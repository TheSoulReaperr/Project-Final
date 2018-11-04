float vertices1[];
float caveX = 0;
float x;
float y;

void initCaves() {
  vertices1 = new float[1366];
  for(int i=0;i<1366;i++){
    vertices1[i] = random(-5,5);
  }
  x=0;
}

//------------------------------------------------------------------------------------------------

void drawCave(float _h) {
  color c = 0;
  fill(0,0);
  noStroke();
  switch(level) {
    case 16 : c=#C18639; break;
    case 17 : c=#83550F; break;
    case 18 : c=#418B31; break;
    case 19 : c=#765319; break;
    case 20 : c=#B47D24; break;
  }
  fill(c,180);
  pushMatrix();
  x-=speed;
  translate(x,y);
  beginShape();
  vertex(0,0);
  for(int i=0;i<1366;i++){
    vertex(caveX+i*20,_h +vertices1[i]);
  }
  vertex(1366,-768);
  endShape();
  
  beginShape();
  vertex(0,768);
  for(int i=0;i<1366;i++){
    vertex(caveX+i*20,768-_h +vertices1[i]);
  }
  vertex(1366,768*2);
  endShape();
  popMatrix();
  
  if(playerY < _h  || playerY + playerH > 768 - _h ) {
    Crash();
  }
}
