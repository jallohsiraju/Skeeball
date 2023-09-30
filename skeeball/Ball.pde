

class Ball {

  PVector pos;
  PVector vel;
  boolean hovered = false;
  float radius =10;

  SoundFile ballBounceSound;

  //added a ballbounceSound parameter to allow the sound to be used in the ball class
  Ball(float x, float y, SoundFile ballBounceSound) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    this.ballBounceSound = ballBounceSound;
  }

  void update() {
    pos.add(vel);
    vel.mult(.96);

    if (pos.x < width/2-210) {
      vel.x*=-1;
      pos.x = width/2-210;
      ballBounceSound.play();
    } else if (pos.x > width/2-210 +420) {
      vel.x*=-1;
      pos.x = width/2-210 +420;
      ballBounceSound.play();
    } else if (pos.y < 0) {
      vel.y*=-1;
      pos.y = 0;
      ballBounceSound.play();
    } else if (pos.y > 800) {
      vel.y*=-1;
      pos.y = 800;
      ballBounceSound.play();
    }
  }

  void display() {
    noStroke();
    fill(255);
    circle(pos.x, pos.y, radius * 2);
  }
}
