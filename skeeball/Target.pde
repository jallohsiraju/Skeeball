class Target {

  float radius;
  PVector pos;
  int score;

  Target(float x, float y, float diameter, int score) {
    pos = new PVector(x, y);
    this.radius = diameter/2;
    this.score = score;
  }

  void display() {
    stroke(255);
    strokeWeight(3);
    fill(0);
    circle(pos.x, pos.y, 2 * radius);
    fill(255);
    text(score, pos.x-10, pos.y+8); // middle 5
  }
}
