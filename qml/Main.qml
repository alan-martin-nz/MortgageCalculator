import Felgo 3.0
import QtQuick 2.0

App {
    licenseKey: "8B5DD8433C808B67741F16DAF88126CE02D898230509F18F2809B86238343E5BA4A99D5D449E79FB3B98D2EFD6BFA319BCC4D99ABE3541FD131C14025FBF6AE511018012766F471EB19266E54FEFAA82D59D6493BC9B07E102F9B0C56AF5CA8598BA1BCD38F86194E8D34A8C9A57896B88A7DA47E6E5891D99047F9ECD05C46598B3DBB33F1E413B66917301998A68B2A551684EEB1EACE34955EDE7622F4210D93C164A44A6F433F6A2CD8E4B30814CFFEF45DF9810010FB64517177CF34973A6485F4E1D0458DECE53B1F30A1BEADCA9604A7DC638EC6A736EC1227986CFD525B2865DFB44D1527EF1D6A74DE3CEC38FBCE08E527CB6E1AFA9FD96E593AF120A509196D068E06F26D804CB52F7E5CB7D2275EA146F3EE062DC35E6E37C5E099E506699A67150AEAB39E1D2CA3C6AD342A5AAECAC01F51DE23429474A4F6012"
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

