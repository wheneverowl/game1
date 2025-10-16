
//BallClass.pde

class Ball {
  PVector Position = new PVector(0, 0);
  PVector Velocity = new PVector(int(random(-20,20)), int(random(-3,3)));
  PVector Acceleration = new PVector(0, int(random(0.5,1)));
  public int x;
  public int y;
  public int direction;
  public color  colour;

  public Ball(int setX, int setY, color setColour) {
    this.Position.x = setX;
    this.Position.y = setY;

    this.colour = setColour;
  }

  public void moveBall() {
    Velocity = Velocity.add(Acceleration);
    Position = Position.add(Velocity);
    Velocity = Velocity.add(Acceleration);
    
    fill(this.colour);
    ellipse(this.Position.x, this.Position.y, 30, 30);
    
    if (this.Position.y > 785) {
      this.Position.y = 785;
      this.Velocity.y = -1 * this.Velocity.y;

    }
    if (this.Position.y < 15) {
      this.Position.y = 15;
      this.Velocity.y = -1 * this.Velocity.y;

    }
    if (this.Position.x > 1185) {
      this.Position.x = 1185;
      this.Velocity.x = -1 * this.Velocity.x;
   
    }
    if (this.Position.x < 15) {
      this.Position.x = 15;
      this.Velocity.x = -1 * this.Velocity.x;
 
    }
  }
}
