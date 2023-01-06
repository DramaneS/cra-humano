function goMapboxglContact(){

    const geojson = {
     type : 'FeatureCollection',
     features : [
       {
         type : 'Feature',
         geometry : {
           type : 'Point',
           coordinates: [-8.021212963457447, 12.580594115124772]
         },
         properties : {
           title : 'Mineytou',
           description: 'Si&egrave;ge'
         }
       }
     ]
    };
//pk.eyJ1IjoiYWxhc3NhbmUtbmlhbWJlbGUiLCJhIjoiY2t6bDU2cDB0MG9odDJ1cXJkZ3N5eW1obyJ9.ORU25_pqVMWD79l6VbZrRg
//    mapboxgl.accessToken = 'pk.eyJ1IjoiYWxhc3NhbmUtbmlhbWJlbGUiLCJhIjoiY2t6bDViMWlxMGU4bjJwbGxyam02dXdnOCJ9.9Uyu2CC5jtC301cwacKlmw';
mapboxgl.accessToken = 'pk.eyJ1IjoiYWxhc3NhbmUtbmlhbWJlbGUiLCJhIjoiY2t6bDU2cDB0MG9odDJ1cXJkZ3N5eW1obyJ9.ORU25_pqVMWD79l6VbZrRg';

    const map = new mapboxgl.Map({
    container: 'map', // container ID
    style: 'mapbox://styles/mapbox/streets-v11', // style URL
    center: [-8.021212963457447, 12.580594115124772], // starting position [lng, lat]
    //zoom: 16 // starting zoom
    zoom: 12 
    });

    // add markers to map
    for (const feature of geojson.features) {
     // create a HTML element for each feature
     const el = document.createElement('div');
     el.className = 'marker';


     // make a marker for each feature and add it to the map
     new mapboxgl.Marker(el)
     .setLngLat(feature.geometry.coordinates)
     .setPopup(
     new mapboxgl.Popup({ offset: 25 }) // add popups
     .setHTML(
     `<h3>${feature.properties.title}</h3><p>${feature.properties.description}</p>`
     )
     )
     .addTo(map);

    }

    const layerList = document.getElementById('map-menu');
    const inputs = layerList.getElementsByTagName('input');

    for (const input of inputs) {
        input.onclick = (layer) => {
            const layerId = layer.target.id;
            map.setStyle('mapbox://styles/mapbox/' + layerId);
        };
    }
  }
