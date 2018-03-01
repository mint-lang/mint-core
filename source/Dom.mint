record DOM.Element {
  value : String
}

record DOM.Dimensions {
  height : Number,
  width : Number,
  bottom : Number,
  right : Number,
  left : Number,
  top : Number,
  x : Number,
  y : Number
}

module DOM {
  fun equals (a : DOM.Dimensions, b : DOM.Dimensions) : Bool {
    a.bottom == b.bottom && a.right == b.right && a.left == b.left && a.top == b.top
  }

  fun dummyElement : DOM.Element {
    `document.createElement('div')`
  }

  fun getElementById (id : String) : DOM.Element {
    `document.getElementById(id)`
  }

  fun setStyle (prop : String, value : String, dom : DOM.Element) : Void {
    `dom.style[prop] = value`
  }

  fun emptyDimensions : DOM.Dimensions {
    {
      bottom = 0,
      height = 0,
      width = 0,
      right = 0,
      left = 0,
      top = 0,
      x = 0,
      y = 0
    }
  }

  fun getDimensions (dom : DOM.Element) : DOM.Dimensions {
    `dom.getBoundingClientRect()`
  }

  fun matches (selector : String, dom : DOM.Element) : Bool {
    `dom.matches(selector)`
  }
}
