// Rabin Karp Search Algorithm Generative Art
// By Phillip Miao & Zora Zhang

import java.util.*; 

int numOfAlph = 4;                          // the number of Alphs exist in txt and wd (counting from `a`)

void setup() {
  size(500, 500);
  pixelDensity(2);
}

void draw() {
  test(1000);
  noLoop();
}

// unit testing

void test(int times)
{
    for(int i = 0; i < times; i++)
    {
        RK rk = new RK(100, 4, numOfAlph);
        if(rk.index != rk.txt.indexOf(rk.wd))
        {
            println("Error!!\n\t" + rk.txt + " and " + rk.wd + ": ");
            println("\trk:   " + rk.index);
            println("\treal: " + rk.txt.indexOf(rk.wd));
            return;
        }
    }
    
    println("All good!");
}

String randString(int len, int numOfAlph){
  String holder = "";
  for (int i = 0; i < len; i++){
    holder += char('a' + (int) random(0, numOfAlph));
  }
  return holder;
}
