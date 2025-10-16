
//DriverCode.pde

//Ball Objects
// These 4 statements 'instantiate' the 4 balls. Note that they include
// the same information that our variables and arrays did in the prior
// example. Of course we could do fancier things, like using a loop
// and an array, like before as well
int RoomX = 7;
int RoomY = 7;  //^Sets the starting ints for the X and Y's within the 2d array to be in the middle
/*
int w = 0;
int k = 0;
int t = 0;
*/
int dash = 0;
int dashk = 0;
int dasht = 0 ;

int jump = 0;
int jumpk = 0;
int jumpt = 0;

int ImmunityFramesElapsed = 0;
int ImmunityFramesStartTime = 0;
int ImmunityFramesCurrentTime = 0;
boolean CanDamage = true;


int Recursion = 15;
public String TextToTypeIn = "";
public final color DefaultTerrain = #003333;
public int MoveX = 0, MoveY = 0;
public boolean RoomMoveUp = false;
public boolean RoomMoveDown = false;
public boolean RoomMoveRight = false;
public boolean RoomMoveLeft = false;

int[] Room = new int[4];
public int RoomAdd = 0;
public boolean [] Move = new boolean[4];

ArrayList <Circle> circle = new ArrayList<Circle>();
ArrayList <Rectangle> rectangle = new ArrayList<Rectangle>();
ArrayList <Triangle> triangle = new ArrayList<Triangle>();
ArrayList <Bat> bat = new ArrayList<Bat>();
ArrayList <Spike> spike = new ArrayList<Spike>();

ArrayList <Particle> particle = new ArrayList<Particle>();

public int RandomGen = 0;
public int RoomGenNum = 0;
public int Rooms[][]= new int[15][15];
public boolean RoomComplete[][] = new boolean[15][15];

public boolean RoomGenerate = true;

public boolean Grounded = false;
public float[] StartTime = new float [20];
public float[] LastLapTime = new float [20];
public float[] DifferenceTime = new float [20];
public float MouseX = 0;
public float MouseY = 0;
public float HealthPoints = 100;
Player Player1 = new Player(581, 200, 255);



Rectangle Rectangle1 = new Rectangle(400, 400, 150, 150, true, #AA0033);

//Circle Circle1 = new Circle(950, 200, 75);




Bat Bat1 = new Bat(400, 250, true);
int GameState = 3;
PImage GrassSmallPlatform, GrassMediumPlatform, GrassLargePlatform, RockSmallPlatform, RockMediumPlatform, RockLargePlatform, CrystalSmallPlatform, CrystalMediumPlatform, CrystalLargePlatform, TestPlatform;
PImage GrassTileSet, CrystalTileSet, RockTileSet, TechTileSet;
PImage GrassBorder, RockBorder, CrystalBorder, TechBorder;
PImage GrassBackground, GrassBackground2, RockBackground, RockBackground2, CrystalBackground, CrystalBackground2, TechBackground;
PImage Player;
PImage Spikes;


void setup() {
  ImmunityFramesStartTime = millis();
  
  textAlign(CENTER, CENTER);
  
  GrassTileSet = loadImage("Background/GrassTileSet.png");
  RockTileSet = loadImage("Background/RockTileSet.png");
  CrystalTileSet = loadImage("Background/CrystalTileSet.png");
  
  TestPlatform = loadImage("TestPlatform.png");
  GrassBorder = loadImage("Terrain/GrassBorder.png");
  RockBorder = loadImage("Terrain/RockBorder.png");
  CrystalBorder = loadImage("Terrain/CrystalBorder.png");
  TechBorder = loadImage("Terrain/TechBorder.png");

  RockBackground2 = loadImage("Background/RockBackground2.png");
  RockBackground = loadImage("Background/RockBackground.png");

  GrassBackground2 = loadImage("Background/GrassBackground2.png");
  GrassBackground = loadImage("Background/GrassBackground.png");
  
  CrystalBackground2 = loadImage("Background/CrystalBackground2.png");
  CrystalBackground = loadImage("Background/CrystalBackground.png");
  
  TechBackground = loadImage("Background/TechBackground.png");
  
  Spikes = loadImage("Terrain/Spike.png");
  
  Player = loadImage("CharacterSprite/PlayerIdle.png");
  
  //triangle.add(new Triangle(200,300,80,720,440,800));
  image(GrassBorder, 0, 0);

  //bat.add(new Bat(400, 250, false));
  //bat.add(new Bat(400, 200, true));
  size(1200, 800);
  rectMode(CORNER);

  StartTime[0] = millis();
  jump = millis();
  //w = millis();

  /*  for (int RoomGenNum = 0; RoomGenNum < 7; RoomGenNum++) {
   int RandomGen = int(random(-0.50, 100.49));
   println(RandomGen);
   if (RandomGen <= 25 && RandomGen >= 0 && Move[0] != true) { //down
   MoveY += 1;
   Rooms[RoomX+MoveX][RoomY+MoveY] = 1;
   
   Move[0] = true;
   }
   if (RandomGen <= 50 && RandomGen >= 26 && Move[1] != true) { //up
   MoveY -= 1;
   Rooms[RoomX+MoveX][RoomY+MoveY] = 1;
   
   Move[0] = true;
   }
   if (RandomGen <= 75 && RandomGen >= 51 && Move[2] != true) { //right
   MoveX += 1;
   Rooms[RoomX+MoveX][RoomY+MoveY] = 1;
   
   Move[0] = true;
   }
   if (RandomGen <= 100 && RandomGen >= 76&& Move[3] != true) { //;eft
   MoveX -= 1;
   Rooms[RoomX+MoveX][RoomY+MoveY] = 1;
   Move[0] = true;
   }
   }
   for (int w = 0; w < 15; w++) {
   for (int k = 0; k < 15; k++) {
   print(Rooms[w][k]);
   }
   }*/

  for (int w = 0; w < 15; w++) {
    for (int k = 0; k < 15; k++) {
      Rooms[w][k] = 0;
    }
  }
  for (int w = 0; w < 15; w++) {
    Rooms[round(random(-0.49, 14.49))][round(random(-0.49, 14.49))] = 31;
  }
  RoomGen();
  RoomGeneration();
}

void RoomGen() {
  Recursion -=1;
  if (Recursion >= 0) {
    RoomMoveUp = false;
    RoomMoveDown = false;
    RoomMoveRight = false;
    RoomMoveLeft = false;

    RoomAdd = 0;
    RandomGen = 0;
    Rooms[RoomX][RoomY] = 4;
    Room[0]=0;
    Room[1]=0;
    Room[2]=0;
    Room[3]=0;
    if (14 >= RoomY + MoveY + 1 ) {
      if (Rooms[RoomX+MoveX][RoomY+MoveY+1] == 0 ) { //down
        RoomMoveDown = true;
        RoomAdd++;
        Room[0]=RoomAdd;
      }
    }
    if (14 >= RoomX + MoveX + 1) {
      if (Rooms[RoomX+MoveX+1][RoomY+MoveY] == 0) { //down
        RoomMoveRight = true;
        RoomAdd++;
        Room[1]=RoomAdd;
      }
    }
    if (0 <= RoomY + MoveY - 1 ) {
      if (Rooms[RoomX+MoveX][RoomY+MoveY-1] == 0) { //down
        RoomMoveUp = true;
        RoomAdd++;
        Room[2]=RoomAdd;
      }
    }

    if (0 <= RoomX + MoveX - 1) {
      if (Rooms[RoomX+MoveX-1][RoomY+MoveY] == 0  ) { //down
        RoomMoveLeft = true;
        RoomAdd++;
        Room[3]=RoomAdd;
      }
    }
    println(RoomAdd);
    println(Room[0], Room[1], Room[2], Room[3]);


    if (RoomAdd == 4) {
      RandomGen = round(random(0.50, 4.49));
    }
    if (RoomAdd == 3) {
      RandomGen = round(random(0.50, 3.49));
    }
    if (RoomAdd == 2) {
      RandomGen = round(random(0.50, 2.49));
    }
    if (RoomAdd == 1) {
      RandomGen = round(random(0.50, 1.49));
    }
    println(RandomGen);

    /*  if (RoomMoveDown == true) {
     RoomAdd+=1;
     Room[0]=RoomAdd;
     }
     if (RoomMoveUp == true) {
     RoomAdd+=1;
     Room[1]=RoomAdd;
     }
     if (RoomMoveLeft == true) {
     RoomAdd+=1;
     Room[2]=RoomAdd;
     }
     if (RoomMoveRight == true) {
     RoomAdd+=1;
     Room[3]=RoomAdd;
     }*/



    if (RandomGen == Room[0]) {
      MoveY += 1;
      if (Recursion >= 10 && Recursion <= 15) {
        Rooms[RoomX+MoveX][RoomY+MoveY] = 5;
      }
      if (Recursion >= 5 && Recursion <= 9) {
        Rooms[RoomX+MoveX][RoomY+MoveY] = 15;
      }
      if (Recursion >= 1 && Recursion <= 4) {
        Rooms[RoomX+MoveX][RoomY+MoveY] = 30;
      }
    } else if (RandomGen == Room[1]) {
      MoveX += 1;
      if (Recursion >= 10 && Recursion <= 15) {
        Rooms[RoomX+MoveX][RoomY+MoveY] = 5;
      }
      if (Recursion >= 5 && Recursion <= 9) {
        Rooms[RoomX+MoveX][RoomY+MoveY] = 15;
      }
      if (Recursion >= 1 && Recursion <= 4) {
        Rooms[RoomX+MoveX][RoomY+MoveY] = 30;
      }
    } else if (RandomGen == Room[2]) {
      MoveY -= 1;
      if (Recursion >= 10 && Recursion <= 15) {
        Rooms[RoomX+MoveX][RoomY+MoveY] = 5;
      }
      if (Recursion >= 5 && Recursion <= 9) {
        Rooms[RoomX+MoveX][RoomY+MoveY] = 15;
      }
      if (Recursion >= 1 && Recursion <= 4) {
        Rooms[RoomX+MoveX][RoomY+MoveY] = 30;
      }
    } else if (RandomGen == Room[3]) {
      MoveX -= 1;
      if (Recursion >= 10 && Recursion <= 15) {
        Rooms[RoomX+MoveX][RoomY+MoveY] = 5;
      }
      if (Recursion >= 5 && Recursion <= 9) {
        Rooms[RoomX+MoveX][RoomY+MoveY] = 15;
      }
      if (Recursion >= 1 && Recursion <= 4) {
        Rooms[RoomX+MoveX][RoomY+MoveY] = 30;
      }
    }
    /* if (RandomGen <= 25 && RandomGen >= 0
     && Rooms[RoomX+MoveX][RoomY+MoveY-1] == 0 && RoomY + MoveY - 1 >= 1) { //down
     MoveY += 1;
     Rooms[RoomX+MoveX][RoomY+MoveY] = 1;
     }
     RandomGen = int(random(-0.50, 100.49));
     if (RandomGen <= 25 && RandomGen >= 0
     
     && Rooms[RoomX+MoveX][RoomY+MoveY+1] == 0 && RoomY + MoveY + 1 <= 13
     ) { //up
     MoveY -= 1;
     Rooms[RoomX+MoveX][RoomY+MoveY] = 1;
     }
     RandomGen = int(random(-0.50, 100.49));
     if (RandomGen <= 25 && RandomGen >= 0
     
     && Rooms[RoomX+MoveX+1][RoomY+MoveY] == 0 && RoomX + MoveX + 1 <= 13
     ) { //right
     MoveX += 1;
     Rooms[RoomX+MoveX][RoomY+MoveY] = 1;
     }
     RandomGen = int(random(-0.50, 100.49));
     if (RandomGen <= 25 && RandomGen >= 0
     && Rooms[RoomX+MoveX-1][RoomY+MoveY] == 0 && RoomX + MoveX - 1 >= 1
     ) { //;eft
     MoveX -= 1;
     Rooms[RoomX+MoveX][RoomY+MoveY] = 1;
     }*/

    if (RoomAdd == 0) {
      Rooms[RoomX+MoveX][RoomY+MoveY]=42;
      MoveX = round(random(-7, 7));
      MoveY = round(random(-7, 7));
      Rooms[RoomX+MoveX][RoomY+MoveY]=42;
    }
    //BOSS CHECK!
    if (Recursion == 0) {
      Rooms[RoomX+MoveX][RoomY+MoveY] = 2;
      MoveX = 0;
      MoveY = 0;

      for (int x = 0; x < 15; x++) {
        for (int y = 0; y < 15; y++) {
          if (Rooms[x][y] == 5) {
            Rooms[x][y] = int(random(5, 9));
          }
          if (Rooms[x][y] == 15) {
            Rooms[x][y] = int(random(15, 19));
          }
          if (Rooms[x][y] == 30) {
            Rooms[x][y] = int(random(25, 29));
          }
          if (Rooms[x][y] == 31) {
            Rooms[x][y] = int(random(35, 39));
          }
        }
      }

      for (int w = 0; w < 15; w++) {
        for (int k = 0; k < 15; k++) {
          if (14 >= k + 1 && 14 >= w + 1 && 0 <= k - 1 && 0 <= w - 1) {
            if (Rooms[w][k+1] == 0 && Rooms[w+1][k] == 0 && Rooms[w][k-1] == 0 && Rooms[w-1][k] == 0) { //down
              Rooms[w][k] = 0;
            }
          }
        }
      }
    }
    RoomGen();
  }
  Recursion = 15;
}

void BossRecursion() {
}

void StartNewGame() {
  for (int w = 0; w < 15; w++) {
    for (int k = 0; k < 15; k++) {
      Rooms[w][k] = 0;
    }
  }
  for (int w = 0; w < 15; w++) {
    Rooms[round(random(-0.49, 14.49))][round(random(-0.49, 14.49))] = 31;
  }
  RoomGen();
  randomSeed(int(TextToTypeIn));
  RoomGeneration();
  HealthPoints = 100;
}

void TeleporterRecursion() {
}

void RoomBoundaries() {
  //topleft
  rectangle.add(new Rectangle(0, 0, 540, 80, false, #003333));
  rectangle.add(new Rectangle(0, 0, 80, 340, false, #003333 ));
  //rectangle.add(new Rectangle(440, 375, 335, 25, true, #00FF33 ));
  //topright
  rectangle.add(new Rectangle(660, 0, 540, 80, false, #003333 ));
  rectangle.add(new Rectangle(1120, 0, 80, 340, false, #003333 ));
  //rectangle.add(new Rectangle(540, 625, 120, 25, true, #00FF33 ));

  //bottomleft
  rectangle.add(new Rectangle(0, 720, 540, 80, false, #003333 ));
  rectangle.add(new Rectangle(0, 460, 80, 340, false, #003333 ));
  //rectangle.add(new Rectangle(460, 600, 80, 120, false, #003333 ));
  //rectangle.add(new Rectangle(80, 460, 100, 25, true, #00FF00));
  //bottomright
  rectangle.add(new Rectangle(660, 720, 540, 80, false, #003333));
  rectangle.add(new Rectangle(1120, 460, 80, 340, false, #003333));
  //rectangle.add(new Rectangle(1020, 460, 100, 25, true, #00FF00));
  // rectangle.add(new Rectangle(660, 600, 80, 120, false, #003333 ));
  //rectangle.add(new Rectangle(560, 150, 80, 25, true, #00FF33 ));
  //rectangle.add(new Rectangle(300, 400, 600, 50, false));
}

void RoomOutBounds() {
  rectangle.clear();
  triangle.clear();
  circle.clear();
  spike.clear();
  bat.clear();
  RoomBoundaries();
  if (RoomX+MoveX+1 <= 14) {
    if (Rooms[RoomX+MoveX+1][RoomY+MoveY] == 0) {
      rectangle.add(new Rectangle(1160, 340, 40, 120, false, DefaultTerrain));
    }
  } else {
    rectangle.add(new Rectangle(1160, 340, 40, 120, false, DefaultTerrain));
  }

  if (RoomX+MoveX-1 >= 0) {
    if (Rooms[RoomX+MoveX-1][RoomY+MoveY] == 0) {
      rectangle.add(new Rectangle(0, 340, 40, 120, false, DefaultTerrain));
    }
  } else {
    rectangle.add(new Rectangle(0, 340, 40, 120, false, DefaultTerrain));
  }

  if (RoomY+MoveY+1 <= 14) {
    if (Rooms[RoomX+MoveX][RoomY+MoveY+1] == 0) {
      rectangle.add(new Rectangle(540, 760, 120, 40, false, DefaultTerrain));
    }
  } else {
    rectangle.add(new Rectangle(540, 760, 120, 40, false, DefaultTerrain));
  }
  if (RoomY+MoveY-1 >= 0) {
    if (Rooms[RoomX+MoveX][RoomY+MoveY-1] == 0) {
      rectangle.add(new Rectangle(540, 0, 120, 40, false, DefaultTerrain));
    }
  } else {
    rectangle.add(new Rectangle(540, 0, 120, 40, false, DefaultTerrain));
  }
}
