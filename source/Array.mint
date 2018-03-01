module Array {
  fun first (array : Array(a)) : a {
    `array[0]`
  }

  fun size (array : Array(a)) : Number {
    `array.length`
  }

  fun push (item : a, array : Array(a)) : Array(a) {
    `[...array, item]`
  }

  fun reverse (array : Array(a)) : Array(a) {
    `array.reverse()`
  }

  fun map (func : Function(a, b), array : Array(a)) : Array(b) {
    `array.map(func)`
  }

  fun mapWithIndex (func : Function(a, Number, b), array : Array(a)) : Array(b) {
    `array.map(func)`
  }

  fun select (func : Function(a, Bool), array : Array(a)) : Array(a) {
    `array.filter(func)`
  }

  fun reject (func : Function(a, Bool), array : Array(a)) : Array(a) {
    `array.filter((item) => !func(item))`
  }

  fun find (func : Function(a, Bool), array : Array(a)) : Maybe(a) {
    `
    (() => {
      let item = array.find(func)
      if (item) {
        return new Just(item)
      } else {
        return new Nothing()
      }
    })()
    `
  }

  fun any (func : Function(a, Bool), array : Array(a)) : Bool {
    `!!array.find(func)`
  }

  fun sort (func : Function(a, a, Number), array : Array(a)) : Array(a) {
    `array.sort(func)`
  }

  fun sortBy (func : Function(a, b), array : Array(a)) : Array(a) {
    `
    (() => {
      return array.sort((a, b) => {
        let aVal = func(a)
        let bVal = func(b)

        if (aVal < bVal) {
          return -1
        }

        if (aVal > bVal) {
          return 1
        }

        return 0
      })
    })()
    `
  }

  fun slice (from : Number, to : Number, array : Array(a)) : Array(a) {
    `array.slice(from, to)`
  }

  fun last (array : Array(a)) : a {
    `array[array.length - 1]`
  }

  fun isEmpty (array : Array(a)) : Bool {
    size(array) == 0
  }

  fun intersperse (item : a, array : Array(a)) : Array(a) {
    `array.reduce((a,v)=>[...a,v,item],[]).slice(0,-1)`
  }

  fun contains (other : a, array : Array(a)) : Bool {
    `array.includes(other)`
  }

  fun range (from : Number, to : Number) : Array(Number) {
    `Array.from({ length: to - from }).map((v, i) => i + from)`
  }

  fun join (separator : String, array : Array(String)) : String {
    `array.join(separator)`
  }

  fun do (array : Array(Void)) : Void {
    `null`
  }
}