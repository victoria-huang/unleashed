class Location {
  constructor(data){
    this.id = data.id
    this.street = data.street
    this.ave = data.ave
    this.longitude = data.longitude
    this.latitude = data.latitude
    data.npcs.forEach(npc => {
      store.npcs.push(new Npc(npc, this))
    })
    data.dog_collectables.forEach(collect => {
      store.dogCollectables.push(new DogCollectable(collect))
    })
    store.locations.push(this)
  }
}
