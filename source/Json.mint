module Json {
  fun parse (input : String) : Maybe(Object) {
    `
    (() => {
     	try {
     		return new Just(JSON.parse(input))
     	} catch (error) {
     		return new Nothing()
    	}
    })()
    `
  }

  fun stringify (input : Object) : String {
    `JSON.stringify(input)`
  }
}
