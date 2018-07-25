/* Module for functions to manipulate immutable arrays. */
module Array {
  /*
  Returns the first element of the array as `Maybe.just(a)` or `Maybe.nothing()`.

    Array.first([]) == Maybe.nothing()
    Array.first(["a", "x"]) == Maybe.just("a")
  */
  fun first (array : Array(a)) : Maybe(a) {
    `
    (() => {
      let first = array[0]
      if (first !== undefined) {
        return new Just(first)
      } else {
        return new Nothing()
      }
    })()
    `
  }

  /*
  Returns the first element of the array or the default value.

    Array.firstWithDefault("a", []) == "a"
    Array.firstWithDefault("a", ["b", "x"]) == "b"
  */
  fun firstWithDefault (item : a, array : Array(a)) : a {
    first(array)
    |> Maybe.withDefault(item)
  }

  /*
  Returns the last element of the array as `Just(a)` or `Nothing`.

    Array.last([]) == Maybe.nothing()
    Array.last(["x", "a"]) == Maybe.just("a")
  */
  fun last (array : Array(a)) : Maybe(a) {
    `
    (() => {
      let last = array[array.length - 1]
      if (last !== undefined) {
        return new Just(last)
      } else {
        return new Nothing()
      }
    })()
    `
  }

  /*
  Returns the last element of the array or the default value.

    Array.lastWithDefault("a", []) == "a"
    Array.lastWithDefault("a", ["x", "b"]) == "b"
  */
  fun lastWithDefault (item : a, array : Array(a)) : a {
    last(array)
    |> Maybe.withDefault(item)
  }

  /*
  Returns the size of the array.

    Array.size([]) == 0
    Array.size([1, 2, 3]) == 3
  */
  fun size (array : Array(a)) : Number {
    `array.length`
  }

  /*
  Push an element to the end of an array.

    Array.push("a", []) == ["a"]
    Array.push(4, [1, 2, 3]) == [1, 2, 3, 4]
  */
  fun push (item : a, array : Array(a)) : Array(a) {
    `[...array, item]`
  }

  /*
  Returns a new array where the elements are reversed. The first array element
  becomes the last, and the last array element becomes the first.

    Array.reverse([1, 2, 3]) == [4, 3, 2, 1]
  */
  fun reverse (array : Array(a)) : Array(a) {
    `array.slice().reverse()`
  }

  /*
  Creates a new array with the results of calling a provided
  function on every element in the given array.

    Array.map((number : Number) : Number => { number + 1 }, [1, 2, 3]) == [2, 3, 4]
  */
  fun map (func : Function(a, b), array : Array(a)) : Array(b) {
    `array.map(func)`
  }

  /*
  Creates a new array with the results of calling a provided
  function on every element in the given array while providing the index of
  the element.

    Array.mapWithIndex(
      (index : Number, number : Number) : Number => { number + index }, [1, 2, 3]) == [2, 4, 6]
  */
  fun mapWithIndex (func : Function(a, Number, b), array : Array(a)) : Array(b) {
    `array.map(func)`
  }

  /*
  Returns all elements that matches the predicate function.

    Array.select((number : Number) : Bool => { number % 2 == 0 }, [1, 2, 3, 4]) == [2, 4]
  */
  fun select (func : Function(a, Bool), array : Array(a)) : Array(a) {
    `array.filter(func)`
  }

  /*
  Returns all elements that does not matches the predicate function.

    Array.reject((number : Number) : Bool => { number % 2 == 0 }, [1, 2, 3, 4]) == [1, 3]
  */
  fun reject (func : Function(a, Bool), array : Array(a)) : Array(a) {
    `array.filter((item) => !func(item))`
  }

  /*
  Finds the first element in the array that matches the predicate function.

    Array.find((number : Number) : Bool => { number % 2 == 0 }, [1, 2, 3, 4]) == Maybe.just(2)
  */
  fun find (func : Function(a, Bool), array : Array(a)) : Maybe(a) {
    `
    (() => {
      let item = array.find(func)

      if (item != undefined) {
        return new Just(item)
      } else {
        return new Nothing()
      }
    })()
    `
  }

  /*
  Returns `true` if any item in the array matches the prdicate function
  `false` otherwise.

    Array.any((number : Number) : Bool => { number % 2 == 0 }, [1, 2, 3, 4]) == true
    Array.any((number : Number) : Bool => { number % 2 == 0 }, [1, 3]) == false
  */
  fun any (func : Function(a, Bool), array : Array(a)) : Bool {
    `!!array.find(func)`
  }

  /*
  Returns a new sorted array using the given sorting function.

    Array.sort((a : Number, b : Number) : Number => { a - b }, [4, 1, 3, 2]) == [1, 2, 3, 4]
  */
  fun sort (func : Function(a, a, Number), array : Array(a)) : Array(a) {
    `array.slice().sort(func)`
  }

  /*
  Returns a new sorted array using the given functions return as the base of
  the sorting.


    Array.sortBy((number : Number) : Number => { number }, [4, 1, 3, 2]) == [1, 2, 3, 4]
  */
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

  /*
  Returns a copy of a portion of an array (end not included).

    Array.slice(2, 4, ["ant", "bison", "camel", "duck", "elephant"]) == ["camel", "duck"]
  */
  fun slice (begin : Number, end : Number, array : Array(a)) : Array(a) {
    `array.slice(begin, end)`
  }

  /*
  Returns whether or not the array is empty.

    Array.isEmpty([]) == true
    Array.isEmpty(["a", "b"]) == false
  */
  fun isEmpty (array : Array(a)) : Bool {
    size(array) == 0
  }

  /*
  Inserts the given element between the elements of the given array.

    Array.intersperse("a", ["x", "y", "z"]) == ["x", "a", "y", "a", "z"]
  */
  fun intersperse (item : a, array : Array(a)) : Array(a) {
    `array.reduce((a,v)=>[...a,v,item],[]).slice(0,-1)`
  }

  /*
  Checks whether or not the given element exists in the array.

    Array.contains("a", ["a", "b", "c"]) == true
    Array.contains("a", ["x", "y", "z"]) == false
  */
  fun contains (other : a, array : Array(a)) : Bool {
    `
    (() => {
      for (let item of array) {
        if (_compare(other, item)) {
          return true
        }
      }

      return false
    })()
    `
  }

  /*
  Creates an array of numbers starting from the first agrument and
  ending in the last.

    Array.range(0, 5) == [0, 1, 2, 3, 4, 5]
  */
  fun range (from : Number, to : Number) : Array(Number) {
    `Array.from({ length: (to + 1) - from }).map((v, i) => i + from)`
  }

  /*
  Deletes every occurence of the given element from the array.

    Array.delete("a", ["a", "b", "c"]) == ["b", "c"]
  */
  fun delete (what : a, array : Array(a)) : Array(a) {
    reject((item : a) : Bool => { item != what }, array)
  }

  /*
  Returns the maximum value of an array of numbers.

    Array.max([0, 1, 2, 3, 4]) == 4
    Array.max([]) == 0
  */
  fun max (array : Array(Number)) : Number {
    `Math.max(...array)`
  }

  /*
  Returns an random element from the array.

    Array.sample(["a"]) == Maybe.just("a")
    Array.sample() == Maybe.nothing()
  */
  fun sample (array : Array(a)) : Maybe(a) {
    `
    (() => {
      if (array.length) {
        return new Just(array[Math.floor(Math.random() * array.length)])
      } else {
        return new Nothing()
      }
    })()
    `
  }

  /*
  Returns the element at the given index.

    Array.at(0, [0]) == Maybe.just(0)
    Array.at(1, [0]) == Maybe.nothing()
  */
  fun at (index : Number, array : Array(a)) : Maybe(a) {
    `
    (() => {
      let item = array[index]
      if (item !== undefined) {
        return new Just(item)
      } else {
        return new Nothing()
      }
    })()
    `
  }

  /*
  Collapses an array of voids into a single void.

    Array.do([
      do {
        Debug.log("a")
      },
      do {
        Debug.log("b")
      }
    ])
  */
  fun do (array : Array(Void)) : Void {
    `null`
  }

  /*
  Applies the given function against an accumulator and each element in the
  array (from left to right) to reduce it to a single value.

    Array.reduce(
      0,
      (memo : Number, item : Number) : Number => { memo + item },
      [1, 2, 3]) == 6
  */
  fun reduce (initial : a, method : Function(b, a, b), array : Array(a)) : b {
    `array.reduce(method, initial)`
  }
}
