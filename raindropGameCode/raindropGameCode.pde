ArrayList <Raindrop> rain = new ArrayList <Raindrop>();      //declare a new Raindrop called r
Catcher c;//other classes declared
Score s;
int mode=0; //for start screen

void setup() {
  size(1200, 800);
  //mouse = new PVector(); 
  rain.add(new Raindrop(width/2, height/2));
  c = new Catcher();
  s=new Score();
}
//Initialize r. The parameters used are the initial x and y positions


void draw() {
  if (mode==0) {    //start screen and adding text and instructions
    background(255);
    textSize(100);
    fill(0, 0, 255);
    textAlign(CENTER, CENTER);
    text("Raindrop Game", width/2, height/3);
    textSize(30);
    fill(0);
    text("OBJECTIVE: CATCH AS MANY RAINDROPS AS POSSIBLE", width/2, height/2); 
    text("YOU GAIN A POINT FOR EACH RAINDROP YOU CATCH", width/2, height/2 + 40);
    text("AND LOSE 2 POINTS FOR EVERY RAINDROP YOU MISS", width/2, height/2 +80);
    text("YOU WIN WHEN U GET A SCORE OF 30 ", width/2, height/2+120);
    text("AND LOSE IF YOUR SCORE GOES BELOW ZERO", width/2, height/2+160);
    text("Click Screen and hit any key to start", width/2, height/2+200);//text for title screen

    if (keyPressed) {                               // title screen goes away if key is pressed
      mode=1;
    }
  }
  if (mode==1) {  //if statement to make the start screen go away when key is pressed

    background(200);
    c.display();
    c.update();
    s.display();
    if (rain.size() < 10) {
      rain.add(new Raindrop(width/2, height/2));
    }

    for (int i=rain.size()-1; i>=0; i--) {
      Raindrop r = rain.get(i);
      r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      r.display();

      if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        r.reset(); //if it does, reset the raindrop
        s.subScore();
      }

      if (r.isInContactWith(c)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        r.reset();  
        s.addscore();
      }
    }

    if (s.scoref(c)) {  //if the score is the winscore display win screen
      mode=2;
    }

    if (s.scoref2(c)) {        //if you lose display the lose  
      mode=3;
      s.score = 0;
    }
  }

  if (mode==2) {
    background(0);
    fill(255);
    text("HOLLA YOU WON CONGRATS!!!", width/2, height/3);
    text("Click To Play Again!!!", width/2, height/2);  //win screen
    text("Have Fun :)", width/2, height/2+40);
    if (mousePressed) {
      mode=0;    //if you click mouse go back to start screen
      s.score=0;  //reset ther score
      rain.clear();  //reset the raindrops
    }
  }
  if (mode==3) {

    background(0);
    fill(255);
    text("YOU LOSE BETTER LUCK NEXT TIME", width/2, height/3);
    text("Click Screen To Play Again ", width/2, height/2);  //lose screen
    text("you can do it this time :)", width/2, height/2+40);
    if (mousePressed) {
      mode = 0;  //if you click mouse go back to start screen
      s.score = 0;  //reset ther score
      rain.clear();  //reset the raindrops
    }
  }
}