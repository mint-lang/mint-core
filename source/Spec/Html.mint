module Spec.Html {
  fun run (context : Spec.Context(a)) : Promise(String, a) {
    `context.run()`
  }

  fun start (node : Html) : Spec.Context(DOM.Element) {
    `
    (() => {
      let root = document.createElement('div')
      document.body.appendChild(root)
      ReactDOM.render(node, root)
      return new SpecContext(root)
    })()
    `
  }

  fun triggerClick (selector : String, context : Spec.Context(DOM.Element)) : Spec.Context(DOM.Element) {
    `
    context.step((element) => {
      element.querySelector(selector).click()
      return element
    })
    `
  }

  fun triggerMouseDown (selector : String, context : Spec.Context(DOM.Element)) : Spec.Context(DOM.Element) {
    `
    context.step((element) => {
      var clickEvent = document.createEvent ('MouseEvents')
     clickEvent.initEvent ("mousedown", true, true)
     element.querySelector(selector).dispatchEvent(clickEvent)
      return element
    })
    `
  }

  fun assertText (selector : String, value : String, context : Spec.Context(DOM.Element)) : Spec.Context(DOM.Element) {
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

  fun assertElement (selector : String, context : Spec.Context(DOM.Element)) : Spec.Context(DOM.Element) {
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

  fun assertCSSOf (selector : String, property : String, value : String, context : Spec.Context(DOM.Element)) : Spec.Context(DOM.Element) {
    `
    context.step((element) => {
          let subject = element.querySelector(selector)
          if (subject) {
            let actual = getComputedStyle(subject)[property]
            console.log(getComputedStyle(subject)[property])
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
