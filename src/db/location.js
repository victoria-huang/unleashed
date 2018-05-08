class Location {
  constructor(data){
    this.street = data.street
    this.ave = data.ave
    data.npcs.forEach(npc => {
      store.npcs.push(new Npc(npc))
    })
    data.dog_collectables.forEach(collect => {
      store.dogCollectables.push(new DogCollectable(collect))
    })
  }
}
