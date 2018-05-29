record Color {
  alpha : Number,
  green : Number,
  blue : Number,
  red : Number
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
