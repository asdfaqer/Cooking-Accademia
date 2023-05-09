import g4p_controls.*;
void setup(){
  size(800,800);
  createGUI();
}

boolean button_pressed = false;
void draw(){
  G4P.messagesEnabled(false);
}


void open_windows(){
  background(0);
  if(button_pressed){
    G4P.messagesEnabled(false);
    G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
    G4P.setMouseOverEnabled(false);
    surface.setTitle("Sketch Window");
    Receipe = GWindow.getWindow(this, "Receipe_builder", 0, 0, 500, 500, JAVA2D);
    Receipe.noLoop();
    Receipe.setActionOnClose(G4P.KEEP_OPEN);
    Receipe.addDrawHandler(this, "win_draw1");
    Music_Player = GWindow.getWindow(this, "Music", 0, 0, 500, 500, JAVA2D);
    Music_Player.noLoop();
    Music_Player.setActionOnClose(G4P.KEEP_OPEN);
    Music_Player.addDrawHandler(this, "win_draw2");
    Receipe.loop();
    Music_Player.loop();
    button_pressed = false;
  }
}
