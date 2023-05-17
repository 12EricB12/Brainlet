import g4p_controls.*; //<>// //<>//

Questions geoEasy, geoMedium, geoHard, geoQ;

String[] geoEasyQ, geoMediumQ, geoHardQ;

int lvl;
int answerSize = 20;
PFont myFont;


String answer, question;
String mode = "Endless";
String[] splitQuestion;
String[] options;
ArrayList<String> optionsArray = new ArrayList<String>();
ArrayList<String> pastQuestions = new ArrayList<String>();
String winState;

int current = 0;
int agressiveness = 4; // How "random" you want the questions to be. Be careful setting it too high as the program could run forever

void setup() {
  size(800, 400);
  background(255);
  
  createGUI();
  displayStart();
  
  geoEasyQ = loadStrings("Geography/Easy.txt");
  geoMediumQ = loadStrings("Geography/Moderate.txt");
  geoHardQ = loadStrings("Geography/Hard.txt");

  // Load the text documents
  geoEasy = new Questions(geoEasyQ,  mode);
  geoMedium = new Questions(geoMediumQ, mode);
  geoHard = new Questions(geoHardQ, mode);
}

void draw() {
  background(254, 221, 216);
  
  if (winState == "start") {
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("Welcome to \n Brainlet", width/2, 100);
  } 
  
  else if (winState == "Main") {
 //<>//
    // Formatting //<>//
    textSize(20);
    fill(0);

    textAlign(LEFT);

    loadQuestions();
    showText();

    noLoop();
  }
  else if (winState == "End") {
    fill(0);
    textSize(50);
    text("You passed!", width/2-100, 100);
  }
}
