record Html.Event {
  bubbles : Boolean,
  cancelable : Boolean,
  currentTarget : Dom.Element,
  defaultPrevented : Boolean,
  eventPhase : Number,
  isTrusted : Boolean,
  target : Dom.Element,
  timeStamp : Number,
  type : String
}

module Html.Event {
  fun stopPropagation (event : Html.Event) : Void {
    `event.stopPropagation()`
  }

  fun isPropagationStopped (event : Html.Event) : Bool {
    `event.isPropagationStopped()`
  }

  fun preventDefault (event : Html.Event) : Void {
    `event.preventDefault()`
  }

  fun data (event : Html.Event) : String {
    `
    (() => {
      if (typeof event.data === "string") {
        return event.data
      } else {
        return ""
      }
    })()
    `
  }

  fun altKey (event : Html.Event) : Bool {
    `
    (() => {
      if (typeof event.altKey === "boolean") {
        return event.altKey
      } else {
        return false
      }
    })()
    `
  }

  fun charCode (event : Html.Event) : Number {
    `
    (() => {
      if (typeof event.charCode === "number") {
        return event.charCode
      } else {
        return -1
      }
    })()
    `
  }

  fun pageX (event : Html.Event) : Number {
    `
    (() => {
      if (typeof event.pageX === "number") {
        return event.pageX
      } else {
        return -1
      }
    })()
    `
  }

  fun pageY (event : Html.Event) : Number {
    `
    (() => {
      if (typeof event.pageY === "number") {
        return event.pageY
      } else {
        return -1
      }
    })()
    `
  }
}
