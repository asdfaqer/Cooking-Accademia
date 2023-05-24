class Recipe{
  //fields / ingredient restrictions that are provided for the user
  String label;
  float salt;
  float pepper;
  float olive_oil;
  float vegetable_oil;
  float flour;
  float sugar;
  float sausages;
  float eggs;
  float vanilla;
  float chocolate;
  float butter;
  PImage image;
  Recipe uncooked_version;
  PVector image_location = new PVector(0,50);
  boolean completed = false;
  // consturctor to construct the fields needed
  Recipe(String l, float s, float p, float o, float v, float f, float su, float sa, float eg, float vi,float co,float bu, PImage im, Recipe un){
    this.label = l;
    this.salt = s;
    this.pepper = p;
    this.olive_oil = o;
    this.vegetable_oil = v;
    this.flour = f;
    this.sugar = su;
    this.sausages = sa;
    this.eggs = eg;
    this.vanilla = vi;
    this.chocolate = co;
    this.image = im;
    this.butter = bu;
    this.uncooked_version = un;
  }
  Recipe(String l, float s, float p, float o, float v, float f, float su, float sa, float eg, float vi, float co, float bu, PImage im){
    this.label = l;
    this.salt = s;
    this.pepper = p;
    this.olive_oil = o;
    this.vegetable_oil = v;
    this.flour = f;
    this.sugar = su;
    this.sausages = sa;
    this.eggs = eg;
    this.vanilla = vi;
    this.chocolate = co;
    this.butter = bu;
    this.image = im;
  }
  Recipe(PImage im){
    this.image = im;
  }
  //methods
  boolean criteria_meet(){
    //check if all ingredients required are meet using booleans
    boolean need_for_salt;
    boolean need_for_pepper;
    boolean need_for_olive_oil;
    boolean need_for_vegetable_oil;
    boolean need_for_flour;
    boolean need_for_sugar;
    boolean need_for_sausages;
    boolean need_for_eggs;
    boolean need_for_vanilla;
    boolean need_for_chocolate;
    boolean need_for_butter;
    

    need_for_salt = this.salt>0?true:false; // if this.salt is greater than zero, then return true, else return false
    need_for_pepper = this.pepper>0?true:false; // if this.pepper is greater than zero, then return true, else return false
    need_for_olive_oil = this.olive_oil>0?true:false; // if this.olive_oil is greater than zero, then return true, else return false
    need_for_vegetable_oil = this.vegetable_oil>0?true:false; // if this.vegetable_oil is greater than zero, then return true, else return false
    need_for_flour = this.flour>0?true:false; // if this.flour is greater than zero, then return true, else return false
    need_for_sugar = this.sugar>0?true:false;// if this.sugar is greater than zero, then return true, else return false
    need_for_sausages = this.sausages>0?true:false; // // if this.sausages is greater than zero, then return true, else return false
    need_for_eggs = this.eggs>0?true:false;
    need_for_vanilla = this.vanilla>0?true:false;
    need_for_chocolate = this.chocolate>0?true:false;
    need_for_butter = this.butter> 0? true: false;
    
   
    for(int i = 0; i < ingredients_selected.size()&& i < quantities_values.size(); i++){
      if(ingredients_selected.get(i).equals("Salt")){ // if the user selected salt
        need_for_salt = false; // set the need to false and set up the quantity
        if(!(quantities_values.get(i) >= this.salt)){
          return false;
        }
      } 
      if(ingredients_selected.get(i).equals("Pepper")){ // if the user selected pepper
        need_for_pepper = false; //set the need to false and set up the quantity
        if(!(quantities_values.get(i) >= this.pepper)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Olive oil")){ // if the user selected olive oil
        need_for_olive_oil = false; //set the need to false and set up the quantity
        if(!(quantities_values.get(i) >= this.olive_oil)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Vegetable oil")){ // if the user selected Vegetable oil
        need_for_vegetable_oil = false; // set the need to false and set up the quantity
        if(!(quantities_values.get(i) >= this.vegetable_oil)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Flour")){ // if the user selected flour
        need_for_flour = false; // set the need to false and set up the quantity
        if(!(quantities_values.get(i) >= this.flour)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Sugar")){ //if the user selected sugar
        need_for_sugar = false; //set the need to false and set up the quantity
        if(!(quantities_values.get(i) >= this.sugar)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Sausages")){ // //if the user selected Sausages
        need_for_sausages = false; // set the need to false and set up the quantity
        if(!(quantities_values.get(i) >= this.sausages)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Eggs")){
        need_for_eggs = false;
        if(!(quantities_values.get(i) >= this.eggs)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Vanilla extract")){
        need_for_vanilla = false;
        if(!(quantities_values.get(i) >= this.sausages)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Chocolate")){
        need_for_chocolate = false;
        if(!(quantities_values.get(i) >= this.chocolate)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Butter")){
        need_for_butter = false;
        if(!(quantities_values.get(i) >= this.butter)){
          return false;
        }
      }
    }
    
    if(need_for_salt||need_for_pepper||need_for_olive_oil||need_for_vegetable_oil||need_for_flour||need_for_sugar||need_for_sausages||need_for_eggs||need_for_vanilla||need_for_chocolate||need_for_butter){
      return false; // if the requirements for any ingredient are not met
    }
    else{
      return true;
    }
  }
  ArrayList<Recipe> using_ingredients(){
    boolean need_for_salt;
    boolean need_for_pepper;
    boolean need_for_olive_oil;
    boolean need_for_vegetable_oil;
    boolean need_for_flour;
    boolean need_for_sugar;
    boolean need_for_sausages;
    boolean need_for_eggs;
    boolean need_for_vanilla;
    boolean need_for_chocolate;
    boolean need_for_butter;
    ArrayList<Recipe> ingredients_used = new ArrayList<Recipe>();
    
    need_for_salt = this.salt>0?true:false; // if this.salt is greater than zero, then return true, else return false
    need_for_pepper = this.pepper>0?true:false; // if this.pepper is greater than zero, then return true, else return false
    need_for_olive_oil = this.olive_oil>0?true:false; // if this.olive_oil is greater than zero, then return true, else return false
    need_for_vegetable_oil = this.vegetable_oil>0?true:false; // if this.vegetable_oil is greater than zero, then return true, else return false
    need_for_flour = this.flour>0?true:false; // if this.flour is greater than zero, then return true, else return false
    need_for_sugar = this.sugar>0?true:false;// if this.sugar is greater than zero, then return true, else return false
    need_for_sausages = this.sausages>0?true:false;
    need_for_eggs = this.eggs>0?true:false;
    need_for_vanilla = this.vanilla>0?true:false;
    need_for_chocolate = this.chocolate>0?true:false;
    need_for_butter = this.butter> 0? true: false;
    
    
    if(need_for_salt){
      ingredients_used.add(new Recipe("salt",1,0,0,0,0,0,0,0,0,0,0,loadImage("salt.png"))); // add images of the salt
    }
    if(need_for_pepper){
      ingredients_used.add(new Recipe("pepper",0,1,0,0,0,0,0,0,0,0,0,loadImage("pepper.png"))); // add images of the pepper
    }
    if(need_for_olive_oil){
      ingredients_used.add(new Recipe("olive oil",0,0,1,0,0,0,0,0,0,0,0,loadImage("oliveoil.png"))); // add images of the oliveoil 
    }
    if(need_for_vegetable_oil){
      ingredients_used.add(new Recipe("vegetable oil",0,0,0,1,0,0,0,0,0,0,0,loadImage("vegetableoil.png"))); // add images of the vegetableoil
    }
    if(need_for_flour){
      ingredients_used.add(new Recipe("flour",0,0,0,0,1,0,0,0,0,0,0,loadImage("flour.png"))); // add images of the flour
    }
    if(need_for_sugar){
      ingredients_used.add(new Recipe("sugar",0,0,0,0,0,1,0,0,0,0,0,loadImage("sugar.png"))); // add images of the sugar
    }
    if(need_for_sausages){
      ingredients_used.add(new Recipe("sausages",0,0,0,0,0,0,1,0,0,0,0,loadImage("sausages.png"))); // add images of the sausage
    }
    if(need_for_eggs){
      ingredients_used.add(new Recipe("eggs",0,0,0,0,0,0,0,1,0,0,0,loadImage("eggs.png"))); // add images of the egg
    }
    if(need_for_vanilla){
      ingredients_used.add(new Recipe("vanilla",0,0,0,0,0,0,0,0,1,0,0,loadImage("vanilla.png"))); // add images of the vanilla
    }
    if(need_for_chocolate){
      ingredients_used.add(new Recipe("chocolate",0,0,0,0,0,0,0,0,0,1,0,loadImage("chocolate.png"))); // add images of the chocolate
    }
    if(need_for_butter){
      ingredients_used.add(new Recipe("butter",0,0,0,0,0,0,0,0,0,1,0,loadImage("butter.png"))); // add images of the chocolate
    }
    return ingredients_used;
  }
  
  float closeness_to_ingredients_in_possession(){ // judge how close the recipe matches the ingreidents in position
    float score = 0;
    String cur_ingredient;
    float cur_amount;
    for(int i = 0; i < ingredients_selected.size(); i++){
      cur_ingredient = ingredients_selected.get(i); // select the ingreident user picked
      // checks if quantitiies_values is null
      try{
        cur_amount = quantities_values.get(i);
      }catch(Exception e){
        continue;
      }
      if(cur_ingredient.equals("Salt")){
        score += cur_amount - this.salt;
      }
      if(cur_ingredient.equals("Pepper")){
        score += cur_amount - this.pepper;
      }
      if(cur_ingredient.equals("Olive oil")){
        score += cur_amount - this.olive_oil;
      }
      if(cur_ingredient.equals("Vegetable oil")){
        score += cur_amount - this.vegetable_oil;
      }
      if(cur_ingredient.equals("Flour")){
        score += cur_amount - this.flour;
      }
      if(cur_ingredient.equals("Sugar")){
        score += cur_amount - this.sugar;
      }
      if(cur_ingredient.equals("Sausages")){
        score += cur_amount - this.sausages;
      }
      if(cur_ingredient.equals("Eggs")){
        score += cur_amount - this.eggs;
      }
      if(cur_ingredient.equals("Vanilla extract")){
        score += cur_amount - this.vanilla;
      }
      if(cur_ingredient.equals("Chocolate")){
        score += cur_amount - this.chocolate;
      }
      if(cur_ingredient.equals("Butter")){
        score += cur_amount - this.butter;
      }
    }
    return score;
  }
}
