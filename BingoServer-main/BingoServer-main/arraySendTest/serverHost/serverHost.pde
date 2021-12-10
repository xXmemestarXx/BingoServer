import processing.net.*; //<>// //<>// //<>// //<>// //<>//

CBP[] clientData = new CBP[30];
Server s;
String input;
Client c;
Client clients[] = new Client[0]; 
String IP; 
int cNum = 0;
int[] drawnNum = new int[0];
boolean keyP = false;
int num;
boolean goodNum = false;

void setup() {
  size(200, 200);
  background(0);
  frameRate(10);  
  s = new Server(this, 12345);
}

void serverEvent(Server someServer, Client someClient) {
  println("New client connected: " + someClient.ip()); 
  clients = (Client[]) expand(clients, clients.length + 1);
  clients[clients.length - 1] = someClient;
  clients[clients.length - 1].write("CONNECTED");
}

void draw() {
  c = s.available();
  if (c != null) {
    stringInput();
  }
  if (keyPressed) {
    if (key == ' ') {
      if (drawnNum.length < 90) {
        println("----------------");
        checkArrays();
      }
    }
  }
}

void stringInput() {
  input = clients[clients.length - 1].readString();
  print(input + " ");
  clientData[cNum] = new CBP(input);
  cNum++;
}

void checkArrays() {
  drawnNum = expand(drawnNum, drawnNum.length + 1);  
  randomNum();
  println(drawnNum.length + " : good num = " + num);
  goodNum = false;
}

void randomNum() {
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
