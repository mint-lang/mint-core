/* Mathematical functions. */
module Math {
  /*
  Negates the given number.

    Math.negate(1) == -1
  */
  fun negate (number : Number) : Number {
    `-number`
  }

  /*
  Returns the absolute value of the given number.

    Math.abs(1) == 1
    Math.abs(-1) == 1
  */
  fun abs (number : Number) : Number {
    `Math.abs(number)`
  }

  /*
  Returns the smallest integer greater than or equal to a given number.

    Math.ceil(0.3) == 1
  */
  fun ceil (number : Number) : Number {
    `Math.ceil(number)`
  }

  /*
  Returns the largest integer less than or equal to a given number.

    Math.floor(0.8) == 0
  */
  fun floor (number : Number) : Number {
    `Math.floor(number)`
  }

  /*
  Returns the value of a number rounded to the nearest integer.

    Math.round(0.5) == 1
  */
  fun round (number : Number) : Number {
    `Math.round(number)`
  }

  /*
  Returns the lowest-valued number from the arguments.

    Math.min(1, 2) == 1
  */
  fun min (number1 : Number, number2 : Number) : Number {
    `Math.min(number1, number2)`
  }

  /*
  Returns the highest-valued number from the arguments.

    Math.min(1, 2) == 2
  */
  fun max (number1 : Number, number2 : Number) : Number {
    `Math.max(number1, number2)`
  }
}
