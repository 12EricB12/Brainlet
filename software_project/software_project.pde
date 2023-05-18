import g4p_controls.*;    //<>//

Questions easyQ, moderateQ, hardQ, questionSet;

String[] easyFile, moderateFile, hardFile; 

int numOfTries;
int lvl;
int attempts;
int answerSize = 20;

PImage mainMenu, questionScreen ;

String answer, question;
String mode = "Test"; // Possible options: Test, Endless

String[] splitQuestion;
String[] options;
ArrayList<String> optionsArray = new ArrayList<String>();
ArrayList<String> pastQuestions = new ArrayList<String>();
String windowName;
String subSelected;

int current = 0;

int randomness = 4; // How "random" you want the questions to be. Be careful setting it too high as the program could run forever
int correct = 0;
int answerLocation = 0;
int buttonClicked;

void setup() {
  
  mainMenu = loadImage("background.jpg");
  questionScreen = loadImage("startquiz.jpg");
  size(800, 500);
 //<>//
  createGUI();
  displayMainMenu(); 
}

void draw() {
  background(254, 221, 216);
  
  // Display the other screens //<>//
  displayScreen();
 //<>// //<>//
}
