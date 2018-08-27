module Set {
  fun empty : Set(a) {
    `new Set()`
  }

  fun toArray (set : Set(a)) : Array(a) {
    `Array.from(set)`
  }

  fun has (value : a, set : Set(a)) : Bool {
    `set.has(value)`
  }

  fun add (value : a, set : Set(a)) : Set(a) {
    `
    (() => {
      const newSet = new Set()

      set.forEach((item) => {
        newSet.add(item)
      })

      newSet.add(value)

      return newSet
    })()
    `
  }

  fun delete (value : a, set : Set(a)) : Set(a) {
    `
    (() => {
      const newSet = new Set()

      set.forEach((item) => {
        newSet.add(item)
      })

      newSet.delete(value)

      return newSet
    })()
    `
  }

  fun map (method : Function(a, b), set : Set(a)) : Array(b) {
    `
    (() => {
      const array = []

      set.forEach((item) => {
        array.push(method(item))
      })

      return array
    })()
    `
  }
}
