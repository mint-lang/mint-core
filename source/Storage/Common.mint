enum Storage.Error {
  SecurityError,
  QuotaExceeded,
  NotFound,
  Unkown
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
            return new Err($Storage_Error_SecurityError)
          case 'QUOTA_EXCEEDED_ERR':
            return new Err($Storage_Error_QuotaExceeded)
          case 'QuotaExceededError':
            return new Err($Storage_Error_QuotaExceeded)
          case 'NS_ERROR_DOM_QUOTA_REACHED':
            return new Err($Storage_Error_QuotaExceeded)
          default:
            return new Err($Storage_Error_Unkown)
        }
      }
    })()
    `
  }

  fun get (storage : Storage, key : String) : Result(Storage.Error, String) {
    `
    (() => {
      try {
        let value = storage.getItem(key)

        if (typeof value === "string") {
          return new Ok(value)
        } else {
          return new Err($Storage_Error_NotFound)
        }
      } catch (error) {
        switch(error.name) {
          case 'SecurityError':
            return new Err($Storage_Error_SecurityError)
          default:
            return new Err($Storage_Error_Unkown)
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
            return new Err($Storage_Error_SecurityError)
          default:
            return new Err($Storage_Error_Unkown)
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
            return new Err($Storage_Error_SecurityError)
          default:
            return new Err($Storage_Error_Unkown)
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
            return new Err($Storage_Error_SecurityError)
          default:
            return new Err($Storage_Error_Unkown)
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
            return new Err($Storage_Error_SecurityError)
          default:
            return new Err($Storage_Error_Unkown)
        }
      }
    })()
    `
  }
}
