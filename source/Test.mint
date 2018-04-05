module Test {
  fun assertEqual (a : a, b : a) : Test.Context(a) {
    with Test.Context {
      of(a)
      |> assertEqual(b)
    }
  }
}
