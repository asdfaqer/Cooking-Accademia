import processing.sound.*;
import g4p_controls.*;
import java.awt.*;
Receipe cooked_sausages = new Receipe(0,0,0,0,0,0,1); // create the recipe
String selectedAppliance = ""; // select the appliance used to cook
int ovenstemperaure = 50; // set the ovensinitial temperaure
boolean button_pressed = false; // determine if the button is pressed or not

// input the files such as picures and sound files
PImage oven;
PImage cooklo;
PImage songImage;
SoundFile Song;
boolean cooking_mode = false; // store weather the receipe the user choose is qualified to use or not
ArrayList<String> instructions = new ArrayList<String>(); // store all instructions.

void setup(){
  size(800,600);
  surface.setResizable(true);
  oven = loadImage("openoven.png"); // load image
  cooklo = loadImage("cooklogo.png");// load image
  songImage = loadImage("Cool Out Son Image.PNG");// load image
  
  
   
  //SongImage = loadImage ("Cool Out Son Image;
  
  Song = new SoundFile(this, "a.wav"); // create the new song file
  Song.play(); // play the music
  
  create_start_button(); // call this function to make button in the bottom of the screen
   
}
boolean scene_setup = false;
String cur_instruction; // store the current instruction selected
void draw(){
  image(cooklo,0,0,width,height);
  if(task_completed && round(random(0,100))==1){     // if the task is completed 
    background(0);
    task_receipe_completion.setText(""); // set the text to a empty string
    task_completed = false; // set task_completed back to false
    return;
  }
  cooking_mode = false; // set the cooking mode back to false
  try{
    cur_instruction = instructions.get(step_num-1);
    //find scene 
    if (cur_instruction.substring(0,5).equals("oven ")){ // if we selected oven
      cooking_mode = true; // set the cooking _ mode to true
    }  
    if(scene_setup){ // show the user the steps to cook the recipe selected
      background(0);
      cur_instruction_label.setText("STEP #" + str(step_num) + ":\n" + cur_instruction.substring(5,cur_instruction.length()));
    }
  }
  catch(Exception e){
    
  }
  //set up scene
  if(cooking_mode){
    if(!scene_setup){
      set_up_scene();
      scene_setup = true;
    }
    image(oven,0,0,width,height); // add the image of the oven when the user need to use the oven to cook the recipe
    
    
    
    if(cur_instruction.substring(5,10).equals("heat ")){ // if the instruction is heat the oven up
      target_temp = int(cur_instruction.substring(13, cur_instruction.indexOf("C")-1)); // the user need to drag the knob to change the temperature
    }
    if(cur_instruction.substring(5,10).equals("cook ")){ // if the instruction is set the timer
      target_time = int(cur_instruction.substring(14, cur_instruction.indexOf("m")-1)); // the user need to drag the knob ot change the time
    }
  }
}

// setup the scene and gui of the screen
void set_up_scene(){
  if(cooking_mode){
    Temp = new GKnob(this, 138, 40, 60, 60, 0.8);
    Temp.setTurnRange(110, 70);
    Temp.setTurnMode(GKnob.CTRL_HORIZONTAL);
    Temp.setSensitivity(1);
    Temp.setShowArcOnly(false);
    Temp.setOverArcOnly(false);
    Temp.setIncludeOverBezel(false);
    Temp.setShowTrack(true);
    Temp.setTurnMode(GKnob.CTRL_ANGULAR);
    Temp.setLimits(0.0, 0.0, 300.0);
    Temp.setShowTicks(true);
    Temp.setOpaque(false);
    Temp.addEventHandler(this, "changeoventemp");
    ovenstemp = new GLabel(this, 55, 60, 80, 20);
    ovenstemp.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    ovenstemp.setText("Temp");
    ovenstemp.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
    ovenstemp.setOpaque(false);
    tempature = new GLabel(this, 170, 60, 80 ,20);
    tempature.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    tempature.setText("0 C");
    tempature.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
    tempature.setOpaque(false);
    time = new GKnob(this, 294, 39, 60, 60, 0.8);
    time.setTurnRange(110, 70);
    time.setTurnMode(GKnob.CTRL_HORIZONTAL);
    time.setSensitivity(1);
    time.setShowArcOnly(false);
    time.setOverArcOnly(false);
    time.setIncludeOverBezel(false);
    time.setShowTrack(true);
    time.setTurnMode(GKnob.CTRL_ANGULAR);
    time.setLimits(0.0, 0.0, 40.0);
    time.setShowTicks(true);
    time.setOpaque(false);
    time.addEventHandler(this, "changetimeforoven");
    timelabel = new GLabel(this, 351, 58, 80, 20);
    timelabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    timelabel.setText("Time");
    timelabel.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
    timelabel.setOpaque(false);
    timer = new GLabel(this, 226, 58, 80, 20);
    timer.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    timer.setText("0 min");
    timer.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
    timer.setOpaque(false);
    cur_instruction_label = new GLabel(this, width-300, 50, 300, 100);
    cur_instruction_label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    cur_instruction_label.setOpaque(false);
    cur_instruction_label.setFont(new Font("Monospaced", Font.PLAIN, 30));
    cur_instruction_label.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
    task_receipe_completion = new GLabel(this, width/2 - 250, height/2 - 150, 500, 300);
    task_receipe_completion.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    task_receipe_completion.setFont(new Font("Monospaced", Font.PLAIN, 90));
    task_receipe_completion.setOpaque(false);
    task_receipe_completion.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  }
}
void create_start_button(){
  image(cooklo,0,0,width,height);
  start_button = new GButton(this, width/2 - 150, height*3/4, 300, 100);
  start_button.setText("Start");
  start_button.addEventHandler(this, "start_button");
  
  
}
// create button manually using different documentation
GButton start_button;
GLabel cur_instruction_label;
GLabel task_receipe_completion;
GLabel timer;
GLabel tempature;

// this function creates the staring button in the home screen
public void start_button(GButton source, GEvent event){
  
  start_button.setAlpha(0);
  start_button.dispose();
  start_button = null;
  background(0);
  createGUI(); // call the create gui function in the gui tab
   
}
