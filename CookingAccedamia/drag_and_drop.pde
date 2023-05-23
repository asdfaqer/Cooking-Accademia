void mouseDragged(){
  if(!add_mode){
    return;
  }
  for(Recipe i : current_requirement){
    if(PVector.sub(i.image_location, new PVector(mouseX, mouseY)).mag()<50){ // using PVectors change the locationof the image
      i.image_location = new PVector(mouseX, mouseY); // the new location is the locationof the mouse
    }
    if(i.image_location.x < 550 && i.image_location.x > 50 && !task_completed){ // if the image of sausage is in the middle plate
      if(i.image_location.y < 450 && i.image_location.y > 200){
        i.image_location = new PVector(width/2, height/2); // move the picture there
        i.completed = true;
      }
    }
  }
  for(Recipe i: current_requirement){
    if(!i.completed){
      return;
    }
  }
  task_complete(); // call the task complete function
  task_completed = true;
  step_num++;
  add_mode = false;
}
