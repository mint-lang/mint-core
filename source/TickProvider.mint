record TickProvider.Subscription {
  ticks : Function(Void)
}

provider TickProvider : TickProvider.Subscription {
  fun update : Void {
    subscriptions
    |> Array.map(\item : TickProvider.Subscription => item.ticks)
    |> Array.map(\func : Function(Void) => func())
    |> Array.do()
  }

  fun attach : Void {
    `
    (() => {
      this.detach()
      this.id = setInterval(this.update.bind(this), 1000)
    })()
    `
  }

  fun detach : Void {
    `clearInterval(this.id)`
  }
}
