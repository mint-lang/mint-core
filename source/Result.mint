module Result {
  fun error (input : a) : Result(a, b) {
    `new Err(input)`
  }

  fun ok (input : a) : Result(b, a) {
    `new Ok(input)`
  }

  fun withDefault (value : b, input : Result(x, b)) : b {
    `input instanceof Ok ? input.value : value`
  }

  fun withError (value : a, input : Result(a, b)) : a {
    `input instanceof Err ? input.value : value`
  }

  fun map (func : Function(b, c), input : Result(a, b)) : Result(a, c) {
    `input instanceof Ok ? new Ok(func(input.value)) : input`
  }

  fun mapError (func : Function(a, c), input : Result(a, b)) : Result(c, b) {
    `input instanceof Err ? new Err(func(input.value)) : input`
  }

  fun isOk (input : Result(a, b)) : Bool {
    `input instanceof Ok`
  }

  fun isError (input : Result(a, b)) : Bool {
    `input instanceof Err`
  }

  fun toMaybe (result : Result(a, b)) : Maybe(b) {
    `
    (() => {
      if (result instanceof Ok) {
        return new Just(result.value)
      } else {
        return new Nothing()
      }
    })()
    `
  }
}
