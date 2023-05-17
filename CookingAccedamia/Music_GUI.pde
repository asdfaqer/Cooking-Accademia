public void play_music(GButton source, GEvent event){
  Song.pause();
  Song.play();
}
public void pause_music(GButton source, GEvent event){
  Song.pause();
}
public void change_volume(GCustomSlider source, GEvent event){
  Song.amp(source.getValueF());
}
