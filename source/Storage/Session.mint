module Storage.Session {
  fun set (key : String, value : String) : Result(Storage.Error, Void) {
    Storage.Common.set(`sessionStorage`, key, value)
  }

  fun get (key : String) : Result(Storage.Error, String) {
    Storage.Common.get(`sessionStorage`, key)
  }

  fun remove (key : String) : Result(Storage.Error, Void) {
    Storage.Common.remove(`sessionStorage`, key)
  }

  fun clear : Result(Storage.Error, Void) {
    Storage.Common.clear(`sessionStorage`)
  }

  fun size : Result(Storage.Error, Number) {
    Storage.Common.size(`sessionStorage`)
  }

  fun keys : Result(Storage.Error, Array(String)) {
    Storage.Common.keys(`sessionStorage`)
  }
}
