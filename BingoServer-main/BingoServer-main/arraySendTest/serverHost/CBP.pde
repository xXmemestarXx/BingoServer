class CBP{
  String navn;
  String bingoNum;
  int k = 1;


  CBP(String data) {
    String[] del = split(data, ',');
    navn = del[0];
    int[][] cData = new int[3][9];
    for(int i=0; i<8; i++){
      for(int j=0; j<2; j++){
        cData[j][i] = int(del[k]);
        k++;
      }
    }
  }
}
