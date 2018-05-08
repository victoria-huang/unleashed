const npcAdapter = new Adapter("http://localhost:3000/api/v1/npcs");
const locationAdapter = new Adapter("http://localhost:3000/api/v1/locations")
const collectableAdapter = new Adapter("http://localhost:3000/api/v1/dog_collectables")

let store = {
  inventory: [],
  npcs: [],
  locations: [],
  dogCollectables: []
}

let dogLocation = {street: "14", ave: "1", longitude: -73.9826037269086, latitude: 40.7312857466366}


window.addEventListener("load", () => {
  document.getElementById("overlay").style.display = "block";
})

document.addEventListener('DOMContentLoaded', () => {
  const navBar = document.getElementById('navbar')
  const modal = document.getElementById('modal-container')
  const list = document.getElementById('collectables')

  // load all locations
  locationAdapter.getResources().then((locations) => {
    locations.forEach(l => new Location(l))
  }).then(locations => {
    console.log(store); store.npcs.forEach(npc => npc.getMarker())
  })

  mapInit(dogLocation)

  document.addEventListener('keydown', (e) => {
    if (e.key === "ArrowDown" || e.key === "ArrowUp") {
      let street = e.key === "ArrowDown" ? parseInt(dogLocation.street) - 1 : parseInt(dogLocation.street) + 1
      console.log("down/up")
      if (isValidMove(street, dogLocation.ave)){
        dogLocation = store.locations.find(l => l.street === `${street}` && l.ave === dogLocation.ave)
        moveTo(dogLocation)
      } else{
        // play music to indicate you can't pass
        playWallBump()
      }
    } else if (e.key === "ArrowLeft" || e.key === "ArrowRight") {
      console.log("left/right")
      let avenue = e.key === "ArrowLeft" ? parseInt(dogLocation.ave) + 1 : parseInt(dogLocation.ave) - 1
      if (isValidMove(dogLocation.street, avenue)){
        dogLocation = store.locations.find(l => l.street === dogLocation.street && l.ave === `${avenue}`)
        moveTo(dogLocation)
      } else{
        // play music to indicate you can't pass
        playWallBump()
      }
    }
  })

  navBar.addEventListener('click', (e) => {
    if (e.target.innerText === 'Checklist') {
      console.log('checklist clicked')
      $('#modal-container').modal('show');
    }

    console.log(store.dogCollectables)
    store.dogCollectables.forEach((item) => {
      let li = document.createElement('li')
      li.innerText = item.name
      list.appendChild(li)
    })

  })

})

function isValidMove(street, ave){
  return street < 24 && street > 13 && ave < 10 && ave > 0
}

function ordinalSuffix(i) {
  var j = i % 10,
    k = i % 100;
  if (j == 1 && k != 11) {
    return i + "st";
  }
  if (j == 2 && k != 12) {
    return i + "nd";
  }
  if (j == 3 && k != 13) {
    return i + "rd";
  }
  return i + "th";
}
