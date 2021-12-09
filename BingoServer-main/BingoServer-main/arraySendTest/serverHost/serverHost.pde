import processing.net.*;

CBP[] clientData = new CBP[30];
Server s;
String input;
Client c;
Client clients[] = new Client[0]; 
String IP; 
int cNum = 0;
int[] drawnNum = new int[0];
boolean keyP = false;
boolean boolean1 = false;
int num; 

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

void draw() { //<>//
    c = s.available();
    if(c != null) {
        stringInput();
}
    if (keyPressed) {
      if(key == ' '){
        checkArrays();  //<>//
        print(num);
      } 
  }
}

void stringInput() {
    input = clients[clients.length - 1].readString();
    print(input + " ");
    clientData[cNum] = new CBP(input);
    cNum++;
}

void checkArrays() { //<>//
    drawnNum = expand(drawnNum, drawnNum.length + 1);   //<>//
    randomNum();
    print(drawnNum.length);
}

void randomNum() {
    while(boolean1 == false) {
        int i = 0;
          boolean boolean2 = true;
        num = int(random(1, 91)); 
        while(boolean2 == true) {
            while(i<drawnNum.length-1){
            if (drawnNum[i] == num) {
                boolean2 = false;
                i = drawnNum.length;
            }
            if(i == drawnNum.length-1){
              boolean1 = true;
              i = drawnNum.length;
              boolean1 = false;
            }
            i++;
            }
    }
    }
}
