import g4p_controls.*; //<>//

Questions geoEasy, geoMedium, geoHard, geoQ;

int lvl;
int answerSize = 20;
PFont myFont;


String answer, question;
String[] splitQuestion;
String[] options;
String windowName;

void setup() {
  size(800, 400);
  background(255);
  
  createGUI();
  displayStart();

  // Load the text documents
  geoEasy = new Questions(loadStrings("Geography/Easy.txt"));
  geoMedium = new Questions(loadStrings("Geography/Moderate.txt"));
  geoHard = new Questions(loadStrings("Geography/Hard.txt"));
}

void draw() {
  background(254, 221, 216);
  
  if (windowName == "start") {
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("Welcome to \n Brainlet", width/2, 100);
  } 
  
  else if (windowName == "Main") {
 //<>//
    // Formatting //<>//
    textSize(20);
    fill(0);

    textAlign(LEFT);

    loadQuestions();
    showText();

    noLoop();
  }
}
