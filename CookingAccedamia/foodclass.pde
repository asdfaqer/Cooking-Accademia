class Food{
  // fields food have
  String name;
  int calories;
  float protein;
  float fat;
  float sugar;
  float salt;
  
  // constructor to construct the fields
  Food(String n, int cl, float pt, float ft, float sg, float st){
    this.name = name;
    this.calories = cl;
    this.protein = pt;
    this.fat = ft;
    this.sugar = sg;
    this.salt = st;
  }
  
  // methold to create the nutritionlabel (calroeis, protein, fat, sugar and others)
  String nutritionalLabel(){
    // create the lables 
    String label = "Nutrition label for" + "this.name";
    label += "Calroies" + this.calories +" \n";
    label += "Protein: " + this.protein + "g \n";
    label += "Fat" + this.fat + "g \n";
    label += "Sugar" + this.sugar + "g \n";
    label += "Salt" + this.salt + "g \n";
    return label; // return it
  }
  
  //methold to draw the lables onto the screen
  void drawlabel(){
    size(200,200);
    text(nutritionalLabel(),200,300);
  }
  
}
