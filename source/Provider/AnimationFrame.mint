/* Represents a subscription for `Provider.AnimationFrame` */
record Provider.AnimationFrame.Subscription {
  frames : Function(Void)
}

/* A provider for the `requestAnimationFrame` API. */
provider Provider.AnimationFrame : Provider.AnimationFrame.Subscription {
  /* Updates the subscribers. */
  fun update : Void {
    subscriptions
    |> Array.map(
      \item : Provider.AnimationFrame.Subscription => item.frames)
    |> Array.map(\func : Function(Void) => func())
    |> Array.do()
  }

  /* Attaches the provider. */
  fun attach : Void {
    `
    (() => {
      this.detach()
      this.id = this.frame()
    })()
    `
  }

  /* This function handles the animation frame. */
  fun frame : Void {
    `
    (() => {
      this.id = requestAnimationFrame(() => {
        this.update()
        this.frame()
      })
    })()
    `
  }

  /* Detaches the provider. */
  fun detach : Void {
    `cancelAnimationFrame(this.id)`
  }
}
