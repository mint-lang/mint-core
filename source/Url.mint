record Url {
  hostname : String,
  protocol : String,
  origin : String,
  search : String,
  path : String,
  hash : String,
  host : String,
  port : String
}

module Url {
  fun parse (url : String) : Url {
    `
    (() => {
      if (!this._a) {
        this._a = document.createElement('a')
      }

      this._a.href = url

      return {
        hostname: this._a.hostname,
        protocol: this._a.protocol,
        origin: this._a.origin,
        path: this._a.pathname,
        search: this._a.search,
        hash: this._a.hash,
        host: this._a.host,
        port: this._a.port
      }
    })()
    `
  }
}
