int target_temp = -1;
int target_time = -1;
boolean task_completed = false;

 // function to change the temperature of the oven
public void changeoventemp(GKnob source, GEvent event) { //_CODE_:Temp:491161:
  background(0);
  tempature.setText(str(Temp.getValueI()) + " C");
  if(abs(target_temp - Temp.getValueI()) < 5){ // it is hard to get the exact number during the interaction, so we diecded to make the excpted error range to be 5 degrees
    step_num ++; // add the step numer when this step is done
    target_temp = -1; // set the target temp to -1 
    if(step_num > instructions.size()){ // if the user completed this instruction
      recipe_complete(); // output the complete receiple screen;
      return;
    }
    task_complete();
    task_completed = true; // set taked complated to true;
  }
  println(source.getValueI(), target_temp);
} //_CODE_:Temp:491161:


// workds simipler to the changetemperature function
public void changetimeforoven(GKnob source, GEvent event) { //_CODE_:time:476537:
  timer.setText(str(time.getValueI())+" min"); 
  if(target_time == time.getValueI()){ // if the time the user setup is equal to the target
    step_num ++; // move onto the next step 
    target_time = -1; 
    if(step_num > instructions.size()){ //if the user completed this instruction
      recipe_complete(); // output the complete receiple screen;
      return;
    }
    task_complete();
    task_completed = true; // // set task complated to true;
  }
  println(source.getValueI(), target_time);
}
