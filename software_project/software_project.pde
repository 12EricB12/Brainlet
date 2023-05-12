import g4p_controls.*;
import java.util.Arrays;
 
Questions geoEasy, geoMedium, geoHard;

import java.util.*;

int lvl; // different difficulty levels
String answer, question;
String[] splitQuestion;

void setup() {
  size(800,800);
  background(255);
  createGUI();
  
  // Get the questions and answers from the documents
  Questions geoQ = loadQuestions(1);
  
  answer = geoQ.getAnswer();
  question = geoQ.getQuestion();
  
  splitQuestion = question.split("");
}

void draw() {
  textSize(10);
  textAlign(LEFT);
  
  int counter = 0;
  
  for (int i = 0; i < splitQuestion.length; i++) {
    if (counter == 10) {
      splitQuestion[i] = splitQuestion[i] + "\n";
      counter = 0;
    }
    
    counter++;
  }
  
  question = String.join("", splitQuestion);
  
  text(question, 40, 120);
  fill(0);
}
