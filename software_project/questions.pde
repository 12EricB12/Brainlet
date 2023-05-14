import java.util.*;

class Questions {
  String fullLine;
  String[] test;
  String[] optionsSplit;
  String[] fileName;
  
  Questions(String[] fileStrings) {
    this.fullLine = fileStrings[round( random( fileStrings.length-1 ))]; // Loads one line from the full file
    this.fileName = fileStrings;
    this.optionsSplit = this.fullLine.split("#");
  }
  
  void randomizeNext() {
    this.fullLine = this.fileName[round( random( this.fileName.length-1 ))]; // Refreshes the question and forces it to move on
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
  
  // FIX
  String nextQuestion() {
    // Note: This function will randomly shuffle through the selection. A non-shuffle approach can be added later if we have time.
    this.fullLine = this.fileName[round( random( this.fileName.length-1 ))]; // Loads one line from the full file
    this.optionsSplit = this.fullLine.split("#");
    
    String question = this.optionsSplit[0];
    return question;
    // OLD CODE
    //for (int i = 0; i < optionsSplit.length; i++) {
      
    //  String nextRow = this.fileName[i];
    //  println(nextRow);
      
    //  String[] nextQuestion = nextRow.split("");
      
    //  question = nextQuestion[0];
      
    //  question = String.join("", nextQuestion);
    //}
    
    //return question;
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
