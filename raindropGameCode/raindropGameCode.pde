
int count = 500;
PVector mouse;   //declare a P

Raindrop[] r= new Raindrop[count];      //declare a new Raindrop called r

void setup() {
  size(1200, 800);
  mouse = new PVector(); 
  for ( int i=0; i< r.length; i++) {
    r[i]= new Raindrop();
  }
}
// r = new Raindrop(random(width), 0);   //Initialize r. The parameters used are the initial x and y positions


void draw() {
  background(255);
  for (int i=0; i<r.length; i++) {
    mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY

    r[i].fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r[i].display(); 

    if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r[i].reset();                           //if it does, reset the raindrop
    }
    if (r[i].isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r[i].reset();                         //if it is, reset the raindrop
    }
  }
}