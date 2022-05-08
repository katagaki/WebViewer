# WebViewer
This project is a template project that allow developers to build their own WebView clients.

## About WebView Clients
WebView clients are basically apps that only have a single WebView, and is meant to be used for a single website (e.g. Wordle).
WebView clients are useful for websites that refuse to build apps (despite apps being a better experience).
However, these WebView clients cannot be submitted to the App Store, and hence have to be built and deployed manually.

## Using WebViewer

1. Download/clone the project
2. Change the developer signing certificate to your own.
3. Change the display name of the project in the Xcode project's settings > General.
4. Use your own bundle identifier, or add the website's domain to the bundle identifier.
   (e.g. `com.tsubuzaki.WebViewer` > `com.tsubuzaki.WebViewer-www-dmm-com`
5. In `Configuration.plist`, configure the homepage of the website by changing the value of the `Home` key.
    - Depending on the website, you may have to add App Transport Security exceptions.
7. Build and install the project onto your iOS device.

## Features...?

- Basic fullscreen WebView that supports back/forward gestures.
- Status bar color that tries to match the top color of the website (it takes the color from the top left pixel).
- When the page is loading, the status bar shows a blue color to indicate as such.
- Web data is saved within the app. To clear the data, simply uninstall the app.
