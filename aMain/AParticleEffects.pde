void ParticleExplosion() {
  for (int w = 0; w < 10; w++) {
    particle.add(new Particle(0, 1, random(-6, 6), random(-9, 3), Player1.Position.x+19, Player1.Position.y, #FF0000, 0, 6));
  }
}

void ParticleJump() {
  for (int w = 0; w < 10; w++) {
    particle.add(new Particle(0, -0.50, random(-3, 3), random(25, 30), Player1.Position.x+19, Player1.Position.y, #FFFFFF, 0, 3));
  }
  for (int w = 0; w < 10; w++) {
    particle.add(new Particle(0, -0.50, random(-3, 3), random(25, 30), Player1.Position.x+19, Player1.Position.y, #FFFFFF, 0, 3));
  }
}

void GrassAmbient() {
  particle.add(new Particle(0, 0, random(-1, 1), random(-1, 1), random(0, width), random(0, height), #00AB00, 0, 1));
}

void RockAmbient() {
  particle.add(new Particle(random(-1,1), 0, 0, random(-0.50, 0.50), 0, random(0, height), #FFAB00, 1, 1));
}

void CrystalAmbient() {
  particle.add(new Particle(0, 0.01, random(-0.50,0.50), random(-0.50, 0.50), random(0,width), random(0, height/3), #AA00AA, 1, 1));
}

void ParticleManager() {
  if (Rooms[RoomX+MoveX][RoomY+MoveY] >= 4 && Rooms[RoomX+MoveX][RoomY+MoveY] <= 9) {
    GrassAmbient();
  }
  if (Rooms[RoomX+MoveX][RoomY+MoveY] >= 15 && Rooms[RoomX+MoveX][RoomY+MoveY] <= 19) {
    RockAmbient();
  }
  if (Rooms[RoomX+MoveX][RoomY+MoveY] >= 25 && Rooms[RoomX+MoveX][RoomY+MoveY] <= 29) {
    CrystalAmbient();
  }
  if(Player1.DashActive == true){
      particle.add(new Particle(-1*Player1.Velocity.x/100, -1*Player1.Velocity.y/100, -1*Player1.Velocity.x, -1*Player1.Velocity.y, Player1.Position.x, Player1.Position.y, #AAAAAA, 0, 1));
  }
}
