suite "Array.first" {
  test "returns nothing for empty array" {
    []
    |> Array.first()
    |> Maybe.isNothing()
  }

  test "returns just(a) for non-empty array" {
    [
      "a",
      "b"
    ]
    |> Array.first()
    |> Maybe.isJust()
  }

  test "returns the first item of non-empty array" {
    ([
      "a",
      "b"
    ]
    |> Array.first()
    |> Maybe.withDefault("")) == "a"
  }
}

suite "Array.last" {
  test "returns nothing for empty array" {
    []
    |> Array.last()
    |> Maybe.isNothing()
  }

  test "returns just(a) for non-empty array" {
    [
      "a",
      "b"
    ]
    |> Array.last()
    |> Maybe.isJust()
  }

  test "returns the last item of non-empty array" {
    ([
      "a",
      "b"
    ]
    |> Array.last()
    |> Maybe.withDefault("")) == "b"
  }
}

suite "Array.size" {
  test "returns 0 for empty array" {
    Array.size([]) == 0
  }

  test "returns 1 for an array with 1 item" {
    Array.size([""]) == 1
  }

  test "returns 5 for an array with 5 items" {
    Array.size([
      "",
      "",
      "",
      "",
      ""
    ]) == 5
  }
}

suite "Array.push" {
  test "appends item" {
    ([]
    |> Array.push("a")
    |> Array.size()) == 1
  }

  test "appends item to the end" {
    ([
      "x",
      "y",
      "z"
    ]
    |> Array.push("a")
    |> Array.last()
    |> Maybe.withDefault("")) == "a"
  }
}

suite "Array.reverse" {
  test "reverses an array" {
    ([
      "x",
      "y"
    ]
    |> Array.reverse()
    |> Array.first()
    |> Maybe.withDefault("")) == "y"
  }
}

suite "Array.map" {
  test "maps over the items of the array" {
    ([
      "A",
      "B"
    ]
    |> Array.map(String.toLowerCase)
    |> Array.first()
    |> Maybe.withDefault("")) == "a"
  }
}

suite "Array.mapWithIndex" {
  test "maps over the items and their indexes of the array" {
    ([
      "A",
      "B"
    ]
    |> Array.mapWithIndex(
      \item : String, index : Number => item + Number.toString(index))
    |> Array.first()
    |> Maybe.withDefault("")) == "A0"
  }
}

suite "Array.select" {
  test "it keeps items that match that predicate" {
    ([
      1,
      2,
      3,
      4,
      5
    ]
    |> Array.select(Number.isOdd)
    |> Array.size()) == 3
  }
}

suite "Array.reject" {
  test "it keeps items that match that does not predicateon" {
    ([
      1,
      2,
      3,
      4,
      5
    ]
    |> Array.reject(Number.isOdd)
    |> Array.size()) == 2
  }
}
