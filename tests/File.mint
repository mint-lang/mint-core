suite "File.readAsString" {
  test "it reads it as string" {
    with Test.Context {
      of(File.fromString("content", "test.txt", "text/plain"))
      |> then(File.readAsString)
      |> assertEqual("content")
    }
  }

  test "it reads it as data url" {
    with Test.Context {
      of(File.fromString("content", "test.txt", "text/plain"))
      |> then(File.readAsDataURL)
      |> assertEqual("data:text/plain;base64,Y29udGVudA==")
    }
  }
}
