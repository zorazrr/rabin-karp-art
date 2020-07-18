char[] alphabet = {'a','b','c','d'};
String alphabetString = "abcd";
int[] scores = {1,2,3,4};
String word = "abccbad";

void setup() {
  size(400, 400);
}

void draw() {
  println(rk("cabdddd","abd",5));
  noLoop();
}

int rk(String doc, String wd, int prime){
  int docLen = doc.length();
  int wdLen = wd.length();
  int wdHash = 0; 
  int docHash = 0; 
  for (int i = 0; i < wdLen; i++){
    char letter = wd.charAt(i);
    wdHash += scores[alphabetString.indexOf(letter)] * pow(prime, i);
  }
  for (int i = 0; i < docLen; i++){
    for (int j = 0; j < wdLen; j++){
      char letter = doc.charAt(i + j);
      
    }
  }
  return wdHash;
}
