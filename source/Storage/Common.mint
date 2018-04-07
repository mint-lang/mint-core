record Storage.Error {
  type : String
}

module Storage.Common {
  fun set (storage : Storage, key : String, value : String) : Result(Storage.Error, Void) {
    `
    (() => {
      try {
        storage.setItem(key, value)
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

  fun get (storage : Storage, key : String) : Result(Storage.Error, Maybe(String)) {
    `
    (() => {
      try {
        let value = storage.getItem(key)

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

  fun remove (storage : Storage, key : String) : Result(Storage.Error, Void) {
    `
    (() => {
      try {
        storage.removeItem(key)
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

  fun clear (storage : Storage) : Result(Storage.Error, Void) {
    `
    (() => {
      try {
        storage.clear()
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

  fun size (storage : Storage) : Result(Storage.Error, Number) {
    `
    (() => {
      try {
        return new Ok(storage.length)
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

  fun keys (storage : Storage) : Result(Storage.Error, Array(String)) {
    `
    (() => {
      try {
        return new Ok(Object.keys(storage).sort())
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
