record MouseProvider.Position {
  left : Number,
  top : Number
}

record MouseProvider.Subscription {
  moves : Function(MouseProvider.Position, Void),
  clicks : Function(Html.Event, Void),
  ups : Function(Html.Event, Void)
}

provider MouseProvider : MouseProvider.Subscription {
  fun moves (event : Html.Event) : Void {
    subscriptions
    |> Array.map(
      \subcription : MouseProvider.Subscription => subcription.moves)
    |> Array.map(
      \func : Function(MouseProvider.Position, Void) =>
        func({
          top = event.pageY,
          left = event.pageX
        }))
    |> Array.do()
  }

  fun clicks (event : Html.Event) : Void {
    subscriptions
    |> Array.map(
      \subcription : MouseProvider.Subscription => subcription.clicks)
    |> Array.map(\func : Function(Html.Event, Void) => func(event))
    |> Array.do()
  }

  fun ups (event : Html.Event) : Void {
    subscriptions
    |> Array.map(
      \subcription : MouseProvider.Subscription => subcription.ups)
    |> Array.map(\func : Function(Html.Event, Void) => func(event))
    |> Array.do()
  }

  fun attach : Void {
    `
    (() => {
      window.addEventListener("mousemove", this._moves || (this._moves = this.moves.bind(this)))
      window.addEventListener("click", this._clicks || (this._clicks = this.clicks.bind(this)), true)
      window.addEventListener("mouseup", this._ups || (this._ups = this.ups.bind(this)))
    })()
    `
  }

  fun detach : Void {
    `
    (() => {
      window.removeEventListener("mousemove", this._moves)
      window.removeEventListener("click", this._clicks, true)
      window.removeEventListener("mouseup", this._ups)
    })()
    `
  }
}
