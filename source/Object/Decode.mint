enum Object.Error {
  MissingObjectKey,
  NotAValidTime,
  NotABoolean,
  NotAnObject,
  NotANumber,
  NotAString,
  NotAnArray,
  Unkown
}

module Object.Decode {
  fun field (key : String, decoder : Function(Object, Result(Object.Error, a)), input : Object) : Result(Object.Error, a) {
    `
    (() => {
      if (input == null ||
          input == undefined ||
          typeof input !== "object" ||
          Array.isArray(input)) {
        return new Err($Object_Error_NotAnObject)
      } else {
        const actual = input[key]
        if (typeof actual === "undefined") {
          return new Err($Object_Error_MissingObjectKey)
        }
        return decoder(actual)
      }
    })()
    `
  }

  fun string (input : Object) : Result(Object.Error, String) {
    `
    (() => {
      if(typeof input != "string") {
        return new Err($Object_Error_NotAString)
      } else {
        return new Ok(input)
      }
    })()
    `
  }

  fun time (input : Object) : Result(Object.Error, Time) {
    `
    (() => {
      const parsed = Date.parse(input)

      if (Number.isNaN(parsed)) {
        return new Err($Object_Error_NotAValidTime)
      } else {
        return new Ok(new Date(parsed))
      }
    })()
    `
  }

  fun number (input : Object) : Result(Object.Error, Number) {
    `
    (() => {
      if(typeof input != "number") {
        let value = parseFloat(input)

        if (isNaN(value)) {
          return new Err($Object_Error_NotANumber)
        } else {
          return new Ok(value)
        }
      } else {
        return new Ok(input)
      }
    })()
    `
  }

  fun boolean (input : Object) : Result(Object.Error, Bool) {
    `
    (() => {
      if(typeof input != "boolean") {
        return new Err($Object_Error_NotABoolean)
      } else {
        return new Ok(input)
      }
    })()
    `
  }

  fun array (decoder : Function(Object, Result(Object.Error, a)), input : Object) : Result(Object.Error, Array(a)) {
    `
    (() => {
      if (!Array.isArray(input)) {
        return new Err($Object_Error_NotAnArray)
      }

      let results = []

      for (let item of input) {
        let result = decoder(item)

        if (result instanceof Err) {
          return result
        } else {
          results.push(result.value)
        }
      }

      return new Ok(results)
    })()
    `
  }
}
