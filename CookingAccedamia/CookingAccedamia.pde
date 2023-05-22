import processing.sound.*;
import g4p_controls.*;
import java.awt.*;
import java.util.*;
import java.util.function.Supplier;

String selectedAppliance = ""; // select the appliance used to cook
int ovenstemperaure = 50; // set the ovensinitial temperaure
boolean button_pressed = false; // determine if the button is pressed or not
ArrayList<Recipe> recipes = new ArrayList<Recipe>();
ArrayList<Recipe> used_ingredients = new ArrayList<Recipe>();

// input the files such as picures and sound files
PImage oven;
PImage cooklo;
PImage tray;
PImage mixer;
PImage sausages;
PImage songImage;
SoundFile Song;

boolean cooking_mode = false; // store whether the scene to be displayed is the oven scene
boolean add_mode = false; // store whether the scene to be displayed is the tray scene
boolean mix_mode = false; // store whether the scene to be displayed is the mixer scene
boolean cutting_board_mode = false; // store whether the scene to be displayed is the cutting board scene

ArrayList<String> instructions = new ArrayList<String>(); // store all instructions.
Recipe cooked_sausages;
Recipe chocolate_chip_cookie;
int delay = 40;// how long temparry text stays up
int frame;
void setup(){
  size(800,600);
  chocolate_chip_cookie = new Recipe("chocolate chip cookie",0,0,0,0,250,300,0,100,1,loadImage("chocolate_chip.png"));
  cooked_sausages = new Recipe("cooked sausages",0,0,0,0,0,0,1,0,0,loadImage("sausages.png")); // create the recipe
  recipes.add(chocolate_chip_cookie);
  recipes.add(cooked_sausages);
  oven = loadImage("openoven.png"); // load image
  cooklo = loadImage("cooklogo.png");// load image
  tray = loadImage("tray.png");
  sausages = loadImage("sausages.png");
  mixer = loadImage("mixer.png");
  
  //music window
  songImage = loadImage("Cool Out Son Image.PNG");// load image
  
  Song = new SoundFile(this, "a.wav"); // create the new song file
  Song.play(); // play the music
  
  create_start_button(); // call this function to make button in the bottom of the screen
   
  set_up_task_recipe_completion();

}

boolean scene_setup = false;
String cur_instruction; // store the current instruction selected
void draw(){
  frame++;
  //image(cooklo,0,0,width,height);
  if(task_completed && frame > delay - 1){ // if the task is completed 
    print("ok");
    background(0);
    task_recipe_completion.setText("");
    task_completed = false; // set task_completed back to false
  }
  
  // set all modes to false
  cooking_mode = false;
  add_mode = false;
  
  try{
    cur_instruction = instructions.get(step_num-1);
    //find scene 
    if (cur_instruction.substring(0,5).equals("oven ")){ // if we selected oven
      cooking_mode = true; // set the cooking _ mode to true
      print("cool");
    }  
    else if ( cur_instruction.substring(0,5).equals("tray ")){
      add_mode = true;
    }
    else if ( cur_instruction.substring(0,5).equals("mixer")){
      mix_mode = true;
    }
    
    if(scene_setup){ // show the user the steps to cook the recipe selected
      background(0);
      cur_instruction_label.setText("STEP #" + str(step_num) + ":\n" + cur_instruction.substring(5,cur_instruction.length()));
    }
  }
  catch(Exception e){
    
  }
  int j; //used to control spacing of ingredients when displayed
  //set up scene
  if(cooking_mode){
    print(step_num);
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
  else if(add_mode){
    set_up_scene();
    try{
      j = 0;
      image(tray, 0, 0, width,height);
      for(Recipe i: used_ingredients){
        j++;
        image(i.image, i.image_location.x - width/10 + j * 30 , i.image_location.y - height/10, width/5, height/5);
      }
    }
    catch(Exception e){
    }
  }
  else if(mix_mode){
    set_up_scene();
    try{
      j=0;
      image(mixer, 0, 0, width, height);
      for(Recipe i: used_ingredients){
        j++;
        image(i.image, i.image_location.x - width/10 + j * 30 , i.image_location.y - height/10, width/5, height/5);
      }
    }
    catch(Exception e){}
  }
}

void set_up_task_recipe_completion(){
  task_recipe_completion = new GLabel(this, width/2 - 250, height/2 - 150, 500, 300);
  task_recipe_completion.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  task_recipe_completion.setFont(new Font("Monospaced", Font.PLAIN, 90));
  task_recipe_completion.setOpaque(false);
  task_recipe_completion.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
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
GLabel task_recipe_completion;
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
