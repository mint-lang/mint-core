record Html.Event {
  bubbles : Boolean,
  cancelable : Boolean,
  currentTarget : Dom.Element,
  defaultPrevented : Boolean,
  eventPhase : Number,
  isTrusted : Boolean,
  target : Dom.Element,
  timeStamp : Number,
  type : String,
  data : String,
  altKey : Boolean,
  charCode : Number,
  ctrlKey : Boolean,
  key : String,
  keyCode : Number,
  locale : String,
  location : Number,
  metaKey : Boolean,
  repeat : Boolean,
  shiftKey : Boolean,
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
