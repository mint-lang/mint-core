module Promise {
  fun fromResult (input : Result(a, b)) : Promise(a, b) {
    `input instanceof Err ? Promise.reject(input.value) : Promise.resolve(input.value)`
  }

  fun reject (input : a) : Promise(a, Never) {
    `Promise.reject(input)`
  }
}
