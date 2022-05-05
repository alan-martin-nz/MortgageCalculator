let map;

function initMap() {
    map = new google.maps.Map(document.getElementById("map-canvas"), {
        zoom: 6,
        center: new google.maps.LatLng(-36.8509, 174.7645),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });
       
    findUserDevice (map);
}
 
 //Get User position and set marker and info window
function findUserDevice (map) {

    if(navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          var userPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

        var userIcon = {
        url:  "icons8-user_location.png",
        scaledSize: new google.maps.Size(50, 50), // scaled size
        origin: new google.maps.Point(0,0), // origin
        anchor: new google.maps.Point(0,0) // anchor
        }; 

        var userMarker = new google.maps.Marker({
        position: userPosition,
        icon: userIcon,
        map: map
        });

        var userInfoWindow = new google.maps.InfoWindow({
        content: "<h3>App User</h3>",
        pixelOffset: new google.maps.Size(10,10),
        maxWidth: 100,
        });

        userMarker.addListener('click', function(){userInfoWindow.open(map, userMarker)});

        map.setCenter(userPosition);

        });
    }
}

//Get Broker data details from remote server
fetch("https://backendlessappcontent.com/2C040131-BEEB-41FA-BB84-89D6E6E0812F/2D31B11C-FC27-46D9-BC8C-B9239EED58D9/files/map-marker-data/marker-data.json")
    .then((response) => {
      return response.json();
    })
    .then((data) => {
      var markers = data;
    // console.log(markers);
    
        //Loop through Brokers data retrieved from remote server and and pass to addMarker function      
            for(var i = 0;i< markers.length;i++){

                addMarker(markers[i]);
            } 

            //Add markers for each Broker and create info window
            function addMarker(props) {
     
                var brokerInfoWindow = new google.maps.InfoWindow({
                    content: props.content,
                    maxWidth: 350
                });

                var brokerMarker = new google.maps.Marker({
                    position: props.coords,
                    icon: props.iconImage,
                    map: map
                });

                google.maps.event.addListener(brokerMarker, 'click', function(){
                    brokerInfoWindow.open(map, brokerMarker)
                });
     
                google.maps.event.addListener(map, 'click', function(){
                    brokerInfoWindow.close()
                });
   
            }

    }); 







   