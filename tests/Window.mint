suite "Window.title" {
  test "returns the current title" {
    Window.title() == ""
  }
}

suite "Window.setTitle" {
  test "sets the windows title" {
    try {
      Window.setTitle("Test")

      (Window.title() == "Test")
    }
  }
}

suite "Window.url" {
  test "returns the current url" {
    try {
      url =
        Window.url()

      (url.hostname == "localhost")
    }
  }

  test "returns the correct port" {
    try {
      url =
        Window.url()

      (url.port == "3000")
    }
  }
}

suite "Window.width" {
  test "returns the windows width" {
    Window.width() == `window.innerWidth`
  }
}

suite "Window.height" {
  test "returns the windows height" {
    Window.height() == `window.innerHeight`
  }
}
