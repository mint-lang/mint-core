module Promise {
  fun reject (input : a) : Promise(a, Never) {
    `Promise.reject(input)`
  }

  fun resolve (input : a) : Promise(Never, a) {
    `Promise.resolve(input)`
  }
}
