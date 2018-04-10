suite "Html.Event.stopPropagation" {
  test "it stops propagation" {
    Html.Event.stopPropagation(`{ stopPropagation: () => "A"}`) == `"A"`
  }
}

suite "Html.Event.preventDefault" {
  test "it prevents default" {
    Html.Event.preventDefault(`{ preventDefault: () => "A"}`) == `"A"`
  }
}

suite "Html.Event.isPropagationStopped" {
  test "it prevents default" {
    Html.Event.isPropagationStopped(
      `{ isPropagationStopped: () => true}`) == true
  }
}

suite "Html.Event.data" {
  test "it returns it if it's a string" {
    Html.Event.data(`{ data: "Hello" }`) == "Hello"
  }

  test "it returns an empty string if it's not a string" {
    Html.Event.data(`{ data: 0 }`) == ""
  }
}

suite "Html.Event.altKey" {
  test "it returns it if it's a boolean" {
    Html.Event.altKey(`{ altKey: true }`)
  }

  test "it returns an false if it's not a boolean" {
    Html.Event.altKey(`{ altKey: 0 }`) == false
  }
}

suite "Html.Event.charCode" {
  test "it returns it if it's a number" {
    Html.Event.charCode(`{ charCode: 0 }`) == 0
  }

  test "it returns an false if it's not a number" {
    Html.Event.charCode(`{ charCode: "0" }`) == -1
  }
}

suite "Html.Event.pageX" {
  test "it returns it if it's a number" {
    Html.Event.pageX(`{ pageX: 0 }`) == 0
  }

  test "it returns an false if it's not a number" {
    Html.Event.pageX(`{ pageX: "0" }`) == -1
  }
}

suite "Html.Event.pageY" {
  test "it returns it if it's a number" {
    Html.Event.pageY(`{ pageY: 0 }`) == 0
  }

  test "it returns an false if it's not a number" {
    Html.Event.pageY(`{ pageY: "0" }`) == -1
  }
}
