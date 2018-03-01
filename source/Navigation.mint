record Location {
  pathname : String
}

module Navigation {
  fun navigate (url : String) : Void {
    `Mint.navigate(url)`
  }
}
