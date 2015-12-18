class Raindrop {
  PVector loc, vel, acc;
  int diam;
  color c;

  Raindrop(float x,float y) {
    diam = 20;
    loc = new PVector(random(diam, width-diam), random(diam, height-diam));
    vel= new PVector(0, random(1));
    acc = PVector.random2D();
    acc.mult(.01);
    c = color(random(255), random(255), random(255));
  }

  //after declaring fields and setting up constructors, you can define your methods
  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }
  void fall() {
    vel.add(acc);
    vel.limit(5);
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
    vel.add(acc);
  }


  boolean isInContactWith(Catcher thing) {

    if (thing.loc.dist(loc) < thing.diam/2 + diam/2 ) {
      return true;
    } else { 
      return false;
    }
  }
}