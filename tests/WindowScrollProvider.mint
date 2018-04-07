record TestWindowScrollProvider.State {
  position : Number
}

component TestWindowScrollProvider {
  use WindowScrollProvider { scrolls = \ => next { state | position = Window.scrollTop() } }

  state : TestWindowScrollProvider.State { position = 0 }

  style base {
    height: 3000px;
    width: 3000px;
  }

  fun render : Html {
    <div::base>
      <{ `console.log(this.state)` }>
      <{ Number.toString(state.position) }>
    </div>
  }
}

suite "WindowScrollProvider.scrolls" {
  test "it notifies subscribers about scroll events" {
    with Test.Html {
      with Test.Window {
        <TestWindowScrollProvider/>
        |> start()
        |> assertTextOf("div", "0")
        |> setScrollTop(100)
        |> assertTextOf("div", "100")
      }
    }
  }
}
