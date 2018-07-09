suite "Math.negate" {
  test "negates positive numbers" {
    Math.negate(1) == -1
  }

  test "negates negative numbers" {
    Math.negate(-1) == 1
  }
}

suite "Math.abs" {
  test "returns the absolute value of a number" {
    Math.abs(-100) == 100
  }
}

suite "Math.ceil" {
  test "returns the ceiling of a float" {
    Math.ceil(0.1) == 1
  }
}

suite "Math.floor" {
  test "returns the floor of a float" {
    Math.floor(0.9) == 0
  }
}

suite "Math.round" {
  test "rounds up correctly" {
    Math.round(0.51) == 1
  }

  test "rounds down correctly" {
    Math.round(0.49) == 0
  }
}

suite "Math.min" {
  test "returns the lower number" {
    Math.min(0, 1) == 0
  }
}

suite "Math.max" {
  test "returns the higher number" {
    Math.max(0, 1) == 1
  }
}

suite "Math.fmod" {
  test "returns the floating-point remainder of 5.3 by 2" {
    Math.fmod(5.3, 2) == 1.3
  }

  test "returns the floating-point remainder of 18.5 by 4.2" {
    Math.fmod(18.5, 4.2) == 1.7
  }
}

suite "Math.clamp" {
  test "returns the bottom if the number is lower then that" {
    Math.clamp(-20, 0, 10) == 0
  }

  test "returns the top if the number is lower then that" {
    Math.clamp(20, 0, 10) == 10
  }

  test "returns the number if it's between top and bottom" {
    Math.clamp(5, 0, 10) == 5
  }
}
