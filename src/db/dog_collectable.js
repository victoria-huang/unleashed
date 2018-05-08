class DogCollectable {
  constructor(data, location){
    this.id = data.id
    this.name = data.name
    this.img = data.img
    this.location = location
  }

  static removeItem(item) {
    let index = store.dogCollectables.indexOf(item);
    store.dogCollectables.splice(index, 1);
  }
}
