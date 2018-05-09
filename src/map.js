let mymarker;
let mymap;

function mapInit(data) {
  mymap = L.map('map', { zoomControl:false }).setView([data.latitude, data.longitude], 17);
  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoicmVkZmlzaDA3IiwiYSI6ImNqZ3hzbDNrMDI5NjUzM3Axcm90N2o2NmcifQ.HjxYG61ovRMiydlM3AkfPQ'
  }).addTo(mymap);

  mymap.scrollWheelZoom.disable()
  mymap.keyboard.disable();
  // debugger

  var myIcon = L.icon({
    iconUrl: 'images/dog/pug2.gif',
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

function outOfBounds() {
  myMarker.bindPopup("I can't move that way!").openPopup();
  setTimeout(function(){mymap.closePopup()}, 5000)
}

function foundItem(item) {
  myMarker.bindPopup(`I found <b>${item.name}</b>! <img src=${item.img} width="50" height="50">`).openPopup();
  setTimeout(function(){mymap.closePopup()}, 5000)
}
