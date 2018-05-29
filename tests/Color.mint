suite "Color.toHSVA" {
  test "converts black correctly" {
    (Color.fromRGBA(0, 0, 0, 0)
    |> Color.toHSVA()) == {
      saturation = 0,
      value = 0,
      alpha = 0,
      hue = 0
    }
  }

  test "converts white correctly" {
    (Color.fromRGBA(255, 255, 255, 0)
    |> Color.toHSVA()) == {
      saturation = 0,
      value = 100,
      alpha = 0,
      hue = 0
    }
  }

  test "converts red correctly" {
    (Color.fromRGBA(255, 0, 0, 0)
    |> Color.toHSVA()) == {
      saturation = 100,
      value = 100,
      alpha = 0,
      hue = 0
    }
  }

  test "converts lime correctly" {
    (Color.fromRGBA(0, 255, 0, 0)
    |> Color.toHSVA()) == {
      saturation = 100,
      value = 100,
      hue = 120,
      alpha = 0
    }
  }
}

suite "Color.fromRGBA" {
  test "returns a new color" {
    Color.fromRGBA(0, 0, 0, 0) == {
      green = 0,
      alpha = 0,
      blue = 0,
      red = 0
    }
  }

  test "clamps colors to lower value" {
    Color.fromRGBA(-10, -10, -10, -10) == {
      green = 0,
      alpha = 0,
      blue = 0,
      red = 0
    }
  }

  test "clamps colors to upper value" {
    Color.fromRGBA(1000, 1000, 1000, 1000) == {
      green = 255,
      alpha = 100,
      blue = 255,
      red = 255
    }
  }
}
