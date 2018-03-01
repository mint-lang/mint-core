component Html.Fragment {
  property children : Array(Html) = []

  fun render : Array(Html) {
    children
  }
}
