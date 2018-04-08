record Provider.Mouse.Subscription {
  clicks : Function(Html.Event, Void),
  moves : Function(Html.Event, Void),
  ups : Function(Html.Event, Void)
}

provider Provider.Mouse : Provider.Mouse.Subscription {
  fun moves (event : Html.Event) : Void {
    subscriptions
    |> Array.map(
      \subcription : Provider.Mouse.Subscription => subcription.moves)
    |> Array.map(\func : Function(Html.Event, Void) => func(event))
    |> Array.do()
  }

  fun clicks (event : Html.Event) : Void {
    subscriptions
    |> Array.map(
      \subcription : Provider.Mouse.Subscription => subcription.clicks)
    |> Array.map(\func : Function(Html.Event, Void) => func(event))
    |> Array.do()
  }

  fun ups (event : Html.Event) : Void {
    subscriptions
    |> Array.map(
      \subcription : Provider.Mouse.Subscription => subcription.ups)
    |> Array.map(\func : Function(Html.Event, Void) => func(event))
    |> Array.do()
  }

  fun attach : Void {
    `
    (() => {
      const clicks = this._clicks || (this._clicks = this.clicks.bind(this))
      const moves = this._moves || (this._moves = this.moves.bind(this))
      const ups = this._ups || (this._ups = this.ups.bind(this))

      window.addEventListener("click", clicks, true)
      window.addEventListener("mousemove", moves)
      window.addEventListener("mouseup", ups)
    })()
    `
  }

  fun detach : Void {
    `
    (() => {
      window.removeEventListener("click", this._clicks, true)
      window.removeEventListener("mousemove", this._moves)
      window.removeEventListener("mouseup", this._ups)
    })()
    `
  }
}
