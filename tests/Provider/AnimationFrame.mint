record Test.Provider.AnimationFrame {
  counter : Number
}

component Test.Provider.AnimationFrame {
  state : Test.Provider.AnimationFrame { counter = 0 }

  use Provider.AnimationFrame { frames = \ => next { state | counter = state.counter + 1 } }

  fun render : Html {
    <div>
      <{ Number.toString(state.counter) }>
    </div>
  }
}

suite "Provider.AnimationFrame.frames" {
  test "called on an animation frame" {
    with Test.Html {
      <Test.Provider.AnimationFrame/>
      |> start()
      |> assertTextOf("div", "1")
      |> assertTextOf("div", "2")
      |> assertTextOf("div", "3")
    }
  }
}
