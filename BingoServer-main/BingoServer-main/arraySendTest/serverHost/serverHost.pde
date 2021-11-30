import processing.net.*; //<>//

Server s;
String input;
Client c;
Client clients[] = new Client[0];
String IP;
String Navn;
String[] cData = new String[]


void setup() {
  size(200, 200);
  background(0);
  frameRate(10);  
  s = new Server(this, 12345);
}

void serverEvent(Server someServer, Client someClient) {
  println("New client conectet: " + someClient.ip()); 
  clients = (Client[]) expand(clients, clients.length+1);
  clients[clients.length-1] = someClient;
  clients[clients.length-1].write("CONNECTET");
  bingoPlade();
}

void draw() {
  c = s.available();
  if (c != null) {
    stringInput();
  }
}

void stringInput() {
  input = clients[clients.length-1].readString();
  print(input + " ");
  
}

void stringToArray() {
  cData = split(input, ",");
  String[] temp = subset(cData, 1);
  int[] cNum = int(temp);
  int[] cData[0] = new int[];
} //<>//
