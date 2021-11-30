import processing.net.*;

Server s;
Client c;
String input;


void setup() {
  size(200, 200);
  background(0);
  frameRate(10);  
  s = new Server(this, 12345);
}

void draw() {
  s.write("MODTAGET");
}
