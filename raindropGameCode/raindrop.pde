class Raindrop {
  PVector loc, vel, mouse;
  int diam;
  color c;

  Raindrop() {
    diam = 5;
    loc = new PVector(random(diam, width-diam), random(diam, height-diam));
    vel= new PVector(0, random(1));
    c = color(50, 50, 50);
  }

  //after declaring fields and setting up constructors, you can define your methods
  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }
  void fall() {
    loc.add(vel);
  }

  void bounceoffwalls() {
    if (loc.x + diam/2 >= width) {
      vel.x = -abs(vel.x);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (loc.x - diam/2 <= 0) {
      vel.x = abs(vel.x);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
  }

  void reset() {
    loc.y=0;
    loc.add(vel);
  }


boolean isInContactWith() {
 if( loc.dist(mouse){
   return true;
}
}