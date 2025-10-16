class Triangle {


  //public boolean[] RayTriangle = new boolean[3];
  /*public float floater = 0;
  public float placerX = 0;
  public float placerY = 0;
  public float InscribedX1;
  public float InscribedX2;
  public float InscribedY1;
  public float InscribedY2;*/
  public PVector Mid = new PVector(0, 0);
  //public float[] Edges = new float [3];
  //public float[] Rays = new float[3];
  public float[] PlacerX = new float[3];
  public float[] PlacerY = new float[3];
  public float[] Slope = new float[6];


  public float[] Sign = new float[3];
  public float[] MidSign = new float[3];
  public float[] HoverSign = new float[3];

  public float[] SetComparisonX = new float[3];
  public float[] SetComparisonY = new float[3];
  public float[] PlayerComparisonX = new float[3];
  public float[] PlayerComparisonY = new float[3];

  public float[] PlayerSlope = new float[3];
  public float[] PlayerIntercept =new float[3];

  public float[] ComparisonX = new float[3];
  public float[] ComparisonY = new float[3];

  public float[] MidComparisonX = new float[3];
  public float[] MidComparisonY = new float[3];

  public float[] MidIntercept = new float[3];
  public float[] Intercepts = new float[6];
 // public float[] Inscribed = new float[8];
 // public float[] AreaOne = new float[4];
 // public float[] AreaTwo = new float[4];
 // public float[] AreaThree = new float[4];

  public boolean[] SidesCollision = new boolean[3];
  public boolean[] InsideTriangle = new boolean[3];
  public PVector Point1 = new PVector(0, 0);
  public PVector Point2 = new PVector(0, 0);
  public PVector Point3 = new PVector(0, 0);
 // public float[] ImaginaryPointX = new float[3];
 // public float[] ImaginaryPointY = new float[3];
  public int Placer;
  public color Colour;

  public float x1;      // three points of the triangle
  public float y1;
  public float x2;
  public float y2;
  public float x3;
  public float y3;
  /*
  public float hx1;      // hover points of the triangle that is above the reg triangle
  public float hy1;
  public float hx2;
  public float hy2;
  public float hx3;
  public float hy3;
*/




  public Triangle(float setX1, float setY1, float setX2, float setY2, float setX3, float setY3, int setplacer, int SetColour) {
    this.x1 = setX1;
    this.y1 = setY1;
    this.x2 = setX2;
    this.y2 = setY2;
    this.x3 = setX3;
    this.y3 = setY3;
    this.Colour = SetColour; //set values of the triangle according to emthod
    /*
    this.hx1 = this.x1;
    this.hx2 = this.x2;
    this.hx3 = this.x3;
    this.hy1 = this.y1-36;
    this.hy2 = this.y2-36;
    this.hy3 = this.y3-36;
    
    this.InscribedX1 = min(x1, x2, x3);
     this.InscribedX2 = max(x1, x2, x3);
     this.InscribedY1 = min(y1, y2, y3);
     this.InscribedY2 = max(y1, y2, y3);
     */

    this.Point1.set(this.x1, this.y1);
    this.Point2.set(this.x2, this.y2);
    this.Point3.set(this.x3, this.y3);
    Mid.set(((this.Point1.x + this.Point2.x + this.Point3.x)/3), ((this.Point1.y + this.Point2.y + this.Point3.y)/3));
    this.MidSign[0] = (this.Point2.x-this.Point1.x)*(this.Mid.y-this.Point1.y)-(this.Point2.y-this.Point1.y)*(this.Mid.x-this.Point1.x);
    this.MidSign[1] = (this.Point3.x-this.Point1.x)*(this.Mid.y-this.Point1.y)-(this.Point3.y-this.Point1.y)*(this.Mid.x-this.Point1.x);
    this.MidSign[2] = (this.Point2.x-this.Point3.x)*(this.Mid.y-this.Point3.y)-(this.Point2.y-this.Point3.y)*(this.Mid.x-this.Point3.x);
    // uses cross product to determine whether a point is on what side of the line, this determiens where the middles are according to the 2 points of a triangle. This can bbe used to compared vlaues as the sign to a cross products of palyer
  }

  public void drawTriangle() {
    fill(this.Colour);
    noStroke();
    triangle(x1, y1, x2, y2, x3, y3);
    noFill();
    println(Point1.x, Point1.y);
  } //dras triangles to dimensiosn defined

  public void collideTriangle() {


    this.Slope[3] = ((Player1.Position.y+27)-this.y1)/((Player1.Position.x+19)-this.x1);
    this.Intercepts[3]=this.y1-Slope[3]*this.x1;
    this.Slope[4] = ((Player1.Position.y+27)-this.y2)/((Player1.Position.x+19)-this.x2);
    this.Intercepts[4]=this.y2-Slope[4]*this.x2;
    this.Slope[5] = ((Player1.Position.y+27)-this.y3)/((Player1.Position.x+19)-this.x3);
    this.Intercepts[5]=this.y3-Slope[5]*this.x3; //uses slopes

    /*  line(Player1.Position.x+36, Player1.Position.y+36, x1, y1);
     line(Player1.Position.x+36, Player1.Position.y+36, x2, y2);
     line(Player1.Position.x+36, Player1.Position.y+36, x3, y3);*/




    this.PlacerX[0]=(this.Intercepts[0]-this.Intercepts[5])/(this.Slope[5]-this.Slope[0]);
    this.PlacerX[1]=(this.Intercepts[1]-this.Intercepts[3])/(this.Slope[3]-this.Slope[1]);
    this.PlacerX[2]=(this.Intercepts[2]-this.Intercepts[4])/(this.Slope[4]-this.Slope[2]);
    this.PlacerY[0]=this.Slope[0]*this.PlacerX[0]+this.Intercepts[0];
    this.PlacerY[1]=this.Slope[1]*this.PlacerX[1]+this.Intercepts[1];
    this.PlacerY[2]=this.Slope[2]*this.PlacerX[2]+this.Intercepts[2];
    //places are just angles according to slopes of the side of the triangels 

    /*
    for (int w = 0; w < 3; w++) {
      this.PlayerIntercept[w] = Player1.Position.y+28-this.PlayerSlope[w]*Player1.Position.x+19;

      this.ComparisonX[w] = (this.Intercepts[w]-this.PlayerIntercept[w])/(this.PlayerSlope[w]-this.Slope[w]);

      this.ComparisonY[w] = this.PlayerSlope[w]*this.ComparisonX[w]+this.PlayerIntercept[w];

      this.MidIntercept[w] = this.Mid.y-this.PlayerSlope[w]*this.Mid.x;

      this.MidComparisonX[w] = (this.Intercepts[w]-this.MidIntercept[w])/(this.PlayerSlope[w]-this.Slope[w]);

      this.MidComparisonY[w] = this.PlayerSlope[w]*this.MidComparisonX[w]+this.MidIntercept[w];



      fill(#FFFFFF);
      ellipse(this.ComparisonX[w], this.ComparisonY[w], 10, 10);
    }

    if (this.MidComparisonX[0] > this.Mid.x) {
      this.SetComparisonX[0] = 1;
    }
    if (this.MidComparisonX[0] < this.Mid.x) {
      this.SetComparisonX[0] = 0;
    }
    if (this.MidComparisonY[0] > this.Mid.y) {
      this.SetComparisonY[0] = 1;
    }
    if (this.MidComparisonY[0] < this.Mid.y) {
      this.SetComparisonY[0] = 0;
    }
    if (this.MidComparisonX[1] > this.Mid.x) {
      this.SetComparisonX[1] = 1;
    }
    if (this.MidComparisonX[1] < this.Mid.x) {
      this.SetComparisonX[1] = 0;
    }
    if (this.MidComparisonY[1] > this.Mid.y) {
      this. SetComparisonY[1] = 1;
    }
    if (this.MidComparisonY[1] < this.Mid.y) {
      this.SetComparisonY[1] = 0;
    }
    if (this.MidComparisonX[2] > this.Mid.x) {
      this. SetComparisonX[2] = 1;
    }
    if (this.MidComparisonX[2] < this.Mid.x) {
      this.SetComparisonX[2] = 0;
    }
    if (this.MidComparisonY[2] > this.Mid.y) {
      this.SetComparisonY[2] = 1;
    }
    if (this.MidComparisonY[2] < this.Mid.y) {
      this.SetComparisonY[2] = 0;
    }

    if (this.ComparisonX[0] > Player1.Position.x + 19 ) {
      this.PlayerComparisonX[0] = 1;
    }
    if (this.ComparisonX[0] < Player1.Position.x+ 19 ) {
      this.PlayerComparisonX[0] = 0;
    }
    if (this.ComparisonY[0] > Player1.Position.y + 27 ) {
      this.PlayerComparisonY[0] = 1;
    }
    if (this.ComparisonY[0] < Player1.Position.y  + 27 ) {
      this.PlayerComparisonY[0] = 0;
    }
    if (this.ComparisonX[1] > Player1.Position.x  + 19) {
      this.PlayerComparisonX[1] = 1;
    }
    if (this.ComparisonX[1] < Player1.Position.x + 19) {
      this.PlayerComparisonX[1] = 0;
    }
    if (this.ComparisonY[1] > Player1.Position.y + 27) {
      this.PlayerComparisonY[1] = 1;
    }
    if (this.ComparisonY[1] < Player1.Position.y + 27 ) {
      this.PlayerComparisonY[1] = 0;
    }
    if (this.ComparisonX[2] > Player1.Position.x + 19) {
      this.PlayerComparisonX[2] = 1;
    }
    if (this.ComparisonX[2] < Player1.Position.x + 19 ) {
      this.PlayerComparisonX[2] = 0;
    }
    if (this.ComparisonY[2] > Player1.Position.y + 27) {
      this.PlayerComparisonY[2] = 1;
    }
    if (this.ComparisonY[2] < Player1.Position.y + 27) {
      this.PlayerComparisonY[2] = 0;
    }

    fill(#FF00FF);
    ellipse(this.ComparisonX[0], this.ComparisonY[0], 10, 10);
    fill(#FFFFFF);
    ellipse(this.ComparisonX[1], this.ComparisonY[1], 10, 10);
    fill(#FFFF00);
    ellipse(this.ComparisonX[2], this.ComparisonY[2], 10, 10);
    */

    // this.TotalSign = (this.Point2.x-this.Point1.x)*(this.Point3.y-this.Point1.y)-(this.Point2.y-this.Point1.y)*(this.Point3.x-this.Point1.x);
    this.Sign[0] = (this.Point2.x-this.Point1.x)*(Player1.Position.y+27-this.Point1.y)-(this.Point2.y-this.Point1.y)*(Player1.Position.x+19-this.Point1.x);
    this.Sign[1] = (this.Point2.x-this.Point3.x)*(Player1.Position.y+27-this.Point3.y)-(this.Point2.y-this.Point3.y)*(Player1.Position.x+19-this.Point3.x);
    this.Sign[2] = (this.Point3.x-this.Point1.x)*(Player1.Position.y+27-this.Point1.y)-(this.Point3.y-this.Point1.y)*(Player1.Position.x+19-this.Point1.x);

    this.HoverSign[0] = (this.Point2.x-this.Point1.x)*((Player1.Position.y+7)-(this.Point1.y-20))-((this.Point2.y-20)-(this.Point1.y-20))*(Player1.Position.x+9-this.Point1.x);
    this.HoverSign[1] = (this.Point2.x-this.Point3.x)*((Player1.Position.y+7)-(this.Point3.y-20))-((this.Point2.y-20)-(this.Point3.y-20))*(Player1.Position.x+9-this.Point3.x);
    this.HoverSign[2] = (this.Point3.x-this.Point1.x)*((Player1.Position.y+7)-(this.Point1.y-20))-((this.Point3.y-20)-(this.Point1.y-20))*(Player1.Position.x+9-this.Point1.x);
    //signs that comprae the sides of the triangel usign cross product wit the crosss products from the middle the triangle to find when ti is colliding 
    
    if (
      ((this.HoverSign[0] >= 0 && this.MidSign[0] >= 0) || (this.HoverSign[0] <= 0 && this.MidSign[0] <= 0))
      && ((this.HoverSign[1] >= 0 && this.MidSign[1] >= 0) || (this.HoverSign[1] <= 0 && this.MidSign[1] <= 0))
      && ((this.HoverSign[2] >= 0 && this.MidSign[2] >= 0) || (this.HoverSign[2] <= 0 && this.MidSign[2] <= 0))
      ) {
      Player1.Velocity.y = 3;
      Player1.Grounded = true;
    }

    if (
      ((this.Sign[0] >= 0 && this.MidSign[0] >= 0) || (this.Sign[0] <= 0 && this.MidSign[0] <= 0))
      && ((this.Sign[1] >= 0 && this.MidSign[1] >= 0) || (this.Sign[1] <= 0 && this.MidSign[1] <= 0))
      && ((this.Sign[2] >= 0 && this.MidSign[2] >= 0) || (this.Sign[2] <= 0 && this.MidSign[2] <= 0))
      ) {

      if (SidesCollision[0] == true) {
        Player1.Position.x = this.PlacerX[0]-19;
        Player1.Position.y = this.PlacerY[0]-28;
      } else if (SidesCollision[1] == true) {
        Player1.Position.x = this.PlacerX[1]-19;
        Player1.Position.y = this.PlacerY[1]-28;
      } else if (SidesCollision[2] == true) {
        Player1.Position.x = this.PlacerX[2]-19;
        Player1.Position.y = this.PlacerY[2]-28;
      }
    }

  /*  if (this.PlayerComparisonY[2] == this.SetComparisonY[2]
      && this.PlayerComparisonX[2] == this.SetComparisonX[2]
      && this.PlayerComparisonY[1] == this.SetComparisonY[1]
      && this.PlayerComparisonX[1] == this.SetComparisonX[1]
      && this.PlayerComparisonY[0] != this.SetComparisonY[0]
      && this.PlayerComparisonX[0] != this.SetComparisonX[0]) {
      this.SidesCollision[0] = true;
      this.SidesCollision[2] = false;
      this.SidesCollision[1] = false;
    }

    if (this.PlayerComparisonY[1] == this.SetComparisonY[1]
      && this.PlayerComparisonX[1] == this.SetComparisonX[1]
      && this.PlayerComparisonY[0] == this.SetComparisonY[0]
      && this.PlayerComparisonX[0] == this.SetComparisonX[0]
      && this.PlayerComparisonY[2] != this.SetComparisonY[2]
      && this.PlayerComparisonX[2] != this.SetComparisonX[2] ) {
      this.SidesCollision[0] = false;
      this.SidesCollision[2] = true;
      this.SidesCollision[1] = false;
    }


    if (this.PlayerComparisonY[2] == this.SetComparisonY[2]
      && this.PlayerComparisonX[2] == this.SetComparisonX[2]
      && this.PlayerComparisonY[0] == this.SetComparisonY[0]
      && this.PlayerComparisonX[0] == this.SetComparisonX[0]
      && this.PlayerComparisonY[1] != this.SetComparisonY[1]
      && this.PlayerComparisonX[1] != this.SetComparisonX[1]) {
      this.SidesCollision[0] = false;
      this.SidesCollision[1] = true;
      this.SidesCollision[2] = false;
    }
    */
    if ((this.Sign[0] >= 0 && this.MidSign[0] <= 0) || (this.Sign[0] <= 0 && this.MidSign[0] >= 0)) {
      this.SidesCollision[0] = true;
      this.SidesCollision[2] = false;
      this.SidesCollision[1] = false;
    }
    if ((this.Sign[1] >= 0 && this.MidSign[1] <= 0) || (this.Sign[1] <= 0 && this.MidSign[1] >= 0)) {
      this.SidesCollision[0] = false;
      this.SidesCollision[2] = false;
      this.SidesCollision[1] = true;
    }
    if ((this.Sign[2] >= 0 && this.MidSign[2] <= 0) || (this.Sign[2] <= 0 && this.MidSign[2] >= 0)) {
      this.SidesCollision[0] = false;
      this.SidesCollision[2] = true;
      this.SidesCollision[1] = false;
    } //cejks what side of thet riagnel it sios n to do the collsion


    println(SidesCollision[0], SidesCollision[1], SidesCollision[2]);




    //Cross Product, uses signs whether to check if a point is on either side of a line(not Heron's formula)

    /*
      
     
     \  /                          /
     \/                          /
     /  \                -       /       +
     /    \                      /                                                                +
     /  *   \                                                                              ----------------
     _ /________\__                                                                                   -
     /          \
     
     Works similar to the rectangular collision, however instead of just checking whether the point is above, below a certain. It checks what side
     of the line. This can also be solved using slopse, but there are many problems and bugs. having an infinite slope or a 0 slope doesn't allow for collisions
     It also becomes difficult to check on where to place and when it's just onlycolliding. It finds the signs of each side of the triangle by first comparing it from the
     middle of triangle, and then checks whether if the player is inside the triangle if the signs of those made from the comparison of the middle of the triangle is the same
     as the signs of those when comparing against the player. us
     
     */
    // println(TotalSign, Sign[0], Sign[1], Sign[2]);
    println(MidSign[0], MidSign[1], MidSign[2]);

















    //line(0, 200, x3, y3);

    this.Slope[0] = (this.y2-this.y1)/( this.x2-this.x1);
    this.Slope[1] = (this.y3-this.y2)/( this.x3-this.x2);
    this.Slope[2] = (this.y1-this.y3)/( this.x1-this.x3);
    this.PlayerSlope[0] = -1*(1/this.Slope[0]);
    this.PlayerSlope[1] = -1*(1/this.Slope[1]);
    this.PlayerSlope[2] = -1*(1/this.Slope[2]);
    if (this.x2 - this.x1 == 0) {
      Slope[0] = 1600;
    }
    if (this.x3 - this.x2 == 0) {
      Slope[1] = 1600;
    }
    if (this.x1 - this.x3 == 0) {
      Slope[2] = 1600;
    }
    for (int w = 0; w < 3; w++) {

      if (this.PlayerSlope[w] == abs(0/1)) {
        this.PlayerSlope[w] = 1600;
      }
    }
    //println(this.Slope[0], this.Slope[1], this.Slope[2]);
    this.Intercepts[0]=this.y1-this.Slope[0]*this.x1;
    this.Intercepts[1]=this.y2-this.Slope[1]*this.x2;
    this.Intercepts[2]=this.y3-this.Slope[2]*this.x3;
    /* stroke(#FFFFFF);
     line(0, Intercepts[0], x1, y1);
     line(0, Intercepts[1], x2, y2);
     line(0, Intercepts[2], x3, y3);
     
     //placerY=Slope[3]*placerX+Intercepts[3];
     //
     //
     //
     
     
                                                                                                                                                                                                /*  Mid1X = (x1 + x2)/2;
     Mid2X = (x2 + x3)/2;
     Mid3X = (x3 + x1)/2;
     
     Mid1Y = (y1 + y2)/2;
     Mid2Y = (y2 + y3)/2;
     Mid3Y = (y3 + y1)/2;
     */


    // line(MidX, MidY, Player1.Position.x+32, Player1.Position.y+32);

    //y=mx+b
    //b=y-mx
    //  line(0, Intercepts[3], MidX, MidY);



    //println(PlayerSlope[0], PlayerSlope[1], PlayerSlope[2], Slope[0], Slope[1], Slope[2], MidIntercept[0], Intercepts[0], this.PlayerSlope[0], this.Slope[0], this.MidComparisonX[0]);


















    /* Mid1Ray = sqrt((Player1.Position.y+36 - Mid1Y) * ( Player1.Position.y+36 - Mid1Y) + sq( Player1.Position.x+36 - Mid1X));
     Mid2Ray = sqrt((Player1.Position.y+36 - Mid2Y) * ( Player1.Position.y+36 - Mid2Y) + sq( Player1.Position.x+36 - Mid2X));
     Mid3Ray = sqrt((Player1.Position.y+36 - Mid3Y) * ( Player1.Position.y+36 - Mid3Y) + sq( Player1.Position.x+36 - Mid3X));*/

    /*this.Rays[0] = sqrt((Player1.Position.y+36 - this.y1) * ( Player1.Position.y+36 - this.y1) + sq( Player1.Position.x+36 - this.x1));
     this.Rays[1] = sqrt((Player1.Position.y+36 - this.y2) * ( Player1.Position.y+36 - this.y2) + sq( Player1.Position.x+36 - this.x2));
     this.Rays[2] = sqrt((Player1.Position.y+36 - this.y3) * ( Player1.Position.y+36 - this.y3) + sq( Player1.Position.x+36 - this.x3));
     
     this.Edges[0] = sqrt((this.y2 - this.y1) * ( this.y2 - this.y1) + sq( this.x2 - this.x1));
     this.Edges[1] = sqrt((this.y3 - this.y2) * ( this.y3 - this.y2) + sq( this.x3 - this.x2));
     this.Edges[2] = sqrt((this.y1 - this.y3) * ( this.y1 - this.y3) + sq( this.x1 - this.x3));*/

    /* ImaginaryPointX[0] = (x1 + x2)/2;
     ImaginaryPointX[1] = (x2 + x3)/2;
     ImaginaryPointX[2] = (x3 + x1)/2;
     ImaginaryPointY[0] = (y1 + y2)/2;
     ImaginaryPointY[1] = (y2 + y3)/2;
     ImaginaryPointY[2] = (y3 + y1)/2;
    /*  for (int w = 0; w < 3; w++) {
     if (this.ImaginaryPointY[w] > this.MidY) {
     this.ImaginaryPointY[w]=this.ImaginaryPointY[w] + 300;
     }
     if (this.ImaginaryPointY[w] < this.MidY) {
     this.ImaginaryPointY[w]=this.ImaginaryPointY[w] - 300;
     }
     if (this.ImaginaryPointY[w] == this.MidY) {
     this.ImaginaryPointY[w]=this.ImaginaryPointY[w];
     }
     if (this.ImaginaryPointX[w] > this.MidX) {
     this.ImaginaryPointX[w]=this.ImaginaryPointX[w] + 350;
     }
     if (this.ImaginaryPointX[w] < this.MidX) {
     this.ImaginaryPointX[w]=this.ImaginaryPointX[w] - 350;
     }
     if (this.ImaginaryPointX[w] == this.MidX) {
     this.ImaginaryPointX[w]=this.ImaginaryPointX[w];
     }
     }
     */
    /* println(Rays[0], Rays[1], Rays[2]);
     println(Edges[0], Edges[1], Edges[2]);
     
     println() ;
     */
    //println(Mid1Ray, Mid2Ray, Mid3Ray);
    /*  float Jefferson = min(Mid1Ray, Mid2Ray, Mid3Ray);
     if (Jefferson == Mid1Ray) {
     stroke(#FF0000);
     } else if (Jefferson == Mid2Ray) {
     stroke(#00FF00);
     } else if (Jefferson == Mid3Ray) {
     stroke(#0000FF);
     }
     rect(200, 200, Mid1Ray, 20);
     rect(200, 250, Mid2Ray, 20);
     rect(200, 300, Mid3Ray, 20);
     stroke(#FF0000);
     line(x3, y3, Player1.Position.x+36, Player1.Position.y+36);
     stroke(#00FF00);
     line(x2, y2, Player1.Position.x+36, Player1.Position.y+36);
     stroke(#0000FF);
     line(x1, y1, Player1.Position.x+36, Player1.Position.y+36);
     noFill();
     rect(RectX1, RectY1, RectX2 - RectX1, RectY2 - RectY1);
     rectMode(CORNER);
     noFill();
     stroke(#FFFFFF);
     line(MidX, MidY, Player1.Position.x+36, MidY );
     line(MidX, MidY, MidX, Player1.Position.y+36);
     */



    //fill(#000000, 00);
    //stroke(#FFFFFF);

    // point(MidX, MidY);
    fill(#FFFFFF, 32);


    /*
    fill(#FF0000);
     rect(PlacerX[0], PlacerY[0], 20, 20);
     fill(#00FF00);
     rect(PlacerX[1], PlacerY[1], 20, 20);
     fill(#0000FF);
     rect(PlacerX[2], PlacerY[2], 20, 20);
     */
    //^ extremely useful visual visualization of how the position is calculated, kinda like a tangent
    // if the sum of the three areas equals the original,
    // we're inside the triangle!






    /*
     if (RayTriangle[0] == true) {
     Player1.Position.x = PlacerX[0]-36;
     Player1.Position.y = PlacerY[0]-36;
     } else if (RayTriangle[1] == true) {
     Player1.Position.x = PlacerX[1]-36;
     Player1.Position.y = PlacerY[1]-36;
     } else if (RayTriangle[2] == true) {
     Player1.Position.x = PlacerX[2]-36;
     Player1.Position.y = PlacerY[2]-36;
     }
     
     if (Placer == 0) {
     Player1.Position.x = PlacerX[0]-19;
     Player1.Position.y = PlacerY[0]-27;
     }
     if (Placer == 1) {
     Player1.Position.x = PlacerX[1]-19;
     Player1.Position.y = PlacerY[1]-27;
     }
     if (Placer == 2) {
     Player1.Position.x = PlacerX[2]-19;
     Player1.Position.y = PlacerY[2]-27;
     }
     }*/
    /* if (this.SidesCollision[0] == false && this.SidesCollision[1] == false && this.SidesCollision[2] == false) {
     Player1.Position.x = PlacerX[0]-19;
     Player1.Position.y = PlacerY[0]-27;
     }*/
    /*fill(#FFFFFF);
     
     ellipse(this.ImaginaryPointX[0], this.ImaginaryPointY[0], 64, 64);
     ellipse(x1, y1, 64, 64);
     fill(#FFFF00);
     ellipse(x2, y2, 64, 64);
     fill(#FFFF00);
     ellipse(this.ImaginaryPointX[1], this.ImaginaryPointY[1], 64, 64);
     fill(#FF00FF);
     ellipse(x3, y3, 64, 64);
     fill(#FF00FF);
     ellipse(this.ImaginaryPointX[2], this.ImaginaryPointY[2], 64, 64);*/
  }
}
