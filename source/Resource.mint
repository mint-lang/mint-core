/* Functions for prebrowsing and resource hints. */
module Resource {
  /*
  Pre-loads a given URL with a type of resource as soon as possible.

    Resource.preLoad("https://example.com/fonts/font.woff", "font")

    Resource Types: https://developer.mozilla.org/en-US/docs/Web/HTML/Preloading_content#What_types_of_content_can_be_preloaded
  */
  fun preLoad (url : String, type : String) : Promise(Never, Void) {
    `
    (() => {
        var preLoadLink = document.createElement("link");
        preLoadLink.href = url;
        preLoadLink.rel = "preload";
        preLoadLink.as = type;
        document.head.appendChild(preLoadLink);
    })()
    `
  }

  /*
  Pre-fetches a given URL with a low priority.

    Resource.preFetch("page-2.html")
  */
  fun preFetch (url : String) : Promise(Never, Void) {
    `
    (() => {
        var preFetchLink = document.createElement("link");
        preFetchLink.href = url;
        preFetchLink.rel = "prefetch";
        document.head.appendChild(preFetchLink);
    })()
    `
  }

  /*
  Pre-fetches DNS of a given URL in the background.

    Resource.preFetchDns("page-2.html")
  */
  fun preFetchDns (url : String) : Promise(Never, Void) {
    `
    (() => {
        var preFetchDnsLink = document.createElement("link");
        preFetchDnsLink.href = url;
        preFetchDnsLink.rel = "dns-prefetch";
        document.head.appendChild(preFetchDnsLink);
    })()
    `
  }

  /*
  preRender tells the browser to download the entire page in the background.

    Resource.preRender("http://example.com/services.html")
  */
  fun preRender (url : String) : Promise(Never, Void) {
    `
    (() => {
        var preRenderLink = document.createElement("link");
        preRenderLink.href = url;
        preRenderLink.rel = "prerender";
        document.head.appendChild(preRenderLink);
    })()
    `
  }

  /*
  Establish a connection with given URL removing DNS lookup,
  TCP handshake, and TLS negotiation round-trip for HTTPS.

    Resource.preConnect("https://cdn.domain.com")
  */
  fun preConnect (url : String) : Promise(Never, Void) {
    `
    (() => {
        var preConnectLink = document.createElement("link");
        preConnectLink.href = url;
        preConnectLink.rel = "preconnect";
        document.head.appendChild(preConnectLink);
    })()
    `
  }
}
