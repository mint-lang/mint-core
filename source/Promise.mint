module Promise {
  fun reject (input : a) : Promise(a, Never) {
    `Promise.reject(input)`
  }

  fun resolve (input : a) : Promise(Never, a) {
    `Promise.resolve(input)`
  }

  fun wrap (method : Function(Promise(a, b), Void), input : Promise(a, b)) : Promise(a, b) {
    `method(input)`
  }
}
