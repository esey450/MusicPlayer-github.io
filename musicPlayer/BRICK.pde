Class Brick {

  // Instance variables
  float x, y, w, h;
  boolean isBroken;

  // Constructor
  Brick(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.isBroken = false;
  }

  // Method to display the brick
  void show() {
    if (!isBroken) {
      fill(255, 0, 0); // Red color for the brick
      rect(x, y, w, h);
    }
  }

  // Method to check for collision with the ball
  boolean checkCollision(Ball ball) {
    if (!isBroken && ball.x + ball.d/2 > x && ball.x - ball.d/2 < x + w &&
        ball.y + ball.d/2 > y && ball.y - ball.d/2 < y + h) {
      isBroken = true; // Mark the brick as broken
      return true; // Collision detected
    }
    return false; // No collision
  }
}
