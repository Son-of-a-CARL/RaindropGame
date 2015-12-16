int count = 10000;

Raindrop[] r= new Raindrop[count];      //declare a new Raindrop called r
Catcher c;
void setup() {
  size(1200, 800);
  //mouse = new PVector(); 
  for ( int i=0; i< r.length; i++) {
    r[i]= new Raindrop();
  }
  c = new Catcher();
}
//Initialize r. The parameters used are the initial x and y positions


void draw() {
  background(255);
  c.display();
  c.update();
  for (int i=0; i<r.length; i++) {
    r[i].fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r[i].display();
    r[i].bounceoffwalls();

    if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r[i].reset();                           //if it does, reset the raindrop
    }
    if (r[i].isInContactWith(c)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r[i].reset();  
      //if it is, reset the raindrop
    }
  }
}