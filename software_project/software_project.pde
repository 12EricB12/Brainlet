import g4p_controls.*;

Questions geoEasy;

void setup() {
  geoEasy = new Questions(loadStrings("Geography/Easy.txt"));
  size(800,800);
  background(255);
  createGUI();
  
  String answer = geoEasy.getAnswer();
  String question = geoEasy.getQuestion();
  
  println(question);
  println(answer);
}

void draw() {
  
}
