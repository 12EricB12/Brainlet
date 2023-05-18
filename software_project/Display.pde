void displayMainMenu() {
  
  // Set the name of the window to "start"
  windowName = "start";
  window1.setVisible(false);
  
}

void displayScreen() {
  
  // Displays the title of the program
  if (windowName == "start") {
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("Welcome to \n Brainlet", width/2, 100);
  }
  
  // Start button was clicked
  else if (windowName == "begin") {
   
    // Formatting
    textSize(20);
    textAlign(LEFT);

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
