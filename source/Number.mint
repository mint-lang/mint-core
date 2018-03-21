module Number {
  fun isOdd (input : Number) : Bool {
    `input % 2 === 1`
  }

  fun isEven (input : Number) : Bool {
    `Math.abs(input % 2) === 0`
  }

  fun toString (input : Number) : String {
    `input.toString()`
  }

  fun fromString (input : String) : Maybe(Number) {
    `
    (() => {
      let value = parseFloat(input)
      if (isNaN(value)) {
        return new Nothing()
      } else {
        return new Just(value)
      }
    })()
    `
  }
}
