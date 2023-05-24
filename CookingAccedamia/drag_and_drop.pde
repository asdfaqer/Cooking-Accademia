void mouseDragged(){
  if(current_requirement.isEmpty()){
    return;
  }
  for(Recipe i : current_requirement){
    if(PVector.sub(i.image_location, new PVector(mouseX, mouseY)).mag()<60){ // using PVectors change the location of the image
      i.image_location = new PVector(mouseX, mouseY); // the new location is the location of the mouse
    }
    if(add_mode){
      if(i.image_location.x < 4 * width/5 && i.image_location.x > width/5 && !task_completed){ // if the image of sausage is in the middle plate
        if(i.image_location.y < 4 * height/5 && i.image_location.y > height/5){
          i.image_location = new PVector(width/2, height/2); // move the picture there
          i.completed = true;
        }
      }
    }
    if(mix_mode){
      if(i.image_location.x < 4 * width/5 && i.image_location.x > width/5 && !task_completed){ // if the image of sausage is in the middle plate
        if(i.image_location.y < 4 * height/5 && i.image_location.y > height/5){
          i.image_location = new PVector(width/2, height/2); // move the picture there
          i.completed = true;
        }
      }
    }
  }
  for(Recipe i: current_requirement){
    if(!i.completed){
      return;
    }
  }
  if(task_completed){
    return;
  }
  task_complete(); // call the task complete function
  task_completed = true;
  step_num++;
  add_mode = false;
  mix_mode = false;
  cooking_mode = false;
  current_requirement.clear();
  current_requirements_found = false;
}
