record Storage.Error {
  type : String
}

module Storage.Local {
  fun set (key : String, value : String) : Result(Storage.Error, Void) {
    `
    (() => {
      try {
        localStorage.setItem(key, value)
        return new Ok(null)
      } catch (error) {
        switch(error.name) {
          case 'SecurityError':
            return new Err({ type: 'SECURITY_ERROR' })
          case 'QUOTA_EXCEEDED_ERR':
            return new Err({ type: 'QUOTA_EXCEEDED' })
          case 'QuotaExceededError':
            return new Err({ type: 'QUOTA_EXCEEDED' })
          default:
            return new Err({ type: 'UNKOWN_ERROR' })
        }
      }
    })()
    `
  }

  fun get (key : String) : Result(Storage.Error, Maybe(String)) {
    `
    (() => {
      try {
        let value = localStorage.getItem(key)

        if (typeof value === "string") {
          return new Ok(new Just(value))
        } else {
          return new Ok(new Nothing())
        }
      } catch (error) {
        switch(error.name) {
          case 'SecurityError':
            return new Err({ type: 'SECURITY_ERROR' })
          default:
            return new Err({ type: 'UNKOWN_ERROR' })
        }
      }
    })()
    `
  }

  fun remove (key : String) : Result(Storage.Error, Void) {
    `
    (() => {
      try {
        localStorage.removeItem(key)
        return new Ok(null)
      } catch (error) {
        switch(error.name) {
          case 'SecurityError':
            return new Err({ type: 'SECURITY_ERROR' })
          default:
            return new Err({ type: 'UNKOWN_ERROR' })
        }
      }
    })()
    `
  }

  fun clear : Result(Storage.Error, Void) {
    `
    (() => {
      try {
        localStorage.clear()
        return new Ok(null)
      } catch (error) {
        switch(error.name) {
          case 'SecurityError':
            return new Err({ type: 'SECURITY_ERROR' })
          default:
            return new Err({ type: 'UNKOWN_ERROR' })
        }
      }
    })()
    `
  }

  fun size : Result(Storage.Error, Number) {
    `
    (() => {
      try {
        return new Ok(localStorage.length)
      } catch (error) {
        switch(error.name) {
          case 'SecurityError':
            return new Err({ type: 'SECURITY_ERROR' })
          default:
            return new Err({ type: 'UNKOWN_ERROR' })
        }
      }
    })()
    `
  }

  fun keys : Result(Storage.Error, Array(String)) {
    `
    (() => {
      try {
        return new Ok(Object.keys(localStorage).sort())
      } catch (error) {
        switch(error.name) {
          case 'SecurityError':
            return new Err({ type: 'SECURITY_ERROR' })
          default:
            return new Err({ type: 'UNKOWN_ERROR' })
        }
      }
    })()
    `
  }
}
