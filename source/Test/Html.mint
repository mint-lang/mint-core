module Test.Html {
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

  fun triggerClick (selector : String, context : Test.Context(Dom.Element)) : Test.Context(Dom.Element) {
    `
    context.step((element) => {
      element.querySelector(selector).click()
      return element
    })
    `
  }

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
