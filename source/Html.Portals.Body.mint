/* A React portal for the body. */
component Html.Portals.Body {
  property children : Array(Html) = []

  /* Renders the children into the documents body. */
  fun render : Html {
    `_createPortal(this.children, document.body)`
  }
}
