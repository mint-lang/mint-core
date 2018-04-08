record Provider.Scroll.Subscription {
  scrolls : Function(Html.Event, Void)
}

provider Provider.Scroll : Provider.Scroll.Subscription {
  fun scrolls (event : Html.Event) : Void {
    subscriptions
    |> Array.map(
      \subscription : Provider.Scroll.Subscription => subscription.scrolls)
    |> Array.map(
      \subscription : Function(Html.Event, Void) => subscription(event))
    |> Array.do()
  }

  fun attach : Void {
    `
    (() => {
      const scrolls = this._scrolls || (this._scrolls = this.scrolls.bind(this))

      window.addEventListener("scroll", scrolls)
    })()
    `
  }

  fun detach : Void {
    `
    (() => {
      window.removeEventListener("mousemove", this._scrolls)
    })()
    `
  }
}
