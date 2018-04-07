module Timer {
  fun timeout (duration : Number, subject : a) : Promise(Never, a) {
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
