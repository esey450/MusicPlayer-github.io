//Global Variables
final int intro = 1;
final int playing = 2;
final int pause = 3;
final int win = 4;
final int lose = 5;

int mode;

Ball myball;


void setup() {
  size(600 , 600);
  mode = playing;
  
  myball = new Ball();
}
 
void draw() {
  if (mode == playing) {
    intro();
  } else if (mode == playing) {
    playing();
  } else if (mode == pause) {
    pause();
  } else if (mode == win) {
    win();
  } else if (mode == lose) {
    lose();
  } else {
    println("MODE ERROR");
  }
}
