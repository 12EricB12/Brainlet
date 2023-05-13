void displayQuestions() {
  // Easy mode was chosen
  if (lvl == 0) { 
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
  splitQuestion = question.split("");
  
  
}
