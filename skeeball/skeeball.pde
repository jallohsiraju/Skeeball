import processing.sound.*;

//sound variables
SoundFile musicSound;
SoundFile boing;

//array for the targets
ArrayList<Target> targets = new ArrayList();

int score;

Ball ball;

void setup() {
  //music for the game: game music
  musicSound = new SoundFile(this, "gameMusic.wav");
  musicSound.loop();
  //ball bounce sound
  boing = new SoundFile(this, "boing.wav");

  size(600, 800);
  background(0);
  PFont font = createFont("arial.ttf", 16);
  textFont(font);
  ball = new Ball(width/2, 750, boing);

  // adds targets to array list
  targets.add(new Target(160, 60, 70, 100));
  targets.add(new Target(440, 60, 70, 100));
  targets.add(new Target(width/2, 100, 70, 50));
  targets.add(new Target(width/2, 200, 60, 40));
  targets.add(new Target(width/2, 280, 60, 30));
  targets.add(new Target(width/2, 360, 40, 20));
  targets.add(new Target(width/2, 440, 40, 10));
}


void draw() {
  background(0);
  fill(#1D7616);
  noStroke();

  // top square
  fill(#23A018);
  rect(width/2-210, 0, 420, 500);


  // U curve
  stroke(255);
  strokeWeight(4);
  fill(#1D7616);
  beginShape();
  curveVertex(width/2 - 190, height/2 - 400);
  curveVertex(width/2 - 190, height/2 - 400);
  curveVertex(width/2 - 150, 420);
  curveVertex(width/2 + 150, 420);
  curveVertex(width/2 + 190, height/2 - 400);
  curveVertex(width/2 + 190, height/2 - 400);
  endShape();
  ellipse(width/2, 270, 250, 250); // medium circle

  // bottom square
  noStroke();
  fill(#13550E);
  rect(width/2-210, 500, 420, 600);

  // displays targets
  for (Target t : targets) {
    t.display();
  }


  // point values
  fill(255);


  // score counter
  text("Score: " + score, width/2-30, 780);

  ball.update();
  ball.display();

  // controls score count + reset
  if (ball.vel.mag() <= 0.01) {
    //println("hit" + frameCount);
    for (int i = 0; i < targets.size(); i++) {
      Target t = targets.get(i);
      float dist = dist(t.pos.x, t.pos.y, ball.pos.x, ball.pos.y);
      if (dist < t.radius + ball.radius+20) {
        println("test");
        score = score + t.score;
      }
    }
    ball.pos.x = width/2;
    ball.pos.y = 750;
  }
}

// checks if ball is hovered over
Ball getHover() {
  Ball bb = null;
  if (dist(ball.pos.x, ball.pos.y, mouseX, mouseY) < ball.radius) {
    bb = ball;
    ball.hovered = true;
  } else {
    ball.hovered = false;
  }
  return bb;
}


void mouseMoved() {
  getHover();
}

void mouseDragged() {
  Ball bHovered = getHover();
  if (bHovered != null) {
    ball.pos.x = mouseX;
    ball.pos.y = mouseY;

    ball.vel.x = mouseX - pmouseX;
    ball.vel.y = mouseY - pmouseY;
  }
}

void mouseReleased() {
  ball.vel.mult(10);
}
