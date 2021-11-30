import processing.net.*;

Client c;
String input;

int [][] numbers = new int [3][9];
int col = 0;

void setup() {
  c = new Client(this, "10.130.152.195", 12345);

  size(1000, 450);
  int time = 1;
  int time1 = 10;

  for (int i = 0; i < 9; i++) {
    generate(time, time1);
    col++;
    time = time + 10;
    time1 = time1 + 10;
    if (col == 1) time--;
    if (col == 8) time1++;
  }

  sendArray();
}

void generate(int x, int y) {
  for (int i = 0; i < 3; i++) {
    numbers[i][col] = int(random(x, y));
    if (i > 0) {
      while (numbers[i-1][col] == numbers[i][col])
        numbers[i][col] = int(random(x, y));
    }
    if (i > 1) {
      while (numbers[i-2][col] == numbers[i][col] || numbers[i-1][col] == numbers[i][col])
        numbers[i][col] = int(random(x, y));
    }
  }
  if (numbers[0][col] > numbers[1][col]) {
    int temp = numbers[0][col];
    numbers[0][col] = numbers[1][col];
    numbers[1][col] = temp;
  }
  if (numbers[1][col] > numbers[2][col]) {
    int temp = numbers[1][col];
    numbers[1][col] = numbers[2][col];
    numbers[2][col] = temp;
  }
  if (numbers[0][col] > numbers[1][col]) {
    int temp = numbers[0][col];
    numbers[0][col] = numbers[1][col];
    numbers[1][col] = temp;
  }
}

void draw() {
  if (frameCount == 1) {
    gridMake(50, 100);
  }
  
  if (c.available() > 0) {
    input = c.readString();
    println(input);
  }
}

void sendArray() {
  for (int i = 0; i < 9; i++) {
    for (int n = 0; n < 3; n++) {
    c.write(numbers[n][i]);
    }
  }
}

void gridMake(int x, int y) {
  for (int i = 0; i <= 8; i++) {
    square(x, y, 100);
    square(x, 100+y, 100);
    square(x, 200+y, 100);
    x = x +100;
  }
  numbers(50, 100);
}

void numbers(int x, int y) {
  fill(0);
  textAlign(CENTER);
  textSize(50);
  for (int i = 0; i <= 8; i++) {
    for (int r = 0; r <= 2; r++) {
      text(numbers[r][i], 50+x, 75+y);
      y = y +100;
    }
    x = x + 100;
    y = y - 300;
  }
}
