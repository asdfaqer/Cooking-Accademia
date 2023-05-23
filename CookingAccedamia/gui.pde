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
public void recipe_complete(){
  background(0);
  task_recipe_completion.setText("RECIPE COMPLETED");
}
public void task_complete(){
  background(0);
  task_recipe_completion.setText("TASK COMPLETED");
  frame = 0;
}

synchronized public void recipe_Window(PApplet appc, GWinData data) { //_CODE_:recipe:431125:
  appc.background(230);
}
synchronized public void win_draw4(PApplet appc, GWinData data) { //_CODE_:window1:431125:
  fill(0);
  square(100,100,100);
  appc.background(230);
} //_CODE_:recipe:431125:

//_CODE_:Music:895587:
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
ArrayList <Integer> quantities_values = new ArrayList<Integer>();
ArrayList <String> grams = new ArrayList<String>(Arrays.asList("Salt","Pepper","Flour","Sugar","Vanilla extract"));
ArrayList <String> no_units = new ArrayList<String>(Arrays.asList("Sausages", "Eggs"));
ArrayList <String> mili_letres = new ArrayList<String>(Arrays.asList("Olive oil", "Vegetable oil"));

public void change_quantities(GCustomSlider source, GEvent event){
  int current_slider_location;
  Recipe.background(230);
  quantities_values.clear();
  for( int j = 0; j <= i; j++){
    if(grams.contains(ingredients_selected.get(j))){
      current_slider_location = ingredient_quantities.get(j).getValueI();
      ingredient_quantities.get(j).setLimits(current_slider_location,0,500);
      quantities_values.add(ingredient_quantities.get(j).getValueI());
      quantities_label.get(j).setText(quantities_values.get(j) + " g");
    }
    else if(no_units.contains(ingredients_selected.get(j))){
      current_slider_location = ingredient_quantities.get(j).getValueI();
      if(current_slider_location > 12){
        current_slider_location = current_slider_location / 42;// rescale the slider
      }
      ingredient_quantities.get(j).setLimits(current_slider_location,0,12);
      quantities_values.add(ingredient_quantities.get(j).getValueI());
      quantities_label.get(j).setText(str(quantities_values.get(j)));
    }
    else if(mili_letres.contains(ingredients_selected.get(j))){
      current_slider_location = ingredient_quantities.get(j).getValueI();
      ingredient_quantities.get(j).setLimits(current_slider_location,0,500);
      quantities_values.add(ingredient_quantities.get(j).getValueI());
      quantities_label.get(j).setText(quantities_values.get(j) + " mL");
    }
  }
  println(quantities_values);
}

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:254614:
  i++;
  Recipe.background(230);
  dropLists.add(new GDropList(Recipe, 29, 60+ 40*i, 90, 80, 3, 15));
  dropLists.get(i).setItems(loadStrings("list_374668"), 0);
  dropLists.get(i).addEventHandler(this, "dropList1_click1");
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
  quantities_label.add(new GLabel(Recipe, 120, 40 + 40 * i, 100, 50));
  quantities_label.get(i).setText("N/A");
  ingredient_quantities.add(new GCustomSlider(Recipe, 120, 60 + 40*i, 100, 40, "grey_blue"));
  ingredient_quantities.get(i).setLimits(0.0, 0.0, 500.0);
  ingredient_quantities.get(i).setNumberFormat(G4P.DECIMAL, 2);
  ingredient_quantities.get(i).setOpaque(false);
  ingredient_quantities.get(i).addEventHandler(this, "change_quantities");
} //_CODE_:button1:254614:
String text_selected;

public void possible_recipes(GDropList source, GEvent event){
  text_selected = source.getSelectedText();
  for(Recipe r: recipes){
      if( r.label.equals(text_selected)){
        cur_recipe = r;
        break;
      }
  }
  recipe_selected.setText("selected recipe" + text_selected);
  Recipe.background(230);
  Recipe.image(cur_recipe.image,300,0,width/3,height/3);
  instructions.clear();
}

Recipe cur_recipe;
public void simulate_recipe(GButton source, GEvent event){
  possible_recipes(recipe_options, event);
  step_num = 1;
  String [] instructions_array = loadStrings(text_selected + ".txt");
  for(int i = 0; i<instructions_array.length; i ++){
    instructions.add(instructions_array[i]);
  }
  // find the current recipe
  //update used ingredients 
  used_ingredients = new ArrayList<Recipe>( cur_recipe.using_ingredients() );
  println(cur_recipe.using_ingredients().get(0).label);
}

ArrayList<Recipe> valid_recipes = new ArrayList<Recipe>();
public void generating_recipes(GButton source, GEvent event){
  Recipe.background(230);
  boolean recipe_found = false;
  if(ingredients_selected.contains("Select Ingredients")){
    recipe_selected.setText("sorry, but you need to finish your selection");
    return;
  }
  //find valid recipes

  for(Recipe r : recipes){
    if(r.criteria_meet()){
      valid_recipes.add(r);
      recipe_found = true;
    }
  }
  //finds the best match
  float max_value = 0;
  float cur_value;
  Recipe top_recipe = valid_recipes.get(0);//closest match to desired recipe
  recipe_selected.setText("Recipe recommended" + top_recipe.label);
  recipe_options.setAlpha(255);
  simulate_recipe.setAlpha(255);
  
  for(Recipe r : valid_recipes){
    cur_value = r.closeness_to_ingredients_in_possession();
    recipe_options.addItem(r.label);
    if(max_value < cur_value){
      max_value = cur_value;
      top_recipe = r;
    }
  }
  //displays the top recipe
  Recipe.image(top_recipe.image,300,0,width/3,height/3);
  recipe_options.removeItem(0);
  recipe_options.setSelected(valid_recipes.indexOf(top_recipe));
  if(!recipe_found){
    recipe_selected.setText("sorry, but there are no matchs found");
    return;
  }
}
GDropList recipe_options;
// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Main window");
  
  //recipe generater window
  
  Recipe = GWindow.getWindow(this, "Recipe", 800, 200, 800, 400, JAVA2D);
  Recipe.noLoop();
  Recipe.setActionOnClose(G4P.KEEP_OPEN);
  Recipe.addDrawHandler(this, "Recipe_Window");
  recipe_options = new GDropList(Recipe, 600, 60, 90, 80, 3, 15);
  recipe_options.setItems(loadStrings("possible_recipes"), 0);
  recipe_options.addEventHandler(this, "possible_recipes");
  recipe_options.addItem("select recipe");
  recipe_options.setAlpha(0);
  simulate_recipe = new GButton(Recipe, 600, 160, 80, 30, "simulate recipe");
  simulate_recipe.addEventHandler(this, "simulate_recipe");
  simulate_recipe.setAlpha(0);
  dropLists.add(new GDropList(Recipe, 29, 60, 90, 80, 3, 20));
  dropLists.get(0).setItems(loadStrings("list_374668"), 0);
  dropLists.get(0).addEventHandler(this, "dropList1_click1");
  add_ingredient = new GButton(Recipe, 190, 300, 80, 30);
  add_ingredient.setText("add ingerdient");
  add_ingredient.addEventHandler(this, "button1_click1");
  generate_recipes = new GButton(Recipe, 500, 300, 80, 30);
  generate_recipes.setText("generate recipes");
  generate_recipes.addEventHandler(this, "generating_recipes");
  ingredient_quantities.add(new GCustomSlider(Recipe, 120, 60, 100, 40, "grey_blue"));
  ingredient_quantities.get(0).setLimits(0.0, 0.0, 500.0);
  ingredient_quantities.get(0).setNumberFormat(G4P.DECIMAL, 2);
  ingredient_quantities.get(0).setOpaque(false);
  ingredient_quantities.get(0).addEventHandler(this, "change_quantities");
  quantities_label.add(new GLabel(Recipe, 120, 40, 100, 50, "N/A"));
  recipe_selected = new GLabel(Recipe, 126, 222, 300, 100);
  recipe_selected.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  recipe_selected.setOpaque(false);
  label2 = new GLabel(Recipe, 27, 35, 300, 20);
  label2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  label2.setText("I n g r e d i e n t s   i n  p o s s e s s i o n :");
  label2.setOpaque(false);
  
  //Music window
  
  Music = GWindow.getWindow(this, "Music", 0, 200, 300, 300, JAVA2D);
  Music.noLoop();
  Music.setActionOnClose(G4P.KEEP_OPEN);
  Music.addDrawHandler(this, "Music_Window");
  
  play_button_music = new GButton(Music, 50, 240, 80, 30);
  play_button_music.setText("play");
  play_button_music.addEventHandler(this, "play_music");
  pause_button_music = new GButton(Music, 175, 240, 80, 30);
  pause_button_music.setText("pause");
  pause_button_music.addEventHandler(this, "pause_music");
  volume = new GCustomSlider(Music, 110, 215, 80, 30);
  
  volume.setLimits(0.5, 0.0, 1.0);
  volume.setNumberFormat(G4P.DECIMAL, 2);
  volume.setOpaque(false);
  volume.addEventHandler(this,"change_volume");
  
  volume_label = new GLabel(Music, 128, 199, 60, 40);
  //volume_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  volume_label.setText("Volume");
  volume_label.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  volume_label.setOpaque(false);
  
  Recipe.loop();
  Music.loop();
}

// Variable declarations 
// autogenerated do not edit
GButton simulate_recipe;
GLabel recipe_selected;
GKnob Temp; 
GButton play_button_music;
GButton pause_button_music;
GCustomSlider volume;
GLabel ovenstemp; 
GKnob time; 
GLabel timelabel; 
GWindow Recipe;
ArrayList<GDropList> dropLists = new ArrayList<GDropList>();
ArrayList<GCustomSlider> ingredient_quantities = new ArrayList<GCustomSlider>();
ArrayList<GLabel> quantities_label = new ArrayList<GLabel>();
GCustomSlider oventemp; 
GLabel Ovenslabel; 
GWindow Music;
GButton add_ingredient;
GButton generate_recipes;
GLabel volume_label;
GLabel label2;
