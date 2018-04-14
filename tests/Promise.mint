record Test.Promise {
  result : String
}

component Test.Promise {
  state : Test.Promise { result = "" }

  fun reject : Void {
    do {
      Promise.reject("rejected")
    } catch String => result {
      next { state | result = result }
    }
  }

  fun resolve : Void {
    do {
      result =
        Promise.resolve("resolved")

      next { state | result = result }
    }
  }

  fun render : Html {
    <div>
      <result>
        <{ state.result }>
      </result>

      <resolve onClick={\event : Html.Event => resolve()}/>
      <reject onClick={\event : Html.Event => reject()}/>
    </div>
  }
}

suite "Promise.resolve" {
  test "resolves a promise" {
    with Test.Html {
      <Test.Promise/>
      |> start()
      |> assertTextOf("result", "")
      |> triggerClick("resolve")
      |> assertTextOf("result", "resolved")
    }
  }
}

suite "Promise.reject" {
  test "rejects a promise" {
    with Test.Html {
      <Test.Promise/>
      |> start()
      |> assertTextOf("result", "")
      |> triggerClick("reject")
      |> assertTextOf("result", "rejected")
    }
  }
}
