class Score {
  int score5=0;

  Score() {
    fill(255);
    textSize(30);
  }

  //after declaring fields and setting up constructors, you can define your methods
  void display() {
    text("Score:",10,50);
    text(score5, 100, 50);
  }
 
void addscore() {
score5=score5+1;
  
  }
}