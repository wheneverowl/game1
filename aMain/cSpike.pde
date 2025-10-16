class Spike {
  int SpikeX = 0;
  int SpikeY = 0;
  int SpikeWidth = 0;


  public Spike(int setSpikeX, int setSpikeY, int setSpikeWidth) {
    this.SpikeX = setSpikeX;
    this.SpikeY = setSpikeY;
    this.SpikeWidth = setSpikeWidth;
  }


  public void DrawSpike() {
    fill(#F0F0FF);
    rect(this.SpikeX, this.SpikeY, this.SpikeWidth, 1);
  }

  public void CollideSpike() {
    if (Player1.Position.x < this.SpikeX + this.SpikeWidth
      && Player1.Position.x + 38 > this.SpikeX
      && Player1.Position.y < this.SpikeY + 1
      && Player1.Position.y + 54 > this.SpikeY) {
      if (CanDamage == true) {
        Player1.Grounded = true;
        Player1.Velocity.y += -18;
        Player1.Velocity.x += random(-15, 15);
        ParticleExplosion();  
        HealthPoints-= 5;
        CanDamage = false;
      }
    }
  }
}
