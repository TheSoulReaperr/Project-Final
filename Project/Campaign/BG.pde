void drawBackground() {
  switch(level) {
    case 1 : background(#ADF5E2); break;
    case 2 : background(#F5F1A6); break;
    case 3 : background(#ADF5E2); break;
    case 4 : background(0);       break;
    case 5 : background(0);       break;
    case 6 : background(#EABC66); break;
    case 7 : background(#7EE4FF); break;
    case 8 : background(#96FCB9); break;
    case 9 : background(0);       break;
    case 10: background(0);       break;
    case 11: background(#ADF5E2); break;
    case 12: background(#E1F0B3); break;
    case 13: background(#7BAFF0); break;
    case 14: background(0);       break;
    case 15: background(0);       break;
    case 16: background(#ADF5E2); break;
    case 17: background(#F5F1A6); break;
    case 18: background(#EABC66); break;
    case 19: background(0);       break;
    case 20: background(0);       break;
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void drawBottom() {
  rectMode(CENTER);
  noStroke();
  fill(#6F4817);
  rect(1366/2, 760 , 1366, 160 );
  fill(#4F2800);
  rect(1366/2, 695 , 1366, 30 );
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void drawLevel() {
  fill(150,100,250);
  textSize(80 );
  text("LEVEL "+level,1366/2,768/2.2);
  textSize(30 );
  fill(200,100,200);
  text("START",1366/2,768/1.8);
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

float starX[];
float starY[];
void initStars() {
  starX = new float[100];
  starY = new float[100];
  for(int i =0;i<100;i++) {
    starX[i] = random(1366);
    starY[i] = random(768);
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void drawStars() {
  stroke(255);
  strokeWeight(1);
  for(int i = 0; i<100; i++) {
    point(starX[i],starY[i]);
  }
}
