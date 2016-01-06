class Score {
  int score5=0;

  Score() {
    fill(0);
    textSize(30);
  }

  //after declaring fields and setting up constructors, you can define your methods
  void display() {
    fill(0);
    text("Score:", 50, 50);
    text(score5, 115, 50);
  }

  void addscore() {
    score5=score5+1;
  }
  void subScore() {
    score5=score5-2;
  }

  boolean scoref (Catcher thing) {

    if (score5==30) {
      return true;
    } else { 
      return false;
    }
  }
  boolean scoref2 (Catcher thing) {

    if (score5<0) {
      return true;
     
    } else { 
      return false;
    }
  }
}