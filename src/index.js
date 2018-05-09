const npcAdapter = new Adapter("http://localhost:3000/api/v1/npcs");
const locationAdapter = new Adapter("http://localhost:3000/api/v1/locations")
const collectableAdapter = new Adapter("http://localhost:3000/api/v1/dog_collectables")
let stop = false;

let store = {
  npcs: [],
  locations: [],
  dogCollectables: []
}

let dogLocation = {}


window.addEventListener("load", () => {
  document.getElementById("overlay").style.display = "block";
//   document.getElementById("title").animate([
//   // keyframes
//   { transform: 'translateX(0px)' },
//   { transform: 'translateX(-300px)' }
// ], {
//   // timing options
//   duration: 3000,
//   iterations: 1
// });
})

document.addEventListener('DOMContentLoaded', () => {
  const navBar = document.getElementById('navbar')
  const modal = document.getElementById('modal-container')
  const checklist = document.getElementById('collectables')
  const textBox = document.getElementById('text')
  const npcBox = document.getElementById('npc')

  playBg()

  // load all locations
  locationAdapter.getResources().then((locations) => {
    locations.forEach(l => new Location(l))
  }).then(locations => {
    store.dogCollectables.forEach((item) => {
      let div = document.createElement('div')
      div.setAttribute('id', `item-id-${item.id}`)
      div.setAttribute('class', 'main-img')
      div.innerHTML = `<img src=${item.img} width="50" height="50"><br>${item.name}`
      checklist.appendChild(div)
    })
    dogLocation = store.locations.find(l => l.empty)
    mapInit(dogLocation)
    store.npcs.forEach(npc => npc.getMarker())
  })

  document.addEventListener('keyup', (e) => {
    textBox.className = "invisible"
    npcBox.className = "invisible"
    if (!stop) {
      if (e.key === "ArrowDown" || e.key === "ArrowUp") {
        let street = e.key === "ArrowDown" ? parseInt(dogLocation.street) - 1 : parseInt(dogLocation.street) + 1
        if (isValidMove(street, dogLocation.ave)) {
          dogLocation = store.locations.find(l => l.street === `${street}` && l.ave === dogLocation.ave)
          moveTo(dogLocation)
          checkOnStep(textBox)
        } else {
          playWallBump()
          outOfBounds()
        }
      } else if (e.key === "ArrowLeft" || e.key === "ArrowRight") {
        let avenue = e.key === "ArrowLeft" ? parseInt(dogLocation.ave) + 1 : parseInt(dogLocation.ave) - 1
        if (isValidMove(dogLocation.street, avenue)) {
          dogLocation = store.locations.find(l => l.street === dogLocation.street && l.ave === `${avenue}`)
          moveTo(dogLocation)
          checkOnStep(textBox)
        } else {
          playWallBump()
          outOfBounds()
        }
      } else if (e.key === " ") {
        //speed text up
        let npc = store.npcs.find(c => c.location.id === dogLocation.id)
        if (npc && !npc.found) {
          textBox.className = "visible"
          textBox.innerHTML = `<img src="${npc.img}"><h1 class="style-name-tag">${npc.name}</h1><p id="slow-text" class="style-dialogue"></p>`
          let slowText = document.getElementById('slow-text')
          slowText.innerText = npc.dialogue
        }
      }
    }
  })

  navBar.addEventListener('click', (e) => {
    if (e.target.innerText === 'Checklist') {
      $('#modal-container').modal('show');
    } else if (e.target.innerText === 'Toggle Sound') {
      toggleSound();
    }
  })

})

function checkOnStep(textBox) {

  let item = store.dogCollectables.find(c =>
    (c.location.latitude === dogLocation.latitude && c.location.longitude === dogLocation.longitude)
  )
  if (item) {
    foundItem(item);
    item.checkOff();
    DogCollectable.removeItem(item);
  }

  let npc = store.npcs.find(c => c.location.id === dogLocation.id)
  if (npc && !npc.found) {
    playHello()
    textBox.className = "visible"
    textBox.innerHTML = `<img src="${npc.img}"><h1 class="style-name-tag">${npc.name}</h1><p id="slow-text" class="style-dialogue"></p>`
    let slowText = document.getElementById('slow-text')
    showText(slowText, npc.dialogue, 0, 75);
  }
}

function isValidMove(street, ave) {
  return street < 51 && street > 13 && ave < 10 && ave > 0
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
