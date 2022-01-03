import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.net.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class serverHost extends PApplet {

 //<>// //<>// //<>// //<>// //<>// //<>//

CBP[] clientData = new CBP[0];
Server s;
String input;
Client c;
Client clients[] = new Client[0]; 
String IP; 
int[] drawnNum = new int[0];
boolean goodNum = false;
int num;

public void setup() {
  
  background(0);
  frameRate(10);  
  s = new Server(this, 12345);
}

public void serverEvent(Server someServer, Client someClient) {
  println("New client connected: " + someClient.ip()); 
  clients = (Client[]) expand(clients, clients.length + 1);
  clients[clients.length - 1] = someClient;
  clients[clients.length - 1].write("CONNECTED");
}

public void draw() {
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

public void stringInput() {
  input = clients[clients.length - 1].readString();
  println(input + " ");
  clientData = (CBP[]) expand(clientData, clientData.length + 1);
  clientData[clientData.length - 1] = new CBP(input);
}

public void drawNum() {
  randomNum();
  println(drawnNum.length + " : good num = " + num);
  goodNum = false;
  checkMatch(num);
  println("Cheked Match");
  checkBingo();
  println("Cheked Bingo");
  for (int i = 0; i < clients.length - 1; i++) {
    clients[i].write(num);
  }
  println("Rady for next draw");
}

public void randomNum() {
  drawnNum = expand(drawnNum, drawnNum.length + 1);  
  while (goodNum == false) {
    int i = 0;
    num = PApplet.parseInt(random(1, 91));
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

public void checkMatch(int n) {
  for (int i = 0; i < clientData.length; i++) {
    println(clientData[i].navn + ": ");
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 9; k++) {
        if (clientData[i].cData[k][j] == n) {
          println("Match ved: " + clientData[i].navn + " Tal: " + clientData[i].cData[k][j]);
          clientData[i].cData[k][j] = 0;
          println("Match pa: " + clientData[i].navn + " Rekke: " + j + " Col: " + k + " nummer: " + clientData[i].cData[k][j]);
          break;
        }
      }
    }
  } 
}

public void checkBingo() {
  for (int i = 0; i < clientData.length; i++) {
    for (int j = 0; j < 3; j++) {
      int sum = 0;
      String row = "";
      for (int k = 0; k < 9; k++) {
        sum += clientData[i].cData[k][j];
        row += clientData[i].cData[k][j] + ",";
      }
      if (sum == 0) {
        println(clientData[i].navn + " har bingo på række: " + j);
        println("Tal i række: " + row);
      }
    }
  }
}
class CBP{
  String navn;
  int[][] cData = new int[9][3];
  String bingoNum;
  


  CBP(String data) {
    int k = 1;
    String[] del = split(data, ',');
    navn = del[0];
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 3; j++) {
        cData[i][j] = PApplet.parseInt(del[k]);
        k++;
      }
    }
  }
}
  public void settings() {  size(200, 200); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "serverHost" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
