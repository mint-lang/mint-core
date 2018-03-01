module Window {
  fun setTitle (title : String) : Void {
    `document.title = title`
  }

  fun width : Number {
    `window.innerWidth`
  }

  fun height : Number {
    `window.innerHeight`
  }
}
