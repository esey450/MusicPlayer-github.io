Class Ball {

  //1. Instance variables
  float x, y, vx, vy, d;
  
  //2. Constructor
  Ball() {
    x = width/2;
    y = height/2;
    vx = 3;
    vy = 4;
    d = 50;
  } 

  //3. behavior F  unctioons
  void show() {
     ellipse(x, y, d, d);
  }
   
   void act() {
      x = x + vx;
      y = y + vy;  
      
      if (x < d/2 || x > width-d/2) {
        vx = -vx;
      }
      if (y < d/2 || y > width-d/2) {
        vy = -vy;
      }
  }
   
}
