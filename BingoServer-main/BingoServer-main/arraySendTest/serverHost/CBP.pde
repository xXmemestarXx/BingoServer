class CBP{
  String navn;
  int[][] cData = new int[3][9];
  String bingoNum;
  


  CBP(String data) {
    int k = 1;
    String[] del = split(data, ',');
    navn = del[0];
    for(int i=0; i<8; i++){
      for(int j=0; j<2; j++){
        cData[j][i] = int(del[k]);
        k++;
      }
    }
  }
}
