suite "Array equality" {
  test "simple values" {
    [
      "a",
      "b"
    ] == [
      "a",
      "b"
    ]
  }

  test "different values" {
    [Maybe.just("b")] != [Maybe.just("a")]
  }
}

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

suite "Array.firstWithDefault" {
  test "returns the first item if exists" {
    ([
      "a",
      "b",
      "c"
    ]
    |> Array.firstWithDefault("")) == "a"
  }

  test "returns the default value if the item does not exists" {
    (Array.firstWithDefault("", [])) == ""
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

suite "Array.lastWithDefault" {
  test "returns the first item if exists" {
    ([
      "a",
      "b",
      "c"
    ]
    |> Array.lastWithDefault("")) == "c"
  }

  test "returns the default value if the item does not exists" {
    (Array.lastWithDefault("", [])) == ""
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
  test "keeps items that match that predicate" {
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
  test "keeps items that match that does not predicate" {
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

suite "Array.find" {
  test "finds the first item that matches the predicate" {
    ([
      1,
      2,
      3,
      4,
      5,
      6
    ]
    |> Array.find(\number : Number => number == 3)
    |> Maybe.withDefault(0)) == 3
  }

  test "finds item if it equals to false" {
    ([
      true,
      false
    ]
    |> Array.find(\item : Bool => item == false)
    |> Maybe.withDefault(true)) == false
  }
}

suite "Array.any" {
  test "returns true if finds any item that matches the predicat" \
  "e" {
    [
      1,
      2,
      3,
      4,
      5,
      6
    ]
    |> Array.any(\number : Number => number == 3)
  }

  test "returns false if no item matches the predicate" {
    ([
      1,
      2,
      3,
      4,
      5,
      6
    ]
    |> Array.any(\number : Number => number == 9)) == false
  }
}

suite "Array.sort" {
  test "sorts the array based on predicate function" {
    ([
      3,
      2,
      1
    ]
    |> Array.sort(\a : Number, b : Number => a - b)
    |> Array.map(Number.toString)
    |> String.join("")) == "123"
  }
}

suite "Array.sortBy" {
  test "sorts the array based on predicate function" {
    ([
      3,
      2,
      1
    ]
    |> Array.sortBy(\a : Number => a)
    |> Array.map(Number.toString)
    |> String.join("")) == "123"
  }
}

suite "Array.slice" {
  test "returns empty array for empty array" {
    []
    |> Array.slice(0, 0)
    |> Array.isEmpty()
  }

  test "returns part of the array" {
    ([
      1,
      2,
      3,
      4,
      5
    ]
    |> Array.slice(1, 3)
    |> Array.map(Number.toString)
    |> String.join("")) == "23"
  }
}

suite "Array.isEmpty" {
  test "returns true for empty array" {
    Array.isEmpty([])
  }

  test "returns false for non-empty array" {
    Array.isEmpty(["a"]) == false
  }
}

suite "Array.intersperse" {
  test "inserts the separator between items" {
    ([
      "a",
      "b",
      "c",
      "d"
    ]
    |> Array.intersperse("|")
    |> String.join("")) == "a|b|c|d"
  }
}

suite "Array.contains" {
  test "returns true if the array contains the exact item" {
    [
      "a",
      "b"
    ]
    |> Array.contains("a")
  }

  test "returns false if the it does not contain the exact item" {
    ([
      "a",
      "b"
    ]
    |> Array.contains("c")) == false
  }
}

suite "Array.range" {
  test "returns an array of numbers for the given range" {
    (Array.range(0, 10)
    |> Array.map(Number.toString)
    |> String.join("")) == "012345678910"
  }
}
