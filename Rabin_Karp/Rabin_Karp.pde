// Rabin Karp Search Algorithm Generative Art
// By Phillip Miao & Zora Zhang

import java.util.*; 


Particle[] ps;                             // array that stores all the moving particles   

Link[] links;                              // array that stores the link between particles 

ArrayList<Line> lines;                     // arraylist that stores all the lines 

int numOfParticle = 30;                    // number of particles

int numOfAlph = 4;                         // the number of Alphs exist in txt and wd (counting from `a`)

void setup()
{
    
    // init particles
    ps = new Particle[numOfParticle];
    for(int i = 0; i < numOfParticle; i++){
        ps[i] = new Particle(); 
    }
    
    
    //init lines
    lines = new ArrayList<Line>();
    
    // init links
    links = new Link[numOfParticle * (numOfParticle - 1) / 2];
    int count = 0;
    for(int i = 0; i < numOfParticle; i++)
    {
        for(int j = i+1; j < numOfParticle; j++)
        {
            links[count++] = new Link(ps[i], ps[j]);
        }
    }
    
    size(500, 500);
    pixelDensity(2);
}

void draw()
{
    background(255);
    displayLines();
    for(Particle p : ps)
    {
        p.update();
        p.edges();
        //p.display();
        for (int i = p.layer; i > 0; i --){
          p.display();
        }
    }
    checkColliding();
}

void checkColliding()
{
    for(Link l : links)
    {
        l.collide();
    }
}

void displayLines()
{
    for(Line l : lines) l.display();
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
