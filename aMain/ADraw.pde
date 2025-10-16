void draw() {
  if (GameState == 1) {
    GameState1();
  }
  if (GameState == 2) {
    GameState2();
  }
  if (GameState == 3) {
    GameState3();
  }
  if (GameState == 4) {
    GameState4();
  }
  if (GameState == 5) {
    GameState5();
  }
  if (GameState == 6) {
    GameState6();
  }
  if (GameState == 7) {
    GameState7();
  }
  if (GameState == 8) {
    GameState8();
  }
}



void keyPressed() {
  Player1.keyPressed();
  if (GameState == 3) {
    if (keyCode >= 48 && keyCode <= 57 && TextToTypeIn.length() <= 8) {
      TextToTypeIn = TextToTypeIn + key;
    }
    if (keyCode == 8 && TextToTypeIn.length() >= 1 && TextToTypeIn.length() <= 8) {
      TextToTypeIn = TextToTypeIn.substring(0, TextToTypeIn.length()-1);
    }
  }
}
void keyReleased() {
  Player1.keyReleased();
}
void mouseReleased() {
  if (GameState == 3) {
    GameState = 1;
    //StartNewGame();
  }
  Player1.mouseReleased();
  ParticleExplosion();
}
