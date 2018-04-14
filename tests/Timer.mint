suite "Timer.timeout" {
  test "resolves after a time" {
    with Test.Context {
      of("TEST")
      |> timeout(1)
      |> then(
        \subject : String =>
          subject
          |> String.toLowerCase()
          |> Promise.resolve())
      |> then(
        \subject : String =>
          subject == "test"
          |> Promise.resolve())
    }
  }
}

suite "Timer.nextFrame" {
  test "resolves after the next frame" {
    with Test.Context {
      of("TEST")
      |> then(\subject : String => Timer.nextFrame(subject))
      |> then(
        \subject : String =>
          subject
          |> String.toLowerCase()
          |> Promise.resolve())
      |> then(
        \subject : String =>
          subject == "test"
          |> Promise.resolve())
    }
  }
}
