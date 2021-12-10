import processing.net.*; //<>// //<>// //<>// //<>// //<>// //<>//

CBP[] clientData = new CBP[0];
Server s;
String input;
Client c;
Client clients[] = new Client[0]; 
String IP; 
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
        drawNum();
      }
    }
  }
}

void stringInput() {
  input = clients[clients.length - 1].readString();
  print(input + " ");
  clientData = (CBP[]) expand(clientData, clientData.length + 1);
  clientData[clientData.length - 1] = new CBP(input);
}

void drawNum() {
  randomNum();
  println(drawnNum.length + " : good num = " + num);
  goodNum = false;
  checkMatch(num);
  println("Cheked Match");
  checkBingo();
  println("Cheked Bingo");
  println("Rady for next draw");
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

void checkMatch(int n) {
  for (int i = 0; i < clientData.length - 1; i++) {
    for (int j = 0; j < 2; j++) {
      for (int k = 0; k < 8; k++) {
        if (clientData[i].cData[j][k] == n) {
          clientData[i].cData[j][k] = 0;
          break;
        }
      }
    }
  }
}

void checkBingo() {
  for (int i = 0; i < clientData.length - 1; i++) {
    for (int j = 0; j < 2; j++) {
      int sum = 0;
      String row = "";
      int b = 0;
      for (int k = 0; k < 8; k++) {
        sum += clientData[i].cData[j][k];
        row += clientData[i].cData[j][k] + ",";
        b++;
      }
      if (sum == 0) {
        println(clientData[i].navn + " har bingo på række: " + j);
        println("Tal i række: " + row);
      }
    }
  }
}
