class DogCollectable {
  constructor(data, location) {
    this.id = data.id
    this.name = data.name.replace(/your friend/g, '').replace(/,/g, '').replace(/^(a )/g, '')
    this.img = data.img
    this.location = location
  }

  checkOff() {
    let imgDiv = document.getElementById(`item-id-${this.id}`)
    imgDiv.innerHTML += "<img class='inlay' src='https://dl.dropboxusercontent.com/s/5ziysnzn31kutph/check_mark.png?dl=0' width='40' height='40'>"
  }

  static removeItem(item) {
    let index = store.dogCollectables.indexOf(item);
    store.dogCollectables.splice(index, 1);

    if (store.dogCollectables.length === 0) {
      clearInterval(cruellaInterval);
      let overlayText = document.getElementById("reload-text")
      overlayText.innerHTML = "<img src='https://dl.dropboxusercontent.com/s/bpdfenxv7iqy2ek/pug_gif.gif?dl=0'><h3>YAY! YOU WON!</h3><hr><h5>Click Anywhere to Play Again!</h5>"
      document.getElementById("reload").style.display = "block";
      fetch('https://unleashedbackendapp.herokuapp.com/api/v1/locations/reset')
    }
  }
}
