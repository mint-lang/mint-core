module Map {
  fun empty : Map(x, z) {
    `new Map()`
  }

  fun set (key : x, value : z, map : Map(x, z)) : Map(x, z) {
    `
    (() => {
      const newMap = new Map()

      for (let item of map1) {
        newMap.set(item[0], item[1])
      }

      newMap.set(key, value)

      return newMap
    })()
    `
  }

  fun get (key : x, map : Map(x, z)) : Maybe(z) {
    `
    (() => {
      if (map.has(key)) {
        return new Just(map.get(key))
      } else {
        return new Nothing()
      }
    })()
    `
  }

  fun merge (map1 : Map(x, z), map2 : Map(x, z)) : Map(x, z) {
    `
    (() => {
      const map = new Map()

      for (let item of map1) {
        map.set(item[0], item[1])
      }

      for (let item of map2) {
        map.set(item[0], item[1])
      }

      return map
    })()
    `
  }
}
