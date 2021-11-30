import processing.net.*; //<>//

Server s;
int input;
Client c;
Client clients[] = new Client[0];
String IP;

int[][] plate = new int [3][9];
int col, row;


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
  col = 0; row = 0;
}

void draw() {
  c = s.available();
  if (c != null) {
    arrayInput();
  }
}

void arrayInput() {
  if (col < 9) {
    input = clients[clients.length-1].read();
    plate[row][col] = input;
    row++;
    if (row == 3) {
      row = 0;
      col++;
    }
  }
  print(input + " ");
  if (col == 9 && row == 0) {
    clients[clients.length-1].write("ARRAY MODTAGET "); 
  }
}
