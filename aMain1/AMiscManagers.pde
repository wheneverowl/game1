void Seed() {
}

void HealthManager() {
  if (HealthPoints <= 0) {
    GameState = 3;
  } //if health goes below 0, only way through spike in spawn, goes back to main menu
  fill(#FF0000);

  rect(40, 40, HealthPoints*2, 60); //draws healthbar according to health point value
} 
