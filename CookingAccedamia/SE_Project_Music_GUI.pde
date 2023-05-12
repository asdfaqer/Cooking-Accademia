import g4p_controls.*;
import processing.sound.*;

SoundFile Song;
//PImage SongImage;

void setup() {
    size(100,100);
   createGUI();
   
   //SongImage = loadImage ("Cool Out Son Image");
  
   Song = new SoundFile(this, "a.wav");
   
}

void draw() {
  
}
