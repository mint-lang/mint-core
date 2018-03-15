module FormData {
  fun empty : FormData {
    `new FormData`
  }

  fun addString (key : String, value : String, formData : FormData) : FormData {
    `
     (() => {
     	formData.append(key, value)
     	return formData
    })()
    `
  }

  fun addFile (key : String, value : File, formData : FormData) : FormData {
    `
     (() => {
     	formData.append(key, value)
     	return formData
    })()
    `
  }
}
