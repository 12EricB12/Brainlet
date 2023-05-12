String state; // the state of the software in various stages
int lvl;
import g4p_controls.*;
import java.util.*;

String answer, question;
String[] splitQuestion;

void setup() {
  size(800,800);
  background(255);
  createGUI();
  
  Questions geoQ = loadQuestions(1);
  
  answer = geoQ.getAnswer();
  question = geoQ.getQuestion();
  
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
  
  question = String.join("", splitQuestion);
  
  text(question, 40, 120);
  fill(0);
}
