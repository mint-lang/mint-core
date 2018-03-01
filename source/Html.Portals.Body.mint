component Html.Portals.Body {
  property element : Html = Html.empty()

  fun render : Html {
    `ReactDOM.createPortal(this.element, document.body)`
  }
}
