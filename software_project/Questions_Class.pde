import java.util.*;

class Questions {
  String fullLine;
  String[] test;
  String[] optionsSplit;
  String[] fileName;
  String mode;
  
  Questions(String[] fileStrings, String m) {
    this.fullLine = fileStrings[round( random( fileStrings.length-1 ))]; // Loads one line from the full file
    this.fileName = fileStrings;
    this.optionsSplit = this.fullLine.split("#");
    this.mode = m;
  }
  
  
  String getAnswer() {
    String answers = optionsSplit[1];
    String[] finalOptions = answers.split(", ");
    
    return finalOptions[0];
  }
  
  
  String getQuestion() {
    String question = optionsSplit[0];
    
    return question;
  }
  
  String nextQuestion(int questionNum, ArrayList<String> selection) {
    
    // The user chose the "test" mode
    if (this.mode.equals("Test") ) { 
      
      // Loads and seperates the relevant question from the full file
      this.fullLine = this.fileName[questionNum]; 
      this.optionsSplit = this.fullLine.split("#");
      
      // The last question was reached
      if (questionNum == (this.fileName.length)-1) {
        return "finished";
      } 
      
      // There are still unasked questions
      else {
        question = this.optionsSplit[0];
      }
      
      return question;
    }
    
    // Random mode was chosen
    else if (this.mode.equals("Random") ) { 
 
      // Loads and seperates a random question from the full file
      this.fullLine = this.fileName[int( random( this.fileName.length-1 ))]; 
      this.optionsSplit = this.fullLine.split("#");
      
      // Deletes the randomly selectedelement to prevent reselection
      this.fileName = deleteElemInArray(this.fileName, this.fullLine); 
      
      // If all elements have been cycled through, display the end screen
      if (this.fileName.length == 0) {
        return "finished"; 
      }
      
      // Otherwise, display the question
      else {
        return question; 
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
  
  
  String[] randomizeSelection( int numQuestions) { 
    String selection = optionsSplit[1];
    String[] selectionLst = selection.split(", ");
    String[] choices;
    
    choices = Arrays.copyOfRange(selectionLst, 1, 4);
 
    return choices;
  }
}
