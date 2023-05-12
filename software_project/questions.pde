class Questions {
  String fullLine;
  ArrayList<String> options = new ArrayList<String>();
  
  Questions(String[] fileStrings) {
    this.fullLine = fileStrings[round(random(fileStrings.length))]; // Loads one line from the full file
  }
  
  String getAnswer() {
    String initalOptions = fullLine.split("#")[1];
    String[] finalOptions = initalOptions.split(", ");
    
    println(this.fullLine);
    return finalOptions[0];
  }
}
