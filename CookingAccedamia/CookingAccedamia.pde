import g4p_controls.*;
String selectedAppliance = "";
int ovenstemperaure = 50;
PImage oven;

void setup(){
  surface.setResizable(true);
  size(800,600);
  oven = loadImage("openoven.png");
}
void draw(){
  
 
  if(!button_pressed){
    create_start_button();
  }
  else{
     fill(255);
     textSize(50);
     textAlign(CENTER);
     text("display not in use", width/2, height/2);
     println("pressed");
     drawoven();
  }
}
boolean button_pressed = false;
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
