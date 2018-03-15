record File {
  size : Number,
  type : String,
  name : String
}

module File {
  fun selectMultiple (accept : String) : Promise(Never, Array(File)) {
    `
    (() => {
      let input = document.createElement('input')

      input.style.position = 'absolute'
      input.style.height = '1px'
      input.style.width = '1px'
      input.style.left = '-1px'
      input.style.top = '-1px'

      input.multiple = true
      input.accept = accept
      input.type = 'file'

      document.body.appendChild(input)

      return new Promise((resolve, reject) => {
        input.addEventListener('change', () => {
          resolve(Array.from(input.files))
        })
        input.click()
        document.body.removeChild(input)
      })
    })()
    `
  }

  fun select (accept : String) : Promise(Never, File) {
    `
    (() => {
      let input = document.createElement('input')

      input.style.position = 'absolute'
      input.style.height = '1px'
      input.style.width = '1px'
      input.style.left = '-1px'
      input.style.top = '-1px'

      input.accept = accept
      input.type = 'file'

      document.body.appendChild(input)

      return new Promise((resolve, reject) => {
        input.addEventListener('change', () => {
          resolve(input.files[0])
        })
        input.click()
        document.body.removeChild(input)
      })
    })()
    `
  }

  fun readAsDataURL (file : File) : Promise(Never, String) {
    `
    (() => {
      let reader = new FileReader();
      return new Promise((resolve, reject) => {
        reader.addEventListener('load', (event) => {
          resolve(reader.result)
        })
        reader.readAsDataURL(file)
      })
    })()
    `
  }

  fun readAsString (file : File) : Promise(Never, String) {
    `
    (() => {
      let reader = new FileReader();
      return new Promise((resolve, reject) => {
        reader.addEventListener('load', (event) => {
          resolve(reader.result)
        })
        reader.readAsText(file)
      })
    })()
    `
  }
}
