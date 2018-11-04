import de.bezier.data.sql.*;

final float GameSpeed = 10;
final float GameGravity = 5;

float speed;
float gravity;
float ratio = 1;
int GameScreen = 0;
PFont Font;

void setup() {
  fullScreen();
  if(width > 1900) {
    ratio = 1.405;
  } else {
    ratio = 1;
  }
  frameRate(30);
  rectMode(CENTER);
  loadStuffs();
  initBackground();
  initPlayers();
  initMissiles();
  connectSQL();
  textFont(Font);
}

//---------------------------------------------------------------------------------------------------------------------------------

void draw() {
  scale(ratio);
  speed *= 1.001;
  drawBackground();
  devMode();
  drawMissiles();
  drawPlayers();
  if(GameScreen == 0) {
    fill(255,150,0);
    textAlign(CENTER,CENTER);
    textSize(60);
    text("START",1366/2,768/2.5);
  }
}

//---------------------------------------------------------------------------------------------------------------------------------

void Start() {
  speed = GameSpeed ;
  gravity = GameGravity ;
  GameScreen = 1;
  initPlayers();
  initMissiles();
}

//--------------------------------------------------------------------------------------------------------------------------------

void Crash(int a) {
  GameScreen = 2;
  p1UP = false;
  p1DOWN = false;
  p1LEFT = false;
  p1RIGHT = false;
  p2UP = false;
  p2DOWN = false;
  p2LEFT = false;
  p2RIGHT = false;
  speed = 0;
  gravity = 0;
  for(int i=0; i<missiles.length; i++) {
    missiles[i].mSpeed = 0;
  }
  fill(255,100,150);
  textAlign(CENTER,CENTER);
  textSize(50);
  text("Player "+a+" Wins",1366/2,768/2.5);
  text("RESTART",1366/2,768/2);
}

//--------------------------------------------------------------------------------------------------------------------------------

void devMode() {
  fill(200,50,50);
  textSize(12 );
  textAlign(CENTER,CENTER);
  text("X:"+mouseX+" Y:"+mouseY+" FR:"+frameRate,1366/2,10);
  textAlign(LEFT,CENTER);
  text("Speed:"+speed,10,300);
}

void loadStuffs() {
  plane1 = loadImage("plane01.png");
  plane2 = loadImage("plane02.png");
  plane3 = loadImage("plane03.png");
  plane4 = loadImage("plane04.png");
  Missile01 = loadImage("missile01.png");
  Missile02 = loadImage("missile02.png");
  Missile03 = loadImage("missile03.png");
  Missile04 = loadImage("missile04.png");
  Font =  createFont("OCR A Std",100);
}
