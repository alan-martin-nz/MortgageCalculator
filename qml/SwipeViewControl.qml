import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import Felgo 3.0


Column {
    id: swipeColumn
        width: parent.width
       // spacing: dp(10)

      property alias wtext1: wtext1.text
        property alias ftext1: ftext1.text
        property alias mtext1: mtext1.text


        property alias wtext3b: wtext3b.text
        property alias ftext3b: ftext3b.text
        property alias mtext3b: mtext3b.text

        property alias wtext4b: wtext4b.text
        property alias ftext4b: ftext4b.text
        property alias mtext4b: mtext4b.text

       Rectangle {
        id: window
            width: parent.width
            height: dp(250)
            visible: true
            radius: dp(20)
            color:"black"
            clip: true

        SwipeView {
            id: view

                anchors.fill: parent
                width: parent.width
                currentIndex: detailsViewIndicator.currentIndex

            Rectangle {
                id: weeklyPage

                      Text{
                          id: wtext1

                          text: "$0.00"
                          font.pixelSize: sp(30)
                          color: "white"
                          anchors.horizontalCenter: parent.horizontalCenter
                          anchors.top: parent.top
                          anchors.topMargin: dp(25)
                     }

                     Text{
                          id:wtext2

                          text: "Weekly Payment"
                          font.pixelSize: sp(20)
                          color: "white"
                          anchors.top: wtext1.bottom
                          anchors.horizontalCenter:  parent.horizontalCenter
                          bottomPadding: dp(35)
                      }

                      Text{
                          id:wtext3a
                          text: "Interest Rate"
                          font.pixelSize: sp(16)
                          color: "white"
                          anchors.top: wtext2.bottom
                          anchors.left:  parent.left
                          anchors.leftMargin: dp(30)
                       }


                      Text{
                        id:wtext3b
                        // text:   // "4.45%"
                        font.pixelSize: sp(16)
                        color: "white"
                        anchors.right:  parent.right
                        anchors.rightMargin: dp(30)
                        anchors.baseline: wtext3a.baseline
                     }

                    Text{
                    id:wtext4a
                    text: "Total Cost of Loan"
                    font.pixelSize: sp(16)
                    color: "white"
                    anchors.top: wtext3a.bottom
                    anchors.left:  parent.left
                    anchors.leftMargin: dp(30)
                }

                Text{
                    id:wtext4b
                    text: "$0"
                    font.pixelSize: sp(16)
                    color: "white"
                    anchors.right:  parent.right
                    anchors.rightMargin: dp(30)
                    anchors.baseline: wtext4a.baseline

                }
                Rectangle {
                    id: wgraphButton
                    Image {
                        source: "icons8-bar_chart.png"
                        clip: true
                        width: dp(43)
                        height: dp(43)
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter:  parent.verticalCenter
                        anchors.horizontalCenter:  parent.horizontalCenter
                    }
                    anchors.right: parent.right
                    anchors.top: wtext4b.bottom
                    color: "white"
                    anchors.topMargin: dp(15)
                    anchors.rightMargin: dp(30)
                    width: dp(30)
                    height: dp(30)
                    radius: dp(5)
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            page.navigationStack.push(tableViewComponent)
                            nativeUtils.preferredScreenOrientation = NativeUtils.ScreenOrientationPortrait
                        }
                    }
                }
                color: "black"
                radius: dp(20)
       }

            Component {
                id: tableViewComponent

                  TableViewPage {
                    id: tablePage

                 }
            }

            Rectangle {
                id: fortnightlyPage
                Text{
                    id:ftext1
                text: "$0.00"
                font.pixelSize: sp(30)
                color: "white"
                anchors.top: parent.top
                anchors.topMargin: dp(25)
                anchors.horizontalCenter:  parent.horizontalCenter
                }

                Text{
                    id:ftext2
                text: "Fortnightly Payment"
                font.pixelSize: sp(20)
                color: "white"
                anchors.top: ftext1.bottom
                anchors.horizontalCenter:  parent.horizontalCenter
                bottomPadding: dp(40)
                }

                Text{
                    id:ftext3a
                    text: "Interest Rate"
                    font.pixelSize: sp(16)
                    color: "white"
                    anchors.top: ftext2.bottom
                    anchors.left:  parent.left
                    anchors.leftMargin: dp(30)
                }

                Text{
                    id:ftext3b
                    text: "4.45%"
                    font.pixelSize: sp(16)
                    color: "white"
                    anchors.right:  parent.right
                    anchors.rightMargin: dp(30)
                    anchors.baseline: ftext3a.baseline
                }

                Text{
                    id:ftext4a
                    text: "Total Cost of Loan"
                    font.pixelSize: sp(16)
                    color: "white"
                    anchors.top: ftext3a.bottom
                    anchors.left:  parent.left
                    anchors.leftMargin: dp(30)
                }

                Text{
                    id:ftext4b
                    text: "$0"
                    font.pixelSize: sp(16)
                    color: "white"
                    anchors.right:  parent.right
                    anchors.rightMargin: dp(30)
                    anchors.baseline: ftext4a.baseline
                }
                Rectangle {
                    id: fgraphButton
                    Image {
                        source: "icons8-bar_chart.png"
                        clip: true
                        width: dp(43)
                        height: dp(43)
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter:  parent.verticalCenter
                        anchors.horizontalCenter:  parent.horizontalCenter
                    }
                    anchors.right: parent.right
                    anchors.top: ftext4b.bottom
                    color: "white"
                    anchors.topMargin: dp(15)
                    anchors.rightMargin: dp(30)
                    width: dp(30)
                    height: dp(30)
                    radius: dp(5)
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            page.navigationStack.push(tableViewComponent)
                            nativeUtils.preferredScreenOrientation = NativeUtils.ScreenOrientationPortrait
                        }
                    }
                }
                color: "black"
                radius: dp(20)
            }
            Rectangle {
                id: monthlyPage
                Text{
                     id:mtext1
                text: "$0.00"
                color: "white"
                anchors.top: parent.top
                anchors.topMargin: dp(25)
                anchors.horizontalCenter:  parent.horizontalCenter
                font.pixelSize: sp(30)
                }

                Text{
                    id:mtext2
                    text: "Monthly Payment"
                    font.pixelSize: sp(20)
                    color: "white"
                    anchors.top: mtext1.bottom
                    anchors.horizontalCenter:  parent.horizontalCenter
                    bottomPadding: dp(40)
                }

                Text{
                    id:mtext3a
                    text: "Interest Rate"
                    font.pixelSize: sp(16)
                    color: "white"
                    anchors.top: mtext2.bottom
                    anchors.left:  parent.left
                    anchors.leftMargin: dp(30)
                }

                Text{
                    id:mtext3b
                    text: "4.45%"
                    font.pixelSize: sp(16)
                    color: "white"
                    anchors.right:  parent.right
                    anchors.rightMargin: dp(30)
                    anchors.baseline: mtext3a.baseline
                }
                Text{
                    id:mtext4a
                    text: "Total Cost of Loan"
                    font.pixelSize: sp(16)
                    color: "white"
                    anchors.top: mtext3a.bottom
                    anchors.left:  parent.left
                    anchors.leftMargin: dp(30)
                }
                Text{
                    id:mtext4b
                    text: "$0"
                    font.pixelSize: sp(16)
                    color: "white"
                    anchors.right:  parent.right
                    anchors.rightMargin: dp(30)
                    anchors.baseline: mtext4a.baseline
                }
                Rectangle {
                    id: mgraphButton
                    Image {
                        source: "icons8-bar_chart.png"
                        clip: true
                        width: dp(43)
                        height: dp(43)
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter:  parent.verticalCenter
                        anchors.horizontalCenter:  parent.horizontalCenter
                    }
                    anchors.right: parent.right
                    anchors.top: mtext4b.bottom
                    color: "white"
                    anchors.topMargin: dp(15)
                    anchors.rightMargin: dp(30)
                    width: dp(30)
                    height: dp(30)
                    radius: dp(5)
                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            page.navigationStack.push(chartViewComponent)
                            nativeUtils.preferredScreenOrientation = NativeUtils.ScreenOrientationLandscape
                        }
                    }
                }

                color: "black"
                radius: dp(20)

            }//monthlyPage - Rectangle
            Component {
                id: chartViewComponent

                  ChartViewPage {
                    id: chartPage

                 }
            }
        }// SwipeView

        PageIndicator {
            id: detailsViewIndicator
            count: view.count
            currentIndex: view.currentIndex
            interactive: true
            anchors.bottom: view.bottom
            property variant indicatorText: ["Weekly", "Fortnightly","Monthly"]
            anchors.bottomMargin: dp(10)
            anchors.horizontalCenter: parent.horizontalCenter


                delegate: Rectangle {
                          color: "white"
                          height: dp(15)
                          width: dp(80)
                          radius: dp(3)
                          opacity: index === view.currentIndex ? 0.95 : pressed ? 0.7 : 0.45
                          Text {
                             text:   detailsViewIndicator.indicatorText[index]
                             font.pixelSize: sp(12)
                             anchors.centerIn: parent
                          }
               }

      }//PageIndicator
   }//Rectangle
}//Column

