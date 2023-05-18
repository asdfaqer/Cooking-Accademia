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
int i = 0;
int step_num = 0;
 //_CODE_:time:476537:
void receipe_complete(){
  background(0);
  task_receipe_completion.setText("RECEIPE COMPLETED");
}
void task_complete(){
  background(0);
  task_receipe_completion.setText("TASK COMPLETED");
}
synchronized public void Receipe_Window(PApplet appc, GWinData data) { //_CODE_:Receipe:431125:
  appc.background(230);
} //_CODE_:Receipe:431125:

synchronized public void Music_Window(PApplet appc, GWinData data) { //_CODE_:Music:895587:
  appc.background(230);
  appc.image(songImage, 250, 0);
} //_CODE_:Music:895587:

ArrayList<String> ingredients_selected = new ArrayList<String>();
public void dropList1_click1(GDropList source, GEvent event) { //_CODE_:dropList1:693695:
  if (ingredients_selected.contains(source.getSelectedText())){
    println("ingredient already selected");
  }
  ingredients_selected.clear();
  for( int j = 0; j <= i; j++){
    ingredients_selected.add(dropLists.get(j).getSelectedText());
  }
  println(ingredients_selected);
  println("dropList1 - GDropList >> GEvent." + event + " @ " + millis());

} //_CODE_:dropList1:693695:
ArrayList<Float> quantities_values = new ArrayList<Float>();

public void change_quantities(GCustomSlider source, GEvent event){
  quantities_values.clear();
  for( int j = 0; j <= i; j++){
    quantities_values.add(ingredient_quantities.get(j).getValueF());
  }
  println(quantities_values);
}

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:254614:
  i++;
  dropLists.add(new GDropList(Receipe, 29, 60+ 40*i, 90, 80, 3, 10));
  dropLists.get(i).setItems(loadStrings("list_374668"), 0);
  dropLists.get(i).addEventHandler(this, "dropList1_click1");
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
  
  ingredient_quantities.add(new GCustomSlider(Receipe, 120, 60 + 40*i, 100, 40, "grey_blue"));
  ingredient_quantities.get(i).setLimits(0.0, 10.0, 100.0);
  ingredient_quantities.get(i).setNumberFormat(G4P.DECIMAL, 2);
  ingredient_quantities.get(i).setOpaque(false);
  ingredient_quantities.get(i).addEventHandler(this, "change_quantities");
} //_CODE_:button1:254614:

public void generating_receipes(GButton source, GEvent event){
  if(ingredients_selected.contains("Select Ingredients")){
    receipe_selected.setText("sorry, but you need to finish your selection");
    return;
  }
  if(cooked_sausages.criteria_meet()){
    receipe_selected.setText("Generated reciepe: sausages");
    String[] instruction_list = loadStrings("Receipe.txt");
    for(int i = 0; i < instruction_list.length; i++){
    instructions.add(instruction_list[i]);
    }
    step_num = 1;
  }
  else{
    receipe_selected.setText("sorry, but there are no matchs found");
    return;
  }
}

// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Main window");
  
  //recipe generater window
  
  Receipe = GWindow.getWindow(this, "Receipe", 800, 200, 800, 400, JAVA2D);
  Receipe.noLoop();
  Receipe.setActionOnClose(G4P.KEEP_OPEN);
  Receipe.addDrawHandler(this, "Receipe_Window");
  dropLists.add(new GDropList(Receipe, 29, 60, 90, 80, 3, 10));
  dropLists.get(0).setItems(loadStrings("list_374668"), 0);
  dropLists.get(0).addEventHandler(this, "dropList1_click1");
  add_ingredient = new GButton(Receipe, 190, 300, 80, 30);
  add_ingredient.setText("add ingerdient");
  add_ingredient.addEventHandler(this, "button1_click1");
  generate_receipes = new GButton(Receipe, 500, 300, 80, 30);
  generate_receipes.setText("generate receipes");
  generate_receipes.addEventHandler(this, "generating_receipes");
  ingredient_quantities.add(new GCustomSlider(Receipe, 120, 60, 100, 40, "grey_blue"));
  ingredient_quantities.get(0).setLimits(0.0, 10.0, 100.0);
  ingredient_quantities.get(0).setNumberFormat(G4P.DECIMAL, 2);
  ingredient_quantities.get(0).setOpaque(false);
  ingredient_quantities.get(0).addEventHandler(this, "change_quantities");
  receipe_selected = new GLabel(Receipe, 126, 222, 300, 100);
  receipe_selected.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  receipe_selected.setOpaque(false);
  
  //Music window
  
  Music = GWindow.getWindow(this, "Music", 0, 200, 800, 400, JAVA2D);
  Music.noLoop();
  Music.setActionOnClose(G4P.KEEP_OPEN);
  Music.addDrawHandler(this, "Music_Window");
  
  play_button_music = new GButton(Music, 0, 0, 80, 30);
  play_button_music.setText("play");
  play_button_music.addEventHandler(this, "play_music");
  pause_button_music = new GButton(Music, 100, 0, 80, 30);
  pause_button_music.setText("pause");
  pause_button_music.addEventHandler(this, "pause_music");
  volume = new GCustomSlider(Music, 0, 60, 80, 30);
  
  volume.setLimits(0.5, 0.0, 1.0);
  volume.setNumberFormat(G4P.DECIMAL, 2);
  volume.setOpaque(false);
  volume.addEventHandler(this,"change_volume");
  
  Receipe.loop();
  Music.loop();
}

// Variable declarations 
// autogenerated do not edit
GLabel receipe_selected;
GKnob Temp; 
GButton play_button_music;
GButton pause_button_music;
GCustomSlider volume;
GLabel ovenstemp; 
GKnob time; 
GLabel timelabel; 
GWindow Receipe;
ArrayList<GDropList> dropLists = new ArrayList<GDropList>();
ArrayList<GCustomSlider> ingredient_quantities = new ArrayList<GCustomSlider>();
GCustomSlider oventemp; 
GLabel Ovenslabel; 
GWindow Music;
GButton add_ingredient;
GButton generate_receipes;
