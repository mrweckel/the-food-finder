$(document).ready(function() {
    // map //
    var map;
    var infowindow;

    function initialize() {
      var dbc = new google.maps.LatLng(40.706426, -74.009007);
      var dest = $('h1').html();
      // var dest = 'Mad Dog'
      var mapOptions = {
        zoom: 15,
        center: dbc
      };


      map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

      var image = '../dbc.png'
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
  //map//

  //login//
  $('a.login-window').click(function() {
    $('#signup-box').fadeOut(200);
            //Getting the variable's value from a link
    var loginBox = $(this).attr('href');

    //Fade in the Popup
    $(loginBox).fadeIn(300);

    //Set the center alignment padding + border see css style
    var popMargTop = ($(loginBox).height() + 24) / 2;
    var popMargLeft = ($(loginBox).width() + 24) / 2;

    $(loginBox).css({
        'margin-top' : -popMargTop,
        'margin-left' : -popMargLeft
    });

    // Add the mask to body
    $('body').append('<div id="mask"></div>');
    $('#mask').fadeIn(300);

    return false;
    });

    // When clicking on the button close or the mask layer the popup closed
  //   $('a.close, #mask').live('click', function() {
  //     $('#mask , .login-popup').fadeOut(300 , function() {
  //       $('#mask').remove();
  //   });
  //   return false;
  // });
  //login//

  //signup//
  $('a.signup-window').click(function() {

    $('#login-box').fadeOut(200);

    var signupBox = $(this).attr('href');

    //Fade in the Popup
    $(signupBox).fadeIn(300);

    //Set the center alignment padding + border see css style
    var popMargTop = ($(signupBox).height() + 24) / 2;
    var popMargLeft = ($(signupBox).width() + 24) / 2;

    $(signupBox).css({
        'margin-top' : -popMargTop,
        'margin-left' : -popMargLeft
    });

    // Add the mask to body
    $('body').append('<div id="mask"></div>');
    $('#mask').fadeIn(300);

    return false;
    });

});
