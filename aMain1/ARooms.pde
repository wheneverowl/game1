void RoomGeneration() {
  particle.clear();
  RoomOutBounds();
  RoomBoundaries();
  RoomTerrainControl();
} //checks room ifnormation

void TerrainManager() {
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 4 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 10) {
    image(GrassBorder, 0, 0);
  }
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 15 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 20) {
    image(RockBorder, 0, 0);
  }
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 25 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 30) {
    image(CrystalBorder, 0, 0);
  }
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 35 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 40) {
    image(TechBorder, 0, 0);
  } //sets border according to current room information
}

void RoomBackgroundManager() {

  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 4 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 10) {
    image(GrassBackground2, round(0.02*(-Player1.Position.x+800))-450, round(0.02*(-Player1.Position.y+700)));
    image(GrassBackground, round(0.05*(-Player1.Position.x+800))-600, round(0.05*(-Player1.Position.y+400))-100);
  }
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 15 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 20) {
    image(RockBackground2, round(0.02*(-Player1.Position.x+800))-450, round(0.02*(-Player1.Position.y+700)));
    image(RockBackground, round(0.05*(-Player1.Position.x+800))-350, round(0.05*(-Player1.Position.y+400)));
  } 

  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 25 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 30) {
    tint(128, 128, 128);
    image(CrystalBackground2, (round(0.02*(-Player1.Position.x+800))-450), round(0.02*(-Player1.Position.y+700)));
    noTint();
    //image(RockBackground2, round(0.02*(-Player1.Position.x+800))-450, round(0.02*(-Player1.Position.y+700)));
    image(CrystalBackground, round(0.05*(-Player1.Position.x+800))-350, round(0.05*(-Player1.Position.y+400))-50);
  }
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 35 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 39 || Rooms[RoomX + MoveX][RoomY + MoveY] == 2) {
    tint(128, 128, 128);
    image(TechBackground2, (round(0.02*(-Player1.Position.x+800)))-450, round(0.02*(-Player1.Position.y+700)));
    noTint();
    //image(RockBackground2, round(0.02*(-Player1.Position.x+800))-450, round(0.02*(-Player1.Position.y+700)));
    image(TechBackground, round(0.05*(-Player1.Position.x+800))-350, round(0.05*(-Player1.Position.y+400))-50);
  } //sets image backgrounds and creates a parallax effect by using the inverse of the player's position on the screen and multiplication to slow. As though you were looking at the image from a perspective.
}

void RoomTerrainControl() {
  if (RoomGenerate == true) {
    RoomType();
    RoomGenerate = false;
  } //when you enter a new room by going towards borders, sets roomgenerate to true so it can reset the room information
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 4 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 10) {
    background(#000000);
  }

  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 15 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 19) {
    background(#ffeb52);
  }
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 25 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 29) {
    background(#fd9eff);
  }
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 35 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 39 || Rooms[RoomX + MoveX][RoomY + MoveY] == 2) {
    background(#1E3F66);
  } //sets the colour background information from rooms
}

void RoomTerrainAppearance() {


  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 4 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 10) {
    for (int i = 0; i < 1200; i++) {
      for (int j = 0; j < 800; j++) {
        if (get(i, j) == #00AA00) {
          set(i, j, GrassTileSet.pixels[j*1200+i]);
        }
      }
    }
  }
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 15 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 19) {
    for (int i = 0; i < 1200; i++) {
      for (int j = 0; j < 800; j++) {
        if (get(i, j) == #FFAA00) {
          set(i, j, RockTileSet.pixels[j*1200+i]);
        }
      }
    }
  }
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 25 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 29) {
    for (int i = 0; i < 1200; i++) {
      for (int j = 0; j < 800; j++) {
        if (get(i, j) == #FF00AA) {
          set(i, j, CrystalTileSet.pixels[j*1200+i]);
        }
      }
    }
  } //based on the shapes in the room, which have the colours according to room value. Replace the pixels with a unique value to a tileset that spans the entire screen.
}
