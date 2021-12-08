class CBP{
  String navn;
  String bingoNum;


  CBP(String data) {
    String[] del = split(data, ',');
    navn = del[0];
    for (int i = 1; i < del.length; i++) {
      if (i < del.length-2){
      bingoNum += del[i] + ",";
      }
      else if (i == del.length-1){
        bingoNum += del[i];
      }
    }
    println(navn + " " + bingoNum);
  }
}
