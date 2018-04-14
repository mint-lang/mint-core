record Test.Provider.AnimationFrame {
  frames : Number
}

component Test.Provider.AnimationFrame {
  state : Test.Provider.AnimationFrame { frames = 0 }

  use Provider.AnimationFrame { frames = \ => next { state | frames = state.frames + 1 } }

  fun render : Html {
    <div>
      <{ Number.toString(state.frames) }>
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
