module Test.Html {
  fun start (node : Html) : Test.Context(Dom.Element) {
    `
    (() => {
      let root = document.createElement('div')
      document.body.appendChild(root)
      ReactDOM.render(node, root)
      return new SpecContext(root)
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

  fun assertText (selector : String, value : String, context : Test.Context(Dom.Element)) : Test.Context(Dom.Element) {
    `
    context.step((element) => {
      let text = element.querySelector(selector).textContent

      if (text == value) {
        return element
      } else {
        throw \`"${text}" != "${value}"\`
      }
    })
    `
  }

  fun assertElement (selector : String, context : Test.Context(Dom.Element)) : Test.Context(Dom.Element) {
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