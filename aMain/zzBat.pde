class Bat {
  public float theta = 0.05;
  public PVector Position = new PVector(0, 0);
  public PVector Velocity = new PVector(0, 0);
  public PVector Acceleration = new PVector(0, 0.28);
  public boolean BatLeft = false;
  public float[] LastLapTime = new float [20];
  public float[] DifferenceTime = new float [20];
  public float HealthAmount = 166;
  public float StartTime[] = {millis(), millis(), millis(), millis(), millis(), millis(), millis(), millis(), millis(), millis(), millis(), millis(), millis(), millis(), millis(), millis(), millis()};
  public Bat(int BatPositionX, int BatPositionY, boolean Direction) {
    this.Position.x = BatPositionX;
    this.Position.y = BatPositionY;
    this.BatLeft = Direction;
  }
  public void drawBat() {
    fill(#FF3300);

    this.Position.y = this.Position.y + sin(theta);
    rect(this.Position.x, this.Position.y, 72, 72);
  }
  public void moveBat() {
    for (int w =0; w< 20; w++) {
      LastLapTime[w] = millis();
    }
    this.DifferenceTime[2] = this.LastLapTime[2] - this.StartTime[2];
    if (this.DifferenceTime[2] > 500) {
      this.Velocity.y = -random(3, 7);
      if (this.BatLeft == false) {
        this.Velocity.x += random(5, 10);
      }
      if (this.BatLeft == true) {
        this.Velocity.x -= random(5, 10);
      }
      this.StartTime[2] = millis();
    }
    this.DifferenceTime[0] = this.LastLapTime[0] - this.StartTime[0];
    if (this.DifferenceTime[0] > 2000) {
      this.Velocity.y = random(-30, 30);
      this.Velocity.y = (Player1.Position.y - this.Position.y)/10;
      if (this.BatLeft == false) {
        this.Velocity.x = (Player1.Position.x - this.Position.x)/5;
      }
      if (this.BatLeft == true) {
        this.Velocity.x = (Player1.Position.x - this.Position.x)/5;
      }
      StartTime[0] = millis();
    }
    this.DifferenceTime[1] = this.LastLapTime[1] - this.StartTime[1];
    if (this.DifferenceTime[1] > 7000) {
      this.BatLeft = !this.BatLeft;
      this.StartTime[1] = millis();
    }
    if (this.Velocity.x != 0) {
      this.Velocity.x *= 0.80;
    }
    this.Position = this.Position.add(this.Velocity);
    this.Velocity = this.Velocity.add(this.Acceleration);
  }
  public void collideBat() {
    if (this.Position.x + 72 > 1200) {
      this.Position.x = 1200 - 72;
    }
    if (this.Position.x < 0) {
      this.Position.x = 0;
    }
    if (this.Position.y - 72 > 800) {
      this.Position.y = 800 - 72;
    }
    if (this.Position.y < 0) {
      this.Position.y = 0;
    }
  }
  public void batProperties() {
    if (this.HealthAmount <= 0) {
      bat.remove(this);
    }
  }
}
