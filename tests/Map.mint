suite "Map equality" {
  test "maps which are not equal returns false" {
    try {
      map1 =
        Map.empty()
        |> Map.set("a", "x")

      map2 =
        Map.empty()
        |> Map.set("a", "b")

      (map1 != map2)
    }
  }

  test "maps which are equal returns true" {
    try {
      map1 =
        Map.empty()
        |> Map.set("a", "b")

      map2 =
        Map.empty()
        |> Map.set("a", "b")

      (map1 == map2)
    }
  }
}

suite "Map.set" {
  test "it sets an item" {
    (Map.empty()
    |> Map.set("x", "y")
    |> Map.get("x")
    |> Maybe.withDefault("")) == "y"
  }

  test "it ovverrides previous value" {
    (Map.empty()
    |> Map.set("x", "y")
    |> Map.set("x", "Z")
    |> Map.get("x")
    |> Maybe.withDefault("")) == "Z"
  }
}

suite "Map.get" {
  test "it gets the value of an item" {
    (Map.empty()
    |> Map.set("a", "b")
    |> Map.get("a")
    |> Maybe.withDefault("")) == "b"
  }

  test "it returns nothing if thre is no the value" {
    Map.empty()
    |> Map.get("a")
    |> Maybe.isNothing()
  }
}

suite "Map.merge" {
  test "it merges two maps together" {
    try {
      a =
        Map.empty()
        |> Map.set("a", "b")

      b =
        Map.empty()
        |> Map.set("x", "y")

      (Map.merge(a, b)
      |> Map.get("x")
      |> Maybe.withDefault("")) == "y"
    }
  }

  test "send map has precedence" {
    try {
      a =
        Map.empty()
        |> Map.set("a", "b")

      b =
        Map.empty()
        |> Map.set("a", "y")

      (Map.merge(a, b)
      |> Map.get("a")
      |> Maybe.withDefault("")) == "y"
    }
  }
}
