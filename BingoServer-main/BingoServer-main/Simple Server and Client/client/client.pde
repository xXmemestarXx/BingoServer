import processing.net.*;

Client c;
String input;


void setup() {
  size(200, 200);
  background(0);
  frameRate(10);
  c = new Client(this, "192.168.87.178", 12345);
}

void draw() {
  if (c.available() > 0) {
    input = c.readString();
    println(input);
  }
  c.write("Nigga");
}
