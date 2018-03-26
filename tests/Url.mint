suite "Url.parse" {
  test "parses an url" {
    try {
      url =
        Url.parse("http://www.google.com")

      url.host == "www.google.com"
    }
  }
}
