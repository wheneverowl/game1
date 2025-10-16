

int RoomX = 7;
int RoomY = 7;  //^Sets the starting ints for the X and Y's within the 2d array to be in the middle
/*
int w = 0;
int k = 0;
int t = 0;
*/
int dash = 0;
int dashk = 0;
int dasht = 0; //^Dash Millis Variables for calculating for how long you can dash again as the player

int jump = 0;
int jumpk = 0;
int jumpt = 0; //^Dash Millis Variables for calculating for how long you can double jump again as the player

int ImmunityFramesElapsed = 0;
int ImmunityFramesStartTime = 0;
int ImmunityFramesCurrentTime = 0;  //^Millis variables for how many times you can be attacked by per amount of time
boolean CanDamage = true; //Variable associated with that function (if CanDamage is true and gets attacked, becomes false, resets after a certain amount of time to true)


int Recursion = 15; //"recursion" can just be done with a for loop, but how many times the room gen does a random Up, Left, Down and Right movement to determine what the rooms are in
public String TextToTypeIn = ""; //meant to be a seed to type with numbers to generate the same type of levels,
public final color DefaultTerrain = #003333; //a constant for a colour that would come, but too inconvenient to be used properly
public int MoveX = 0, MoveY = 0; //variables that are added or substracted from, to describe movement within the 2d array of rooms (7(RoomY)+MoveY)
public int Rooms[][]= new int[15][15]; //Array for generating rooms and seeing what rooms' you're in when you're in the game, also the description of the room system as positions
public boolean RoomMoveUp = false;
public boolean RoomMoveDown = false;
public boolean RoomMoveRight = false;
public boolean RoomMoveLeft = false; //Booleans to check whether if they the snake can move a certain way

int[] Room = new int[4]; //See if Rooms are able to be moved into, then the total is used as the max within the random and the min as 0. So the random movement will always be random between the movements that can actually be done
public int RoomAdd = 0;

ArrayList <Circle> circle = new ArrayList<Circle>();
ArrayList <Rectangle> rectangle = new ArrayList<Rectangle>();
ArrayList <Triangle> triangle = new ArrayList<Triangle>();
ArrayList <Bat> bat = new ArrayList<Bat>();
ArrayList <Spike> spike = new ArrayList<Spike>(); //^Arraylist things for that constantly change from room to room like, terrain or enemies, or miscellanous terrain

ArrayList <Particle> particle = new ArrayList<Particle>(); //^Particle arraylist allows for flexibility compared to regular arrays

public int RandomGen = 0; //same function as int[] Room


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




//Bat Bat1 = new Bat(400, 250, true);
int GameState = 3; //Main menu gamestate, not properly implemented yet, just click to the enter. Health system does not work as the things are not setup properly yet
PImage GrassSmallPlatform, GrassMediumPlatform, GrassLargePlatform, RockSmallPlatform, RockMediumPlatform, RockLargePlatform, CrystalSmallPlatform, CrystalMediumPlatform, CrystalLargePlatform, TestPlatform;
PImage GrassTileSet, CrystalTileSet, RockTileSet, TechTileSet;
PImage GrassBorder, RockBorder, CrystalBorder, TechBorder;
PImage GrassBackground, GrassBackground2, RockBackground, RockBackground2, CrystalBackground, CrystalBackground2, TechBackground, TechBackground2;
PImage Player;
PImage Crosshair;
PImage Spikes; //PImage initilization for all assets


void setup() {
  ImmunityFramesStartTime = millis(); //Start time for immunity frames
  

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
  TechBackground2 = loadImage("Background/TechBackground2.png");
  
  Crosshair = loadImage("CrossHair.png");
  
  Spikes = loadImage("Terrain/Spike.png");
  
  Player = loadImage("CharacterSprite/PlayerIdle.png"); //^defining images for all PImages
  
  //triangle.add(new Triangle(200,300,80,720,440,800));
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
  } //Declares all Room arrays to have no base value
  for (int w = 0; w < 15; w++) {
    Rooms[round(random(-0.49, 14.49))][round(random(-0.49, 14.49))] = 31;
  } //Scatters bonus treasure rooms that have nothing in them
  RoomGen(); //Starts recursive room generation process
  RoomGeneration(); //Package of voids that define what to place in the room according to the value  of the room you're currently in, and clears all particles for better immersion
}

void RoomGen() {
  Recursion -=1; //Goes down one recursive value and repeats until it reaches 0
  if (Recursion >= 0) { //greater than 0, runs room generation
    RoomMoveUp = false;
    RoomMoveDown = false;
    RoomMoveRight = false;
    RoomMoveLeft = false; //Defaults all room movements to null

    RoomAdd = 0; 
    RandomGen = 0;
    Rooms[RoomX][RoomY] = 4; //States the Room at Room[7][7] will always be the starting room
    Room[0]=0;
    Room[1]=0;
    Room[2]=0;
    Room[3]=0; //resets to base values after the recursion
    if (14 >= RoomY + MoveY + 1 ) {
      if (Rooms[RoomX+MoveX][RoomY+MoveY+1] == 0 ) { //down
        RoomMoveDown = true;
        RoomAdd++;
        Room[0]=RoomAdd;
      }
    } //If RoomY + 1 (If room 1 down has value of 0, Array is not out of bounds, can move down, adds to the max random value, Sets the movement value for how many rooms have sifted through (which if this if is true, is 1. The next movement will make the next 
    // value 2, so it can be compared to the randomly generated number value)
    if (14 >= RoomX + MoveX + 1) {
      if (Rooms[RoomX+MoveX+1][RoomY+MoveY] == 0) { //down
        RoomMoveRight = true;
        RoomAdd++;
        Room[1]=RoomAdd;
      }
    } //^ If RoomX + 1 is an empty room (value of 0), checks if array is not out of bounds, if so adds the possibility of moving right 
    if (0 <= RoomY + MoveY - 1 ) {
      if (Rooms[RoomX+MoveX][RoomY+MoveY-1] == 0) { //down
        RoomMoveUp = true;
        RoomAdd++;
        Room[2]=RoomAdd;
      }
    }
    //^ If RoomY - 1 is an empty room (value of 0), checks if array is not out of bounds, if so adds the possibility of moving up

    if (0 <= RoomX + MoveX - 1) {
      if (Rooms[RoomX+MoveX-1][RoomY+MoveY] == 0  ) { //down
        RoomMoveLeft = true;
        RoomAdd++;
        Room[3]=RoomAdd;
      }
    }     //^ If RoomX - 1 is an empty room (value of 0), checks if array is not out of bounds, if so adds the possibility of moving left
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
    } //^ how many rooms were able to move, then generates a max value from those and 0
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
    } //^^Does the random movement, checks if random value is the same as pre-assigned value within when check the possibility of room movement was available, then depending on how many times it has ran the terrain is easy - hard, per 5 recursion
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
    } //If no possibility of moving, generates a random point to tp, meant to create teleporter rooms linking the two. But not implemented yet
 
    if (Recursion == 0) {
      Rooms[RoomX+MoveX][RoomY+MoveY] = 2;
      MoveX = 0;
      MoveY = 0; //when it reaches the end of recursion creates the boss room

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
      } // randomizes the type of room, so they have different terrain per room.

      for (int w = 0; w < 15; w++) {
        for (int k = 0; k < 15; k++) {
          if (14 >= k + 1 && 14 >= w + 1 && 0 <= k - 1 && 0 <= w - 1) {
            if (Rooms[w][k+1] == 0 && Rooms[w+1][k] == 0 && Rooms[w][k-1] == 0 && Rooms[w-1][k] == 0) { //down
              Rooms[w][k] = 0;
            }
          } //when the random rooms were generated, there are some standalones that don't link to anything. It eliminates singular rooms by themselves not connected to the main path in any way.
        }
      }
    }
    RoomGen();
  }
  Recursion = 15; // so when it's called again, it will generate a new set of rooms
}

void BossRecursion() {
}

void StartNewGame() {
  for (int w = 0; w < 15; w++) {
    for (int k = 0; k < 15; k++) {
      Rooms[w][k] = 0;
    }
  } //sets all rooms to be empty
  for (int w = 0; w < 15; w++) {
    Rooms[round(random(-0.49, 14.49))][round(random(-0.49, 14.49))] = 31;
  } //sets random rooms to be treasure rooms
  randomSeed(int(TextToTypeIn));
  RoomGen(); //starts recursive process again

  RoomGeneration(); //Checks the room you're in and sets the terrain and background
  HealthPoints = 100; //restarts base hp to 100
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
  //rectangle.add(new Rectangle(300, 400, 600, 50, false)); //sets boundaries for the room in negative space of a +
}

void RoomOutBounds() {
  rectangle.clear();
  triangle.clear();
  circle.clear();
  spike.clear();
  bat.clear(); //clears all arraylist when you enter a new room
  RoomBoundaries(); //resets the room boundaries again
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
  } //^walling off process off side rooms that are empty, checks in 2d arrays if any adjacent rooms have the value of 0, so corresponding directions within the game are walled off
}
