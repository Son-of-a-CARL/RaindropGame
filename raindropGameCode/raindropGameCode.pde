ArrayList <Raindrop> rain = new ArrayList <Raindrop>();      //declare a new Raindrop called r
Catcher c;
Score s;
void setup() {
  size(1200, 800);
  //mouse = new PVector(); 
  rain.add(new Raindrop(width/2, height/2));
  c = new Catcher();
  s=new Score();
}
//Initialize r. The parameters used are the initial x and y positions


void draw() {
  background(255);
  c.display();
  c.update();
  s.display();
  if(rain.size() < 100){
  rain.add(new Raindrop(width/2, height/2));
  }
  
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
      s.addscore();
      c.grow();
      //if it is, reset the raindrop
    }
  }
  
}