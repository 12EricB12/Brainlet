void loadQuestions() {
  // Easy mode was chosen
  if (lvl <= 1) { 
    geoQ = geoEasy;
  } 
  
  // Moderate mode was chosen
  else if (lvl == 2) {
    geoQ = geoMedium;
  }
  
  // Hard mode was chosen
  else if (lvl == 3) {
    geoQ = geoHard;
  }
  
  // Gets the questions and answers from the text file
  answer = geoQ.getAnswer();
  question = geoQ.getQuestion();
  options = geoQ.randomizeSelection(4);
  splitQuestion = question.split("");
}


void showText() {
  int yVal = 300;
  
  // Creates the question on screen
  question = String.join("", splitQuestion);
  text(question, 40, 100, 700, 700);
  
  // Creates the text size for the answer
  textSize(answerSize); 
  text("1. " + answer, 40, yVal - answerSize, 700, 700);
  
  for (int i = 0; i < options.length; i++) {
    
    // Creates the text size for all the options
    textSize(answerSize); 
    
    // Prints the remaining options
    text(String.valueOf(i + 2) + ". " + options[i], 40, yVal, 700, 700);
    
    // Sets the new text y-value
    yVal += answerSize; 
  }
}

void nextQuestion() { //doesnt work properly yet
  for (int i = 1; i < splitQuestion.length; i++) {
    String nextQuestion = splitQuestion[i];
    question = String.join("", nextQuestion);
    text(question, 40, 100, 700, 700);  

 }

  
}
