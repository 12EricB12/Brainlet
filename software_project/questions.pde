class Questions {
  String fullLine;
  String[] test;
  String[] optionsSplit;
  ArrayList<String> options = new ArrayList<String>();
  
  Questions(String[] fileStrings) {
    this.fullLine = fileStrings[round(random(fileStrings.length))-1]; // Loads one line from the full file
    this.optionsSplit = this.fullLine.split("#");
  }
  
  String getAnswer() {
    String answers = optionsSplit[1];
    String[] finalOptions = answers.split(", ");
    
    println(this.fullLine);
    return finalOptions[0];
  }
  
  String getQuestion() {
    String question = optionsSplit[0];
    
    return question;
  }
}
