module Number {
  fun toString (input : Number) : String {
    `input.toString()`
  }

  fun fromString (input : String) : Result(Number.Error, Number) {
    `
    (() => {
    	let value = parseFloat(input)
    	if (isNaN(value)) {
    		return new Err({ message: "Not a Number" })
    	} else {
    		return new Ok(value)
    	}
    })()
    `
  }
}
