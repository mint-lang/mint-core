suite "Number.isOdd" {
  test "returns false for 0" {
    Number.isOdd(0) == false
  }

  test "returns false for odd numbers" {
    Number.isOdd(2) == false
  }

  test "returns true for even numbers" {
    Number.isOdd(1)
  }
}

suite "Number.isEven" {
  test "returns true for 0" {
    Number.isEven(0)
  }

  test "returns true for odd numbers" {
    Number.isEven(2)
  }

  test "returns false for even numbers" {
    Number.isEven(1) == false
  }
}

suite "Number.toString" {
  test "returns string representation of a number" {
    Number.toString(100) == "100"
  }
}

suite "Number.fromString" {
  test "returns nothing if it cannot convert" {
    Number.fromString("asd")
    |> Maybe.isNothing()
  }

  test "returns just(Number) if it converted successfully" {
    Number.fromString("100")
    |> Maybe.isJust()
  }

  test "returns correct number if it converted successfully" {
    (Number.fromString("100")
    |> Maybe.withDefault(0)) == 100
  }
}
