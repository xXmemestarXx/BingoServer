import processing.net.*;

Client c;
String input;

int [][] numbers = new int [3][9];
int col = 0;

void setup() {
  c = new Client(this, "10.130.153.145", 12345);
}

void draw(){
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
