import java.util.*;

class Particle{
    PVector pos;                  // position
    PVector vel;                  // velocity
    float dia = 20;               // size   
    boolean isVert;
    boolean isRightOrDown;
    int layer = 1;
    color c;                      // initial color 
    color[] palette = {#265b94, #dbf7ff, #d6caae, #363231};
    IntList colors = new IntList();
    
    Particle()
    {
        c = palette[(int)random(4)];
        colors.append(c);
        double[] randHolder = {0.2, 0.8};
        // a 1/5 chance that the particle moves in diagonal 
        if ((int)(random(5)) == 2){
            pos = new PVector((int) (randHolder[(int)random(2)] * height), (int) (randHolder[(int)random(2)] * width));
            vel = new PVector(random(0.5,2), random(0.5,2));
        }
        else {
            // false: move horizontally
            // true: move vertically 
            isVert = randTruth();
            isRightOrDown = randTruth();
            int dirSign = isRightOrDown? 1:-1;
            
            pos = randStartPos(isVert);
            if(isVert)   vel = new PVector(random(0.5,2) * dirSign, 0);
            else         vel = new PVector(0, random(0.5,2) * dirSign);
          }
        }
    
    // defining a starting position according to the movement direction
    PVector randStartPos(boolean dir)
    {
        float mean = 0;
        float sd = 0.6;  // standard devisation
        float rand = constrain(pow(((randomGaussian() * sd + mean)/1.5),2),0,1);
        int sign = randTruth()? -1:1;
        rand = map(rand * sign, -1,1,0.1,0.9);
        if(dir)   return new PVector(width/2, rand*height);
        else      return new PVector(rand*width, height/2);
    }
    
    int randSign()
    {
        return random(2) > 1? -1:1;
    }
    
    boolean randTruth()
    {
        return random(2) > 1? true:false;
    }
    
    void update()
    {
        pos.add(vel);
    }
    
    // bounce back if particle hits an edge 
    void edges()
    {
        if(pos.x + dia/2 > width)
        {
            vel.x = -1 * Math.abs(vel.x);
            pos.x = width - dia/2;
            isRightOrDown = !isRightOrDown;
        }
        else if(pos.x - dia/2 < 0)
        {
            vel.x = Math.abs(vel.x);
            pos.x = dia/2;
            isRightOrDown = !isRightOrDown;
        }
        else if(pos.y + dia/2 > height)
        {
            vel.y = -1 * Math.abs(vel.y);
            pos.y = height - dia/2;
            isRightOrDown = !isRightOrDown;
        }
        else if(pos.y - dia/2 < 0)
        {
            pos.y = dia/2;
            vel.y = Math.abs(vel.y);
            isRightOrDown = !isRightOrDown;
        }
    }
    
    void display()
    {
        noStroke();
        fill(colors.get(colors.size() - 1));
        ellipse(pos.x, pos.y, dia + layer, dia + layer);
        //for (int i = this.layer; i > 0; i--){
        //  fill(colors.get(colors.size() - 1));
        //  ellipse(pos.x, pos.y, dia + i * 5, dia + i * 5);
        //}
    }
}
