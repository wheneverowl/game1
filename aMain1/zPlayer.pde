class Player {
  public PVector Position = new PVector(581, 373);
  public PVector Velocity = new PVector(0, -10);
  public PVector Acceleration = new PVector(0, 1);

  public boolean PlayerMoveLeft = false;
  public boolean PlayerMoveRight = false;
  public boolean PlayerMoveDown = false;
  public boolean PlayerJump = false;
  public boolean DashActive = false;
  public boolean PlayerNeutral = false;
  public boolean PlayerDoubleJump = false;
  public boolean Grounded = false;

  /*public PVector Collide = new PVector(this.Position.x - this.CircleX, this.Position.y - this.CircleY);
   public boolean RectCollision = false;
   public float rayTop = 0;
   public float rayRight = 0;
   public float rayLeft = 0;
   public float rayBottom = 0;
   public float CircleY = 400;
   public float CircleX = 600;
   public float RectangleX = 700;
   public float RectangleY = 300;
   public float CircleRadius = 100;*/

  public float clickX = 0;
  public float clickY = 0;
  public float dashAngle = 0;
  public float circleAngle = 0;
  public float PlayerDashX = 0;
  public float PlayerDashY = 0;
  public float PlayerWidth = 38;
  public float PlayerHeight = 54;
  public float PlayerX;
  public float PlayerY;
  public color colour;
  public float PlayerLeft;
  public float PlayerRight;
  public float PlayerBottom;
  public float PlayerTop;
  public boolean PlayerFaceLeft;

  public float[] PlayerStartTime = new float [20];
  public float[] PlayerLastLapTime = new float [20];
  public float[] PlayerDifferenceTime = new float [20];


  public Player(int setX, int setY, color setColour) {
    this.Position.x = setX;
    this.Position.y = setY;
    this.colour = setColour;
    this.PlayerLeft = this.Position.x;
    this.PlayerRight = this.Position.x+this.PlayerWidth;
    this.PlayerTop = this.Position.x;
    this.PlayerBottom = this.Position.x+this.PlayerHeight;
  }
  public void AnimationManager() {
    if (this.Grounded == false) {
      Player = loadImage("CharacterSprite/PlayerAirborne.png");
    }
    if (this.Grounded == true) {
      Player = loadImage("CharacterSprite/PlayerIdle.png");
    }
  }
  public void drawPlayer() {
    //strokeWeight(2);
    // fill(this.colour);
    if (DashActive == true) {
      fill(#FF0000);
    }
    //rect(this.Position.x, this.Position.y, 72, 72);

    if (this.PlayerFaceLeft == false) {
      image(Player, this.Position.x, this.Position.y+2);
    }
    if (this.PlayerFaceLeft == true) {
      pushMatrix();
      scale(-1, 1);
      image(Player, -1*this.Position.x-PlayerWidth, this.Position.y+2);
      popMatrix();
    }

    //fill(0, 0);
    //stroke(#FFFFFF);
    //ellipse(this.Position.x+36, this.Position.y+36, 344, 344);
    //ellipse(this.PlayerDashX+this.Position.x+36, this.PlayerDashY+this.Position.y+36, 20, 20);
  }
  public void dashPlayer() {

    dasht = dashk - dash;
    if (dasht > 100) {
      this.DashActive = false;
    }
    if (DashActive == true) {
      this.Velocity.x = PlayerDashX;
      this.Velocity.y = PlayerDashY;
    } //dash time and changes velocity to dash
  }
  public void movePlayer() {

    if (this.PlayerJump == true && Grounded == true) {
      this.Velocity.y = - 17;
      this.PlayerDoubleJump = true;
      PlayerJump = false;
    } //jump adds y velcoity up

    if (this.PlayerDoubleJump == true && this.PlayerJump == true) {
      PlayerDoubleJump = false;
      this.Velocity.y = - 17;
      ParticleJump();
    }


    if (this.Velocity.x != 0 && this.Grounded == true) {
      this.Velocity.x*= 0.60;
    }
    if (this.Velocity.x != 0 && this.Grounded == false) {
      this.Velocity.x*= 0.70;
    }
    /* if (this.Grounded == true && this.Velocity.y != 1) {
     this.Velocity.y *= 1;
     }*/
    this.Position = this.Position.add(this.Velocity);
    this.Velocity = this.Velocity.add(this.Acceleration);


    if (this.Velocity.y >= 50) {
      this.Velocity.y = 50;
    } //terminal velocity


    /*  rect(RectangleX, RectangleY, 250, 100);
     if (this.Position.x < this.RectangleX + 250
     && this.Position.x + 72 > this.RectangleX
     && this.Position.y < this.RectangleY + 100
     && this.Position.y + 72 > this.RectangleY) {
     RectCollision = false;
     rayLeft =  abs(this.Position.x  +72 - RectangleX );
     rayRight = abs(RectangleX + 250 - this.Position.x);
     rayBottom = abs(RectangleY+100 - this.Position.y);
     rayTop= abs( this.Position.y + 72 - RectangleY );
     println(rayLeft, rayRight, rayTop, rayBottom);
     
     if (rayRight < rayLeft &&  rayRight < rayTop && rayRight < rayBottom && RectCollision != true) {
     this.Position.x = RectangleX+250;
     RectCollision = true;
     } else if (rayTop < rayBottom && rayTop < rayLeft && rayTop < rayRight && RectCollision != true) {
     this.Position.y = RectangleY-72;
     this.Velocity.y = 0;
     RectCollision = true;
     Grounded = true;
     } else if (rayBottom < rayTop && rayBottom < rayLeft && rayBottom < rayRight && RectCollision != true) {
     this.Position.y = RectangleY+100;
     RectCollision = true;
     } else if (rayLeft < rayRight &&  rayLeft < rayTop && rayLeft < rayRight && RectCollision != true) {
     this.Position.x = RectangleX-72;
     RectCollision = true;
     }
     }
     
     
    /*   if (rayLeft > rayRight ) {
     this.Position.x = RectangleX+250;
     } else if (rayRight > rayLeft) {
     this.Position.x = RectangleX-72;
     }*/




    /*  if (dist(this.Position.x+36, this.Position.y+36, this.CircleX, this.CircleY) < 36+CircleRadius) {
     if (this.CircleX - (CircleRadius +12) < this.Position.x + 72
     && this.CircleX + (CircleRadius +12) > this.Position.x
     && this.CircleY - (CircleRadius +12) - 30 < this.Position.y + 72
     && this.CircleY > this.Position.y) {
     this.Velocity.y = 0;
     this.Velocity.x = 0;
     Grounded = true;
     } else { this.Position.y =  this.Position.y + 5;}
     }
     if (dist(this.Position.x+36, this.Position.y+36, this.CircleX, this.CircleY) < 32+CircleRadius) {
     this.circleAngle = atan2(this.Position.y - this.CircleY, this.Position.x - this.CircleX);
     this.Position.y =  CircleRadius * 0.167295779513 * sin(this.circleAngle) + this.Position.y;
     this.Position.x =  CircleRadius * 0.167295779513 * cos(this.circleAngle) + this.Position.x;
     this.Velocity.y = 0;
     println(circleAngle);
     }
     ellipse(CircleX, CircleY, 200, 200);
     
     */

    this.PlayerX = this.Position.x;
    this.PlayerY = this.Position.y;


    if (PlayerMoveLeft == true) {
      this.Velocity.x = -15;
    }
    if (PlayerMoveRight == true) {
      this.Velocity.x = 15;
    }
    if (PlayerMoveLeft == true && PlayerMoveRight == true) {
      this.Velocity.x = 0;
    }
    if (Grounded == false) {
      if (PlayerMoveDown == true) {
        this.Velocity.y += 0.50;
      }
    } //based on direction you move changes vlelocitry
    fill(255);

    Grounded = false;
  }
  public void RoomMovement() {
    if (this.Position.y > 800) {
      //this.Grounded = true;
      //this.Velocity.y = 0;
      //this.Position.y = 728;

      MoveY+=1;
      RoomGenerate = true;
      RoomGeneration();

      this.Position.y = 50;
    }
    if (this.Position.y + this.PlayerHeight - 5  < 0) {
      //this.Velocity.y = 0;
      //this.Position.y = 0;

      MoveY-=1;
      RoomGenerate = true;
      RoomGeneration();

      this.Position.y = 700;
    }

    if (this.Position.x > 1200) {
      //this.Position.x = width-72;
      MoveX+=1;
      RoomGenerate = true;
      RoomGeneration();

      this.Position.x = 50;
    }
    if (this.Position.x + this.PlayerWidth - 5 < 0) {
      //this.Position.x = 0;
      MoveX-=1;
      RoomGenerate = true;
      RoomGeneration();

      this.Position.x = 1120;
    }
    if (focused != true) {
      this.PlayerMoveLeft = false;
      this.PlayerMoveRight = false;
      this.PlayerMoveDown = false;
      this.PlayerJump = false;
    } //^ boundaries of the a room changes room based on what door enters 
  }


  public void keyPressed() {
    println(keyCode);
    if (keyCode == 65) {
      this.PlayerMoveLeft = true;
      this.PlayerFaceLeft = true;
    }
    if (keyCode == 68) {
      this.PlayerMoveRight = true;
      this.PlayerFaceLeft = false;
    }
    if (keyCode == 83) {
      this.PlayerMoveDown = true;
    }
    if (keyCode == 32) {
      this.PlayerJump = true;
    }
  }
  public void keyReleased() {
    if (keyCode == 65) {
      this.PlayerMoveLeft = false;
    }
    if (keyCode == 68) {
      this.PlayerMoveRight = false;
    }
    if (keyCode == 83) {
      this.PlayerMoveDown = false;
    }
    if (keyCode == 32) {
      this.PlayerJump = false;
    }
  }
  public void mouseReleased() {
    jumpt = jumpk - jump;
    if (jumpt > 2500 && mouseButton == RIGHT) {
      this.clickX = mouseX;
      this.clickY = mouseY;
      this.dashAngle = degrees((atan2(this.clickY - this.PlayerY+36, this.clickX - this.PlayerX+36)));
      println(dashAngle);
      this.dashAngle = (atan2(this.clickY - this.PlayerY, this.clickX - this.PlayerX));
      this.PlayerDashX = 60*cos(this.dashAngle);
      this.PlayerDashY = 20*sin(this.dashAngle);
      this.DashActive = true;
      jump = millis();
      dash = millis();
    }
  } //uses the circle radi and finds angle from the mouse from player using a base unit vector and finding components to detemrine how far those componentws are
}
