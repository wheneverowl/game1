class Spike {
  public int SpikeX = 0;
  public int SpikeY = 0;
  public int SpikeWidth = 0;
  public int RowAmount = 0;


  public Spike(int setSpikeX, int setSpikeY, int setSpikeWidth) {
    this.SpikeX = setSpikeX;
    this.SpikeY = setSpikeY;
    this.SpikeWidth = setSpikeWidth;
    this.RowAmount = round(SpikeWidth/32);
    //sets variables to point x,y and the width defined for the spikes, row amount being the size of the spike sprite being 32, then rounding since it is a int
  }


  public void DrawSpike() {
    fill(#F0F0FF);
    //rect(this.SpikeX, this.SpikeY, this.SpikeWidth, 32);
    for(int w = 0; w < this.RowAmount; w++){
    image(Spikes, this.SpikeX + 32*w, this.SpikeY);
    } //draws spikes according todimensions
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
  } //rectangle collision based on the borders, forces the player up, and random x velocity, plays the hurt particle effect, and takes health poitns away, and also sets the player to grounded so they can jump again
}
