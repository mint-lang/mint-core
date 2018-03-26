suite "Bool.not" {
  test "returns true for false" {
    Bool.not(false)
  }

  test "returns false for true" {
    Bool.not(true) == false
  }
}

suite "Bool.toString" {
  test "returns 'true' for true" {
    (Bool.toString(true)) == "true"
  }

  test "returns 'false' for false" {
    (Bool.toString(false)) == "false"
  }
}
