suite "Http.empty" {
  test "it returns an empty request" {
    Http.empty() == {
      withCredentials = false,
      method = "GET",
      body = `null`,
      headers = [],
      url = ""
    }
  }
}

suite "Http.delete" {
  test "it returns an empty DELETE request" {
    Http.delete("url") == {
      withCredentials = false,
      method = "DELETE",
      body = `null`,
      headers = [],
      url = "url"
    }
  }
}

suite "Http.get" {
  test "it returns an empty DELETE request" {
    Http.get("url") == {
      withCredentials = false,
      method = "GET",
      body = `null`,
      headers = [],
      url = "url"
    }
  }
}

suite "Http.put" {
  test "it returns an empty DELETE request" {
    Http.put("url") == {
      withCredentials = false,
      method = "PUT",
      body = `null`,
      headers = [],
      url = "url"
    }
  }
}

suite "Http.post" {
  test "it returns an empty DELETE request" {
    Http.post("url") == {
      withCredentials = false,
      method = "POST",
      body = `null`,
      headers = [],
      url = "url"
    }
  }
}

suite "Http.stringBody" {
  test "it sets the body of a request to a string" {
    (Http.empty()
    |> Http.stringBody("Hello")) == {
      withCredentials = false,
      body = `"Hello"`,
      method = "GET",
      headers = [],
      url = ""
    }
  }
}

suite "Http.formDataBody" {
  test "it sets the body of a request to a FormData" {
    (Http.empty()
    |> Http.formDataBody(FormData.empty())) == {
      withCredentials = false,
      body = `new FormData()`,
      method = "GET",
      headers = [],
      url = ""
    }
  }
}

suite "Http.method" {
  test "it sets the method of a request" {
    (Http.empty()
    |> Http.method("BLAH")) == {
      withCredentials = false,
      method = "BLAH",
      body = `null`,
      headers = [],
      url = ""
    }
  }
}

suite "Http.withCredentials" {
  test "it sets the withCredentials of a request" {
    (Http.empty()
    |> Http.withCredentials(true)) == {
      withCredentials = true,
      method = "GET",
      body = `null`,
      headers = [],
      url = ""
    }
  }
}

suite "Http.url" {
  test "it sets the url of a request" {
    (Http.empty()
    |> Http.url("WTF")) == {
      withCredentials = false,
      method = "GET",
      body = `null`,
      headers = [],
      url = "WTF"
    }
  }
}

suite "Http.header" {
  test "adds a header to a request" {
    (Http.empty()
    |> Http.header("A", "B")) == {
      headers = [`new Record({key: "A", value: "B"})`],
      withCredentials = false,
      method = "GET",
      body = `null`,
      url = ""
    }
  }
}

suite "Http.sendWithID" {
  test "sends the request with the given ID" {
    try {
      response =
        Http.get("/blah")
        |> Http.sendWithID("A")

      `$Http._requests["A"] != undefined`
    }
  }
}

record Test.Http {
  status : Number,
  error : String,
  body : String
}

component Test.Http {
  property method : String = "GET"
  property timeout : Bool = false
  property url : String = "/blah"
  property abort : Bool = false
  property error : Bool = false

  state : Test.Http {
    status = 0,
    error = "",
    body = ""
  }

  fun componentDidMount : Void {
    do {
      response =
        Http.empty()
        |> Http.url(url)
        |> Http.method(method)
        |> Http.sendWithID("test")
        |> Promise.wrap(
          `
          (async (promise) => {
            if (this.error) {
              $Http._requests["test"].dispatchEvent(new CustomEvent("error"))
            } else if (this.timeout) {
              $Http._requests["test"].dispatchEvent(new CustomEvent("timeout"))
            } else if (this.abort) {
              $Http._requests["test"].abort()
            }

            const result = await promise
            return result
          })
          `)

      next { state | status = response.status }
    } catch Http.ErrorResponse => error {
      case (error.type) {
        Http.Error::NetworkError =>
          next
            { state |
              error = "network-error",
              status = error.status
            }

        Http.Error::BadUrl =>
          next
            { state |
              error = "bad-url",
              status = error.status
            }

        Http.Error::Timeout =>
          next
            { state |
              error = "timeout",
              status = error.status
            }

        Http.Error::Aborted =>
          next
            { state |
              error = "aborted",
              status = error.status
            }

        => void
      }
    }
  }

  fun render : Html {
    <div>
      <error>
        <{ state.error }>
      </error>

      <content>
        <{ state.body }>
      </content>

      <status>
        <{ Number.toString(state.status) }>
      </status>
    </div>
  }
}

suite "Successfull request" {
  test "it loads" {
    with Test.Html {
      <Test.Http/>
      |> start()
      |> assertTextOf("error", "")
      |> assertTextOf("status", "200")
    }
  }
}

suite "Http.Error" {
  test "BadUrl" {
    with Test.Html {
      <Test.Http url="http://::?/"/>
      |> start()
      |> assertTextOf("error", "bad-url")
      |> assertTextOf("status", "0")
    }
  }

  test "NetWorkError" {
    with Test.Html {
      <Test.Http error={true}/>
      |> start()
      |> assertTextOf("error", "network-error")
      |> assertTextOf("status", "0")
    }
  }

  test "Timeout" {
    with Test.Html {
      <Test.Http timeout={true}/>
      |> start()
      |> assertTextOf("error", "timeout")
      |> assertTextOf("status", "0")
    }
  }

  test "Aborted" {
    with Test.Html {
      <Test.Http abort={true}/>
      |> start()
      |> assertTextOf("error", "aborted")
      |> assertTextOf("status", "0")
    }
  }
}
