import Felgo 3.0
import QtQuick 2.0

App {

    onInitTheme: {
         // Set the navigation bar Theme controls for styling
            Theme.navigationBar.backgroundColor = "cornflowerblue"
            Theme.navigationBar.titleColor = "white"
            Theme.navigationBar.titleTextSize = sp(20)
            Theme.navigationBar.dividerColor = "cornflowerblue"
            Theme.navigationBar.height =dp(0)


            //Theme.navigationBar.height = dp(40)
           // Theme.navigationBar.titleBottomMargin = dp(5)
         // Set the global text color to a dark blue
         Theme.colors.textColor = "#000080"
       }
    Navigation {
        id: navigation


   NavigationItem {
         title: qsTr("Mortage Calculator")
         icon: IconType.calculator


      NavigationStack {

          initialPage: CalcPage {
          preferredScreenOrientation: NativeUtils.ScreenOrientationPortrait
          navigationBarHidden: true
          tabBarHidden: true
          }
      }
   }

    NavigationItem {
       title: qsTr("Find A Mortgage Consultant")
        icon: IconType.mapmarker

      NavigationStack {

        MapViewPage {
          id: mapPage
        }
      }
    }

    function navigateToProfilePage() {
      currentIndex = 1
    }
  }

  Constants {
    id: constants
  }
}

