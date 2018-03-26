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
