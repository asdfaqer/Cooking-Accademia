class Food{
  String name;
  int calories;
  float protein;
  float fat;
  float sugar;
  
  Food(String n, int cl, float pt, float ft, float sg){
    this.name = name;
    this.calories = cl;
    this.protein = pt;
    this.fat = ft;
    this.sugar = sg;
  }
  
  String nutritionalLabel(){
    String label = "Nutrition label for" + "this.name";
    label += "Calroies" + this.calories +" \n";
    label += "Protein: " + this.protein + "g \n";
    label += "Fat" + this.fat + "g \n";
    label += "Sugar" + this.sugar + "g \n";
    return label;
  }
  

  
}
