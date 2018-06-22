/* Renders the children if the given condition is true. */
component If {
  property children : Array(Html) = []
  property condition : Bool = true

  fun render : Array(Html) {
    if (condition) {
      children
    } else {
      []
    }
  }
}
