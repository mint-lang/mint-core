record Test.AnimationFrame {
  counter : Number
}

component Test.AnimationFrame {
  state : Test.AnimationFrame { counter = 0 }

  use AnimationFrameProvider { frames = \ => next { state | counter = state.counter + 1 } }

  fun render : Html {
    <div>
      <{ Number.toString(state.counter) }>
    </div>
  }
}

suite "AnimationFrameProvider" {
  test "calls frames on an animation frame" {
    with Test.Html {
      <Test.AnimationFrame/>
      |> start()
      |> assertTextOf("div", "1")
      |> assertTextOf("div", "2")
      |> assertTextOf("div", "3")
    }
  }
}
