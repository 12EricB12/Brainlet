import java.util.Collections;

void txtLoad() {
  geoEasyQ = loadStrings("Geography/Easy.txt");
  geoMediumQ = loadStrings("Geography/Moderate.txt");
  geoHardQ = loadStrings("Geography/Hard.txt");
  geoEasy = new Questions(geoEasyQ, mode);
  geoMedium = new Questions(geoMediumQ, mode);
  geoHard = new Questions(geoHardQ, mode);
  println(subSelected);
  if (subSelected == "Geography") {
    println("geo");
  } else if (subSelected == "Biology") {
    print("Bio");
    //geoEasyQ = loadStrings("Biology/Easy.txt");
    //geoMediumQ = loadStrings("Biology/Moderate.txt");
    ////geoHardQ = loadStrings("Biology/Hard.txt");
    //geoEasy = new Questions(geoEasyQ, mode);
    //geoMedium = new Questions(geoMediumQ, mode);
    //geoHard = new Questions(geoHardQ, mode);
  }
}

void displayStart() {

  windowName = "start";
  window1.setVisible(false);
  txtLoad();
}

void loadQuestions() {

  // Easy mode was chosen
  if (lvl <= 1) { 
    geoQ = geoEasy;
  } 

  // Moderate mode was chosen
  else if (lvl == 2) {
    geoQ = geoMedium;
  }

  // Hard mode was chosen
  else if (lvl == 3) {
    geoQ = geoHard;
  }

  // Gets the questions and answers from the text file
  answer = geoQ.getAnswer(); // Generates the answer to the problem, always the first option (answer shuffle will be added later)
  question = geoQ.getQuestion(); 
  options = geoQ.randomizeSelection(4); // Generates the options that the user can pick from

  splitQuestion = question.split("");
}


void showText() {

  // Initial y-value of answer
  int yVal = 300;

  // Creates the question on screen
  question = String.join("", splitQuestion);
  text(question, 40, 100, 700, 700);

  // Font size for the answer
  textSize(answerSize); 
  text("1. " + answer, 40, yVal - answerSize);

  // Outputs the remaining options
  for (int i = 0; i < options.length; i++) {

    //  Font size and line spacing
    textSize(answerSize); 
    textLeading(10);

    // Creates the remaining options
    text(String.valueOf(i + 2) + ". " + options[i], 40, yVal);

    // Sets the new text y-value
    yVal += answerSize;
  }


  // Create a new font for the labels
  //myFont = createFont("Arial Bold", 20);
  //textFont(myFont);

  text("Question:", 40, 90);
  text("Possible Answers:", 40, 250);
}

void nextQuestion() {

  question = geoQ.nextQuestion(current, pastQuestions);
  answer = geoQ.getAnswer();
  options = geoQ.randomizeSelection(4);
  splitQuestion = question.split("");

  if (question.equals( "finished")) {
    windowName = "End";
  }

  if (mode.equals( "Test")) {
    current++;
  } else if (mode == "Endless") {
    pastQuestions = rotateArrayList(pastQuestions, question, aggressiveness);
  }

  pastQuestions.add(question);
}

ArrayList<String> rotateArrayList(ArrayList<String> arrayLst, String currentQ, int agressive) {
  ArrayList<String> newArrayLst = arrayLst;
  String pastValue;
  if (arrayLst.size() < agressive) {
    newArrayLst.add(currentQ); // If the arrayList is not big enough to be rotated yet, the current question will simply be added.
  } else {
    for (int i = 0; i < arrayLst.size()-1; i++) {
      if (i == 0) {
        pastValue = arrayLst.get(i);
        newArrayLst.set(i, currentQ);
      } else {
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
