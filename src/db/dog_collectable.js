class DogCollectable {
  constructor(data, location) {
    this.id = data.id
    this.name = data.name.replace(/your friend/g, '').replace(/,/g, '').replace(/^(a )/g, '')
    this.img = data.img
    this.location = location
  }

  checkOff() {
    let imgDiv = document.getElementById(`item-id-${this.id}`)
    imgDiv.innerHTML += "<img class='inlay' src='images/other/check_mark.png' width='40' height='40'>"
  }

  static removeItem(item) {
    let index = store.dogCollectables.indexOf(item);
    store.dogCollectables.splice(index, 1);

    if (store.dogCollectables.length === 0) {
      let overlayText = document.getElementById("reload-text")
      overlayText.innerHTML = "<img src='images/dog/pug_gif.gif'><h3>CONGRATULATIONS! YOU WON!</h3><hr><h5>Click Anywhere to Play Again!</h5>"
      document.getElementById("reload").style.display = "block";
      fetch('http://localhost:3000/api/v1/locations/reset').then(r => r.json()).then(console.log)
    }
  }
}
