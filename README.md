# Extensible Typed Schemas

Because the frontend needs to know more coming straight from the app's backend. Especially if it's reactive.

**Introducing ETS**:
Typed schemas with contexts, annotations, endless descriptivity and cross-references.



Assuming the schemas are always meant to describe an API


## How it works

### The parser

_Generates full-tree, dynamically-typed TS files, ready to be feed in the `ETSCompiler` class which can output to multiple supported formats such as RxJsonSchema, JsonSchema_

#### How it's supposed to work:

On the very first run, it scans all `.ets` files in `datamodel` dir (schemas should always be top-level only) then:

- it creates a main declaration  TS file -> generated.d.ts
  - it outputs a TS enum containing the filenames of all those files.
    ```ts index.d.ts
    enum Taxonomies = { User, Post, Comment } // can be named anything else
    ```

It also saves references for each schema of another in memory.

```fs
/datamodel
  User.ets
  Post.ets
  Comment.ets
```

The parser returns, for every input file, a .ts file that contains types, interfaces and the returned object of `ETSCreator` type. (This can be customized to also output .d.ts separately)

