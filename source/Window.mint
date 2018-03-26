module Window {
  fun setTitle (title : String) : Void {
    `document.title = title`
  }

  fun url : Url {
    Url.parse(`window.location.href`)
  }

  fun setScrollTop (position : Number) : Void {
    `window.scrollTo(position, document.body.scrollLeft)`
  }

  fun width : Number {
    `window.innerWidth`
  }

  fun height : Number {
    `window.innerHeight`
  }
}
