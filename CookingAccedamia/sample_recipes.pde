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
}
int hidden_i = 0;
