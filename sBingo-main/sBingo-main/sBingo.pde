int[] bingoPlade = new int[3];

void setup() {

  bingoPlade = talGenerator(1, 10);
  printArray (bingoPlade);
  println();
  int[] t = {5,3,2};
  //printArray (sorter(bingoPlade));
  printArray (sorter(t));
}

void draw() {
}


//Intarray talGenerator(min max)
int[] talGenerator(int min, int max) {
  // opret integerArray
  int[] tal = new int[3];
  //gentag tre gange med et for loop
  for (int i=0; i<3; i++) {
    // tilføj tallet til array
    tal[i] = (int)random(min, max+1);
    if (i>0) {
      while (tal[i-1]== tal[i]) {
        tal[i] = (int)random(min, max+1);
      }
      if (i>1) {
        while (tal[i-2]== tal[i]) {
          tal[i] = (int)random(min, max+1);
        }
      }
    }
  }

  return tal;
}

int[] sorter(int[] tal) {

  int i=0;
  while (i<2) { //<>//
    if (tal[i]>tal[i+1]) {
      int temp=0;
      temp = tal[i];
      tal[i]= tal[i+1];
      tal[i+1]=temp;
      i--;
    }
    i++;
  }
  return tal;
}
