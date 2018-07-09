suite "Color.HSVA.toRGBA" {
  test "converts black correctly" {
    (Color.HSVA.fromHSVA(0, 0, 0, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 0,
      blue = 0,
      red = 0
    }
  }

  test "converts white correctly" {
    (Color.HSVA.fromHSVA(0, 0, 100, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 255,
      blue = 255,
      red = 255
    }
  }

  test "converts red correctly" {
    (Color.HSVA.fromHSVA(0, 100, 100, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 0,
      blue = 0,
      red = 255
    }
  }

  test "converts green correctly" {
    (Color.HSVA.fromHSVA(120, 100, 100, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 255,
      blue = 0,
      red = 0
    }
  }

  test "converts blue correctly" {
    (Color.HSVA.fromHSVA(240, 100, 100, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 0,
      blue = 255,
      red = 0
    }
  }

  test "converts yelllow correctly" {
    (Color.HSVA.fromHSVA(60, 100, 100, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 255,
      blue = 0,
      red = 255
    }
  }

  test "converts cyan correctly" {
    (Color.HSVA.fromHSVA(180, 100, 100, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 255,
      blue = 255,
      red = 0
    }
  }

  test "converts magenta correctly" {
    (Color.HSVA.fromHSVA(300, 100, 100, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 0,
      blue = 255,
      red = 255
    }
  }

  test "converts silver correctly" {
    (Color.HSVA.fromHSVA(0, 0, 75, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 192,
      blue = 192,
      red = 192
    }
  }

  test "converts gray correctly" {
    (Color.HSVA.fromHSVA(0, 0, 50, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 128,
      blue = 128,
      red = 128
    }
  }

  test "converts maroon correctly" {
    (Color.HSVA.fromHSVA(0, 100, 50, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 0,
      blue = 0,
      red = 128
    }
  }

  test "converts olive correctly" {
    (Color.HSVA.fromHSVA(60, 100, 50, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 128,
      blue = 0,
      red = 128
    }
  }

  test "converts dark green correctly" {
    (Color.HSVA.fromHSVA(120, 100, 50, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 128,
      blue = 0,
      red = 0
    }
  }

  test "converts purple correctly" {
    (Color.HSVA.fromHSVA(300, 100, 50, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 0,
      blue = 128,
      red = 128
    }
  }

  test "converts teal correctly" {
    (Color.HSVA.fromHSVA(180, 100, 50, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 128,
      blue = 128,
      red = 0
    }
  }

  test "converts navy correctly" {
    (Color.HSVA.fromHSVA(240, 100, 50, 0)
    |> Color.HSVA.toRGBA()) == {
      alpha = 0,
      green = 0,
      blue = 128,
      red = 0
    }
  }
}
