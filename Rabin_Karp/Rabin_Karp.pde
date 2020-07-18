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
  String pattern = randString(4);
  String text = randString(30);
  println(text);
  println(pattern);
  print(rk(text,pattern));
  noLoop();
}

String randString(int len){
  String holder = "";
  for (int i = 0; i < len; i++){
    int rand = (int) random(0,4);
    if (rand == 0){holder += "a";}
    else if (rand == 1){holder += "b";}
    else if (rand == 2){holder += "c";}
    else {holder += "d"; }
  }
  return holder;
}

int getHash(String txt, int index, int exp){
  int hash = 0;
  char letter = txt.charAt(index);
  hash += scores[alphabetString.indexOf(letter)] * pow(prime, exp);
  return hash;
}

boolean rk(String txt, String wd){
  // Get information of the word that we are searching for 
  int wdHash = 0; 
  int wdLen = wd.length();
  for (int i = 0; i < wd.length(); i++){
    wdHash += getHash(wd, i, i);
  }
  
  // Get information of the document that we are searching in 
  int txtLen = txt.length(); 
  int txtHash = 0; 
  
  // get first hash
  for (int i = 0; i < wdLen; i++){
    txtHash += getHash(txt, i, i);
  }
  
  // rolling hash
  for (int i = wdLen; i < txtLen; i++){
    if (wdHash == txtHash){
      return true;
    }
    else{
      int newHash = getHash(txt, i, wdLen - 1);
      int oldHash = getHash(txt, (i - wdLen), 0);
      txtHash = (txtHash - oldHash)/prime + newHash;
    }
    if (wdHash == txtHash){
      return true;
    }
  }
  return false;
}
