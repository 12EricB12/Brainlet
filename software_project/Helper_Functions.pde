Questions loadQuestions(int lvl) {
  
  // Easy mode was chosen
  if (lvl == 1) {
    Questions geoEasy = new Questions(loadStrings("Geography/Easy.txt"));
    return geoEasy;
  }
  
  // Moderate mode was chosen
  else if (lvl == 2) {
    Questions geoMedium = new Questions(loadStrings("Geography/Moderate.txt"));
    return geoMedium;
  }
  
  else {
    Questions geoHard = new Questions(loadStrings("Geography/Hard.txt"));
    return geoHard;
  }
}
