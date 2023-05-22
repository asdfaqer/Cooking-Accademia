void mouseDragged(){
  if(!add_mode){
    return;
  }
  for(Recipe i : used_ingredients){
    if(PVector.sub(i.image_location, new PVector(mouseX, mouseY)).mag()<50){
      i.image_location = new PVector(mouseX, mouseY);
    }
    if(i.image_location.x < 550 && i.image_location.x > 50 && !task_completed){
      if(i.image_location.y < 450 && i.image_location.y > 200){
        i.image_location = new PVector(width/2, height/2);
        task_complete();
        task_completed = true;
        step_num++;
        add_mode = false;
      }
    }
  }
}
