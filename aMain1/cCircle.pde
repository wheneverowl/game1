class Circle {


  public float circleAngle = 0; //intializes angle for repositioning of the character

  public float CircleY = 400;
  public float CircleX = 600; //intializes player x and y

  public float CircleRadius = 100; //sets radius for use in dist function 
  public color Colour; //intializes colour
  public Circle(int setX, int setY, int setRadius, color SetColour) {
    this.CircleRadius = setRadius;
    this.CircleY = setY;
    this.CircleX = setX;
    this.Colour = SetColour; //^ sets value according to values in method
  }
  public void drawCircle() {
    fill(this.Colour);
    ellipse(CircleX, CircleY, CircleRadius*2, CircleRadius*2);
  } //draws the circle according 
  public void collideCircle() {
    if (dist(Player1.Position.x+19, Player1.Position.y+27, this.CircleX, this.CircleY-6) < 19+this.CircleRadius) {
      if (this.CircleX - (this.CircleRadius +12) < Player1.Position.x + 38
        && this.CircleX + (this.CircleRadius +12) > Player1.Position.x
        && this.CircleY - (this.CircleRadius +12) - 30 < Player1.Position.y + 54
        && this.CircleY > Player1.Position.y) { //if topside collision of the circle treats as grounded 
        Player1.Velocity.y = 0;
        Player1.Grounded = true;
      } else {
        Player1.Position.y =  Player1.Position.y + 5;
      } //if bottomside disables the ability to jump and forces you down
    }
    if (dist(Player1.Position.x+19, Player1.Position.y+27, this.CircleX, this.CircleY) < 19+this.CircleRadius) {
      this.circleAngle = atan2(Player1.Position.y - this.CircleY, Player1.Position.x - this.CircleX);
      Player1.Position.y =  this.CircleRadius * 0.167295779513 * sin(this.circleAngle) + Player1.Position.y;
      Player1.Position.x =  this.CircleRadius * 0.167295779513 * cos(this.circleAngle) + Player1.Position.x;
      Player1.Velocity.y = 0;
      println(circleAngle);
    } //^ actual collision, finds the angle from the middle and to the player. Based on that angle finds components of the radi coming from the middle to the player. With the scalar of the radius
  }
}
