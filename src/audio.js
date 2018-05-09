const wallBump = new Audio('https://dl.dropboxusercontent.com/s/xhwthp126kpct0v/wall_bump.mp3')
const find = new Audio('https://dl.dropboxusercontent.com/s/6wbiboh8hpalrc4/Item%20Found.mp3')
const bg = new Audio('')

function playGetCollectableNoise(){
  find.play()
}

function playWallBump(){
  wallBump.play()
}

function playBg(){
  bg.play()
}
