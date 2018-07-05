/* Represents a subscription for `Provider.Tick` */
record Provider.Tick.Subscription {
  ticks : Function(Void)
}

/* A provider for periodic updated (every 1 seconds). */
provider Provider.Tick : Provider.Tick.Subscription {
  /* Updates the subscribers. */
  fun update : Void {
    subscriptions
    |> Array.map(\item : Provider.Tick.Subscription => item.ticks)
    |> Array.map(\func : Function(Void) => func())
    |> Array.do()
  }

  /* Attaches the provider. */
  fun attach : Void {
    `
    (() => {
      this.detach()
      this.id = setInterval(this.update.bind(this), 1000)
    })()
    `
  }

  /* Detaches the provider. */
  fun detach : Void {
    `clearInterval(this.id)`
  }
}
