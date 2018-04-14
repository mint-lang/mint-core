record Regexp.Options {
  caseInsensitive : Bool,
  multiline : Bool,
  unicode : Bool,
  global : Bool,
  sticky : Bool
}

record Regexp.Match {
  submatches : Array(String),
  match : String,
  index : Number
}

module Regexp {
  fun create (input : String) : Regexp {
    `new RegExp(input)`
  }

  fun createWithOptions (input : String, options : Regexp.Options) : Regexp {
    `
    (() => {
      let flags = ""

      if (options.caseInsensitive) { flags += "i" }
      if (options.multiline) { flags += "m" }
      if (options.unicode) { flags += "u" }
      if (options.global) { flags += "g" }
      if (options.sticky) { flags += "y" }

      return new RegExp(input, flags)
    })()
    `
  }

  fun toString (regexp : Regexp) : String {
    `regexp.toString()`
  }

  fun escape (input : String) : String {
    `input.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&')`
  }

  fun split (input : String, regexp : Regexp) : Array(String) {
    `input.split(regexp)`
  }

  fun replace (input : String, replacer : Function(Regexp.Match, String), regexp : Regexp) : String {
    `
    (() => {
      let index = 0

      return input.replace(regexp, function() {
        const args =
          Array.from(arguments)

        const match =
          args.shift()

        const submatches =
          args.slice(0, -2)

        index += 1

        return replacer({
          submatches, submatches,
          index: index,
          match: match
        })
      })
    })()
    `
  }
}
