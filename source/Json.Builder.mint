record Json.Builder.Field {
  value : JSObject,
  name : String
}

module Json.Builder {
  fun string (input : String) : JSObject {
    `input`
  }

  fun bool (input : Bool) : JSObject {
    `input`
  }

  fun number (input : Number) : JSObject {
    `input`
  }

  fun date (input : Date) : JSObject {
    `input.toISO()`
  }

  fun object (fields : Array(Json.Builder.Field)) : JSObject {
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
