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
  answer = geoQ.getAnswer(); // Generates the answer to the problem, always the first option (answer shuffle will be added later)
  question = geoQ.getQuestion(); 
  options = geoQ.randomizeSelection(4); // Generates the options that the user can pick from
  
  splitQuestion = question.split("");
}


void showText() {
  
  // Initial y-value of answer
  int yVal = 300;
  
  // Creates the question on screen
  question = String.join("", splitQuestion);
  text(question, 40, 100, 700, 700);
  
  // Font size for the answer
  textSize(answerSize); 
  text("1. " + answer, 40, yVal - answerSize);

  // Outputs the remaining options
  for (int i = 0; i < options.length; i++) {
    
    //  Font size and line spacing
    textSize(answerSize); 
    textLeading(10);
    
    // Creates the remaining options
    text(String.valueOf(i + 2) + ". " + options[i], 40, yVal);
    
    // Sets the new text y-value
    yVal += answerSize; 
  }
  
  
  // Create a new font for the labels
  //myFont = createFont("Arial Bold", 20);
  //textFont(myFont);

  text("Question:", 40, 90);
  text("Possible Options:", 40, 250);
}

void nextQuestion() {
  
  geoQ.randomizeNext();
  
  question = geoQ.nextQuestion();
  answer = geoQ.getAnswer();
  options = geoQ.randomizeSelection(4);
  splitQuestion = question.split("");
}
