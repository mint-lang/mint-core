record Test.Provider.Tick {
  counter : Number
}

component Test.Provider.Tick {
  state : Test.Provider.Tick { counter = 0 }

  use Provider.Tick { ticks = \ => next { state | counter = state.counter + 1 } }

  fun render : Html {
    <div>
      <{ Number.toString(state.counter) }>
    </div>
  }
}

suite "Provider.Tick.ticks" {
  test "called every second" {
    with Test.Html {
      with Test.Context {
        <Test.Provider.Tick/>
        |> start()
        |> assertTextOf("div", "0")
        |> timeout(1010)
        |> assertTextOf("div", "1")
      }
    }
  }
}
