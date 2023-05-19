void mouseDragged(){
  if(!add_mode){
    return;
  }
  if(PVector.sub(cooked_sausages.image_location, new PVector(mouseX, mouseY)).mag()<50){
    cooked_sausages.image_location = new PVector(mouseX, mouseY);
  }
  if(cooked_sausages.image_location.x < 550 && cooked_sausages.image_location.x > 50){
    if(cooked_sausages.image_location.y < 450 && cooked_sausages.image_location.x > 200){
      cooked_sausages.image_location = new PVector(width/2, height/2);
      task_complete();
      task_completed = true;
      step_num++;
      add_mode = false;
    }
  }
}
