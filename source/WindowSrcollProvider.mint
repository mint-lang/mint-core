record WindowScrollProvider.Subscription {
  scrolls : Function(Void)
}

provider WindowScrollProvider : WindowScrollProvider.Subscription {
  fun scrolls : Void {
    subscriptions
    |> Array.map(
      \subscription : WindowScrollProvider.Subscription => subscription.scrolls)
    |> Array.map(\subscription : Function(Void) => subscription())
    |> Array.do()
  }

  fun attach : Void {
    `
    (() => {
      window.addEventListener("scroll", this._scrolls || (this._scrolls = this.scrolls.bind(this)))
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
