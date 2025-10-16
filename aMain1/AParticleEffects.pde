void ParticleExplosion() {
  for (int w = 0; w < 10; w++) {
    particle.add(new Particle(0, 1, random(-6, 6), random(-9, 3), Player1.Position.x+19, Player1.Position.y, #FF0000, 0, 6));
  }
} //When the player takes damage, 10 particles with random x and y velocities spawn with gravity starting from the middle bottom of the player

void ParticleJump() {
  for (int w = 0; w < 10; w++) {
    particle.add(new Particle(0, -0.50, random(-3, 3), random(25, 30), Player1.Position.x+19, Player1.Position.y, #FFFFFF, 0, 3));
  } //when you jump release particles that come from the bototmof the player with high intial y velocities downward, with random x velocities. And slow acceleration upawrds
  for (int w = 0; w < 10; w++) {
    particle.add(new Particle(0, -0.50, random(-3, 3), random(25, 30), Player1.Position.x+19, Player1.Position.y, #FFFFFF, 0, 3));
  }
   //when you jump release particles that come from the bototmof the player with high intial y velocities downward, with random x velocities. And slow acceleration upawrds
}

void GrassAmbient() {
  particle.add(new Particle(0, 0, random(-1, 1), random(-1, 1), random(0, width), random(0, height), #00AB00, 0, 1));
}
    //spawns random small green particles with small velocities to imitate fireflies or blossom spores

void RockAmbient() {
  particle.add(new Particle(random(-1, 1), 0, 0, random(-0.50, 0.50), 0, random(0, height), #FFAB00, 1, 1));
}
//spawns particles spanning top and bottom on the left side of the screen that accelerate to the right to imitate windy dust movement

void CrystalAmbient() {
  particle.add(new Particle(0, 0.01, random(-0.50, 0.50), random(-0.50, 0.50), random(0, width), random(0, height/3), #AA00AA, 1, 1));
}
//spawns purple particles on the top of the screen to imitate small particles emanating from the top of the screen

void TechAmbient(){
   particle.add(new Particle(0, -1, random(-0.50, 0.50), random(-0.50, 0.50), random(0, width), height, #33FF33, 1, 1));
}
//particles moving up spawning randomly x from the bottom

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
  if (Rooms[RoomX+MoveX][RoomY+MoveY] >= 35 && Rooms[RoomX+MoveX][RoomY+MoveY] <= 39 || Rooms[RoomX+MoveX][RoomY+MoveY] == 2) {
    TechAmbient();
  }  //according to room value, play the ambient effects in those rooms
  if (Player1.DashActive == true) {
    particle.add(new Particle(-1*Player1.Velocity.x/100, -1*Player1.Velocity.y/100, -1*Player1.Velocity.x, -1*Player1.Velocity.y, Player1.Position.x, Player1.Position.y, #AAAAAA, 0, 1));
  } //adds particles when you jump that are opposite of player's velocity.x and propell downwards
}
