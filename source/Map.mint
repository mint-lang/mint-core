/* Functions for the Map data structure for mapping keys to values. */
module Map {
  /* Returns an empty map. */
  fun empty : Map(x, z) {
    `new Map()`
  }

  /*
  Sets the given value to the kiven key in the map.

    Map.empty()
    |> Map.set("key", "value")
  */
  fun set (key : x, value : z, map : Map(x, z)) : Map(x, z) {
    `
    (() => {
      const newMap = new Map()

      for (let item of map) {
        newMap.set(item[0], item[1])
      }

      newMap.set(key, value)

      return newMap
    })()
    `
  }

  /*
  Gets the value for the given key of the given Map.

    Map.empty()
    |> Map.set("key", "value")
    |> Map.get("key") == Maybe.just("value")
  */
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

  /*
  Merges two maps together where the second has the precendence.

    a =
      Map.empty()
      |> Map.set("a", "b")

    b =
      Map.empty()
      |> Map.set("a", "y")

    (Map.merge(a, b)
    |> Map.get("a")) == Maybe.just("y")
  */
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
