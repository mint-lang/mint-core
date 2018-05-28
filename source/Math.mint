module Math {
  fun negate (number : Number) : Number {
    `-number`
  }

  fun abs (number : Number) : Number {
    `Math.abs(number)`
  }

  fun ceil (number : Number) : Number {
    `Math.ceil(number)`
  }

  fun floor (number : Number) : Number {
    `Math.floor(number)`
  }

  fun round (number : Number) : Number {
    `Math.round(number)`
  }

  fun min (number1 : Number, number2 : Number) : Number {
    `Math.min(number1, number2)`
  }

  fun max (number1 : Number, number2 : Number) : Number {
    `Math.max(number1, number2)`
  }

  fun fmod (a : Number, b : Number) : Number {
    `Number((a - (Math.floor(a / b) * b)).toPrecision(8))`
  }

  fun clamp (number : Number, bottom : Number, top : Number) : Number {
    number
    |> max(bottom)
    |> min(top)
  }
}
