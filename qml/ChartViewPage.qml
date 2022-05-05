import Felgo 3.0
import QtQuick 2.0
import QtWebView 1.1
import 'mcalc.js' as Helper

Page{

    visible: true
    width: parent.width
    height: parent.height

     WebView {
        id: myWebView

        width: parent.width
        height: parent.height

            Component.onCompleted:{
               loadHtml(Helper.newValuesChart())
               nativeUtils.preferredScreenOrientation = NativeUtils.ScreenOrientationLandscape

             }
    }

}
