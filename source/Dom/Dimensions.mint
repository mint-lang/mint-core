record Dom.Dimensions {
  height : Number,
  bottom : Number,
  width : Number,
  right : Number,
  left : Number,
  top : Number,
  x : Number,
  y : Number
}

module Dom.Dimensions {
  fun empty : Dom.Dimensions {
    {
      bottom = 0,
      height = 0,
      width = 0,
      right = 0,
      left = 0,
      top = 0,
      x = 0,
      y = 0
    }
  }
}
