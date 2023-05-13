import g4p_controls.*;

Questions geoEasy, geoMedium, geoHard, geoQ;
int lvl;
String answer, question;
String[] splitQuestion;

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
}
