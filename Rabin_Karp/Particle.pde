import java.util.*;

class Particle{
    PVector pos;
    PVector vel;
    float dia = 20;
    boolean isVert;
    boolean isRightOrDown;
    
    Particle()
    {
        // false: move horizontally
        isVert = randTruth();
        isRightOrDown = randTruth();
        int dirSign = isRightOrDown? 1:-1;
        
        pos = randStartPos(isVert);
        if(isVert)   vel = new PVector(random(0.5,2) * dirSign, 0);
        else         vel = new PVector(0, random(0.5,2) * dirSign);
    }
    
    PVector randStartPos(boolean dir)
    {
        float rand = constrain(pow((randomGaussian()/1.5),2),0,1);
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
        ellipse(pos.x, pos.y, dia, dia);
    }
}
