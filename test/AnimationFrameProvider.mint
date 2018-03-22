record Test.AnimationFrame {
  text : String
}

component Test.AnimationFrame {
  state : Test.AnimationFrame { text = "" }

  use AnimationFrameProvider { frames = \ => next { state | text = "Ticked" } }

  fun render : Html {
    <div>
      <{ state.text }>
    </div>
  }
}

suite "AnimationFrameProvider" {
  test "calls frames on an animation frame" {
    with Spec.Html {
      <Test.AnimationFrame/>
      |> start()
      |> assertText("div", "Ticked")
    }
  }
}
