//topleft
/*rectangle.add(new Rectangle(0, 0, 540, 80, false, #003333));
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
 rectangle.add(new Rectangle(1120, 460, 80, 340, false, #003333));*/


void RoomType() {
  if (Rooms[RoomX+MoveX][RoomY+MoveY] == 4 ) { //LEFT SIDE BALL ROOM
    rectangle.add(new Rectangle(80, 80, 300, 120, false, #FF00AA));
    triangle.add(new Triangle(380, 200, 540, 80, 360, 60, 0, #FF00AA));
    rectangle.add(new Rectangle(360, 350, 300, 200, false, #FF00AA));
    rectangle.add(new Rectangle(660, 450, 120, 100, false, #FF00AA));
    triangle.add(new Triangle(660, 350, 780, 450, 660, 450, 0, #FF00AA));
    rectangle.add(new Rectangle(900, 600, 220, 120, false, #FF00AA));
    spike.add(new Spike(80, 688, 300));
  }
  if (Rooms[RoomX+MoveX][RoomY+MoveY] >= 26 && Rooms[RoomX+MoveX][RoomY+MoveY] <= 29 ) { //LEFT SIDE BALL ROOM
    rectangle.add(new Rectangle(80, 80, 300, 120, false, #FF00AA));
    triangle.add(new Triangle(380, 200, 540, 80, 360, 60, 0, #FF00AA));
    rectangle.add(new Rectangle(360, 350, 300, 200, false, #FF00AA));
    rectangle.add(new Rectangle(660, 450, 120, 100, false, #FF00AA));
    triangle.add(new Triangle(660, 350, 780, 450, 660, 450, 0, #FF00AA));
    rectangle.add(new Rectangle(900, 600, 220, 120, false, #FF00AA));
  }

  if (Rooms[RoomX+MoveX][RoomY+MoveY] == 25) {
    rectangle.add(new Rectangle(80, 460, 260, 340, false, #FF00AA));
    rectangle.add(new Rectangle(420, 300, 360, 60, false, #FF00AA));
    rectangle.add(new Rectangle(860, 460, 260, 340, false, #FF00AA));
    triangle.add(new Triangle(340, 460, 335, 730, 540, 720, 0, #FF00AA));
    triangle.add(new Triangle(860, 460, 660, 720, 890, 730, 0, #FF00AA));
  }
  /*  if (Rooms[RoomX+MoveX][RoomY+MoveY] == 4) {  //SPAWN ROOM
   rectangle.add(new Rectangle(0, 460, 510, 340, false, #00AA00));
   rectangle.add(new Rectangle(690, 460, 510, 340, false, #00AA00));
   rectangle.add(new Rectangle(510, 460, 180, 15, true, #00AAAA));
   rectangle.add(new Rectangle(510, 620, 180, 15, true, #00AAAA));
   rectangle.add(new Rectangle(510, 230, 180, 15, true, #00AAAA));
   }*/

  if (Rooms[RoomX+MoveX][RoomY+MoveY] == 19) { //LEFT SIDE BALL ROOM
    rectangle.add(new Rectangle(80, 460, 440, 340, false, #FFAA00));
    rectangle.add(new Rectangle(680, 80, 440, 260, false, #FFAA00));
    rectangle.add(new Rectangle(720, 560, 440, 260, false, #FFAA00));


    rectangle.add(new Rectangle(680, 460, 120, 260, false, #FFAA00));
    rectangle.add(new Rectangle(400, 80, 120, 260, false, #FFAA00));
    rectangle.add(new Rectangle(80, 80, 440, 160, false, #FFAA00));

    rectangle.add(new Rectangle(520, 460, 160, 15, true, #FFFF00));
    rectangle.add(new Rectangle(520, 640, 160, 15, true, #FFFF00));
    rectangle.add(new Rectangle(520, 325, 160, 15, true, #FFFF00));
    rectangle.add(new Rectangle(520, 150, 160, 15, true, #FFFF00));

    circle.add(new Circle(960, 280, 120, #FFAA00));
    circle.add(new Circle(250, 520, 120, #FFAA00));
  }
  if (Rooms[RoomX+MoveX][RoomY+MoveY] >= 35 && Rooms[RoomX+MoveX][RoomY+MoveY] <= 39 || Rooms[RoomX+MoveX][RoomY+MoveY] == 2 ) {
    rectangle.add(new Rectangle(660, 80, 80, 440, false, #ADD8E6));
    rectangle.add(new Rectangle(840, 460, 440, 340, false, #ADD8E6));
    rectangle.add(new Rectangle(820, 360, 140, 360, false, #ADD8E6));
    rectangle.add(new Rectangle(420, 505, 240, 15, true, #ADD8E2));
    rectangle.add(new Rectangle(80, 505, 240, 15, true, #ADD8E2));
    rectangle.add(new Rectangle(540, 265, 120, 15, true, #ADD8E2));
    rectangle.add(new Rectangle(80, 265, 120, 15, true, #ADD8E2));
  }
  if (Rooms[RoomX+MoveX][RoomY+MoveY] == 18) {
    rectangle.add(new Rectangle(660, 80, 80, 440, false, #FFAA00));
    rectangle.add(new Rectangle(840, 460, 440, 340, false, #FFAA00));
    rectangle.add(new Rectangle(820, 360, 140, 360, false, #FFAA00));
    rectangle.add(new Rectangle(420, 505, 240, 15, true, #FFFF00));
    rectangle.add(new Rectangle(80, 505, 240, 15, true, #FFFF00));
    rectangle.add(new Rectangle(540, 265, 120, 15, true, #FFFF00));
    rectangle.add(new Rectangle(80, 265, 120, 15, true, #FFFF00));
  }
  if (Rooms[RoomX+MoveX][RoomY+MoveY] == 17) {
    rectangle.add(new Rectangle(80, 550, 320, 270, false, #FFAA00));
    rectangle.add(new Rectangle(400, 350, 120, 370, false, #FFAA00));
    circle.add(new Circle(460, 350, 60, #FFAA00));

    circle.add(new Circle(235, 290, 55, #FFAA00));
    rectangle.add(new Rectangle(180, 80, 110, 210, false, #FFAA00));
    rectangle.add(new Rectangle(680, 500, 260, 220, false, #FFAA00));
    rectangle.add(new Rectangle(940, 460, 260, 260, false, #FFAA00));
    rectangle.add(new Rectangle(700, 260, 240, 15, true, #FFFF00));
    rectangle.add(new Rectangle(520, 500, 160, 15, true, #FFFF00));
  }
  if (Rooms[RoomX+MoveX][RoomY+MoveY] == 15) { //Reverse Chandelier Room
    rectangle.add(new Rectangle(340, 505, 520, 15, true, #FFFF00));
    rectangle.add(new Rectangle(340, 280, 520, 15, true, #FFFF00));
    rectangle.add(new Rectangle(550, 740, 100, 15, true, #FFFF00));
    rectangle.add(new Rectangle(80, 280, 200, 60, false, #FFAA00));
    rectangle.add(new Rectangle(280, 280, 60, 240, false, #FFAA00));
    rectangle.add(new Rectangle(480, 505, 60, 275, false, #FFAA00));
    rectangle.add(new Rectangle(660, 505, 60, 275, false, #FFAA00));
    rectangle.add(new Rectangle(920, 280, 260, 60, false, #FFAA00));
    rectangle.add(new Rectangle(860, 280, 60, 240, false, #FFAA00));
  }
  //Grass Rooms
  if (Rooms[RoomX+MoveX][RoomY+MoveY] == 5) { //Face Room
    rectangle.add(new Rectangle(240, 460, 720, 60, false, #00AA00));
    rectangle.add(new Rectangle(300, 60, 60, 200, false, #00AA00));
    rectangle.add(new Rectangle(840, 60, 60, 200, false, #00AA00));
    rectangle.add(new Rectangle(360, 245, 180, 15, true, #00AAAA));
    rectangle.add(new Rectangle(660, 245, 180, 15, true, #00AAAA));
    rectangle.add(new Rectangle(60, 460, 180, 15, true, #00AAAA));
    rectangle.add(new Rectangle(960, 460, 180, 15, true, #00AAAA));
  }
  if (Rooms[RoomX+MoveX][RoomY+MoveY] == 6) { //Sewer Room
    rectangle.add(new Rectangle(0, 460, 510, 340, false, #00AA00));
    rectangle.add(new Rectangle(690, 460, 510, 340, false, #00AA00));
    rectangle.add(new Rectangle(510, 460, 180, 15, true, #00AAAA));
    rectangle.add(new Rectangle(510, 620, 180, 15, true, #00AAAA));
    rectangle.add(new Rectangle(510, 230, 180, 15, true, #00AAAA));
  }
  if (Rooms[RoomX+MoveX][RoomY+MoveY] == 7) { // Stadium Roomssssssss
    rectangle.add(new Rectangle(0, 460, 320, 40, false, #00AA00));
    rectangle.add(new Rectangle(0, 500, 480, 40, false, #00AA00));
    rectangle.add(new Rectangle(880, 460, 320, 40, false, #00AA00));
    rectangle.add(new Rectangle(720, 500, 480, 40, false, #00AA00));
    rectangle.add(new Rectangle(480, 500, 240, 15, true, #00AAAA));
    rectangle.add(new Rectangle(560, 200, 80, 15, true, #00AAAA));
  }
  if (Rooms[RoomX+MoveX][RoomY+MoveY] == 8) { // Double Ball Room
    rectangle.add(new Rectangle(180, 180, 240, 240, false, #00AA00));
    rectangle.add(new Rectangle(780, 380, 240, 240, false, #00AA00));
    rectangle.add(new Rectangle(340, 520, 280, 15, true, #00AAAA));
    rectangle.add(new Rectangle(580, 240, 280, 15, true, #00AAAA));
  }
  if (Rooms[RoomX+MoveX][RoomY+MoveY] == 9) {  //Dumbell Room
    rectangle.add(new Rectangle(180, 200, 240, 400, false, #00AA00));
    rectangle.add(new Rectangle(420, 400, 360, 15, true, #00AAAA));
    rectangle.add(new Rectangle(780, 200, 240, 400, false, #00AA00));
  }

  if (Rooms[RoomX+MoveX][RoomY+MoveY] == 16) {  //Upside-down Chandelier Room
    rectangle.add(new Rectangle(80, 600, 200, 200, false, #FFAA00));
    rectangle.add(new Rectangle(280, 450, 240, 400, false, #FFAA00));
    rectangle.add(new Rectangle(800, 450, 320, 400, false, #FFAA00));
    rectangle.add(new Rectangle(700, 350, 240, 100, false, #FFAA00));
    rectangle.add(new Rectangle(700, 600, 100, 15, true, #FFFF00));
    rectangle.add(new Rectangle(360, 260, 180, 15, true, #FFFF00));
    triangle.add(new Triangle(801, 250, 680, 60, 950, 70, 0, #FFAA00));
  } 
}
