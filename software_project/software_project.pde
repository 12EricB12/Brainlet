import g4p_controls.*;

Questions geoEasy, geoMedium, geoHard, geoQ;

int lvl;
int answerSize = 20;
boolean nextQuestionClicked;
PFont myFont;


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
  background(254, 221, 216);
  
  // Formatting
  textSize(20);
  fill(0);
  
  textAlign(LEFT);

  loadQuestions(); //<>//
  showText();
  
  noLoop();
  
  
  
}
