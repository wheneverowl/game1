class Rectangle {

  public boolean RectCollision = false;
  public color Colour;
  public float RectangleX = 0;
  public float RectangleY = 0;
  public float RectangleWidth = 0;
  public float RectangleHeight = 0;

  public boolean platform = false;
  public boolean RectTop = false;
  public boolean RectBottom = false;
  public boolean RectRight = false;
  public boolean RectLeft = false;
  public boolean BatRectTop = false;
  public boolean BatRectBottom = false;
  public boolean BatRectRight = false;
  public boolean BatRectLeft = false;

  public Rectangle(int setRectangleX, int setRectangleY, int setRectangleWidth, int setRectangleHeight, boolean IsPlatform, color SetColour) {
    this.RectangleX = setRectangleX;
    this.RectangleY = setRectangleY;
    this.RectangleWidth = setRectangleWidth;
    this.RectangleHeight = setRectangleHeight;
    this.platform = IsPlatform;
    this.Colour = SetColour;
  }

  public void drawRectangle() {
    noStroke();
    noFill();
    fill(this.Colour);
    rect(RectangleX, RectangleY, RectangleWidth, RectangleHeight);
    
  }

  public void collidePlayerRectangle() {
    if (Player1.Position.x < this.RectangleX + this.RectangleWidth
      && Player1.Position.x + 38 > this.RectangleX
      && Player1.Position.y < this.RectangleY + this.RectangleHeight
      && Player1.Position.y + 54 > this.RectangleY) {
      /*this.RectCollision = false;
                                                      /*this.rayLeft =  abs(Player1.Position.x  + 38 - this.RectangleX );
       this.rayRight = abs(this.RectangleX + this.RectangleHeight - Player1.Position.x);
       this.rayBottom = abs(this.RectangleY+this.RectangleHeight - Player1.Position.y);
       this.rayTop= abs( Player1.Position.y + 54 - this.RectangleY );
       // println(rayLeft, rayRight, rayTop, rayBottom);
       
      /*  if (this.rayRight < this.rayLeft &&  this.rayRight < this.rayTop && this.rayRight < this.rayBottom && this.RectCollision != true) {
       Player1.Position.x = RectangleX+RectangleWidth;
       RectCollision = true;
       } else if (this.rayTop < this.rayBottom && this.rayTop < this.rayLeft && this.rayTop < this.rayRight && RectCollision != true) {
       Player1.Position.y = this.RectangleY-72;
       Player1.Velocity.y = 0;
       this.RectCollision = true;
       Player1.Grounded = true;
       } else if (rayBottom < rayTop && rayBottom < rayLeft && rayBottom < rayRight && RectCollision != true) {
       Player1.Position.y = RectangleY+RectangleHeight;
       RectCollision = true;
       } else if (rayLeft < rayRight &&  rayLeft < rayTop && rayLeft < rayRight && RectCollision != true) {
       Player1.Position.x = RectangleX-72;
       RectCollision = true;
       }*/
      if (this.RectTop == true) {
        if (this.platform == false) {
          Player1.Velocity.y *= 0.80;
          Player1.Position.y =this.RectangleY-54;

          Player1.Grounded = true;
        }
        if (this.platform == true && Player1.PlayerMoveDown != true) {
          Player1.Velocity.y *= 0.80;
          Player1.Position.y = this.RectangleY-54;

          Player1.Grounded = true;
        }
      }
      if (this.RectLeft == true && platform == false) {
Player1.Velocity.x = 0;
        Player1.Position.x = this.RectangleX-38;
        
      }

      if (this.RectRight == true && platform == false) {
Player1.Velocity.x = 0;
        Player1.Position.x = this.RectangleX+this.RectangleWidth;
  
      }



      if (RectBottom == true && platform == false) {
        Player1.Position.y = this.RectangleY+this.RectangleHeight;
        Player1.Velocity.y = 1;
      }
    }
    this.RectTop = false;
    this.RectBottom = false;
    this.RectLeft = false;
    this.RectRight = false;
    if (platform == false) {
      if (Player1.Position.x < this.RectangleX + this.RectangleWidth
        && Player1.Position.x + 38 > this.RectangleX
        && Player1.Position.y < this.RectangleY + this.RectangleHeight + this.RectangleHeight
        && Player1.Position.y + 44 > this.RectangleY + this.RectangleHeight) {

        this.RectBottom = true;
      }
      if (Player1.Position.x < this.RectangleX + this.RectangleWidth + this.RectangleWidth
        && Player1.Position.x + 38 > this.RectangleX + this.RectangleWidth
        && Player1.Position.y < this.RectangleY + this.RectangleHeight
        && Player1.Position.y + 44 > this.RectangleY ) {

        this.RectRight = true;
      }
      if (Player1.Position.x < this.RectangleX
        && Player1.Position.x + 38 > this.RectangleX - this.RectangleWidth
        && Player1.Position.y < this.RectangleY + this.RectangleHeight
        && Player1.Position.y + 44 > this.RectangleY ) {

        this.RectLeft = true;
      }
      if (Player1.Position.x < this.RectangleX + this.RectangleWidth
        && Player1.Position.x + 38 > this.RectangleX
        && Player1.Position.y  < this.RectangleY + this.RectangleHeight
        && Player1.Position.y + 44 > this.RectangleY-this.RectangleHeight ) {
        this.RectTop = true;
      }
    }
    if (platform == true) {
      if (Player1.Position.x < this.RectangleX + this.RectangleWidth
        && Player1.Position.x + 38 > this.RectangleX
        && Player1.Position.y < this.RectangleY-Player1.PlayerHeight+8
        && Player1.Position.y + 48 > this.RectangleY-Player1.PlayerHeight) {
        this.RectTop = true;
      }
    }
  }
  public void collideBatRectangle() {
    for (int i = 0; i < bat.size(); i++) {
      if (bat.get(i).Position.x < this.RectangleX + this.RectangleWidth
        && bat.get(i).Position.x + 72 > this.RectangleX
        && bat.get(i).Position.y < this.RectangleY + this.RectangleHeight
        && bat.get(i).Position.y + 72 > this.RectangleY) {
        this.RectCollision = false;
        //println(rayLeft, rayRight, rayTop, rayBottom);

        /*  if (this.rayRight < this.rayLeft &&  this.rayRight < this.rayTop && this.rayRight < this.rayBottom && this.RectCollision != true) {
         bat.get(i).Position.x = RectangleX+RectangleWidth;
         RectCollision = true;
         } else if (this.rayTop < this.rayBottom && this.rayTop < this.rayLeft && this.rayTop < this.rayRight && RectCollision != true) {
         bat.get(i).Position.y = this.RectangleY-72;
         bat.get(i).Velocity.y = 0;
         this.RectCollision = true;
         bat.get(i).Grounded = true;
         } else if (rayBottom < rayTop && rayBottom < rayLeft && rayBottom < rayRight && RectCollision != true) {
         bat.get(i).Position.y = RectangleY+RectangleHeight;
         RectCollision = true;
         } else if (rayLeft < rayRight &&  rayLeft < rayTop && rayLeft < rayRight && RectCollision != true) {
         bat.get(i).Position.x = RectangleX-72;
         RectCollision = true;
         }*/
        if (BatRectRight == true && platform == false) {
          bat.get(i).Position.x = RectangleX+RectangleWidth;
        }
        if (BatRectTop == true && platform == false) {
          bat.get(i).Position.y = RectangleY-72;
        }

        if (BatRectBottom == true && platform == false) {
          bat.get(i).Position.y = RectangleY+RectangleHeight;
        }
        if (BatRectLeft == true && platform == false) {
          bat.get(i).Position.x = RectangleX-72;
        }

        if (bat.get(i).Position.x < this.RectangleX + this.RectangleWidth
          && bat.get(i).Position.x + 72 > this.RectangleX
          && bat.get(i).Position.y < this.RectangleY
          && bat.get(i).Position.y + 72 > this.RectangleY-this.RectangleHeight) {
          BatRectTop = true;
          BatRectBottom = false;
          BatRectRight = false;
          BatRectLeft = false;
        }
        if (bat.get(i).Position.x < this.RectangleX + this.RectangleWidth
          && bat.get(i).Position.x + 72 > this.RectangleX
          && bat.get(i).Position.y < this.RectangleY + this.RectangleHeight + this.RectangleHeight
          && bat.get(i).Position.y + 72 > this.RectangleY + this.RectangleHeight) {
          BatRectTop = false;
          BatRectBottom = true;
          BatRectRight = false;
          BatRectLeft = false;
        }
        if (bat.get(i).Position.x < this.RectangleX + this.RectangleWidth + this.RectangleWidth
          && bat.get(i).Position.x + 72 > this.RectangleX + this.RectangleWidth
          && bat.get(i).Position.y < this.RectangleY + this.RectangleHeight
          && bat.get(i).Position.y + 72 > this.RectangleY) {
          BatRectTop = false;
          BatRectBottom = false;
          BatRectRight = true;
          BatRectLeft = false;
        }
        if (bat.get(i).Position.x < this.RectangleX
          && bat.get(i).Position.x + 72 > this.RectangleX - this.RectangleWidth
          && bat.get(i).Position.y < this.RectangleY + this.RectangleHeight
          && bat.get(i).Position.y + 72 > this.RectangleY) {
          BatRectTop = false;
          BatRectBottom = false;
          BatRectRight = false;
          BatRectLeft = true;
        }
      }
    }
  }
}
