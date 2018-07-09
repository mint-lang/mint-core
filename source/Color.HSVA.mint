/* Represents a color by hue, saturation, value and alpha. */
record Color.HSVA {
  saturation : Number,
  value : Number,
  alpha : Number,
  hue : Number
}

/* Utility functions for the `Color.HSVA` type. */
module Color.HSVA {
  /* Creates a new color from the given values. */
  fun fromHSVA (hue : Number, saturation : Number, value : Number, alpha : Number) : Color.HSVA {
    {
      saturation = Math.clamp(saturation, 0, 100),
      alpha = Math.clamp(alpha, 0, 100),
      value = Math.clamp(value, 0, 100),
      hue = Math.clamp(hue, 0, 360)
    }
  }

  /* Converts a `Color.HSVA` to `Color.RGBA` */
  fun toRGBA (color : Color.HSVA) : Color.RGBA {
    { base |
      green = Math.ceil((base.green + m) * 255),
      blue = Math.ceil((base.blue + m) * 255),
      red = Math.ceil((base.red + m) * 255)
    }
  } where {
    saturation =
      Math.clamp(color.saturation, 0, 100) / 100

    value =
      Math.clamp(color.value, 0, 100) / 100

    alpha =
      Math.clamp(color.alpha, 0, 100)

    hue =
      Math.clamp(color.hue, 0, 360)

    c =
      value * saturation

    x =
      c * (1 - Math.abs(Math.fmod(hue / 60, 2) - 1))

    m =
      value - c

    base =
      if (0 <= hue && hue < 60) {
        {
          alpha = alpha,
          green = x,
          blue = 0,
          red = c
        }
      } else {
        if (60 <= hue && hue < 120) {
          {
            alpha = alpha,
            green = c,
            blue = 0,
            red = x
          }
        } else {
          if (120 <= hue && hue < 180) {
            {
              alpha = alpha,
              green = c,
              blue = x,
              red = 0
            }
          } else {
            if (180 <= hue && hue < 240) {
              {
                alpha = alpha,
                green = x,
                blue = c,
                red = 0
              }
            } else {
              if (240 <= hue && hue < 300) {
                {
                  alpha = alpha,
                  green = 0,
                  blue = c,
                  red = x
                }
              } else {
                {
                  alpha = alpha,
                  green = 0,
                  blue = x,
                  red = c
                }
              }
            }
          }
        }
      }
  }
}
