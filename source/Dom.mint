module Dom {
  fun createElement (tag : String) : Dom.Element {
    `document.createElement(tag)`
  }

  fun getElementById (id : String) : Maybe(Dom.Element) {
    `
    (() => {
      let element = document.getElementById(id)

      if (element) {
        return new Just(element)
      } else {
        return new Nothing()
      }
    })()
    `
  }

  fun getElementBySelector (selector : String) : Maybe(Dom.Element) {
    `
    (() => {
      try {
        let element = document.querySelector(selector)

        if (element) {
          return new Just(element)
        } else {
          return new Nothing()
        }
      } catch (error) {
        return new Nothing()
      }
    })()
    `
  }

  fun getDimensions (dom : Dom.Element) : Dom.Dimensions {
    `
    (() => {
      const rect = dom.getBoundingClientRect()

      return new Record({
        bottom: rect.bottom,
        height: rect.height,
        width: rect.width,
        right: rect.right,
        left: rect.left,
        top: rect.top,
        x: rect.x,
        y: rect.y
      })
    })()
    `
  }

  fun getValue (dom : Dom.Element) : String {
    `
    (() => {
      let value = dom.value

      if (typeof value === "string") {
        return value
      } else {
        return ""
      }
    })()
    `
  }

  fun setValue (value : String, dom : Dom.Element) : Dom.Element {
    `(dom.value = value) && dom`
  }

  fun matches (selector : String, dom : Dom.Element) : Bool {
    `
    (() => {
      try {
        return dom.matches(selector)
      } catch (error) {
        return false
      }
    })()
    `
  }
}
