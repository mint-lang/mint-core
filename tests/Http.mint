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
