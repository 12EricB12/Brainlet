/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:354979:
  appc.background(230);
} //_CODE_:window1:354979:

public void ChangeDiffLevel(GCustomSlider source, GEvent event) { //_CODE_:diffLevel:790496:
  println("diffLevel - GCustomSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:diffLevel:790496:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:408766:
  println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield1:408766:

public void textfield2_change1(GTextField source, GEvent event) { //_CODE_:textfield2:502570:
  println("textfield2 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield2:502570:

public void textfield3_change1(GTextField source, GEvent event) { //_CODE_:textfield3:598536:
  println("textfield3 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield3:598536:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 300, 500, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  diffLevel = new GCustomSlider(window1, 62, 61, 100, 40, "grey_blue");
  diffLevel.setLimits(1, 1, 3);
  diffLevel.setNbrTicks(3);
  diffLevel.setStickToTicks(true);
  diffLevel.setNumberFormat(G4P.INTEGER, 0);
  diffLevel.setOpaque(false);
  diffLevel.addEventHandler(this, "ChangeDiffLevel");
  textfield1 = new GTextField(window1, 36, 30, 39, 14, G4P.SCROLLBARS_NONE);
  textfield1.setText("Easy");
  textfield1.setPromptText("Easy");
  textfield1.setOpaque(false);
  textfield1.addEventHandler(this, "textfield1_change1");
  textfield2 = new GTextField(window1, 84, 30, 60, 15, G4P.SCROLLBARS_NONE);
  textfield2.setText("Moderate");
  textfield2.setPromptText("Moderate");
  textfield2.setOpaque(true);
  textfield2.addEventHandler(this, "textfield2_change1");
  textfield3 = new GTextField(window1, 150, 30, 42, 18, G4P.SCROLLBARS_NONE);
  textfield3.setText("Hard");
  textfield3.setPromptText("Hard");
  textfield3.setOpaque(false);
  textfield3.addEventHandler(this, "textfield3_change1");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GCustomSlider diffLevel; 
GTextField textfield1; 
GTextField textfield2; 
GTextField textfield3; 
