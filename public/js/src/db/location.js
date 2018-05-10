class Location {
  constructor(data){
    this.id = data.id
    this.street = data.street
    this.ave = data.ave
    this.longitude = data.longitude
    this.latitude = data.latitude
    this.empty = data.npcs.length < 1 && data.dog_collectables.length < 1
    data.npcs.forEach(npc => {
      store.npcs.push(new Npc(npc, this))
    })
    data.dog_collectables.forEach(collect => {
      store.dogCollectables.push(new DogCollectable(collect, this))
    })
    store.locations.push(this)
  }
}
