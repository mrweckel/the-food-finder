$(document).ready(function() {
var map;
    var infowindow;

    function initialize() {
      var dbc = new google.maps.LatLng(40.706426, -74.009007);
      var dest = 'Mad Dog'
      var mapOptions = {
        zoom: 15,
        center: dbc
      };


      map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

      var image = 'dbc.png'
      var marker = new google.maps.Marker({
        position: dbc,
        map: map,
        icon: image,
        title: 'DBC'
      });

      var request = {
        location: dbc,
        radius: 500,
        name: [dest]
      };
      infowindow = new google.maps.InfoWindow();
      var service = new google.maps.places.PlacesService(map);
      service.nearbySearch(request, callback);
    }



      function callback(results, status) {
        if (status == google.maps.places.PlacesServiceStatus.OK) {
          for (var i = 0; i < results.length; i++) {
            createMarker(results[i]);
          }
        }
      }

      function createMarker(place) {
        var placeLoc = place.geometry.location;
        var marker = new google.maps.Marker({
          map: map,
          position: place.geometry.location
        });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.setContent(place.name);
          infowindow.open(map, this);
        });
      }


      google.maps.event.addDomListener(window, 'load', initialize);

});
