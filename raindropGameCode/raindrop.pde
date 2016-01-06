class Raindrop {
  PVector loc, vel, acc;
  float diam;
  color c;

  Raindrop(float x,float y) {
    diam = random(20,50);
    loc = new PVector(random(diam, width-diam), 0);
    vel= new PVector(0, random(15));
    c = color(0, 0, random(255));
  }

  //after declaring fields and setting up constructors, you can define your methods
  void display() {
    fill(c);
    noStroke();
     for (int i = 2; i < diam/2; i++ ) {
      ellipse(loc.x,loc.y + i*4,i*2,i*2);
    }

  }
  void fall() {
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
   
  }


  boolean isInContactWith(Catcher thing) {

    if (thing.loc.dist(loc) < thing.diam/2 + diam/2 ) {
      return true;
    } else { 
      return false;
    }
  }
}