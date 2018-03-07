module Window {
  fun setTitle (title : String) : Void {
    `document.title = title`
  }

  fun url : Url {
    Url.parse(`window.location.href`)
  }

  fun width : Number {
    `window.innerWidth`
  }

  fun height : Number {
    `window.innerHeight`
  }
}
