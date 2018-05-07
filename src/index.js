const npcAdapter = new Adapter("http://localhost:3000/api/v1/npcs");
const locationAdapter = new Adapter("http://localhost:3000/api/v1/locations")
const collectableAdapter = new Adapter("http://localhost:3000/api/v1/dog_collectables")
let store = { npcs: [], locations: [], dogCollectables: [] }

document.addEventListener('DOMContentLoaded', () => {
  const navBar = document.getElementById('navbar')
  const modal = document.getElementById('modal-container')
  npcAdapter.getResources().then(npcs => getMarkers(npcs))

  // event listener for checklist on nav bar
  navBar.addEventListener('click', (e) => {
    if(e.target.innerText === 'Checklist'){
      console.log('checklist clicked')
      $('#modal-container').modal('show');
      // let div = document.createElement('div')
      // let ul = document.createElement('ul')
      //
      // div.setAttribute('id', "collectables")
      // div.appendChild(ul)
      //
      // store.dogCollectables.forEach((item) => {
      //   let li = document.createElement('li')
      //   li.innerText = item.name
      //   ul.appendChild(li)
      // })
      // modal.append(div)

      // modal.style.zIndex = 100;
      // modal.innerHTML = ` `
  // map.style.position = 'absolute';
    }
  })


})


function getMarkers(npcs) {
  npcs.forEach(npc => {
    let street = npc.location.street;
    let ave = npc.location.ave;
    let icon = npc.img;

    geocoder.geocode( {'address': `${street} and ${ave}, New York, NY`}, function(results, status) {
      if (status == 'OK') {
        map.setCenter({lat: 40.7580348, lng: -73.991703});
        var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location,
            icon: icon
        });
        console.log(marker.position)
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  })
}
