import QtQuick 2.0
import QtWebView 1.1
import Felgo 3.0

Page {
    id: mapPage
    title: "Broker Map"

    visible: true
    width: parent.width
    height: parent.height

    WebView {
        id: myWebView
        url: "mcmap1.html"
        width: parent.width
        height: parent.height

      }
}


