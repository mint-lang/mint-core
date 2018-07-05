/* Represents a subscription for `Provider.Scroll` */
record Provider.Scroll.Subscription {
  scrolls : Function(Html.Event, Void)
}

/* A provider for global scroll events. */
provider Provider.Scroll : Provider.Scroll.Subscription {
  /* Calls the `scrolls` function of the subscribers with the given value. */
  fun scrolls (event : Html.Event) : Void {
    subscriptions
    |> Array.map(
      \subscription : Provider.Scroll.Subscription => subscription.scrolls)
    |> Array.map(
      \subscription : Function(Html.Event, Void) => subscription(event))
    |> Array.do()
  }

  /* Attaches the provider. */
  fun attach : Void {
    `
    (() => {
      const scrolls = this._scrolls || (this._scrolls = this.scrolls.bind(this))

      window.addEventListener("scroll", scrolls)
    })()
    `
  }

  /* Detaches the provider. */
  fun detach : Void {
    `
    (() => {
      window.removeEventListener("mousemove", this._scrolls)
    })()
    `
  }
}
