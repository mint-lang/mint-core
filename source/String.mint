module String {
  fun toLowerCase (string : String) : String {
    `string.toLowerCase()`
  }

  fun isEmpty (string : String) : Bool {
    string == ""
  }

  fun match (pattern : String, string : String) : Bool {
    `string.indexOf(pattern) != -1`
  }

  fun split (separator : String, string : String) : Array(String) {
    `string.split(separator)`
  }

  fun size (string : String) : Number {
    `string.length`
  }

  fun capitalize (string : String) : String {
    `string.replace(/\b[a-z]/g, char => char.toUpperCase())`
  }
}
