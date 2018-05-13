module Storage.Local {
  fun set (key : String, value : String) : Result(Storage.Error, Void) {
    Storage.Common.set(`localStorage`, key, value)
  }

  fun get (key : String) : Result(Storage.Error, String) {
    Storage.Common.get(`localStorage`, key)
  }

  fun remove (key : String) : Result(Storage.Error, Void) {
    Storage.Common.remove(`localStorage`, key)
  }

  fun clear : Result(Storage.Error, Void) {
    Storage.Common.clear(`localStorage`)
  }

  fun size : Result(Storage.Error, Number) {
    Storage.Common.size(`localStorage`)
  }

  fun keys : Result(Storage.Error, Array(String)) {
    Storage.Common.keys(`localStorage`)
  }
}
