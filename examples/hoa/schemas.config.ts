type SchemasConfig = {
  dir: string
  compile: {
    typescript ?: boolean, // Wether to use TS or not -> outputs js if false
    mainEnum: string
  },

  idKey ?: string
}

export (): SchemasConfig => ({
  dir: 'datamodel',
  idKey: '_id',
  compile: {
    typescript: true,
    mainEnum: 'Taxonomies'
  },
})


enum Taxonomies { User, Post, Comment }

type User = {
	email : string,
	name ?: string
}

interface UserAPI {
	readonly posts: Post[]
	readonly comments: Comment[]

	putPost (post: Post): Promise<Post>
	trashPost (id: string): void
}

export default <ETSCreator<User, UserAPI>> {
	fields: {
		name: {
			value: ({ activeDoc }) => activeDoc.name,
			validate: 'min:2|max:30'
		},
		email: {
      validate: 'email'
		}
	},
  references: {},

}
