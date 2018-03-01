module Json {
  fun parse (input : String) : JSObject {
    `JSON.parse(input)`
  }

  fun stringify (input : JSObject) : String {
    `JSON.stringify(input)`
  }
}
