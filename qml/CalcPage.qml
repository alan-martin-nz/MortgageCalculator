import QtQuick 2.9
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.14
import QtQuick.Controls.Styles 1.4
import Felgo 3.0
import 'mcalc.js' as Helper


Page {
  id: root

    useSafeArea: true
// readonly property int buttonWidth: Math.max(button.implicitWidth, Math.min(button.implicitWidth * 2, page.availableWidth / 3))



    Rectangle {
        width: root.width
        height: root.height
        scale: 4
        transform: Rotation {angle: 315}
        gradient: Gradient {
                     GradientStop { position: 0.0; color: "#37d5d6" }
                     GradientStop { position: 1.0; color: "#36096d" }
                  }
      }

    Item {
        id: myitem
        Text {
            id: myTitleText
            text: qsTr("Mortgage Calculator")
            padding: dp(45)
            anchors.centerIn: parent
            color: "white"
            font.family: "Arial Black"
            font.pixelSize: sp(25)
            bottomPadding: dp(40)
        }
        width: parent.width
        height: dp(50)

    }
    AppButton {
        id: button
        borderColor: "deepskyblue"
        borderWidth: 2
        flat: false
        width: buttonText.width


        Text {
           id: buttonText
            text: "Find a Mortgage Consultant"
            color: "white"
            anchors.centerIn: parent
            font.pixelSize: sp(20)
            leftPadding: dp(16)
            rightPadding: dp(16)
         }

        onClicked: {
                 page.navigationStack.push(mapViewComponent)
                 }

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: dp(16)
    }
    Component {
        id: mapViewComponent

          MapViewPage {
            id: mapPage
            navigationBarHidden: true
            tabBarHidden: false
          }



    }

Column {
    id: content
    spacing: dp(30)
     anchors {
         top: myitem.bottom
         left: parent.left
         right: parent.right
         margins: constants.defaultMargins
      }

    SwipeViewControl{
        id: svControl

        wtext3b: myRateSlider.sliderValueText
        ftext3b: myRateSlider.sliderValueText
        mtext3b: myRateSlider.sliderValueText

     }

Rectangle {
    id:backRect
    width: parent.width
    height:  sliderColumn.height

    color: "black"
    radius: dp(20)


    Column {
        id:sliderColumn
        spacing: dp(35)
        topPadding: constants.defaultMargins
        bottomPadding: constants.defaultMargins
        anchors {
            left: parent.left
            right: parent.right
            margins: constants.defaultMargins
         }

     SliderControl{
        id: loanAmountslider
        firstLabel: qsTr("Loan Amount")

        sliderValueText: "$"+(Math.round(mySlider.value  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 0)


        maxValue: 1000000
        minValue: 100000
        step: 10000.0
        sliderValue: 0
       onSliderValueTextChanged:  {
           Helper.vprincipal = Number((Math.round(mySlider.value  * 100) / 100))

           svControl.mtext1 = "$"+(Math.round(Helper.monthPayment()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 2)
           svControl.ftext1 = "$"+(Math.round(Helper.fortPayment()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 2)
           svControl.wtext1 = "$"+(Math.round(Helper.weekPayment()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 2)
           svControl.wtext4b = "$"+(Math.round(Helper.weekTotalCost()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 0)
           svControl.ftext4b = "$"+(Math.round(Helper.fortTotalCost()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 0)
           svControl.mtext4b = "$"+(Math.round(Helper.monthTotalCost()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 0)
          //  console.log(loanAmountslider.mySlider.value)
       }
    }

    SliderControl{
        id: myRateSlider
        firstLabel: qsTr("Interest Rate")
        sliderValueText: (Math.round(mySlider.value  * 100) / 100).toFixed(2)+"%"
        maxValue: 10.0
        minValue: 1.0
        step: 0.05
        sliderValue: 0
        onSliderValueTextChanged:  {
            Helper.vinterestRate = Number((Math.round(mySlider.value  * 100) / 100).toFixed(2))

            svControl.mtext1 = "$"+(Math.round(Helper.monthPayment()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 2)
            svControl.ftext1 = "$"+(Math.round(Helper.fortPayment()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 2)
            svControl.wtext1 = "$"+(Math.round(Helper.weekPayment()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 2)
            svControl.wtext4b = "$"+(Math.round(Helper.weekTotalCost()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 0)
            svControl.ftext4b = "$"+(Math.round(Helper.fortTotalCost()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 0)
            svControl.mtext4b = "$"+(Math.round(Helper.monthTotalCost()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 0)
        }
    }

    SliderControl{
        id: loanTermSlider
        firstLabel: qsTr("Loan Term")
        sliderValueText: ((Math.round(mySlider.value  * 100) / 100).toFixed(0) <= 1) ? (Math.round(mySlider.value  * 100) / 100).toFixed(0)+" year" : (Math.round(mySlider.value  * 100) / 100).toFixed(0)+" years"
        maxValue: 30.0
        minValue: 1.0
        step: 1.0
        sliderValue: 30
        onSliderValueTextChanged:  {
            Helper.vloanTermYears = Number((Math.round(mySlider.value  * 100) / 100).toFixed(0))

            svControl.mtext1 = "$"+(Math.round(Helper.monthPayment()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 2)
            svControl.ftext1 = "$"+(Math.round(Helper.fortPayment()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 2)
            svControl.wtext1 = "$"+(Math.round(Helper.weekPayment()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 2)
            svControl.wtext4b = "$"+(Math.round(Helper.weekTotalCost()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 0)
            svControl.ftext4b = "$"+(Math.round(Helper.fortTotalCost()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 0)
            svControl.mtext4b = "$"+(Math.round(Helper.monthTotalCost()  * 100) / 100).toLocaleString(Qt.locale("en_NZ"), 'f', 0)

        }
    }


   }//Column


}//Rectangle


}//Column

}//Page
