module Timer {
  fun timeout (subject : a, duration : Number) : Promise(Never, a) {
    `
    new Promise((resolve) => {
    	setTimeout(() => {
        resolve(subject)
      }, duration)
    })
    `
  }

  fun nextFrame (subject : a) : Promise(Never, a) {
    `
    new Promise((resolve) => {
    	requestAnimationFrame(() => {
        resolve(subject)
      })
    })
    `
  }
}
