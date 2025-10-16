class Particle {
  public PVector Acceleration = new PVector (0, 0);
  public PVector Velocity = new PVector (0, 0);
  public PVector Position = new PVector(0, 0);
  public color ParticleColour;
  public int Shape;
  public int Size;

  public Particle(float setAccelerationX, float setAccelerationY, float setVelocityX, float setVelocityY, float setPositionX, float setPositionY, color setColour, int setShape, int setSize) {
    this.Acceleration.x = setAccelerationX;
    this.Acceleration.y = setAccelerationY;
    this.Velocity.y = setVelocityY;
    this.Velocity.x = setVelocityX;
    this.Position.x = setPositionX;
    this.Position.y = setPositionY;
    this.ParticleColour = setColour;
    this.Shape = setShape;
    this.Size = setSize;
  }

  public void DrawShape() {
    stroke(this.ParticleColour);
    fill(this.ParticleColour);
    if (Shape == 0) {
      ellipse(this.Position.x, this.Position.y, this.Size, this.Size);
    }
    if (Shape == 1) {
      rect(this.Position.x, this.Position.y, this.Size, this.Size);
    }
  }
  public void MoveShape() {
    this.Position = this.Position.add(this.Velocity);
    this.Velocity = this.Velocity.add(this.Acceleration);
    this.Position = this.Position.add(this.Velocity);

    if (Velocity.y > 20) {
      Velocity.y = 20;
    }
    if (Velocity.y < -20) {
      Velocity.y = -20;
    }
    if (Velocity.x > 20) {
      Velocity.x = 20;
    }
    if (Velocity.x < -20) {
      Velocity.x = -20;
    }

    if (this.Position.x > width || this.Position.x < 0) {
      particle.remove(this);
    }
    if (this.Position.y > height || this.Position.y < 0) {
      particle.remove(this);
    }
  }
}
