const npcAdapter = new Adapter("http://localhost:3000/api/v1/npcs");
const locationAdapter = new Adapter("http://localhost:3000/api/v1/locations")
const collectableAdapter = new Adapter("http://localhost:3000/api/v1/dog_collectables")

let store = { npcs: [], locations: [], dogCollectables: [] }

document.addEventListener('DOMContentLoaded', () => {
  npcAdapter.getResources().then(npcs => getMarkers(npcs))
})

function getMarkers(npcs) {
  npcs.forEach(npc => {
    let street = npc.location.street;
    let ave = npc.location.ave;
    let icon = npc.img;

    geocoder.geocode( {'address': `${street} and ${ave}, New York, NY`}, function(results, status) {
      if (status == 'OK') {
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location,
            icon: icon
        });
        console.log(marker)
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  })
}
