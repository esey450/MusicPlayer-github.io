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

// Button dimensions and positions
float btnW = 80, btnH = 40;
float playX, playY;
float prevX, nextX;

void setup() {
  size(600, 200);
  
  minim = new Minim(this);
  playList = new AudioPlayer[songNames.length];
  
  // Load all songs from the data folder
  for (int i = 0; i < songNames.length; i++) {
    playList[i] = minim.loadFile(songNames[i]);
  }
  
  // Setup buttons positions
  playX = width / 2 - btnW / 2;
  playY = height / 2 - btnH / 2;
  
  prevX = playX - btnW - 20;
  nextX = playX + btnW + 20;
  
  textAlign(CENTER, CENTER);
  textSize(16);
}

void draw() {
  background(50);
  
  // Display current song name (without file extension)
  String displayName = songNames[currentSong].replace(".mp3", "");
  fill(255);
  text("Now Playing: " + displayName, width / 2, height / 4);
  
  // Draw Play/Pause button
  fill(100, 200, 100);
  rect(playX, playY, btnW, btnH, 10);
  fill(0);
  text(isPlaying ? "Pause" : "Play", playX + btnW / 2, playY + btnH / 2);
  
  // Draw Previous button
  fill(150, 150, 250);
  rect(prevX, playY, btnW, btnH, 10);
  fill(0);
  text("Prev", prevX + btnW / 2, playY + btnH / 2);
  
  // Draw Next button
  fill(150, 150, 250);
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
      mouseY > playY && mouseY < pl
