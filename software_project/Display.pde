void displayMainMenu() {
  
  // Set the name of the window to "start"
  windowName = "start";
  window1.setVisible(false);
  
}

void displayScreen() {
  
  // Displays the title of the program
  if (windowName == "start") {
    fill(255);
    textSize(40);
    textAlign(CENTER);
    mainMenu.resize(800, 500);
    background(mainMenu);
    text("Welcome to Brainlet", width/2, 225);
  }
  
  // Start button was clicked
  else if (windowName == "begin") {
   
    // Text Formatting
    textSize(20);
    textAlign(LEFT);
    
    // Image Formatting
    questionScreen.resize(800, 500);
    background(questionScreen);
    
    loadQuestions();
    showText();

    noLoop();
  } 
  
  else if (windowName == "end") {
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("You passed!", width/2, 100);
  }
  
}
