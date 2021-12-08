//match() kan bruges som funktion til at sammenligne 2 strings, så lad os beholde den i string form i stedet for at konvetere den til arrayS.

import processing.net.*;

CBP[] clientData = new CBP[30];
Server s;
String input;
Client c;
Client clients[] = new Client[0]; 
String IP; 
int cNum = 0;


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
}

void draw() {
  c = s.available();
  if (c != null) {
    stringInput();
    //stringtoArray();
  }
}

void stringInput() {
  input = clients[clients.length-1].readString();
  print(input + " ");
  clientData[cNum] = new CBP(input);
  cNum++;
}

//void stringtoArray(String input){
  //input[][] parsedArray = split(input, ",");
  //input[][] = new int[3][9]
  //print(parsedArray);
//}
