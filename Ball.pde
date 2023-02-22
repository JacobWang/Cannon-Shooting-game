// A class for the cannonball shooting from the cannon
public class Ball {
private PVector g = new PVector(0, 0.1); 
private PVector pos;
private PVector speed;
private int radius;

// constructor for creating the ball
public Ball(PVector pos, PVector speed,int radius) {
    this.pos = pos;
    this.speed = speed;
    this.radius = radius;
  }
// Drawing the ball with specific value in the console
public void draw() {
    fill(211, 211, 211);
    strokeWeight(4);
    stroke(92, 130, 228);
    ellipse(pos.x, pos.y, radius, radius);
  }
// adding gravity for the ball 
public void step() {
    speed.add(g);
    pos.add(speed);
  }
// returning the coordinates of the ball 
public PVector getCoordinates() {
    return pos;
  }
}
