import processing.sound.*;
import g4p_controls.*;
String selectedAppliance = "";
int ovenstemperaure = 50;
boolean button_pressed = false;
PImage oven;
SoundFile Song;
void setup(){
  size(800,600);
  surface.setResizable(true);
  oven = loadImage("openoven.png");
  //SongImage = loadImage ("Cool Out Son Image");
  
  Song = new SoundFile(this, "a.wav");
  Song.play();
}
void draw(){
  print();
 
  if(!button_pressed){
    create_start_button();
  }
  else{
     fill(255);
     textSize(50);
     textAlign(CENTER);
     text("display not in use", width/2, height/2);
     //println("pressed");
     drawoven();
  }
}
int x, y;
void create_start_button(){
  x=240;
  y=80;
  fill(255);
  rect(width/2.0 - x/2 , height/2.0 - y/2 + 100, x, y);
}
void start_button(){
 float minx = width/2.0 - x/2;
 float miny = height/2.0 - y/2 + 100 + y;
 float maxx = width/2.0 - x/2 + x;
 float maxy = height/2.0 - y/2 + 100;
 println(minx,maxx,miny,maxy);
 println(mouseX,mouseY);
 if(abs(minx - mouseX) + abs(maxx - mouseX) <= abs(minx - maxx)+10){
   if(abs(miny - mouseY) + abs(maxy - mouseY) <= abs(miny - maxy)+10){
     //open other windows
     background(0);
     surface.setSize(500,500);
     button_pressed = true;
     createGUI();
   }
 }
}
void mousePressed(){
  if(!button_pressed){
    start_button();
  }
}
