var map;

function gmap_show(latitude, longitude) {
  // if ((location.latitude == null) || (location.longitude == null) ) {    // validation check if coordinates are there
  //   return 0;
  // }

  var latlng = new google.maps.LatLng(latitude,longitude);  

  var options = {
    zoom: 15,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  // create our map object
  var map = new google.maps.Map(document.getElementById("map"), options);

  var marker = new google.maps.Marker({
      position: latlng,
      map: map,
      title: 'Hello World!'
  }); 

  // var bounds = new google.maps.LatLngBounds();
  // bounds.extend(latlng);
  // map.fitBounds(bounds);

  // handler = Gmaps.build('Google');    // map init
  // handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
  //   markers = handler.addMarkers([    // put marker method
  //     {
  //       "lat": location.latitude,    // coordinates from parameter company
  //       "lng": location.longitude,
  //       "picture": {    // setup marker icon
  //         "url": 'http://www.planet-action.org/img/2009/interieur/icons/orange-dot.png',
  //         "width":  32,
  //         "height": 32
  //       },
  //       "infowindow": "<b>" + location.address 
  //     }
  //   ]);
  //   handler.bounds.extendWith(markers);
  //   handler.fitMapToBounds();
  //   handler.getMap().setZoom(12);    // set the default zoom of the map
  // });
}

