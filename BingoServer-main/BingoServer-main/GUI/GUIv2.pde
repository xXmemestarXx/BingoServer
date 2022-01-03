int[] drawnNum = new int[0];
boolean goodNum = false;
int num;

boolean LT = false;
final int DISPLAY_DURATION = 70;
int timer;

void setup() {
  size(1028, 720);
  surface.setResizable(true);
  surface.setTitle("BingoBango");
  frameRate(10);
  smooth();
}


void draw() {
  background(30);
  if (LT){
  timer++;
  }
  println(timer);
  GUI();
}

void displayTrukket(){
  if (keyPressed) {
    if (key == ' ') {
      LT = true;
      
      if (drawnNum.length < 90) {
        println("----------------");
        drawNum();
      }
    }
  }
  if (LT){
    fill(255);
    rectMode(CENTER);
    rect(width/2, height/3, width/2, height/2);
    textSize(width/4);
    textAlign(CENTER, BOTTOM);
    fill(0);
    text(num, width/2, height/2);
    if (timer > DISPLAY_DURATION)
    {
      LT = false;
      timer = 0;
    }
   
  }
}


void GUI() {
  displayTrukket();
  fill(255);
  int n = int(random(1, 91));
    
  if (!LT) {
    textSize(width/4);
    textAlign(CENTER, BOTTOM);
    text(n, width/2, height/2);
  }
/*
  fill(100);
  rectMode(CENTER);
  rect(width/2, height-height/5, width/2, height/3);  
  trukketTal(int(width/3.9), int(height/1.55));
  */
}
/*
void trukketTal(int x, int y) {

  fill(255);
  rectMode(CORNER);
  for (int i=0; i<9; i++) {
    for (int j=0; j<3; j++) {     
      rect(x, y, int(width/18.35), height/10);
      for (int k=0; k<drawnNum.length; k++) {
        textSize(height/33);
        textAlign(CENTER);
        fill(0);
        if (drawnNum[k]==num)
          text(num, x+width/35, y+height/15);
      }
      fill(255);
      y += height/10;
    }
    x += int(width/18.35);
    y = int(height/1.55);
  }
}
*/
void drawNum() {
  randomNum();
  println(drawnNum.length + " : good num = " + num);
  goodNum = false;
}

void randomNum() {
  drawnNum = expand(drawnNum, drawnNum.length + 1);  
  while (goodNum == false) {
    int i = 0;
    num = int(random(1, 91));
    while (i <= drawnNum.length-1) {
      if (num == drawnNum[i]) {
        break;
      } else if (i == drawnNum.length-1 && num != drawnNum[drawnNum.length-1]) {
        drawnNum[drawnNum.length-1] = num;
        goodNum = true;
        break;
      }
      i++;
    }
  }
}
