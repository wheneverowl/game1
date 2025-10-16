void RoomGeneration() {
  particle.clear();
  RoomOutBounds();
  RoomBoundaries();
  RoomTerrainControl();
}

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
  }
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
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 35 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 39) {
    tint(128, 128, 128);
    image(TechBackground, (round(0.02*(-Player1.Position.x+800)))-450, round(0.02*(-Player1.Position.y+700)));
    noTint();
    //image(RockBackground2, round(0.02*(-Player1.Position.x+800))-450, round(0.02*(-Player1.Position.y+700)));
    image(TechBackground, round(0.05*(-Player1.Position.x+800))-350, round(0.05*(-Player1.Position.y+400))-50);
  }
}

void RoomTerrainControl() {
  if (RoomGenerate == true) {
    RoomType();
    RoomGenerate = false;
  }
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 4 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 10) {
    background(#000000);
  }

  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 15 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 19) {
    background(#ffeb52);
  }
  if (Rooms[RoomX + MoveX][RoomY + MoveY] >= 25 && Rooms[RoomX + MoveX][RoomY + MoveY] <= 29) {
    background(#fd9eff);
  }
}

void RoomTerrainAppearance() {

  PImage CurrentScreen = get();

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
  }
  for (int i = 0; i < 1200; i++) {
    for (int j = 0; j < 800; j++) {
      if (get(i, j) == #F0F0FF) {
        set(i, j, Spikes);
      }
      if (get(i, j) == #FF0AFF) {
        set(i, j, CurrentScreen.pixels[j*1200+i]);
      }
      if (get(i, j) == #F0F0FF) {
        set(i, j, CurrentScreen.pixels[j*1200+i]);
      }
    }
  }
}
