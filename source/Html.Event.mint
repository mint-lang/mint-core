record Html.Event {
  target : DOM.Element,
  button : Number,
  ctrlKey : Bool,
  pageY : Number,
  pageX : Number
}

module Html.Event {
  fun stopPropagation (event : Html.Event) : Void {
    `event.stopPropagation()`
  }

  fun preventDefault (event : Html.Event) : Void {
    `event.preventDefault()`
  }
}