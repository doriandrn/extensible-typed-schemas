type SchemasConfig = {
  dir: string
  compile: {
    typescript ?: boolean, // Wether to use TS or not -> outputs js if false
    mainEnum: string
  }
}

export default (): SchemasConfig => ({
  dir: 'datamodel',
  compile: {
    typescript: true,
    mainEnum: 'Taxonomies'
  },
})
