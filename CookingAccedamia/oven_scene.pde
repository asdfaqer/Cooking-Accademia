int target_temp = -1;
int target_time = -1;
boolean task_completed = false;
public void changeoventemp(GKnob source, GEvent event) { //_CODE_:Temp:491161:
  background(0);
  tempature.setText(str(Temp.getValueI()) + " C");
  if(abs(target_temp - Temp.getValueI()) < 5){
    step_num ++;
    target_temp = -1;
    if(step_num > instructions.size()){
      receipe_complete();
      return;
    }
    task_complete();
    task_completed = true;
  }
  println(source.getValueI(), target_temp);
} //_CODE_:Temp:491161:

public void changetimeforoven(GKnob source, GEvent event) { //_CODE_:time:476537:
  timer.setText(str(time.getValueI())+" min");
  if(target_time == time.getValueI()){
    step_num ++;
    target_time = -1;
    if(step_num > instructions.size()){
      receipe_complete();
      return;
    }
    task_complete();
    task_completed = true;
  }
  println(source.getValueI(), target_time);
}
