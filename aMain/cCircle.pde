class Circle {


  public float circleAngle = 0;
  public boolean Grounded = false;
  public boolean RectCollision = false;
  public float rayTop = 0;
  public float rayRight = 0;
  public float rayLeft = 0;
  public float rayBottom = 0;
  public float CircleY = 400;
  public float CircleX = 600;
  public float RectangleX = 700;
  public float RectangleY = 300;
  public float CircleRadius = 100;
  public color Colour;
  public Circle(int setX, int setY, int setRadius, color SetColour) {
    this.CircleRadius = setRadius;
    this.CircleY = setY;
    this.CircleX = setX;
    this.Colour = SetColour;
  }
  public void drawCircle() {
    fill(this.Colour);
    ellipse(CircleX, CircleY, CircleRadius*2, CircleRadius*2);
  }
  public void collideCircle() {
    if (dist(Player1.Position.x+19, Player1.Position.y+27, this.CircleX, this.CircleY-6) < 19+this.CircleRadius) {
      if (this.CircleX - (this.CircleRadius +12) < Player1.Position.x + 38
        && this.CircleX + (this.CircleRadius +12) > Player1.Position.x
        && this.CircleY - (this.CircleRadius +12) - 30 < Player1.Position.y + 54
        && this.CircleY > Player1.Position.y) {
        Player1.Velocity.y = 0;
        Player1.Grounded = true;
      } else {
        Player1.Position.y =  Player1.Position.y + 5;
      }
    }
    if (dist(Player1.Position.x+19, Player1.Position.y+27, this.CircleX, this.CircleY) < 19+this.CircleRadius) {
      this.circleAngle = atan2(Player1.Position.y - this.CircleY, Player1.Position.x - this.CircleX);
      Player1.Position.y =  this.CircleRadius * 0.167295779513 * sin(this.circleAngle) + Player1.Position.y;
      Player1.Position.x =  this.CircleRadius * 0.167295779513 * cos(this.circleAngle) + Player1.Position.x;
      Player1.Velocity.y = 0;
      println(circleAngle);
    }
  }
}
