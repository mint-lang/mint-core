module Result {
  fun withDefault (value : b, input : Result(x, b)) : b {
    `input instanceof Ok ? input.value : value`
  }

  fun error (input : a) : Result(a, b) {
    `new Err(input)`
  }

  fun ok (input : a) : Result(b, a) {
    `new Ok(input)`
  }

  fun map (func : Function(b, c), input : Result(a, b)) : Result(a, c) {
    `input instanceof Ok ? new Ok(func(input.value)) : input`
  }

  fun isOk (input : Result(a, b)) : Bool {
    `input instanceof Ok`
  }
}
