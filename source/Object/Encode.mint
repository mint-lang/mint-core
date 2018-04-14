module Object.Encode {
  fun string (input : String) : Object {
    `input`
  }

  fun boolean (input : Bool) : Object {
    `input`
  }

  fun number (input : Number) : Object {
    `input`
  }

  fun time (input : Time) : Object {
    `input.toISOString()`
  }

  fun array (input : Array(Object)) : Object {
    `input`
  }

  fun field (name : String, value : Object) : Object.Field {
    `{ name: name, value: value }`
  }

  fun object (fields : Array(Object.Field)) : Object {
    `
    (() => {
      let result = {}

      for (let item of fields) {
        result[item.name] = item.value
      }

      return result
    })()
    `
  }
}
