record Http.Request {
  headers : Array(Http.Header),
  withCredentials : Bool,
  body : Http.Body,
  method : String,
  url : String
}

record Http.Response {
  status : Number,
  body : String
}

record Http.ErrorResponse {
  type : Http.Error,
  status : Number,
  url : String
}

enum Http.Error {
  NetworkError,
  Aborted,
  Timeout,
  BadUrl
}

module Http {
  fun empty : Http.Request {
    {
      withCredentials = false,
      method = "GET",
      headers = [],
      body = `null`,
      url = ""
    }
  }

  fun delete (value : String) : Http.Request {
    empty()
    |> method("DELETE")
    |> url(value)
  }

  fun get (value : String) : Http.Request {
    empty()
    |> method("GET")
    |> url(value)
  }

  fun put (value : String) : Http.Request {
    empty()
    |> method("PUT")
    |> url(value)
  }

  fun post (value : String) : Http.Request {
    empty()
    |> method("POST")
    |> url(value)
  }

  fun stringBody (value : String, request : Http.Request) : Http.Request {
    { request | body = `value` }
  }

  fun formDataBody (value : FormData, request : Http.Request) : Http.Request {
    { request | body = `value` }
  }

  fun method (value : String, request : Http.Request) : Http.Request {
    { request | method = value }
  }

  fun withCredentials (value : Bool, request : Http.Request) : Http.Request {
    { request | withCredentials = value }
  }

  fun url (value : String, request : Http.Request) : Http.Request {
    { request | url = value }
  }

  fun header (key : String, value : String, request : Http.Request) : Http.Request {
    { request |
      headers =
        Array.push(
          `new Record({ value: value, key: key })`,
          request.headers)
    }
  }

  fun abortAll : Void {
    `
    this._requests && Object.keys(this._requests).forEach((uid) => {
      this._requests[uid].abort()
      delete this._requests[uid]
    })
    `
  }

  fun sendWithID (uid : String, request : Http.Request) : Promise(Http.ErrorResponse, Http.Response) {
    `
    new Promise((resolve, reject) => {
      if (!this._requests) { this._requests = {} }

      let xhr = new XMLHttpRequest()

      this._requests[uid] = xhr

      xhr.withCredentials = request.withCredentials

      try {
        xhr.open(request.method.toUpperCase(), request.url, true)
      } catch (error) {
        delete this._requests[uid]

        reject({
          type: $Http_Error_BadUrl,
          status: xhr.status,
          url: request.url
        })
      }

      request.headers.forEach((item) => {
        xhr.setRequestHeader(item.key, item.value)
      })

      xhr.addEventListener('error', (event) => {
        delete this._requests[uid]

        reject({
          type: $Http_Error_NetworkError,
          status: xhr.status,
          url: request.url
        })
      })

      xhr.addEventListener('timeout', (event) => {
        delete this._requests[uid]

        reject({
          type: $Http_Error_Timeout,
          status: xhr.status,
          url: request.url
        })
      })

      xhr.addEventListener('load', (event) => {
        delete this._requests[uid]

        resolve({ body: xhr.responseText, status: xhr.status })
      })

      xhr.addEventListener('abort', (event) => {
        delete this._requests[uid]

        reject({
          type: $Http_Error_Aborted,
          status: xhr.status,
          url: request.url
        })
      })

      xhr.send(request.body)
    })
    `
  }

  fun send (request : Http.Request) : Promise(Http.ErrorResponse, Http.Response) {
    sendWithID(Uid.generate(), request)
  }
}
