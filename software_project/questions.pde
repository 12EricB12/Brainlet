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
  
  
  String nextQuestion(int pointer, ArrayList<String> selection) {
    
    // Note: This function will randomly shuffle through the selection. A non-shuffle approach can be added later if we have time.
    if (this.mode.equals("Test")) { // For top to bottom
      String question;
      this.fullLine = this.fileName[pointer]; // Loads one line from the full file
      this.optionsSplit = this.fullLine.split("#");
      
      if (pointer == (this.fileName.length)-1) {
        return "finished";
      } 
      else {
        question = this.optionsSplit[0];
      }
      
      return question;
    }
    else if (this.mode.equals("Random")) { // Randomly selects an element
      this.fullLine = this.fileName[int( random( this.fileName.length-1 ))]; // Loads one line from the full file
      this.optionsSplit = this.fullLine.split("#");
      
      String question = this.optionsSplit[0];
      this.fileName = deleteElemInArray(this.fileName, this.fullLine); // Deletes the element that was randomly selected to prevent it from being reselected
      
      if (this.fileName.length == 0) {
        return "finished"; // If all elements have been cycled through, show the end screen
      }
      else {
        return question; // Otherwise, show the question
      }
    }
    else { // Endless
      this.fullLine = this.fileName[round( random( this.fileName.length-1 ))]; // Loads one line from the full file
      
      for (int i = 0; i < selection.size(); i++) {
        while (this.fullLine.contains(selection.get(i))) {
          this.fullLine = this.fileName[round( random( this.fileName.length-1 ))]; // Try again if already present in the list of previous responses
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
