import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/lordmoomoo/ck0705ics06cn1cm50aeuz50k'
    });

    // let currentLocation = {};
    // navigator.geolocation.getCurrentPosition(function(position) {
    //   let data = {
    //     lat: position.coords.latitude,
    //     lng: position.coords.longitude,
    //     image_url: 'https://banner2.kisspng.com/20180509/klq/kisspng-person-logo-computer-icons-5af2c2026fcf79.460327751525858818458.jpg',
    //     infoWindow: ''
    //     };
    //   //console.log(data, 'data');
    //   Object.assign(currentLocation, data);
    //   //currentLocation.push(data);
    //   //console.log(currentLocation, 'oof');
    // });

    map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true
    }));

    const directionFetch = (usrLat, usrLng, restLat, restLng) => {
      fetch(`https://api.mapbox.com/directions/v5/mapbox/walking/${usrLat},${usrLng};${restLat},${restLng}?geometries=geojson&access_token=pk.eyJ1IjoibG9yZG1vb21vbyIsImEiOiJjazA0Nnc0YTQzMmNoM2d1dGJ1djVxd3dyIn0.pGdCWeFobIL8YR1KwhK3Vw`, {
      //method: "POST"
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      });
    };

    directionFetch(51.5151385, 0.115524, 51.5151385, 0.105234);
    //console.log(currentLocation, 'dog');
    const markers = JSON.parse(mapElement.dataset.markers);
    //markers.push(currentLocation);
    //console.log(markers);
    markers.forEach((marker) => {
      console.log(marker.lat, 'lat');
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      console.log(marker, 'marker')
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';

      new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
    });


    fitMapToMarkers(map, markers);


  }




};

export { initMapbox };
