class Npc {
  constructor(npc, location) {
    this.name = npc.name;
    this.dialogue = npc.dialogue;
    this.img = npc.img;
    this.location = location;
    this.found = false;
    store.npcs.push(this);
  }

  static createNpcs(npcsJSON) {
    return npcsJSON.map(npcJSON => {
      return new Npc(npcJSON);
    });
  }

  getMarker() {
    let lat = this.location.latitude;
    let lng = this.location.longitude;

    let icon = L.icon({
      iconUrl: this.img,
      iconSize: [30, 40]
    });

    var marker = L.marker([lat, lng], {autoPan: true, autoPanSpeed: 10, icon: icon}).addTo(mymap);
  }
}
