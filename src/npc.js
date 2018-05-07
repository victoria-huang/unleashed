class Npc {
  constructor(npc) {
    this.name = npc.name;
    this.dialogue = npc.dialogue;
    this.img = npc.img;
    this.location = npc.location;
    store.npcs.push(this);
  }

  static createNpcs(npcsJSON) {
    return npcsJSON.map(npcJSON => {
      return new Npc(npcJSON);
    });
  }

  getMarker() {
    let street = this.location.street;
    let ave = this.location.ave;
    let icon = this.img;

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
  }
}
