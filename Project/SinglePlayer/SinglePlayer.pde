import de.bezier.data.sql.*;

final float GameSpeed = 10;
final float GameGravity = 5;

float speed;
float gravity;
int GameScreen = 0;
int score = 0;
int coinAdd = 0;
float ratio = 1;

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
  initBuildings();
  initCoins();
  initPlayer();
  initMissiles();
  connectSQL();
}

//--------------------------------------------------------------------------------------------------------------------------------

void draw() {
  speed *= 1.001;
  score += ceil(speed/10);
  drawBackground();
  drawBuildings();
  //devMode();
  drawCoins();
  drawTexts();
  drawMissiles();
  drawPlayer();
  if(GameScreen == 0) {
    fill(255,150,0);
    textAlign(CENTER,CENTER);
    textSize(55 );
    text("START",1366/2,768/3);
  }
}

//--------------------------------------------------------------------------------------------------------------------------------

void drawTexts() {
  textAlign(CENTER,CENTER);
  fill(100,255,100);  textSize(50 );
  text(score,1366/2,100 );
  fill(100,150,250);  textSize(30 );
  text("HighScore:"+HighScore,1366/2,50 );
  fill(#EDDA2D);
  text("Coins:"+coinAdd,80 ,50 );
}

//--------------------------------------------------------------------------------------------------------------------------------

void Start() {
  score = 0;
  coinAdd = 0;
  coinflag = false;
  speed = GameSpeed ;
  gravity = GameGravity ;
  GameScreen = 1;
  initCoins();
  initPlayer();
  initMissiles();
}

//--------------------------------------------------------------------------------------------------------------------------------

boolean coinflag = false;
void Crash() {
  up = false;
  down = false;
  left = false;
  right = false;
  GameScreen = 2;
  speed = 0;
  gravity = 0;
  for(int i=0; i<missiles.length; i++) {
    missiles[i].mSpeed = 0;
    missiles[i].Homing = 0;
  }
  if(coinflag == false) {
    coin += coinAdd;
    coinAdd = 0;
    coinflag = true;
  }
  fill(255,100,150);
  textAlign(CENTER,CENTER);
  textSize(50 );
  text("RESTART",1366/2,768/2);
  fill(255,255,100);
  textSize(25 );
  text("Coins : "+coin,1366/2,768/5);
  db.query("UPDATE loginreg SET u_coins = "+ coin + " WHERE u_username = '" +username +"'");
  if(score > HighScore) {
    HighScore = score;
    db.query("UPDATE loginreg SET u_highscore = "+ HighScore + " WHERE u_username = '" +username +"'");
  }
}

//--------------------------------------------------------------------------------------------------------------------------------

void devMode() {
  fill(200,50,50);
  textSize(12 );
  textAlign(CENTER,CENTER);
  text("X:"+mouseX+" Y:"+mouseY+" FR:"+frameRate,1366/2,10 );
  textAlign(LEFT,CENTER);
  text("Speed:"+speed,10 ,300 );
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
}
