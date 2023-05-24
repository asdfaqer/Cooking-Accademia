public void set_ingredients_cooked_sausages(GButton source, GEvent event){
  quantities_values.clear();
  dropLists.get(0).setSelected(7);
  ingredient_quantities.get(0).setLimits(3.0,0.0,12.0);
  quantities_values.add(ingredient_quantities.get(0).getValueI());
  quantities_label.get(0).setText(str(quantities_values.get(0)));
  Recipe.background(230);
  for(int j = 1; j<i+1; j++){
    dropLists.get(j).setAlpha(0);
    quantities_label.get(j).setAlpha(0);
    ingredient_quantities.get(j).setAlpha(0);
  }
  hidden_i = i+1;
  i = 0;
  for( int j = 0; j <= i; j++){
    ingredients_selected.add(dropLists.get(j).getSelectedText());
  }
}
int hidden_i = 0;
public void set_ingredients_chocolate_chip_cookies(GButton source, GEvent event){
  int t = 0;
  quantities_values.clear();
  dropLists.get(0).setSelected(5);
  ingredient_quantities.get(0).setLimits(250.0,0.0,500.0);
  quantities_values.add(ingredient_quantities.get(0).getValueI());
  quantities_label.get(0).setText(str(quantities_values.get(0))+" g");
  Recipe.background(230);
  t++;
  try{
    dropLists.get(t).setSelected(6);
    ingredient_quantities.get(t).setLimits(300.0,0.0,500.0);
    quantities_values.add(ingredient_quantities.get(t).getValueI());
    quantities_label.get(t).setText(str(quantities_values.get(t))+" g");
    Recipe.background(230);
  }catch(Exception e){
    dropLists.add(new GDropList(Recipe, 29, 60 + 40* t, 90, 80, 3, 15));
    dropLists.get(t).setItems(loadStrings("list_374668"), 0);
    dropLists.get(t).setSelected(6);
    dropLists.get(t).addEventHandler(this, "dropList1_click1");
    ingredient_quantities.add(new GCustomSlider(Recipe, 120, 60 + 40*t, 100, 40, "grey_blue"));
    ingredient_quantities.get(t).setLimits(300.0,0.0,500.0);
    ingredient_quantities.get(t).addEventHandler(this, "change_quantities");
    quantities_label.add(new GLabel(Recipe, 120, 40 + 40*t, 100, 50));
    quantities_values.add(ingredient_quantities.get(t).getValueI());
    quantities_label.get(t).setText(str(quantities_values.get(t))+" g");
    Recipe.background(230);
  }  
  t++;
  try{
    dropLists.get(t).setSelected(8);
    ingredient_quantities.get(t).setLimits(1.0,0.0,12.0);
    dropLists.get(t).addEventHandler(this, "dropList1_click1");
    quantities_values.add(ingredient_quantities.get(t).getValueI());
    quantities_label.get(t).setText(str(quantities_values.get(t)));
    Recipe.background(230);
  }catch(Exception e){
    dropLists.add(new GDropList(Recipe, 29, 60 + 40* t, 90, 80, 3, 15));
    dropLists.get(t).setItems(loadStrings("list_374668"), 0);
    dropLists.get(t).setSelected(8);
    dropLists.get(t).addEventHandler(this, "dropList1_click1");
    ingredient_quantities.add(new GCustomSlider(Recipe, 120, 60 + 40*t, 100, 40, "grey_blue"));
    ingredient_quantities.get(t).setLimits(1.0,0.0,12.0);
    ingredient_quantities.get(t).addEventHandler(this, "change_quantities");
    quantities_label.add(new GLabel(Recipe, 120, 40 + 40*t, 100, 50));
    quantities_values.add(ingredient_quantities.get(t).getValueI());
    quantities_label.get(t).setText(str(quantities_values.get(t)));
    Recipe.background(230);
  }  
  t++;
  try{
    dropLists.get(t).setSelected(9);
    dropLists.get(t).addEventHandler(this, "dropList1_click1");
    ingredient_quantities.get(t).setLimits(100.0,0.0,500.0);
    quantities_values.add(ingredient_quantities.get(t).getValueI());
    quantities_label.get(t).setText(str(quantities_values.get(t))+ " mL");
    Recipe.background(230);
  }catch(Exception e){
    dropLists.add(new GDropList(Recipe, 29, 60 + 40* t, 90, 80, 3, 15));
    dropLists.get(t).setItems(loadStrings("list_374668"), 9);
    dropLists.get(t).addEventHandler(this, "dropList1_click1");
    ingredient_quantities.add(new GCustomSlider(Recipe, 120, 60 + 40*t, 100, 40, "grey_blue"));
    ingredient_quantities.get(t).setLimits(100.0,0.0,500.0);
    ingredient_quantities.get(t).addEventHandler(this, "change_quantities");
    quantities_label.add(new GLabel(Recipe, 120, 40 + 40*t, 100, 50));
    quantities_values.add(ingredient_quantities.get(t).getValueI());
    quantities_label.get(t).setText(str(quantities_values.get(t))+" mL");
    Recipe.background(230);
  }  
  // hide extra ingredients
  for(int j = t+1; j<i+1; j++){
    dropLists.get(j).setAlpha(0);
    quantities_label.get(j).setAlpha(0);
    ingredient_quantities.get(j).setAlpha(0);
  }
  if(i>t){
    hidden_i = i+1;
  }
  i = t;
  for( int j = 0; j <= i; j++){
    ingredients_selected.add(dropLists.get(j).getSelectedText());
  }
}
