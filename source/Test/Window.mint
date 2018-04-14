module Test.Window {
  fun setScrollLeft (to : Number, context : Test.Context(a)) : Test.Context(a) {
    Test.Context.then(
      \subject : Dom.Element =>
        try {
          Window.setScrollLeft(100)
          Promise.resolve(subject)
        },
      context)
  }

  fun setScrollTop (to : Number, context : Test.Context(a)) : Test.Context(a) {
    Test.Context.then(
      \subject : Dom.Element =>
        try {
          Window.setScrollTop(100)
          Promise.resolve(subject)
        },
      context)
  }
}
