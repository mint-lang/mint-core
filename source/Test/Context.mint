module Test.Context {
  fun of (a : a) : Test.Context(a) {
    `new SpecContext(a)`
  }

  fun then (proc : Function(a, Promise(b, c)), context : Test.Context(a)) : Test.Context(c) {
    `
    context.step((subject)=> {
      return proc(subject)
    })
    `
  }

  fun assertEqual (a : a, context : Test.Context(a)) : Test.Context(a) {
    `
    context.step((subject)=> {
      let result = a === subject

      if (result) {
        return subject
      } else {
        throw \`Assertion failed ${a} === ${subject}\`
      }
    })
    `
  }
}
