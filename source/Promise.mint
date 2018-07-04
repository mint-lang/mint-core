/* Utility functions for working with promises. */
module Promise {
  /* Creates an already rejected `Promise` */
  fun reject (input : a) : Promise(a, Never) {
    `Promise.reject(input)`
  }

  /* Creates an already resolved `Promise` */
  fun resolve (input : a) : Promise(Never, a) {
    `Promise.resolve(input)`
  }

  /* Wraps a `Promise` in a function. */
  fun wrap (method : Function(Promise(a, b), Void), input : Promise(a, b)) : Promise(a, b) {
    `method(input)`
  }
}
