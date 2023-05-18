import java.util.Collections;


void subjectSelected() {
  
  // Geography was selected
  if (subSelected.equals( "Geography" )) {
    easyFile = loadStrings("Geography/Easy.txt");
    moderateFile = loadStrings("Geography/Moderate.txt");
    hardFile = loadStrings("Geography/Hard.txt");   
  } 
  
  // Biology was selected
  else if (subSelected.equals( "Biology" )) {
    easyFile = loadStrings("Biology/Easy.txt");
    moderateFile = loadStrings("Biology/Moderate.txt");
    hardFile = loadStrings("Biology/Hard.txt");
  }
  
  easyQ = new Questions(easyFile, mode);
  moderateQ = new Questions(moderateFile, mode);
  hardQ = new Questions(hardFile, mode);
}


void loadQuestions() {

  // Easy mode was chosen
  if (lvl <= 1) { 
    questionSet = easyQ;
  } 

  // Moderate mode was chosen
  else if (lvl == 2) {
    questionSet = moderateQ;
  }

  // Hard mode was chosen
  else if (lvl == 3) {
    questionSet = hardQ;
  }

  // Gets the questions and answers from the text file
  answer = questionSet.getAnswer(); 
  question = questionSet.getQuestion(); 
  options = questionSet.randomizeSelection(4); // Generates the options that the user can pick from

  splitQuestion = question.split("");
}


void showText() {

  // Initial y-value of answer
  int yVal = 300;

  // Creates the question on screen
  question = String.join("", splitQuestion);
  text(question, 40, 100, 700, 700);

  // FOR THE ANSWER
  textSize(answerSize); 
  
  // Add the answer to the array
  optionsArray.add(answer);
  
  for (int i = 0; i < options.length; i++) {
    
    // Add the remaining options to the array
    optionsArray.add(options[i]);
  }
  
  // Shuffles the options, and locates the correct answer
  Collections.shuffle(optionsArray);
  answerLocation = optionsArray.indexOf(answer);
  
  // Outputs the remaining options
  for (int i = 0; i < optionsArray.size(); i++) {
    
    textSize(answerSize); 

    // Creates the remaining options
    text(String.valueOf(i + 1) + ". " + optionsArray.get(i), 40, yVal);

    // Sets the new text y-value
    yVal += answerSize;
  }

  // Create a new font for the labels
  //myFont = createFont("Arial Bold", 20);
  //textFont(myFont);
  
  // Empty the array
  optionsArray.clear();

  // Labels
  text("Question:", 40, 90);
  text("Possible Answers:", 40, 260);
}

void nextQuestion() {

  question = questionSet.nextQuestion(current, pastQuestions);
  answer = questionSet.getAnswer();
  options = questionSet.randomizeSelection(4);
  splitQuestion = question.split("");

  if (question.equals( "finished")) {
    windowName = "end";
  }

  if (mode.equals( "Test")) {
    current++;
  } 
  
  else if (mode == "Endless") {
    pastQuestions = rotateArrayList(pastQuestions, question, randomness);
  }

  pastQuestions.add(question);
}

void checkAnswer() {

  // The user has one try to guess answer
  //if (numOfTries == 1) {
  
    // The first answer was correct
    if (answerLocation == 0) {
      answer1.setLocalColorScheme(GCScheme.GREEN_SCHEME);
      answer2.setLocalColorScheme(GCScheme.RED_SCHEME);
      answer3.setLocalColorScheme(GCScheme.RED_SCHEME);
      answer4.setLocalColorScheme(GCScheme.RED_SCHEME);
    }
    
    // Answer was the second option
    if (answerLocation == 1){
      answer1.setLocalColorScheme(GCScheme.RED_SCHEME);
      answer2.setLocalColorScheme(GCScheme.GREEN_SCHEME);
      answer3.setLocalColorScheme(GCScheme.RED_SCHEME);
      answer4.setLocalColorScheme(GCScheme.RED_SCHEME);
    }
    
    // Answer was the third option
    if (answerLocation == 2) {
      answer1.setLocalColorScheme(GCScheme.RED_SCHEME);
      answer2.setLocalColorScheme(GCScheme.RED_SCHEME);
      answer3.setLocalColorScheme(GCScheme.GREEN_SCHEME);
      answer4.setLocalColorScheme(GCScheme.RED_SCHEME);
   }
   
    // Answer was the fourth option
    if (answerLocation == 3) {
      answer1.setLocalColorScheme(GCScheme.RED_SCHEME);
      answer2.setLocalColorScheme(GCScheme.RED_SCHEME);
      answer3.setLocalColorScheme(GCScheme.RED_SCHEME);
      answer4.setLocalColorScheme(GCScheme.GREEN_SCHEME);
    }
    
    current++;
  //}

}

ArrayList<String> rotateArrayList(ArrayList<String> arrayLst, String currentQ, int randomLvl) {
  ArrayList<String> newArrayLst = arrayLst;
  String pastValue;
  
  // If the arrayList is not big enough to be rotated yet, the current question will simply be added.
  if (arrayLst.size() < randomLvl) {
    newArrayLst.add(currentQ); 
  } 
  
  else {
    for (int i = 0; i < arrayLst.size()-1; i++) {
      
      if (i == 0) {
        pastValue = arrayLst.get(i);
        newArrayLst.set(i, currentQ);
      } 
      
      else {
        pastValue = arrayLst.get(i);
        newArrayLst.set(i, pastValue);
      }
    }
  }
  return newArrayLst;
  
}

String[] deleteElemInArray(String[] pastArray, String elem) {
  ArrayList<String> newArray = new ArrayList<String>();

  for (int i = 0; i < pastArray.length; i++) {
    if (!pastArray[i].equals(elem)) {
      newArray.add(pastArray[i]);
    }
  }

  String[] newArr = newArray.toArray(new String[newArray.size()]);
  return newArr;
}
