boolean up;
boolean down;
boolean left;
boolean right;
PImage plane1;
PImage plane2;
PImage plane3;
PImage plane4;
PImage planeImg;
float playerX;
float playerY;
float playerW;
float playerH;
float playerSpeed;

void initPlayer() {
  playerX = 50 ;
  playerY = 768/3;
  switch(plane) {
    case 1 : planeImg = plane1; playerW = 130 ; playerH = 60 ; playerSpeed = 5 ;  break;  
    case 2 : planeImg = plane2; playerW = 150 ; playerH = 60 ; playerSpeed = 7 ;  break;
    case 3 : planeImg = plane3; playerW = 150 ; playerH = 60 ; playerSpeed = 11 ; break;
    case 4 : planeImg = plane4; playerW = 150 ; playerH = 40 ; playerSpeed = 13 ; break;
  }
  up = false;
  down = false;
  left = false;
  right = false;
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void drawPlayer() {
  if(plane == 3) tint(150,100,255);
  image(planeImg, playerX, playerY, playerW, playerH);
  tint(255,255);
  if(playerX <=0) playerX = 0;
  if(playerY <=0) playerY = 0;
  if(playerX+playerW >= 1366) playerX = 1366-playerW;
  
  if(up)     playerY-=playerSpeed*1.7;
  if(down)   playerY+=playerSpeed;
  if(left)   playerX-=playerSpeed;
  if(right)  playerX+=playerSpeed;
  if(Click)
  playerY+=gravity;
}
