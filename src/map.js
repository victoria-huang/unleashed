let mymarker;
let mymap;

function mapInit(data) {
  mymap = L.map('map').setView([data.latitude, data.longitude], 17);
  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoicmVkZmlzaDA3IiwiYSI6ImNqZ3hzbDNrMDI5NjUzM3Axcm90N2o2NmcifQ.HjxYG61ovRMiydlM3AkfPQ'
  }).addTo(mymap);

  mymap.keyboard.disable();
  // debugger

  var myIcon = L.icon({
    iconUrl: 'images/dog/pug.gif',
    iconSize: [80, 50]
  });
  myMarker = L.marker([data.latitude, data.longitude], {autoPan: true, autoPanSpeed: 10, icon: myIcon}).addTo(mymap)

}

function moveTo(data) {
  myMarker.setLatLng([data.latitude, data.longitude], {
    draggable: 'true'
  }).update();
  mymap.panTo(new L.LatLng(data.latitude, data.longitude));
}
