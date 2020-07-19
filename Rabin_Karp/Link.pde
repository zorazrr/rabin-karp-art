class Link{
    
    Particle p1;
    Particle p2;
    Line l1;
    Line l2;
    
    boolean isColliding;
    
    Link(Particle p1, Particle p2)
    {
        this.p1 = p1;
        this.p2 = p2;
    }
    
    boolean needCheck()
    {
        return !(isSameHorVer() && isSameDir());
    }
    
    boolean isSameHorVer()
    {
        return (p1.isVert && p2.isVert) || (!p1.isVert && !p2.isVert);
    }
    
    boolean isSameDir()
    {
        return (p1.isRightOrDown && p2.isRightOrDown) || (!p1.isRightOrDown && !p2.isRightOrDown);
    }
    
    void collide()
    {
        if(!needCheck()) return;
        if(isColliding())
        {
            if(!isColliding)
            {
                p1.dia += 1;
                p2.dia += 1;
                l1 = new Line(p1.pos, PVector.add(p1.pos,p1.vel));
                l2 = new Line(p2.pos, PVector.add(p2.pos,p2.vel));
                lines.add(l1);
                lines.add(l2);
                //p1.vel.mult(0.97);
                //p2.vel.mult(0.97);
                isColliding = true;
            }
            else
            {
                l1.end.add(p1.vel);
                l2.end.add(p2.vel);
            }
            
        }
        else
        {
            isColliding = false;
        }
    }
    
    boolean isColliding()
    {
        float dis = PVector.sub(p2.pos, (p1.pos)).mag();
        return dis < (p1.dia + p2.dia)/2;
    }
}
