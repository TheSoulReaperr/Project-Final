PImage ship1;
PImage ship2;
PImage ship3;
PImage Ship;
Ship ships[];

void initShips() {
  float shipX = random(100, 2000) ;
  ships = new Ship[8];
  for (int i=0; i<ships.length; i++) {
    ships[i] = new Ship(shipX);
    shipX+=random(1000, 5000) ;
  }
}

void drawShips(float y) {
  for (int i=0; i<ships.length; i++) {
    ships[i].Draw(y);
  }
}

//-------------------------------------------------------------------------------------------------------------------------------------------------

class Ship {
  float x;
  float y;
  float w;
  float h;

  Ship(float _x) {
    x = _x ;
    switch(int(random(0,4))) {
      case 1 : Ship = ship1; w = 450 ; h = 170 ; break;
      case 2 : Ship = ship2; w = 500 ; h = 150 ; break;
      case 3 : Ship = ship3; w = 400 ; h = 130 ; break;
    }
  }

  void Draw(float y) {
    image(Ship, x, y-h, w, h);
    x-=speed/2;
    if (playerY + playerH > y+(40 )) {
      if (playerX+playerW > x && playerX < x+w) {
        Crash();
      }
    }
  }
}
