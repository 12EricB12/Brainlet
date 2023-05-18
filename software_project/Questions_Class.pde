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
    if (this.mode.equals("Test")) { 
      String question;
      
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
    else if (this.mode.equals("Random")) { 
      
      // Loads and seperates a random question from the full file
      this.fullLine = this.fileName[int( random( this.fileName.length-1 ))]; 
      this.optionsSplit = this.fullLine.split("#");
      
      String question = this.optionsSplit[0];
      
      // Deletes the element that was randomly selected to prevent it from being reselected
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
      
      // Loads a question from the full file
      this.fullLine = this.fileName[round( random( this.fileName.length-1 ))];
      
      for (int i = 0; i < selection.size(); i++) {
        
        while (this.fullLine.contains(selection.get(i))) {
          // Try again if already present in the list of previous responses
          this.fullLine = this.fileName[round( random( this.fileName.length-1 ))]; 
        }
      }
      
      this.optionsSplit = this.fullLine.split("#");
      
      String question = this.optionsSplit[0];
      return question;
    }
  }
  
  
  String[] randomizeSelection(int numQuestions) { // For now, the numQuestions parameter will be set at 4. If we have extra time and can add more question slots, you can increase this parameter.
    String selection = optionsSplit[1];
    String[] selectionLst = selection.split(", ");
    String[] choices;
    
    if (numQuestions < 4) {
      choices = Arrays.copyOfRange(selectionLst, 1, numQuestions);
    }
    
    else if (numQuestions == 4) {
      choices = Arrays.copyOfRange(selectionLst, 1, 4);
    }
    
    else {
      ArrayList<String> options = new ArrayList<String>();
      choices = Arrays.copyOfRange(selectionLst, 1, 4);
      
      // First loop for adding the original questions
      for (int i = 0; i < 3; i++) {
        options.add(choices[i]); 
      }
      
      for (int i = 0; i < numQuestions - 4; i++) {
        // Loads one line from the full file
        this.fullLine = this.fileName[round( random( this.fileName.length-1 ))]; 
        
        // Splits the line
        this.optionsSplit = this.fullLine.split("#"); 
        
        // Take the answer and split them
        String[] fullOptionSplit = this.optionsSplit[1].split(", "); 
        
        // Randomly selects an answer from a different question to use as an option. Only to be used in more than 4 options.
        String optionRandom = fullOptionSplit[round(random(this.optionsSplit.length-1))]; 
        int tries = 0; // Used to make sure that the program doesn't try to grab a new element too many times. Prevents the program from running slowly
        
        // Ensures that the randomly grabbed element doesn't appear again, if already present in the options array
        if (options.contains(optionRandom) || optionRandom.equals(answer)) { 
          
          while (tries <= 5 && options.contains(optionRandom) || tries <= 5 && optionRandom.equals(answer)) {            
            fullOptionSplit = this.optionsSplit[1].split(", ");
            optionRandom = fullOptionSplit[round(random(this.optionsSplit.length-1))];
            tries++;
          }
        }
        
        options.add(optionRandom); 
      }
      
      // Converts the arrayList to array
      choices = options.toArray(new String[options.size()]);  
    }
    
    return choices;
  }
}
