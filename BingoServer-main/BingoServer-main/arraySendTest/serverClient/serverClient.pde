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
  c.write("Bingoplade bitch!");
}
