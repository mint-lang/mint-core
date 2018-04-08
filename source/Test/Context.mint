module Test.Context {
  fun of (a : a) : Test.Context(a) {
    `new TestContext(a)`
  }

  fun then (proc : Function(a, Promise(b, c)), context : Test.Context(a)) : Test.Context(c) {
    `
    context.step((subject)=> {
      return proc(subject)
    })
    `
  }

  fun timeout (duration : Number, context : Test.Context(a)) : Test.Context(a) {
    then(
      \subject : a => Timer.timeout(duration, subject),
      context)
  }

  fun assertEqual (a : a, context : Test.Context(a)) : Test.Context(a) {
    `
    context.step((subject)=> {
      let result = _compare(a, subject)

      if (result) {
        return subject
      } else {
        throw \`Assertion failed ${a} === ${subject}\`
      }
    })
    `
  }
}
