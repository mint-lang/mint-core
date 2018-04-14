component Html.Portals.Body {
  property children : Array(Html) = []

  fun render : Html {
    `_createPortal(this.children, document.body)`
  }
}
