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
