module Console {
  fun log (value : a) : a {
    `
    (() => {
      console.log(value)
      return value
    })()
    `
  }
}
