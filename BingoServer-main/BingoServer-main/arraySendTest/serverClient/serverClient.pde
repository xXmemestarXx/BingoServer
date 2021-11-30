import processing.net.*;

Client c;
String input;

int [][] numbers = new int [3][9];
int col = 0;

void setup() {
  c = new Client(this, "10.130.153.145", 12345);
}

void draw() {
  if (c.available() > 0) {
    input = c.readString();
    println(input);
    SendBingoplade();
  }
}

void SendBingoplade(){
  c.write("1,2,3,11,12,13,21,22,23,31,32,33,41,42,43,51,52,53,61,62,63,71,72,73,81,82,83");
}
