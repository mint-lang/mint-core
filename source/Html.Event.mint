record Html.Event {
  bubbles : Bool,
  cancelable : Bool,
  currentTarget : Dom.Element,
  defaultPrevented : Bool,
  eventPhase : Number,
  isTrusted : Bool,
  target : Dom.Element,
  timeStamp : Number,
  type : String,
  data : String,
  altKey : Bool,
  charCode : Number,
  ctrlKey : Bool,
  key : String,
  keyCode : Number,
  locale : String,
  location : Number,
  metaKey : Bool,
  repeat : Bool,
  shiftKey : Bool,
  which : Number,
  button : Number,
  buttons : Number,
  clientX : Number,
  clientY : Number,
  pageX : Number,
  pageY : Number,
  screenX : Number,
  screenY : Number,
  detail : Number,
  deltaMode : Number,
  deltaX : Number,
  deltaY : Number,
  deltaZ : Number,
  animationName : String,
  pseudoElement : String,
  propertyName : String,
  elapsedTime : Number
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
}
