record Color {
  alpha : Number,
  green : Number,
  blue : Number,
  red : Number
}

record Color.HSVA {
  saturation : Number,
  value : Number,
  alpha : Number,
  hue : Number
}

module Color {
  fun fromRGBA (red : Number, green : Number, blue : Number, alpha : Number) : Color {
    {
      green = Math.clamp(green, 0, 255),
      alpha = Math.clamp(alpha, 0, 100),
      blue = Math.clamp(blue, 0, 255),
      red = Math.clamp(red, 0, 255)
    }
  }

  fun toHSVA (color : Color) : Color.HSVA {
    {
      saturation = saturation * 100,
      value = value * 100,
      alpha = color.alpha,
      hue = hue
    }
  } where {
    red =
      Math.clamp(color.red, 0, 255) / 255

    blue =
      Math.clamp(color.blue, 0, 255) / 255

    green =
      Math.clamp(color.green, 0, 255) / 255

    cMax =
      red
      |> Math.max(blue)
      |> Math.max(green)

    cMin =
      red
      |> Math.min(blue)
      |> Math.min(green)

    delta =
      cMax - cMin

    value =
      cMax

    saturation =
      if (cMax == 0) {
        0
      } else {
        delta / cMax
      }

    hue =
      if (delta == 0) {
        0
      } else {
        if (cMax == red) {
          60 * Math.fmod((green - blue) / delta, 6)
        } else {
          if (cMax == green) {
            60 * ((blue - red / delta) + 2)
          } else {
            60 * ((red - green / delta) + 4)
          }
        }
      }
  }
}

suite "Color.toHSV" {
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
