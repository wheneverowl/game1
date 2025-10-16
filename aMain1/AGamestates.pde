void GameState1() {
  ImmunityFramesCurrentTime = millis(); //sets current time for immunity frame calculations
  //MouseX = mouseX+(Player1.Position.x-564);
  // MouseY = mouseY+(Player1.Position.y-364);

  //translate(-1*(Player1.Position.x-564), -1*(Player1.Position.y-364));
  /*  for (int i=0; i <  i++) {
   Player1.set(i).StartTime[i] = millis();
   }*/

  dashk = millis();
  jumpk = millis();
  /*k = millis();
     /* t = k - w;
   if (t > 100) {
   println(Rooms[MoveX+RoomX][MoveY+RoomY]);
   //rectangle.add(new Rectangle(int(random(0, width)), int(random(0, height)), int(random(25, 50)), int(random(25, 50)),true ));
   //circle.add(new Circle(int(random(0, width)), int(random(0, height)), int(random(25, 100))));
   w = millis();
   }*/
   
   ImmunityFramesElapsed = ImmunityFramesCurrentTime - ImmunityFramesStartTime;
   if(ImmunityFramesElapsed >= 500){
     ImmunityFramesStartTime = millis();
     CanDamage = true;
   } //every 0.500 seconds can the player be damaged
  RoomTerrainControl(); //controls terrain and coloured background
  RoomBackgroundManager(); //controls image background
  
  for (int i=0; i < rectangle.size(); i++) {
    rectangle.get(i);
    rectangle.get(i).collidePlayerRectangle();
    rectangle.get(i).collideBatRectangle();
    rectangle.get(i).drawRectangle();
  } //runs through the object information of every rectangle within the arraylist of a rectanlge

  for (int i=0; i < triangle.size(); i++) {
    triangle.get(i);
    triangle.get(i).collideTriangle();
    triangle.get(i).drawTriangle();
  } //runs through the object information of every triangle within the arraylist of a triangle
  for (int i=0; i < circle.size(); i++) {
    circle.get(i);
    circle.get(i).collideCircle();
    circle.get(i).drawCircle();
  } //runs through the object ifnormation of every circle within the array list of a circle

  /*
  Ball1.moveBall(); // .moveBall() is called an 'object method' because it is
   Rectangle1.drawRectangle();
   Rectangle1.collidePlayerRectangle();
   */




  for (int i=0; i < bat.size(); i++) {
    bat.get(i);
    bat.get(i).drawBat();
    bat.get(i).moveBat();
    bat.get(i).collideBat();
  }//runs through the object ifnormation of every bat within the array list of a bat 



  stroke(#FFFFFF);
  TerrainManager(); //decides what the border decoraiton of the room should be according to the current room value
  for (int w = 0; w < 15; w++) {
    for (int k = 0; k < 15; k++) {

      if (Rooms[w][k] == 4) {
        stroke(#FFFF00, 128);
        fill(#0909AA, 126);
      }
      if (Rooms[w][k] == 31) {
        stroke(#00FFFF, 128);
        fill(#0909AA, 126);
      }
      if (Rooms[w][k] >= 5 && Rooms[w][k] <= 10) {
        stroke(0, 128);
        fill(#FF0000, 127);
      }
      if (Rooms[w][k] >= 15 && Rooms[w][k] <= 20) {
        stroke(0, 128);
        fill(#0033FF, 127);
      }
      if (Rooms[w][k] >= 25 && Rooms[w][k] <= 30) {
        stroke(0, 128);
        fill(#DD00DD, 127);
      }
      if (Rooms[w][k] >= 35 && Rooms[w][k] <= 40) {
        stroke(0, 128);
        fill(#33DD33, 127);
      }
      if (Rooms[w][k] == 0) {
        fill(#FFFFFF, 198);
        noFill();
        noStroke();
      }
      if (Rooms[w][k] == 2) {
        fill(#0088FF, 128);
        stroke(255);
      }
      if (Rooms[w][k] == 41) {
        fill(#0039FF, 128);
        stroke(255);
      }
      if (Rooms[w][k] == 42) {
        stroke(255, 128);
        fill(#00FF00, 128);
      }
      rect(w*20+900, k*20, 20, 20);
      if (w == RoomX+MoveX && k == RoomY+MoveY) {
        stroke(#FFFFFF);
        ellipse(w*20+10+900, k*20+10, 10, 10);
      }
    }
  } //draws a map within the upper right corner, each room value having their fill and strokes
  Player1.drawPlayer();
  Player1.AnimationManager();
  Player1.movePlayer();
  Player1.dashPlayer();
  Player1.RoomMovement(); //Only one player, runs through the object information
  ParticleManager(); //controls the particle size within the game, according to the current room value 
  for (int i = 0; i < spike.size(); i++) {
    spike.get(i).DrawSpike();
    spike.get(i).CollideSpike();
  } //runs through every object information of a spike, from the spke arraylist
  RoomTerrainAppearance();
  for (int i = 0; i < particle.size(); i++) {
    particle.get(i).DrawShape();
    particle.get(i).MoveShape();
  } //runs through every particle ifnromation from the array list of a particle
  stroke(#FFFFFF);
  HealthManager(); //controls the draw of the healthbar within the to plefrt hand corner and the value of the health, and when the palyer should die according to the player





  Player1.keyReleased(); //
}
void GameState2() {
}

void GameState3() {
  background(0);
  text(TextToTypeIn, 420, 420);
} //main menu is just black background with typeable text

void GameState4() {
}

void GameState5() {
}

void GameState6() {
}

void GameState7() {
}

void GameState8() {
}

void GameState9() {
}
