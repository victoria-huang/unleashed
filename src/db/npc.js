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
    let marker = L.icon({
    iconUrl: this.img,


    // var geocoder = L.Control.geocoder()
    // .on('markgeocode', function(event) {
    //     var center = event.geocode.center;
    //     L.marker(center).addTo(map);
    //     map.setView(center, map.getZoom());
    //     L.marker([51.5, -0.09], {icon: greenIcon}).addTo(map);
    // })
    // .addTo(map);

    });
  }
}
