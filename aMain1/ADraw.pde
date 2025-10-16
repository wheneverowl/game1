void draw() {
  if (GameState == 1) {
    GameState1();
  } // In-Game
  if (GameState == 2) {
    GameState2();
  }
  if (GameState == 3) {
    GameState3();
  } //Main Menu
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
    image(Crosshair, mouseX-16, mouseY-16); //Sets the cursor to be crosshair
}



void keyPressed() {
  Player1.keyPressed();
   //key pressed method for object of Player
  if (GameState == 3) {
    if (keyCode >= 48 && keyCode <= 57 && TextToTypeIn.length() <= 8) {
      TextToTypeIn = TextToTypeIn + key;
    }
    if (keyCode == 8 && TextToTypeIn.length() >= 1 && TextToTypeIn.length() <= 8) {
      TextToTypeIn = TextToTypeIn.substring(0, TextToTypeIn.length()-1);
    }
  } //if in main menu and type numbers, you can set the seed for the roomgeneration
}
void keyReleased() {
  Player1.keyReleased();
  //key released method for object of Player
}

void mousePressed(){
  Crosshair = loadImage("CrossHairOn.png");
} //The image for crosshair becomes red to show user input
void mouseReleased() {
  Crosshair = loadImage("CrossHair.png");
  //The image for crosshair becomes red to show user input
  if (GameState == 3) {
    GameState = 1;
    //StartNewGame();
  } //if click on main menu
  Player1.mouseReleased();
    //mouse released method for object of Player
}
