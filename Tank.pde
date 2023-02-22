// A class for the Tank
public class Tank {

private  PVector pos;
private  PVector spd1;
private  PVector spd2;
// constructor for creating the tank
public Tank(int x, int y) {
    pos = new PVector(x, y);
    spd1 = new PVector(1, 0); // speed for level 2
    spd2 = new PVector(4, 0); // speed for level 3
  }
// drawing the tank in the console
public void draw() {
    strokeWeight(4);
    stroke(241, 87, 56);
    fill(216, 220, 230);
    rect(pos.x, pos.y, 35, 30, 5);
    if (spd1.x>0&spd2.x>0) { 
      rect(pos.x+15, pos.y+13, 35, 4);
    } else { 
      rect(pos.x-20, pos.y+13, 35, 4);
    }
    
    if (gameManager.level==2) {
      pos.add(spd1);
      if (pos.x>width-20) 
      {
        pos.x=width-20;
        spd1.x*=-1;
      }   
      if (pos.x<20) 
      {
        pos.x=20;
        spd1.x*=-1;
      }
    }
    if (gameManager.level>=3) {
      pos.add(spd2);
      if (pos.x>width-20) 
      {
        pos.x=width-20;
        spd2.x*=-1;
      }   
      if (pos.x<20) 
      {
        pos.x=20;
        spd2.x*=-1;
      }
    }
  }
// returning the coordinates of the ball 
public  PVector getCoordinates() {
    return pos;
  }
}
