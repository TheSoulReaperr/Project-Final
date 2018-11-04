PImage Missile01;
PImage Missile02;
PImage Missile03;
PImage Missile04;

Missile missiles[];

void initMissiles() {
  float x =1400 ;
  missiles = new Missile[4];
  for (int i=0; i< missiles.length; i++) {
    missiles[i] = new Missile();
    missiles[i].missile(x);
    x+=random(1000,2000);
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
    x = _x;
    y = random(0, 768);
    switch(int(random(0,11))) {
      case 0 : 
      case 1 :
      case 2 : 
      case 3 : w = 110 ;  h = 30 ;  Missile = Missile01;  h1 = 1.7 ;  h2 = 2.7 ; Homing = 1.5; break;
      case 4 : 
      case 5 : 
      case 6 : w = 90 ;   h = 30 ;  Missile = Missile02;  h1 = 2.5 ;  h2 = 3.5 ; Homing = 0.8; break;
      case 7 :
      case 8 :
      case 9 : w = 90 ;   h = 30 ;  Missile = Missile03;  h1 = 1.2 ;  h2 = 2.0 ; Homing = 2.1; break;
      case 10: w = 300 ;  h = 80 ;  Missile = Missile04;  h1 = 1.0 ;  h2 = 1.2 ; Homing =-0.2; break;
    }
    mSpeed = speed*random(h1,h2);
  }

  void Draw() {
    tint(255,255);
    image(Missile, x, y, w, h);
    if(GameScreen ==1)
    x-=mSpeed;
    if (x < -w) {
      x = random(1400 , 2200 );
      missile(x);
    }

    if (p1X + pW -10 > x && p1X + 10 < x + w && p1Y + pH - 10 > y  && p1Y + 10< y + h) {
      Crash(1);
    }
    else if (p2X + pW -10 > x && p2X + 10 < x + w && p2Y + pH - 10 > y  && p2Y + 10< y + h) {
      Crash(2);
    }
    
    if(GameScreen == 1) {
      if(p1Y - y < p2Y - y ) {
        if(p1Y > y) y += Homing;
        else y -= Homing;
      } else {
        if(p2Y > y) y+= Homing;
        else y-= Homing;
      }
    }
  }
}
