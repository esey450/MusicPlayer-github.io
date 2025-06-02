import ddf.minim.*;

Minim minim;
AudioPlayer[] playList;

String[] songNames = {
  "song1.mp3",
  "song2.mp3",
  "song3.mp3"
};

int currentSong = 0;
boolean isPlaying = false;

float btnW = 80, btnH = 40;
float playX, playY;
float prevX, nextX;

void setup() {
  size(600, 200);
  
  minim = new Minim(this);
  playList = new AudioPlayer[songNames.length];
  
  for (int i = 0; i < songNames.length; i++) {
    playList[i] = minim.loadFile(songNames[i]);
  }
  
  playX = width / 2 - btnW / 2;
  playY = height / 2 - btnH / 2;
  
  prevX = playX - btnW - 20;
  nextX = playX + btnW + 20;
  
  textAlign(CENTER, CENTER);
  textSize(16);
}

void draw() {
  background(50);
  
  String displayName = songNames[currentSong].replace(".mp3", "");
  fill(255);
  text("Now Playing: " + displayName, width / 2, height / 4);
  
  fill(100, 200, 100);
  rect(playX, playY, btnW, btnH, 10);
  fill(0);
  text(isPlaying ? "Pause" : "Play", playX + btnW / 2, playY + btnH / 2);
  
  fill(150, 150, 250);
  rect(prevX, playY, btnW, btnH, 10);
  fill(0);
  text("Prev", prevX + btnW / 2, playY + btnH / 2);
  
  rect(nextX, playY, btnW, btnH, 10);
  fill(0);
  text("Next", nextX + btnW / 2, playY + btnH / 2);
}

void mousePressed() {
  if (mouseX > playX && mouseX < playX + btnW &&
      mouseY > playY && mouseY < playY + btnH) {
    if (isPlaying) {
      playList[currentSong].pause();
      isPlaying = false;
    } else {
      playList[currentSong].play();
      isPlaying = true;
    }
  }
  
  if (mouseX > prevX && mouseX < prevX + btnW &&
      mouseY > playY && mouseY < playY + btnH) {
    switchSong(-1);
  }
  
  if (mouseX > nextX && mouseX < nextX + btnW &&
      mouseY > playY && mouseY < playY + btnH) {
    switchSong(1);
  }
}

void switchSong(int direction) {
  playList[currentSong].pause();
  playList[currentSong].rewind();
  
  currentSong += direction;
  if (currentSong < 0) currentSong = playList.length - 1;
  else if (currentSong >= playList.length) currentSong = 0;
  
  if (isPlaying) {
    playList[currentSong].play();
  }
}

void stop() {
  for (AudioPlayer player : playList) {
    if (player != null) player.close();
  }
  minim.stop();
  super.stop();
}
