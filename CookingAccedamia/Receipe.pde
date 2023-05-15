class Receipe{
  //fields / ingredient restrictions
  float salt;
  float pepper;
  float olive_oil;
  float vegetable_oil;
  float flour;
  float sugar;
  float sausages;
  Receipe(float s, float p, float o, float v, float f, float su, float sa){
    this.salt = s;
    this.pepper = p;
    this.olive_oil = o;
    this.vegetable_oil = v;
    this.flour = f;
    this.sugar = su;
    this.sausages = sa;
  }
  //methods
  boolean criteria_meet(){
    //check if all ingredients required are meet 
    boolean need_for_salt;
    boolean need_for_pepper;
    boolean need_for_olive_oil;
    boolean need_for_vegetable_oil;
    boolean need_for_flour;
    boolean need_for_sugar;
    boolean need_for_sausages;
    
    need_for_salt = this.salt>0?true:false;
    need_for_pepper = this.pepper>0?true:false;
    need_for_olive_oil = this.olive_oil>0?true:false;
    need_for_vegetable_oil = this.vegetable_oil>0?true:false;
    need_for_flour = this.flour>0?true:false;
    need_for_sugar = this.sugar>0?true:false;
    need_for_sausages = this.sausages>0?true:false;
   
    for(int i = 0; i < ingredients_selected.size()&& i < quantities_values.size(); i++){
      if(ingredients_selected.get(i).equals("Salt")){
        need_for_salt = false;
        if(!(quantities_values.get(i) >= this.salt)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Pepper")){
        need_for_pepper = false;
        if(!(quantities_values.get(i) >= this.pepper)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Olive oil")){
        need_for_olive_oil = false;
        if(!(quantities_values.get(i) >= this.olive_oil)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Vegetable oil")){
        need_for_vegetable_oil = false;
        if(!(quantities_values.get(i) >= this.vegetable_oil)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Flour")){
        need_for_flour = false;
        if(!(quantities_values.get(i) >= this.flour)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Sugar")){
        need_for_sugar = false;
        if(!(quantities_values.get(i) >= this.sugar)){
          return false;
        }
      }
      if(ingredients_selected.get(i).equals("Sausages")){
        need_for_sausages = false;
        if(!(quantities_values.get(i) >= this.sausages)){
          return false;
        }
      }
    }
    if(need_for_salt||need_for_pepper||need_for_olive_oil||need_for_vegetable_oil||need_for_flour||need_for_sugar||need_for_sausages){
      return false;
    }
    else{
      return true;
    }
  }
}
