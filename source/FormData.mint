module FormData {
  fun empty : FormData {
    `new FormData`
  }

  fun keys (formData : FormData) : Array(String) {
    `Array.from(formData.keys())`
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
