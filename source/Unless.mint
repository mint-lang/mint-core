/* Renders the children if the given condition is false. */
component Unless {
  property children : Array(Html) = []
  property condition : Bool = true

  fun render : Array(Html) {
    if (!condition) {
      children
    } else {
      []
    }
  }
}
