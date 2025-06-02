Class Ball {

  //1. Instance variables
  float x, y, vx, vy, d;
  
  //2. Constructor
  Ball() {
    x = width/2;
    y = height/2;
    vx = 3
    vy = 4
    d = 50
 }

 //3. behavior functioons
 void show() {
     ellipse(x, y, d, d);
 }
   

}
