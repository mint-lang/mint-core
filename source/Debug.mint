module Debug {
  fun log (value : a) : a {
    `
    (() => {
      console.log(value)
      return value
    })()
    `
  }
}
