// Rabin Karp Search Algorithm Generative Art
// By Phillip Miao & Zora Zhang

import java.util.*; 

char[] alphabet = {'a','b','c','d'};                    // Usable alphabets 
String alphabetString = "abcd";                          // Index reference
int[] scores = {1,2,3,4};                                // Matching scores
int prime = 5;                                           // Prime number 
ArrayList<Integer> results = new ArrayList<Integer>();   // Arraylist of all hashes 

void setup() {
  size(500, 500);
  pixelDensity(2);
}

void draw() {
  test(1000);
  noLoop();
}

void test(int times)
{
    for(int i = 0; i < times; i++)
    {
        String pattern = randString(2);
        String text = randString(30);
        RK rk = new RK(text, pattern);
        if(rk.index != text.indexOf(pattern))
        {
            println("Error!!\n\t" + text + " and " + pattern + ": ");
            println("\trk:   " + rk.index);
            println("\treal: " + text.indexOf(pattern));
            return;
        }
    }
    
    println("All good!");
}

String randString(int len){
  String holder = "";
  for (int i = 0; i < len; i++){
    holder += char('a' + (int) random(0, 4));
  }
  return holder;
}
