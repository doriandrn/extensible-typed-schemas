@parents Taxonomies.Organization // this add references fields required for it + values from store if needed

_id ? // implicitly a string
  value // this means it has a computed value coming from the store and so it will get it from there

name !: string (ex. M11, COCOR-2, A3...) // ! = indexable
  validate 'min:1|max:20'
  focus true // boolean or function
  value 'activeDoc'
  oninput
    transform 'uppercase:all'

address ?: Textarea
  validate 'min:20'

scari ?: Scara[] // this won't be indexed,  cant search for it

addScara (scara: Scara): void
removeScara (id: string): void

-------------
OUTPUTS:
-------------

type Building = {
  name : string
  address : string

  scari ?: Scara[]

  _id ?: string
  organizationId ?: string
}

// if it has methods
interface BuildingAPI {
  addScara
}

const fields: FieldCreator<Building>[] = [
  {
    id: 'name',
    placeholder: 'ex. M11, COCOR-2, A3...',
    oninput: {
      transform: 'uppercase:all',
    },
    type: 'text',
    required: true,
    index: true,
    validate: 'min:1|max:20',
    focus: true,
    value: ({ activeDoc }) => activeDoc.name
  },
  {
    id: 'scari',
    type: 'scari',
    default: [{
      id: 1,
      etaje: 4,
      lift: false,
      mansarda: false
    }],
    value: ({ activeDoc }) => activeDoc.scari
  },
  {
    id: 'adresa',
    type: 'textarea',
    value: ({ activeDoc }) => activeDoc.adresa
  }
]
