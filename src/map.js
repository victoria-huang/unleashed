let mymarker;
let mymap;

function mapInit(data) {
  mymap = L.map('map', {
    zoomControl: false
  }).setView([data.latitude, data.longitude], 17);
  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoicmVkZmlzaDA3IiwiYSI6ImNqZ3hzbDNrMDI5NjUzM3Axcm90N2o2NmcifQ.HjxYG61ovRMiydlM3AkfPQ'
  }).addTo(mymap);
  var popup = L.popup();

  let st = 31
  let av = 1;

  function onMapClick(e) {
    console.log(e.latlng)
      fetch('http://localhost:3000/api/v1/locations', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({street: `${st}`, ave: `${av}`, latitude: e.latlng.lat, longitude: e.latlng.lng})
      }).then(r=>r.json()).then(console.log)
      // console.log(av+"ave, "+" street: "+st)
      if(av === 9){
        av=1
        st ++
      }else{
        av++
      }
  }

  mymap.on('click', onMapClick);

}
