record Http.Header {
  value : String,
  key : String
}

record Http.Request {
  headers : Array(Http.Header),
  withCredentials : Bool,
  method : String,
  body : String,
  url : String
}

record Http.Response {
  status : Number,
  body : String
}

record Http.Error {
  status : Number,
  type : String,
  url : String
}

module Http {
  fun empty : Http.Request {
    {
      withCredentials = false,
      method = "GET",
      headers = [],
      body = "",
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

  fun body (value : String, request : Http.Request) : Http.Request {
    { request | body = value }
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
        Array.push({
          value = value,
          key = key
        }, request.headers)
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

  fun sendWithID (uid : String, request : Http.Request) : Promise(Http.Error, Http.Response) {
    `
    new Promise((resolve, reject) => {
      if (!this._requests) { this._requests = {} }

      let xhr = new XMLHttpRequest()

      this._requests[uid] = xhr

      xhr.withCredentials = request.withCredentials

      try {
        xhr.open(request.method.toUpperCase(), request.url, true)
      } catch (e) {
        reject({ type: 'bad-url', url: request.url, status: xhr.status })
        delete this._requests[uid]
      }

      request.headers.forEach((item) => {
        xhr.setRequestHeader(item.key, item.value)
      })

      xhr.addEventListener('error', (event) => {
        reject({ type: 'network-error', url: request.url, status: xhr.status })
        delete this._requests[uid]
      })

      xhr.addEventListener('timeout', (event) => {
        reject({ type: 'timeout', url: request.url, status: xhr.status })
        delete this._requests[uid]
      })

      xhr.addEventListener('load', (event) => {
        resolve({ body: xhr.responseText, status: xhr.status })
        delete this._requests[uid]
      })

      xhr.addEventListener('abort', (event) => {
        reject({ type: 'aborted', status: xhr.status })
        delete this._requests[uid]
      })

      xhr.send(request.body)
    })
    `
  }

  fun send (request : Http.Request) : Promise(Http.Error, Http.Response) {
    sendWithID(Uid.generate(), request)
  }
}