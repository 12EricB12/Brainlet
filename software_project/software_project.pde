String state; // the state of the software in various stages

import g4p_controls.*;

Questions geoEasy;

String answer, question;

void setup() {
  geoEasy = new Questions(loadStrings("Geography/Easy.txt"));
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
