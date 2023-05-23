synchronized public void Music_Window(PApplet appc, GWinData data) { //_CODE_:Music:895587:
  appc.background(230);
  appc.image(songImage, 50, 10, 200 ,200);
} 
public void play_music(GButton source, GEvent event){
  Song.pause(); // pause the music
  Song.play(); // play the music
}
public void pause_music(GButton source, GEvent event){
  Song.pause();
}
public void change_volume(GCustomSlider source, GEvent event){
  Song.amp(source.getValueF()); // motify the volume of the music
}
