PImage Missile01;
PImage Missile02;
PImage Missile03;
PImage Missile04;
Missile missiles[];

void initMissiles() {
  float x =1400 ;
  missiles = new Missile[3];
  for (int i=0; i< missiles.length; i++) {
    missiles[i] = new Missile();
    missiles[i].missile(x);
    x+=random(1000,2000) ;
  }
}

void drawMissiles() {
  for (int i=0; i< missiles.length; i++) {
    missiles[i].Draw();
  }
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------

class Missile {
  float x;
  float y;
  float w;
  float h;
  float h1;
  float h2;
  float mSpeed;
  float Homing;
  PImage Missile;

  void missile(float _x) {
    x = _x ;
    y = random(0, 500) ;
    switch(int(random(0,11))) {
      case 0 : 
      case 1 :
      case 2 : 
      case 3 : w = 110 ;  h = 30 ;  Missile = Missile01;  h1 = 1.7 ;  h2 = 2.7 ;  Homing = 2.0 ;  break;
      case 4 : 
      case 5 : 
      case 6 : w = 90 ;   h = 30 ;  Missile = Missile02;  h1 = 2.5 ;  h2 = 3.5 ;  Homing = 1.2 ;  break;
      case 7 :
      case 8 :
      case 9 : w = 90 ;   h = 30 ;  Missile = Missile03;  h1 = 1.2 ;  h2 = 2.0 ;  Homing = 3.0 ;  break;
      case 10: w = 300 ;  h = 80 ;  Missile = Missile04;  h1 = 1 ;  h2 = 1.2 ;  Homing = 0.1 ;  break;
    }
    mSpeed = speed*random(h1,h2);
  }

  void Draw() {
    image(Missile, x, y, w, h);
    if (y > playerY ) y-=Homing;
    else if (y < playerY) y+=Homing;
    if(GameScreen ==1)
    x-=mSpeed;
    if (x < -w) {
      x = random(1400, 2200) ;
      missile(x);
    }

    if (playerX + playerW -10 > x && playerX + 10 < x + w && playerY + playerH - 30 > y  && playerY + 10< y + h) {
      Crash();
    }
  }
}
