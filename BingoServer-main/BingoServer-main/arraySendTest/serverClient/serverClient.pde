import processing.net.*;

Client c;
String input;

int [][] numbers = new int [3][9];
int col = 0;
int in;
boolean send = false;

void setup() {
  c = new Client(this, "192.168.1.227", 12345);
}

void draw() {
  if (send == false) { 
    if (c.available() > 0) {
      input = c.readString();
      println(input);
      SendBingoplade();
      send = true;
    }
  }
  if (c.available() > 0) {
    in = c.read();
    println("Nummer er: " + in);
  }
}

void SendBingoplade() {
  c.write("Kris,1,2,3,11,12,13,21,22,23,31,32,33,41,42,43,51,52,53,61,62,63,71,72,73,81,82,83");
}
