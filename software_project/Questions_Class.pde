import java.util.*;

class Questions {
  String fullLine;
  String[] test;
  String[] optionsSplit;
  String[] fileName;
  String mode;
  
  Questions(String[] fileStrings, String m) {
    if (!m.equals("Test")) {
      this.fullLine = fileStrings[round( random( fileStrings.length-1 ))]; // Loads one line from the full file
    }
    
    else {
      this.fullLine = fileStrings[0]; // Loads the first line from the file
    }
    
    this.fileName = fileStrings;
    this.optionsSplit = this.fullLine.split("#");
    this.mode = m;
  }
  
  
  String getAnswer() {
    
    // Takes the second part of the full line
    String answers = optionsSplit[1]; 
    String[] finalOptions = answers.split(", ");
    
    return finalOptions[0];
  }
  
  
  String getQuestion() {
    // Takes the first part of the full line, which is the question
    String question = optionsSplit[0]; 
    
    return question;
  }
  
  String nextQuestion(int questionNum, ArrayList<String> selection) {
    
    // The user chose the "test" mode
    if (this.mode.equals("Test")) {
      
      // The last question was reached
      if (questionNum == this.fileName.length) {
        checkAnswer();
        return "finished";
      } 
      
      // There are still unasked questions
      else {

        // Loads and seperates the relevant question from the full file
        this.fullLine = this.fileName[questionNum]; 
        this.optionsSplit = this.fullLine.split("#");
        question = this.optionsSplit[0];
        
        return question;
      }
    } 
    
    // Random mode was selected
    else if (this.mode.equals("Random")) { 
      
      // All the questions have not been asked yet
      try {
        
        // Loads and seperates a random question from the full file
        this.fullLine = this.fileName[int( random( this.fileName.length-1 ))]; 
        this.optionsSplit = this.fullLine.split("#");
        question = this.optionsSplit[0];
        
        // Deletes the element that was randomly selected to prevent it from being reselected
        this.fileName = deleteElemInArray(this.fileName, this.fullLine); 
        return question; 
      }
      
      // Every question has been asked
      catch (ArrayIndexOutOfBoundsException e) {
        return "finished";
      }
    }
    
    // User chose the endless mode
    else { 
       
      for (int i = 0; i < selection.size(); i++) {
        
        while (this.fullLine.contains(selection.get(i))) {
          
          // Try again if already present in the list of previous responses
          this.fullLine = this.fileName[round( random( this.fileName.length-1 ))]; 
        }
      }
      
      this.optionsSplit = this.fullLine.split("#");
      question = this.optionsSplit[0];
      
      return question;
    }
  }
  
  // Randomizes the answers
  String[] randomizeSelection() { 
    String selection = optionsSplit[1];
    
    // Splits the answers wherever there is a comma
    String[] selectionLst = selection.split(", "); 
    String[] choices;
    
    choices = Arrays.copyOfRange(selectionLst, 1, 4);
 
    return choices;
  }
}
