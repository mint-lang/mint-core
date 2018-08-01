component Test.Promise {
  state result : String = ""

  fun reject : Void {
    do {
      Promise.reject("rejected")
    } catch String => result {
      next { result = result }
    }
  }

  fun resolve : Void {
    do {
      result =
        Promise.resolve("resolved")

      next { result = result }
    }
  }

  fun render : Html {
    <div>
      <result>
        <{ result }>
      </result>

      <resolve onClick={(event : Html.Event) : Void => { resolve() }}/>
      <reject onClick={(event : Html.Event) : Void => { reject() }}/>
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
