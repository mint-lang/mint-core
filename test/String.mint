suite "String.toLowerCase" {
  test "converts string to lowercase representation" {
    String.toLowerCase("HELLO") == "hello"
  }
}

suite "String.isEmpty" {
  test "returns true if the string is empty" {
    String.isEmpty("")
  }

  test "returns false if the string contains whitespace" {
    String.isEmpty(" ") == false
  }

  test "returns false if the string contains anything" {
    String.isEmpty("asd") == false
  }
}

suite "String.size" {
  test "returns the size of the string" {
    String.size("123456") == 6
  }

  test "returns 0 for empty string" {
    String.size("") == 0
  }
}

suite "String.split" {
  test "splits the string with a separator" {
    ("a,b,c,d,e"
    |> String.split(",")
    |> Array.size()) == 5
  }
}

suite "String.capitalize" {
  test "returns capitalized string" {
    String.capitalize("hello there mate!") == "Hello There Mate!"
  }
}
