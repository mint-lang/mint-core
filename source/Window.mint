module Window {
  fun navigate (url : String) : Void {
    `_navigate(url)`
  }

  fun title : String {
    `document.title`
  }

  fun setTitle (title : String) : Void {
    `document.title = title`
  }

  fun url : Url {
    Url.parse(href())
  }

  fun href : String {
    `window.location.href`
  }

  fun width : Number {
    `window.innerWidth`
  }

  fun height : Number {
    `window.innerHeight`
  }

  fun setScrollTop (position : Number) : Void {
    `window.scrollTo(position, document.body.scrollLeft)`
  }
}
