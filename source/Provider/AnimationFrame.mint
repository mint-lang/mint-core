record Provider.AnimationFrame.Subscription {
  frames : Function(Void)
}

provider Provider.AnimationFrame : Provider.AnimationFrame.Subscription {
  fun update : Void {
    subscriptions
    |> Array.map(
      \item : Provider.AnimationFrame.Subscription => item.frames)
    |> Array.map(\func : Function(Void) => func())
    |> Array.do()
  }

  fun attach : Void {
    `
    (() => {
      this.detach()
      this.id = this.frame()
    })()
    `
  }

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

  fun detach : Void {
    `cancelAnimationFrame(this.id)`
  }
}
