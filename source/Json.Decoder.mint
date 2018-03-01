record Json.Error {
  message : String
}

module Json.Decoder {
  fun field (key : String, object : JSObject, decoder : Function(JSObject, Result(Json.Error, a))) : Result(Json.Error, a) {
    `
    (() => {
      let actual = object[key]
      if (typeof actual === "undefined") {
        return new Err({ message: \`No key ${key}\` })
      }
      return decoder(actual)
    })()
    `
  }

  fun string (input : JSObject) : Result(Json.Error, String) {
    `
    (() => {
      if(typeof input != "string") {
        return new Err({ message: "Not a string" })
      } else {
        return new Ok(input)
      }
    })()
    `
  }

  fun date (input : JSObject) : Result(Json.Error, Time) {
    `
    (() => {
      let parsed = Date.parse(input)

      if (Number.isNaN(parsed)) {
        return new Err({ message: "Not a date" })
      } else {
        return new Ok(new Date(parsed))
      }
    })()
    `
  }

  fun number (input : JSObject) : Result(Json.Error, Number) {
    `
    (() => {
      if(typeof input != "number") {
        let value = parseFloat(input)
        if (isNaN(value)) {
          return new Err({ message: "Not a number" })
        } else {
          return new Ok(value)
        }
      } else {
        return new Ok(input)
      }
    })()
    `
  }

  fun boolean (input : JSObject) : Result(Json.Error, Bool) {
    `
    (() => {
      if(typeof input != "boolean") {
        return new Err({ message: "Not a boolean" })
      } else {
        return new Ok(input)
      }
    })()
    `
  }

  fun decodeWith (decoder : Function(JSObject, Result(Json.Error, a)), input : JSObject) : Result(Json.Error, a) {
    decoder(input)
  }

  fun array (decoder : Function(JSObject, Result(Json.Error, a))) : Function(JSObject, Result(Json.Error, Array(a))) {
    `
    ((input) => {
      if (!Array.isArray(input)) {
        return new Err({ message: "Input is not an array!"})
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
    })
    `
  }
}
