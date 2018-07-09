/* Represents a color by red, green, blue and alpha. */
record Color.RGBA {
  alpha : Number,
  green : Number,
  blue : Number,
  red : Number
}

/* Utility functions for the `Color.RGBA` type. */
module Color.RGBA {
  /* Creates a new color from the given values. */
  fun fromRGBA (red : Number, green : Number, blue : Number, alpha : Number) : Color.RGBA {
    {
      green = Math.clamp(green, 0, 255),
      alpha = Math.clamp(alpha, 0, 100),
      blue = Math.clamp(blue, 0, 255),
      red = Math.clamp(red, 0, 255)
    }
  }

  /* Converts a `Color.RGBA` to `Color.HSVA` */
  fun toHSVA (color : Color.RGBA) : Color.HSVA {
    {
      saturation = Math.round(saturation * 100),
      value = Math.round(value * 100),
      alpha = Math.round(color.alpha),
      hue = Math.round(hue)
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
          if (cMax == blue) {
            60 * ((red - green / delta) + 4)
          } else {
            60 * ((blue - red / delta) + 2)
          }
        }
      }
  }
}
