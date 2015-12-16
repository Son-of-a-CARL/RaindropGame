class Catcher {
  PVector loc;
  color c;
  int diam;

  Catcher() {
    diam = 100;
    loc = new PVector();
    c = color(0);
  }

  //after declaring fields and setting up constructors, you can define your methods
  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }
  void update() {
    loc.set(mouseX,mouseY);
    }
}