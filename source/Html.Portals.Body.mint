component Html.Portals.Body {
  property element : Html = Html.empty()

  fun render : Html {
    `_.createPortal(this.element, document.body)`
  }
}
