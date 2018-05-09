class DogCollectable {
  constructor(data, location){
    this.id = data.id
    this.name = data.name.replace(/your friend/g, '').replace(/,/g, '').replace(/^(a )/g, '')
    this.img = data.img
    this.location = location
  }

  addToInventory() {
    const inventory = document.getElementById('collectables')
    let div = document.createElement('div')
    div.innerHTML = `<img src=${this.img} width="60" height="50"><br>${this.name}`
    inventory.appendChild(div)
  }

  static removeItem(item) {
    let index = store.dogCollectables.indexOf(item);
    store.dogCollectables.splice(index, 1);
  }
}
