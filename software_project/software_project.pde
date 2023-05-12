String state; // the state of the software in various stages
int lvl;
import g4p_controls.*;

Questions geoEasy, geoMedium, geoHard;

String answer, question;

void setup() {
  size(800,800);
  background(255);
  createGUI();
  
  answer = geoEasy.getAnswer();
  question = geoEasy.getQuestion();
  
  println(question);
  println(answer);
}

void draw() {
  textSize(50);
  text(question, 40, 120);
  fill(0);
}
