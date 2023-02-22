// A class for the cannon
public class Cannon {
private int x;
private int y;
private int length;
private int angle;
// Constructor for creating the cannon with specific index given 
public Cannon(int x, int y) {
    this.x = x;
    this.y = y;
    this.length = 30;
    this.angle = 270;
  }
// drawing the cannon in the console
public void draw() {
    float deltaX = length*cos(radians(angle));
    float deltaY = length*sin(radians(angle));
    strokeWeight(16);
    stroke(92, 130, 228);
    line(x, y, x+deltaX, y+deltaY);
    noStroke();
    fill(92, 130, 228);
    ellipse(x, y, 30, 30);
    strokeWeight(10);
    stroke(216, 220, 230);
    line(x, y, x+deltaX, y+deltaY);
    noStroke();
    fill(216, 220, 230);
    ellipse(x, y, 24, 24);
  }
// method for rotating the cannon with specific degree 
public void rotate(int degree) {
    angle += degree;
  }
// method for returning the value of the cannon's current angle
public int currentAngle() {
    return angle;
  }
}
