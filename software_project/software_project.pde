import g4p_controls.*;     //<>//

Questions easyQ, moderateQ, hardQ, questionSet;

String[] easyFile, moderateFile, hardFile; 
String[] splitQuestion;
String[] options; 

String answer, question;
String windowName;
String subSelected; // Selected subject

int numOfTries = 1; // Initial value
int lvl; // Difficulty level
int current = 0; // Current question
int correct = 0; // Number of correct questions
int attempts;
int numOfQuestions;
int answerSize = 20;
int answerLocation = 0;
int buttonClicked;

boolean sliderChanged;
boolean answerSelected = false;
PImage mainMenu, questionScreen, endingScreen ; 

// CHANGEABLE VALUES
int randomness = 4; // How "random" you want the questions to be. Be careful setting it too high as the program could run forever
String mode = "Test"; // Possible options: Test, Endless, Random

ArrayList<String> optionsArray = new ArrayList<String>();
ArrayList<String> pastQuestions = new ArrayList<String>();
 //<>//
void setup() {
  size(800, 500);
  
  // Load background images
  mainMenu = loadImage("background.jpg");
  questionScreen = loadImage("startquiz.jpg");
  endingScreen = loadImage("endingImage.jpg");
  //<>// //<>//
  createGUI();
  mainMenu(); 
}

void draw() {
  background(254, 221, 216);
  
  // Display the other screens //<>//
  displayScreen(); //<>//
}
