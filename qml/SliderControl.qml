import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2
import Felgo 3.0

Column {
    id: sliderRoot
    width: parent.width

    property alias firstLabel: firstLabel.text
  //  property alias secondLabel: secondLabel.text
    property alias sliderValueText: sliderValueText.text
    property alias mySlider: mySlider
    property real maxValue: 5.0
    property real minValue: 0.0
    property real step: 0.05
    property real sliderValue: 0

    property double mutualValue: 0

    function setMutualValue(value) {
     value = parseFloat(value)
        mutualValue = value
        console.log(sliderValueText.text)
    }

    RowLayout {
        width: parent.width
        spacing:dp(20)

        Text {
          id: firstLabel
          leftPadding: 8
          Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
          font.pixelSize: sp(18)
          bottomPadding: dp(20)
          color: "whitesmoke"
        }

       /* Text {
          id: secondLabel
          font.pixelSize: sp(12)
          Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
          color: "white"
        }*/




          Text {
             id: sliderValueText
             width: dp(100)
             height: dp(25)
             Layout.alignment: Qt.AlignRight | Qt.AlignBaseline

             font.pixelSize: sp(18)
             color:  "white"
          }


    }
    Slider {
        id:mySlider
        anchors {
            left: parent.left
            right: parent.right
        }

        tickmarksEnabled: false
        maximumValue: maxValue
        minimumValue: minValue
        value: sliderValue
        stepSize: step
        updateValueWhileDragging: true


    style: SliderStyle {
        groove: Rectangle {
            id: sliderGroove
            implicitWidth: dp(350)
            implicitHeight: dp(10)
            color: "deepskyblue"
            radius: 8
        }
        handle: Rectangle {
            id:sliderHandle
            color: control.pressed ? "blue" : "white"
            implicitWidth: dp(35)
            implicitHeight: dp (35)
            radius: dp(50)
            Rectangle {
               // color: "black"
                anchors.centerIn: parent
                color: control.pressed ? "yellow" : "black"
                implicitWidth: dp(15)
                implicitHeight: dp(15)
                radius: dp(25)
            }
        }

    }//SliderStyler
  } //Slider

} // Column

