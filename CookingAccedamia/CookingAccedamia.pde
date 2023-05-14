import processing.sound.*;
import g4p_controls.*;
String selectedAppliance = "";
int ovenstemperaure = 50;
boolean button_pressed = false;
PImage oven;
SoundFile Song;
boolean cooking_mode = false;
void setup(){
  size(800,600);
  surface.setResizable(true);
  oven = loadImage("openoven.png");
  //SongImage = loadImage ("Cool Out Son Image");
  
  Song = new SoundFile(this, "a.wav");
  Song.play();
  
  create_start_button();
}
void draw(){
  if(cooking_mode){
    image(oven,0,0,width,height);
    set_up_scene();
  }
}
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
    Temp.setLimits(100.0, 0.0, 300.0);
    Temp.setShowTicks(true);
    Temp.setOpaque(false);
    Temp.addEventHandler(this, "changeoventemp");
    ovenstemp = new GLabel(this, 55, 60, 80, 20);
    ovenstemp.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    ovenstemp.setText("Temp");
    ovenstemp.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
    ovenstemp.setOpaque(false);
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
  }
}
void create_start_button(){
  start_button = new GButton(this, width/2 - 150, height*3/4, 300, 100);
  start_button.setText("Start");
  start_button.addEventHandler(this, "start_button");
}
GButton start_button;
public void start_button(GButton source, GEvent event){
     background(0);
     surface.setSize(500,500);
     start_button.dispose();
     createGUI();
}
