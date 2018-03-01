module Timer {
  fun timeout (duration : Number) : Promise(Void, Void) {
    `
    new Promise((resolve) => {
    	setTimeout(resolve, duration)
    })
    `
  }

  fun waitForNextFrame : Promise(Void, Void) {
    `
    new Promise((resolve) => {
    	requestAnimationFrame(resolve)
    })
    `
  }
}
