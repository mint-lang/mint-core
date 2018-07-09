suite "Color.RGBA.toHSVA" {
  test "converts black correctly" {
    (Color.RGBA.fromRGBA(0, 0, 0, 0)
    |> Color.RGBA.toHSVA()) == {
      saturation = 0,
      value = 0,
      alpha = 0,
      hue = 0
    }
  }

  test "converts white correctly" {
    (Color.RGBA.fromRGBA(255, 255, 255, 0)
    |> Color.RGBA.toHSVA()) == {
      saturation = 0,
      value = 100,
      alpha = 0,
      hue = 0
    }
  }

  test "converts red correctly" {
    (Color.RGBA.fromRGBA(255, 0, 0, 0)
    |> Color.RGBA.toHSVA()) == {
      saturation = 100,
      value = 100,
      alpha = 0,
      hue = 0
    }
  }

  test "converts green correctly" {
    (Color.RGBA.fromRGBA(0, 255, 0, 0)
    |> Color.RGBA.toHSVA()) == {
      saturation = 100,
      value = 100,
      hue = 120,
      alpha = 0
    }
  }

  test "converts blue correctly" {
    (Color.RGBA.fromRGBA(0, 0, 255, 0)
    |> Color.RGBA.toHSVA()) == {
      saturation = 100,
      value = 100,
      hue = 240,
      alpha = 0
    }
  }

  test "converts cyan correctly" {
    (Color.RGBA.fromRGBA(0, 255, 255, 0)
    |> Color.RGBA.toHSVA()) == {
      saturation = 100,
      value = 100,
      hue = 180,
      alpha = 0
    }
  }

  test "converts silver correctly" {
    (Color.RGBA.fromRGBA(192, 192, 192, 0)
    |> Color.RGBA.toHSVA()) == {
      saturation = 0,
      value = 75,
      alpha = 0,
      hue = 0
    }
  }

  test "converts gray correctly" {
    (Color.RGBA.fromRGBA(128, 128, 128, 0)
    |> Color.RGBA.toHSVA()) == {
      saturation = 0,
      value = 50,
      alpha = 0,
      hue = 0
    }
  }

  test "converts maroon correctly" {
    (Color.RGBA.fromRGBA(128, 0, 0, 0)
    |> Color.RGBA.toHSVA()) == {
      saturation = 100,
      value = 50,
      alpha = 0,
      hue = 0
    }
  }

  test "converts olive correctly" {
    (Color.RGBA.fromRGBA(128, 128, 0, 0)
    |> Color.RGBA.toHSVA()) == {
      saturation = 100,
      value = 50,
      alpha = 0,
      hue = 60
    }
  }

  test "converts dark green correctly" {
    (Color.RGBA.fromRGBA(0, 128, 0, 0)
    |> Color.RGBA.toHSVA()) == {
      saturation = 100,
      value = 50,
      alpha = 0,
      hue = 120
    }
  }

  test "converts purple correctly" {
    (Color.RGBA.fromRGBA(128, 0, 128, 0)
    |> Color.RGBA.toHSVA()) == {
      saturation = 100,
      value = 50,
      alpha = 0,
      hue = 300
    }
  }

  test "converts teal correctly" {
    (Color.RGBA.fromRGBA(0, 128, 128, 0)
    |> Debug.log()
    |> Color.RGBA.toHSVA()
    |> Debug.log()) == {
      saturation = 100,
      value = 50,
      alpha = 0,
      hue = 180
    }
  }

  test "converts navy correctly" {
    (Color.RGBA.fromRGBA(0, 0, 128, 0)
    |> Color.RGBA.toHSVA()) == {
      saturation = 100,
      value = 50,
      alpha = 0,
      hue = 240
    }
  }
}

suite "Color.RGBA.fromRGBA" {
  test "returns a new color" {
    Color.RGBA.fromRGBA(0, 0, 0, 0) == {
      green = 0,
      alpha = 0,
      blue = 0,
      red = 0
    }
  }

  test "clamps colors to lower value" {
    Color.RGBA.fromRGBA(-10, -10, -10, -10) == {
      green = 0,
      alpha = 0,
      blue = 0,
      red = 0
    }
  }

  test "clamps colors to upper value" {
    Color.RGBA.fromRGBA(1000, 1000, 1000, 1000) == {
      green = 255,
      alpha = 100,
      blue = 255,
      red = 255
    }
  }
}
