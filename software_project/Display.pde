void mainMenu() {
  
  // Set the window name to "start" and hide GUI window
  windowName = "start";
  window1.setVisible(false);
}


void displayScreen() {
  
  // Displays the starting screen
  if (windowName == "start") {
    
    // Text formatting
    fill(255);
    textSize(50);
    textAlign(CENTER);
    
    // Image formatting 
    mainMenu.resize(800, 500);
    background(mainMenu);
    text("Welcome to Brainlet", width/2, 225);
  }
  
  // Start button was clicked
  else if (windowName == "begin") {
   
    // Text formatting
    textSize(20);
    textAlign(LEFT);
    
    // Image formatting
    questionScreen.resize(800, 500);
    background(questionScreen);
    
    loadQuestions();
    showText();
    noLoop();
  } 
  
  // Ending screen
  else if (windowName == "end") {
    
    // Text formatting
    textSize(50);
    textAlign(CENTER);
    
    // Image formatting
    endingScreen.resize(800, 500);
    background(endingScreen);
    text("You passed!", width/2, 250);
    
    println(attempts);
  }
}
