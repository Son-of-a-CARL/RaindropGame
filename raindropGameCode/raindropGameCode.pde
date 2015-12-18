//int count = 10000;

ArrayList <Raindrop> rain = new ArrayList <Raindrop>();      //declare a new Raindrop called r
Catcher c;
void setup() {
  size(1200, 800);
  //mouse = new PVector(); 
  rain.add(new Raindrop(width/2, height/2));
  c = new Catcher();
}
//Initialize r. The parameters used are the initial x and y positions


void draw() {
  background(255);
  c.display();
  c.update();
  rain.add(new Raindrop(width/2, height/2));
  for (int i=rain.size()-1; i>=0; i--) {
    Raindrop r = rain.get(i);
    r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r.display();
    r.bounceoffwalls();

    if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r.reset();                           //if it does, reset the raindrop
    }
    if (r.isInContactWith(c)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r.reset();  
      //if it is, reset the raindrop
    }
  }
}