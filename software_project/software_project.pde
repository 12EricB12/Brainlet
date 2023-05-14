import g4p_controls.*;

Questions geoEasy, geoMedium, geoHard, geoQ;
int lvl;

int answerSize = 25;

String answer, question;
String[] splitQuestion;

String[] options;

void setup() {
  size(800, 800);
  background(255);
  createGUI();
  
  // Load the text documents
  geoEasy = new Questions(loadStrings("Geography/Easy.txt"));
  geoMedium = new Questions(loadStrings("Geography/Moderate.txt"));
  geoHard = new Questions(loadStrings("Geography/Hard.txt"));
  
  
}


void draw() {
  background(255);
  
  // Formatting
  textSize(20);
  fill(0);
  textAlign(LEFT);

  displayQuestions(); //<>//
  noLoop();
  
  // Creates the text on screen
  question = String.join("", splitQuestion);
  text(question, 40, 100, 700, 700);
  
  int yVal = 500;
  
  textSize(answerSize); // Creates the text for the answer
  text(answer, 40, yVal - answerSize, 700, 700);
  
  for (int i = 0; i < options.length; i++) {
    textSize(answerSize); // Creates the text for all the options
    text(options[i], 40, yVal, 700, 700);
    yVal += answerSize; // Sets the new text Y value
    println(yVal);
  }
}
