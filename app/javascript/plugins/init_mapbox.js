import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';


const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};


const initMapbox = () => {

  const mapElement = document.getElementById('map')

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map', 
      style: 'mapbox://styles/maltyeva/ckdgrmmso08a71is8zs0mus4b'

    })

    const markers = JSON.parse(mapElement.dataset.markers)
    markers.forEach((marker) => {
       // add custom marker
       const element = document.createElement('div');
       element.className = 'marker';
       element.style.backgroundImage = `url('${marker.image_url}')`;
       element.style.backgroundSize = 'contain';
       element.style.width = '25px';
       element.style.height = '25px';
       const popup = new mapboxgl.Popup().setHTML(marker.infoWindow)
      // pass element as an argument
      new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map)
    })
    fitMapToMarkers(map, markers)
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }));
  }

}

export {initMapbox}