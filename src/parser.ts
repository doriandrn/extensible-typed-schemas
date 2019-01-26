import fs from 'fs'

class ETSParser {
  constructor (
    readonly options: ETSInputOptions
  ) {
    fs.readFileSync(`${ options.schemasDir || 'datamodel'}/`)
  }

  static async readFromDir (dir) {}
}
