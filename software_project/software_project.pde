String state; // the state of the software in various stages

import g4p_controls.*;
import java.utils.Arrays;

Questions geoEasy;

String answer, question;
String[] splitQuestion;

void setup() {
  geoEasy = new Questions(loadStrings("Geography/Easy.txt"));
  size(800,800);
  background(255);
  createGUI();
  
  answer = geoEasy.getAnswer();
  question = geoEasy.getQuestion();
  
  splitQuestion = question.split("");
}

void draw() {
  textSize(25);
  textAlign(LEFT);
  
  int counter = 0;
  
  for (int i = 0; i < splitQuestion.length; i++) {
    if (counter == 5) {
      splitQuestion[i] = splitQuestion[i] + "\n";
    }
    counter++;
  }
  
  text(question, 40, 120);
  fill(0);
}
