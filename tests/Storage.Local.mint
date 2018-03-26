suite "Storage.Local.set" {
  test "returns void for successfull set" {
    Storage.Local.set("test", "value")
    |> Result.isOk()
  }

  test "sets the given value at the given key" {
    try {
      Storage.Local.set("test", "test")

      value =
        Storage.Local.get("test")
        |> Result.map(
          \maybe : Maybe(String) => Maybe.withDefault("", maybe))

      (value == "test")
    } catch Storage.Error => error {
      error.type == "QUOTA_EXCEEDED"
    }
  }

  test "it returns error if over the qouta" {
    try {
      Storage.Local.set("test", String.repeat("test", 10000000))

      false
    } catch Storage.Error => error {
      true
    }
  }
}

suite "Storage.Local.get" {
  test "it returns the value if exists" {
    try {
      Storage.Local.set("test", "test")

      value =
        Storage.Local.get("test")
        |> Result.map(
          \maybe : Maybe(String) => Maybe.withDefault("", maybe))

      (value == "test")
    } catch Storage.Error => error {
      false
    }
  }

  test "it returns nothing if the key does not exists" {
    try {
      value =
        Storage.Local.get("test")

      Maybe.isNothing(value)
    } catch Storage.Error => error {
      false
    }
  }
}

suite "Storage.Local.clear" {
  test "it clears all items" {
    try {
      Storage.Local.set("test", "test")

      initialSize =
        Storage.Local.size()

      Storage.Local.clear()

      afterSize =
        Storage.Local.size()

      (initialSize == 1 && afterSize == 0)
    } catch Storage.Error => error {
      false
    }
  }
}

suite "Storage.Local.remove" {
  test "it removes the item with the specified key" {
    try {
      Storage.Local.set("test", "test")

      initialSize =
        Storage.Local.size()

      Storage.Local.remove("test")

      afterSize =
        Storage.Local.size()

      (initialSize == 1 && afterSize == 0)
    } catch Storage.Error => error {
      false
    }
  }
}

suite "Storage.Local.size" {
  test "it returns the number of elements in the storage" {
    try {
      Storage.Local.set("a", "0")
      Storage.Local.set("b", "1")
      Storage.Local.set("c", "2")

      size =
        Storage.Local.size()

      (size == 3)
    } catch Storage.Error => error {
      false
    }
  }
}

suite "Storage.Local.keys" {
  test "it returns the keys of elements in the storage" {
    try {
      Storage.Local.set("c", "2")
      Storage.Local.set("a", "0")
      Storage.Local.set("b", "1")

      keys =
        Storage.Local.keys()

      (Array.join("", keys) == "abc")
    } catch Storage.Error => error {
      false
    }
  }
}
