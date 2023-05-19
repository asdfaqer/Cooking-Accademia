class Receipe{
  //fields / ingredient restrictions that are provided for the user
  float salt;
  float pepper;
  float olive_oil;
  float vegetable_oil;
  float flour;
  float sugar;
  float sausages;
  PImage image;
  PVector image_location = new PVector(0,0);
  // consturctor to construct the fields needed
  Receipe(float s, float p, float o, float v, float f, float su, float sa, PImage im){
    this.salt = s;
    this.pepper = p;
    this.olive_oil = o;
    this.vegetable_oil = v;
    this.flour = f;
    this.sugar = su;
    this.sausages = sa;
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
    

    need_for_salt = this.salt>0?true:false; // if this.salt is greater than zero, then return true, else return false
    need_for_pepper = this.pepper>0?true:false; // if this.pepper is greater than zero, then return true, else return false
    need_for_olive_oil = this.olive_oil>0?true:false; // if this.olive_oil is greater than zero, then return true, else return false
    need_for_vegetable_oil = this.vegetable_oil>0?true:false; // if this.vegetable_oil is greater than zero, then return true, else return false
    need_for_flour = this.flour>0?true:false; // if this.flour is greater than zero, then return true, else return false
    need_for_sugar = this.sugar>0?true:false;// if this.sugar is greater than zero, then return true, else return false
    need_for_sausages = this.sausages>0?true:false; // // if this.sausages is greater than zero, then return true, else return false
   
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
    }
    
    if(need_for_salt||need_for_pepper||need_for_olive_oil||need_for_vegetable_oil||need_for_flour||need_for_sugar||need_for_sausages){
      return false; // if we do not need any of the ingredients
      // return false
    }
    else{
      return true;
    }
  }
}
