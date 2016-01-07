class Score {
  int score=0;

  Score() {
    fill(0);
    textSize(30);
  }

  //after declaring fields and setting up constructors, you can define your methods
  void display() {
    fill(0);
    text("Score:", 50, 50);
    text(score, 115, 50);
  }

  void addscore() {  //adds score
    score=score+1;
  }
  void subScore() {  //subtract score
    score=score-2;
  }

  boolean scoref (Catcher thing) {

    if (score==30) {     //win score
      return true;
    } else { 
      return false;
    }
  }
  boolean scoref2 (Catcher thing) {

    if (score<0) {  //lose score
      return true;
     
    } else { 
      return false;
    }
  }
}