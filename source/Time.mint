module Time {
  fun fromIso (raw : String) : Maybe(Time) {
    `
    (() => {
      try {
        return new Just(new Date(raw))
      } catch (error) {
        return new Nothing()
      }
    })()
    `
  }

  fun toIso (date : Time) : String {
    `date.toISOString()`
  }

  fun now : Time {
    `new Date()`
  }

  fun today : Time {
    `
    (() => {
      const date = new Date()

      return new Date(Date.UTC(
        date.getUTCFullYear(),
        date.getUTCMonth(),
        date.getUTCDate()
      ))
    })()
    `
  }

  fun from (year : Number, month : Number, day : Number) : Time {
    `new Date(Date.UTC(year, month - 1, day))`
  }

  fun day (date : Time) : Number {
    `date.getUTCDate()`
  }

  fun month (date : Time) : Number {
    `(date.getUTCMonth() + 1)`
  }

  fun year (date : Time) : Number {
    `date.getUTCFullYear()`
  }

  fun format (pattern : String, date : Time) : String {
    `DateFNS.format(date, pattern)`
  }

  fun startOf (what : String, date : Time) : Time {
    `
    (() => {
      switch (what) {
        case 'month':
          return DateFNS.startOfMonth(date)
        case 'week':
          return DateFNS.startOfWeek(date, { weekStartsOn: 1 })
        case 'day':
          return DateFNS.startOfDay(date)
        default:
          return date
      }
    })()
    `
  }

  fun endOf (what : String, date : Time) : Time {
    `
    (() => {
      switch (what) {
        case 'month':
          return DateFNS.endOfMonth(date)
        case 'week':
          return DateFNS.endOfWeek(date, { weekStartsOn: 1 })
        case 'day':
          return DateFNS.endOfDay(date)
        default:
          return date
      }
    })()
    `
  }

  fun range (from : Time, to : Time) : Array(Time) {
    `DateFNS.eachDay(from, to)`
  }

  fun nextMonth (date : Time) : Time {
    `
    (() => {
      return DateFNS.addMonths(date, 1)
    })()
    `
  }

  fun previousMonth (date : Time) : Time {
    `
    (() => {
      return DateFNS.addMonths(date, -1)
    })()
    `
  }

  fun relative (other : Time, now : Time) : String {
    `
    (() => {
      return DateFNS.distanceInWordsStrict(now, other, { addSuffix: true })
    })()
    `
  }
}
