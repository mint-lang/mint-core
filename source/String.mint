module String {
  fun toLowerCase (string : String) : String {
    `string.toLowerCase()`
  }

  fun toUpperCase (string : String) : String {
    `string.toUpperCase()`
  }

  fun reverse (string : String) : String {
    `[...string].reverse().join('')`
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

  fun repeat (count : Number, string : String) : String {
    `string.repeat(count)`
  }

  fun join (separator : String, array : Array(String)) : String {
    `array.join(separator)`
  }

  fun concat (array : Array(String)) : String {
    join("", array)
  }

  fun isAnagarm (string1 : String, string2 : String) : Bool {
    `
    (() => {
      const normalize = string =>
        string
          .toLowerCase()
          .replace(/[^a-z0-9]/gi, '')
          .split('')
          .sort()
          .join('');

      return normalize(string1) === normalize(string2);
    })()
    `
  }
}
