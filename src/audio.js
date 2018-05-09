const wallBump = new Audio('https://dl.dropboxusercontent.com/s/xhwthp126kpct0v/wall_bump.mp3')
const find = new Audio('https://dl.dropboxusercontent.com/s/6wbiboh8hpalrc4/Item%20Found.mp3')
const bg = new Audio('https://dl.dropboxusercontent.com/s/bimvvd0g46urrxc/wholetthedogsout.mp3')

function playGetCollectableNoise(){
  find.play()
}

function playWallBump(){
  wallBump.play()
}

function playBg(){
  bg.loop = true;
  bg.play()
}

function toggleSound() {
  if (bg.muted) {
    bg.muted = false;
    wallBump.muted = false;
    find.muted = false;
  } else {
    bg.muted = true;
    wallBump.muted = true;
    find.muted = true;
  }
}
