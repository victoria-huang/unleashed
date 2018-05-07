document.addEventListener('DOMContentLoaded', () => {
  // fetch("http://localhost:3000/api/v1/locations").then(res => res.json()).then(console.log)

  fetch("http://localhost:3000/api/v1/npcs").then(res => res.json())
  .then(npcs => getMarkers(npcs))
  // .then(locations => getMarkers(locations));
})

// function getLocations(npcs) {
//   return npcs.map(npc => {
//     let street = npc.location.street;
//     let ave = npc.location.ave;
//     return `${street} and ${ave}, New York, NY`
//   })
// }

function getMarkers(npcs) {
  npcs.forEach(npc => {
    let street = npc.location.street;
    let ave = npc.location.ave;
    let icon = `${npc.img}.png`;

    geocoder.geocode( {'address': `${street} and ${ave}, New York, NY`}, function(results, status) {
      if (status == 'OK') {
        console.log(location)
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location,
            icon: icon
        });
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  })

}
