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
    `Decoder.field(key, decoder)(input)`
  }

  fun string (input : Object) : Result(Object.Error, String) {
    `Decoder.string(input)`
  }

  fun time (input : Object) : Result(Object.Error, Time) {
    `Decoder.time(input)`
  }

  fun number (input : Object) : Result(Object.Error, Number) {
    `Decoder.number(input)`
  }

  fun boolean (input : Object) : Result(Object.Error, Bool) {
    `Decoder.boolean(input)`
  }

  fun array (decoder : Function(Object, Result(Object.Error, a)), input : Object) : Result(Object.Error, Array(a)) {
    `Decoder.array(decoder)(input)`
  }

  fun maybe (decoder : Function(Object, Result(Object.Error, a)), input : Object) : Result(Object.Error, Maybe(a)) {
    `Decoder.maybe(decoder)(input)`
  }
}
