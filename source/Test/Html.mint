/* Module for testing `Html` */
module Test.Html {
  /*
    Starts a test of an `Html` node.

    Test.Html.start(<div><{ "Content" }></div>)
  */
  fun start (node : Html) : Test.Context(Dom.Element) {
    `
    (() => {
      let root = document.createElement('div')
      document.body.appendChild(root)
      ReactDOM.render(node, root)
      return new TestContext(root, () => {
        ReactDOM.unmountComponentAtNode(root)
        document.body.removeChild(root)
      })
    })()
    `
  }

  /* Triggers a click event on the element that matches the given selector. */
  fun triggerClick (selector : String, context : Test.Context(Dom.Element)) : Test.Context(Dom.Element) {
    `
    context.step((element) => {
      element.querySelector(selector).click()
      return element
    })
    `
  }

  /* Triggers a mouse down event on the element that matches the given selector. */
  fun triggerMouseDown (selector : String, context : Test.Context(Dom.Element)) : Test.Context(Dom.Element) {
    `
    context.step((element) => {
      let event = document.createEvent ('MouseEvents')
      event.initEvent ("mousedown", true, true)
      element.querySelector(selector).dispatchEvent(event)
      return element
    })
    `
  }

  /* Triggers a mouse move event on the element that matches the given selector. */
  fun triggerMouseMove (selector : String, context : Test.Context(Dom.Element)) : Test.Context(Dom.Element) {
    `
    context.step((element) => {
      let event = document.createEvent ('MouseEvents')
      event.initEvent ("mousemove", true, true)
      element.querySelector(selector).dispatchEvent(event)
      return element
    })
    `
  }

  /* Triggers a mouse up event on the element that matches the given selector. */
  fun triggerMouseUp (selector : String, context : Test.Context(Dom.Element)) : Test.Context(Dom.Element) {
    `
    context.step((element) => {
      let event = document.createEvent ('MouseEvents')
      event.initEvent ("mouseup", true, true)
      element.querySelector(selector).dispatchEvent(event)
      return element
    })
    `
  }

  /* Asserts the text of the element that matches the given selector. */
  fun assertTextOf (selector : String, value : String, context : Test.Context(Dom.Element)) : Test.Context(Dom.Element) {
    `
    context.step((element) => {
      let text = "";

      try {
        text = element.querySelector(selector).textContent
      } catch (error) {
        throw \`Could not find element with selector: ${selector}\`
      }

      if (text == value) {
        return element
      } else {
        throw \`"${text}" != "${value}"\`
      }
    })
    `
  }

  /* Asserts that there is an element that matches the given selector. */
  fun assertElementExists (selector : String, context : Test.Context(Dom.Element)) : Test.Context(Dom.Element) {
    `
    context.step((element) => {
      let subject = element.querySelector(selector)

      if (subject) {
        return element
      } else {
        throw \`Could not find element with selector: ${selector}\`
      }
    })
    `
  }

  /* Asserts the value of a css property on the element that matches the given selector. */
  fun assertCSSOf (selector : String, property : String, value : String, context : Test.Context(Dom.Element)) : Test.Context(Dom.Element) {
    `
    context.step((element) => {
      let subject = element.querySelector(selector)

      if (subject) {
        let actual = getComputedStyle(subject)[property]

        if (actual == value) {
          return element
        } else {
          throw \`Style did not match\`
        }
      } else {
        throw \`Could not find element with selector: ${selector}\`
      }
    })
    `
  }
}
