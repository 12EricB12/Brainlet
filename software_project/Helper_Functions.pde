
void loadQuestions(int lvl) {
  
  // Easy mode was chosen
  if (lvl == 1) {
    geoEasy = new Questions(loadStrings("Geography/Easy.txt"));
  }
  
  // Moderate mode was chosen
  else if (lvl == 2) {
    geoMedium = new Questions(loadStrings("Geography/Moderate.txt"));
  }
  
  else {
    geoHard = new Questions(loadStrings("Geography/Hard.txt"));
    
  }
  
  
  
}
