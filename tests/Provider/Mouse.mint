record Test.Provider.Mouse {
  clicks : Number,
  moves : Number,
  ups : Number
}

component Test.Provider.Mouse {
  state : Test.Provider.Mouse {
    clicks = 0,
    moves = 0,
    ups = 0
  }

  use Provider.Mouse {
    clicks = \event : Html.Event => next { state | clicks = state.clicks + 1 },
    moves = \event : Html.Event => next { state | moves = state.moves + 1 },
    ups = \event : Html.Event => next { state | ups = state.ups + 1 }
  }

  fun render : Html {
    <div>
      <clicks>
        <{ Number.toString(state.clicks) }>
      </clicks>

      <moves>
        <{ Number.toString(state.moves) }>
      </moves>

      <ups>
        <{ Number.toString(state.ups) }>
      </ups>
    </div>
  }
}

suite "Provider.Mouse.clicks" {
  test "calls clicks on click" {
    with Test.Html {
      <Test.Provider.Mouse/>
      |> start()
      |> assertTextOf("clicks", "0")
      |> triggerClick("clicks")
      |> assertTextOf("clicks", "1")
    }
  }
}

suite "Provider.Mouse.moves" {
  test "calls moves on mouse move" {
    with Test.Html {
      <Test.Provider.Mouse/>
      |> start()
      |> assertTextOf("moves", "0")
      |> triggerMouseMove("moves")
      |> assertTextOf("moves", "1")
    }
  }
}

suite "Provider.Mouse.ups" {
  test "calls ups on mouse up" {
    with Test.Html {
      <Test.Provider.Mouse/>
      |> start()
      |> assertTextOf("ups", "0")
      |> triggerMouseUp("ups")
      |> assertTextOf("ups", "1")
    }
  }
}
