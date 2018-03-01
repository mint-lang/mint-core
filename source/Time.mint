module Time {
  fun fromIso (raw : String) : Time {
    `new Date(raw)`
  }

  fun now : Time {
    `new Date()`
  }

  fun today : Time {
    `
    (() => {
      let date = new Date()
      return new Date(date.getFullYear(), date.getMonth(), date.getDate())
    })()
    `
  }

  fun equals (a : Time, b : Time) : Bool {
    `+a == +b`
  }

  fun from (year : Number, month : Number, day : Number) : Time {
    `new Date(year, month, day)`
  }

  fun day (date : Time) : Number {
    `date.getDate()`
  }

  fun month (date : Time) : Number {
    `date.getMonth()`
  }

  fun toIso (date : Time) : String {
    `date.toISOString()`
  }

  fun format (pattern : String, date : Time) : String {
    `dateFns.format(date, pattern)`
  }

  fun startOf (what : String, date : Time) : Time {
    `
    (() => {
      switch (what) {
        case 'month':
          return dateFns.startOfMonth(date)
        case 'week':
          return dateFns.startOfWeek(date, { weekStartsOn: 1 })
        case 'day':
          return dateFns.startOfDay(date)
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
          return dateFns.endOfMonth(date)
        case 'week':
          return dateFns.endOfWeek(date, { weekStartsOn: 1 })
        case 'day':
          return dateFns.endOfDay(date)
        default:
          return date
      }
    })()
    `
  }

  fun range (from : Time, to : Time) : Array(Time) {
    `dateFns.eachDay(from, to)`
  }

  fun nextMonth (date : Time) : Time {
    `
    (() => {
      return dateFns.addMonths(date, 1)
    })()
    `
  }

  fun previousMonth (date : Time) : Time {
    `
    (() => {
      return dateFns.addMonths(date, -1)
    })()
    `
  }

  fun relative (other : Time, now : Time) : String {
    `
    (() => {
      return dateFns.distanceInWordsStrict(now, other, { addSuffix: true })
    })()
    `
  }
}
