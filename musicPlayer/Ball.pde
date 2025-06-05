class Ball {
  float x, y, vx, vy, d;

  Ball() {
    x = width / 2;
    y = height / 2;
    vx = 3;
    vy = 4;
    d = 20; // Diameter of the ball
  }

  void show() {
    ellipse(x, y, d, d);
  }

  void act() {
    x += vx;
    y += vy;

    if (x < d / 2 || x > width - d / 2) {
      vx = -vx;
    }
    if (y < d / 2) {
      vy = -vy;
    }
  }
}
