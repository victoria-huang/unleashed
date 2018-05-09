const npcAdapter = new Adapter("http://localhost:3000/api/v1/npcs");
const locationAdapter = new Adapter("http://localhost:3000/api/v1/locations")
const collectableAdapter = new Adapter("http://localhost:3000/api/v1/dog_collectables")

let store = {
  inventory: [],
  npcs: [],
  locations: [],
  dogCollectables: []
}

let dogLocation = {
  id: 109,
  street: "14",
  ave: "1",
  longitude: -73.9826037269086,
  latitude: 40.7312857466366
}


window.addEventListener("load", () => {
  document.getElementById("overlay").style.display = "block";
})

document.addEventListener('DOMContentLoaded', () => {
  const navBar = document.getElementById('navbar')
  const modal = document.getElementById('modal-container')
  const inventory = document.getElementById('collectables')
  const textBox = document.getElementById('text')
  const npcBox = document.getElementById('npc')

  // load all locations
  locationAdapter.getResources().then((locations) => {
    locations.forEach(l => new Location(l))
  }).then(locations => {
    console.log(store);
    store.npcs.forEach(npc => npc.getMarker())
  })

  mapInit(dogLocation)

  document.addEventListener('keyup', (e) => {
    let press = false;
    textBox.className = "invisible"
    npcBox.className = "invisible"
    if (e.key === "ArrowDown" || e.key === "ArrowUp") {
      let street = e.key === "ArrowDown" ? parseInt(dogLocation.street) - 1 : parseInt(dogLocation.street) + 1
      if (isValidMove(street, dogLocation.ave)) {
        dogLocation = store.locations.find(l => l.street === `${street}` && l.ave === dogLocation.ave)
        moveTo(dogLocation)
        checkOnStep(textBox, npcBox)
      } else {
        playWallBump()
        outOfBounds()
      }
    } else if (e.key === "ArrowLeft" || e.key === "ArrowRight") {
      let avenue = e.key === "ArrowLeft" ? parseInt(dogLocation.ave) + 1 : parseInt(dogLocation.ave) - 1
      if (isValidMove(dogLocation.street, avenue)) {
        dogLocation = store.locations.find(l => l.street === dogLocation.street && l.ave === `${avenue}`)
        moveTo(dogLocation)
        checkOnStep(textBox, npcBox)
      } else {
        playWallBump()
        outOfBounds()
      }
    }



  })

  navBar.addEventListener('click', (e) => {
    if (e.target.innerText === 'Checklist') {
      $('#modal-container').modal('show');
    }
    // console.log(store.dogCollectables)
    // store.dogCollectables.forEach((item) => {
    //   let div = document.createElement('div')
    //   div.innerHTML = `<img src=${item.img} width="50" height="50"><br>${item.name}`
    //   inventory.appendChild(div)
    // })
  })

})

function checkOnStep(textBox){

  let item = store.dogCollectables.find(c =>
    (c.location.latitude === dogLocation.latitude && c.location.longitude === dogLocation.longitude)
  )
  if(item){
    foundItem(item);
    item.addToInventory();
    DogCollectable.removeItem(item);
  }

  let npc = store.npcs.find(c => c.location.id === dogLocation.id)
  if (npc) {
    console.log(npc)

    //load text
    textBox.className = "visible "
    textBox.innerHTML = `<img src="${npc.img}"><h1 class="style-name-tag">${npc.name}</h1><p id="slow-text" class="style-dialogue"></p>`
    let slowText = document.getElementById('slow-text')
    showText(slowText, npc.dialogue, 0, 75);

  }
}

function isValidMove(street, ave) {
  return street < 24 && street > 13 && ave < 10 && ave > 0
}

function on() {
  document.getElementById("overlay").style.display = "block";
}

function off() {
  document.getElementById("overlay").style.display = "none";
}

function showText(target, message, index, interval) {
  if (index < message.length) {
    $(target).append(message[index++]);
    setTimeout(function() {
      showText(target, message, index, interval);
    }, interval);
  }
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
