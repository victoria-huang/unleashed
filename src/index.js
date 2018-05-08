const npcAdapter = new Adapter("http://localhost:3000/api/v1/npcs");
const locationAdapter = new Adapter("http://localhost:3000/api/v1/locations")
const collectableAdapter = new Adapter("http://localhost:3000/api/v1/dog_collectables")

let store = { inventory: [], npcs: [], locations: [], dogCollectables: [] }
let dogLocation = { street: '42nd St', ave: '9th Avenue' }

document.addEventListener('DOMContentLoaded', () => {
  npcAdapter.getResources()
  .then(npcsJSON => Npc.createNpcs(npcsJSON))
  .then(npcs => { npcs.forEach(npc => npc.getMarker()) })
  .then(
    document.addEventListener('keydown', (event) => {
      const arrowKeys = {
        '37': moveLeft(dogLocation['ave']),
        '38': moveUp(dogLocation['street']),
        '39': moveRight(dogLocation['ave']),
        '40': moveDown(dogLocation['street'])
      }

      const keyPressed = event.which;

      if (arrowKeys[keyPressed]) {
        if (keyPressed === 38 || keyPressed === 40) {
          dogLocation['street'] = arrowKeys[keyPressed];
        } else {
          dogLocation['ave'] = arrowKeys[keyPressed];
        }
      }

      geocoder.geocode( {'address': `${dogLocation['street']} and ${dogLocation['ave']}, New York, NY`}, function(results, status) {
        map.setCenter(results[0].geometry.location);
        popup = new Popup(
            new google.maps.LatLng({lat: results[0].geometry.location.lat(), lng: results[0].geometry.location.lng()}),
            document.getElementById('content'));
        popup.setMap(map);
      })
    })
  );
})

function moveUp(street) {
  let streetNum = parseInt(street.replace(/\D+/g, ''));
  let newStreetNum;

  streetNum < 50 ? newStreetNum = ++streetNum : newStreetNum = streetNum

  return `${ordinalSuffix(newStreetNum)} St`
}

function moveDown(street) {
  let streetNum = parseInt(street.replace(/\D+/g, ''));
  let newStreetNum;

  streetNum > 14 ? newStreetNum = --streetNum : newStreetNum = streetNum

  return `${ordinalSuffix(newStreetNum)} St`
}

function moveLeft(ave) {
  let aveNum = parseInt(ave.replace(/\D+/g, ''));
  let newAveNum;

  if (aveNum === 3) {
    newAveNum = aveNum + 2;
  } else if (aveNum < 9) {
    newAveNum = ++aveNum;
  } else {
    newAveNum = aveNum;
  }

  return `${ordinalSuffix(newAveNum)} Avenue`
}

function moveRight(ave) {
  let aveNum = parseInt(ave.replace(/\D+/g, ''));
  let newAveNum;

  if (aveNum === 5) {
    newAveNum = aveNum -2;
  } else if (aveNum > 1) {
    newAveNum = --aveNum;
  } else {
    newAveNum = aveNum;
  }

  return `${ordinalSuffix(newAveNum)} Avenue`
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
