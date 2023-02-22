import processing.sound.*; // importing the sound package
private PVector g = new PVector(0, 0.1);
private PVector pos = new PVector(400, 600);
private int speed = 30;
private ArrayList<Ball> balls;
private Cannon cannon;
private Tank tank;
private int score;
private GameManager gameManager;
private SoundFile shoot ;
// the main method of this game 
public void setup() {
  size(800, 640);
  frameRate(30);
  gameManager=new GameManager();
  balls = new ArrayList<Ball>();
  cannon = new Cannon(400, 600);
  tank = new Tank(int(random(100, 700)), int(random(100, 540)));
  score = 0;
  shoot = new SoundFile(this, "sound.mp3");
}
// jumping to the manager for drawing the game
public void draw() {
  gameManager.run();
}
// launching the ball with enter and changing the angle of the cannon with given instrucments.
public void keyPressed() {
  if (keyCode == ENTER) {
    shoot.play();
    int angle = cannon.currentAngle();
    float speedX = speed * cos(radians(angle));
    float speedY = speed * sin(radians(angle));
    balls.add(new Ball(pos.copy(), new PVector(speedX, speedY), 20-gameManager.level*3));
    score -= 1;
  } else if (keyCode == LEFT) {
    cannon.rotate(-5);
  } else if (keyCode == RIGHT) {
    cannon.rotate(5);
  }
}

// if less than 25 pixels on x and y axis, it is considered as hit
public boolean intersects(Tank t, Ball b) {
  PVector t_pos = t.getCoordinates();
  PVector b_pos = b.getCoordinates();

  return abs(t_pos.x+18-b_pos.x)<b.radius/2+18 && abs(t_pos.y-b_pos.y)<b.radius/2+18;
}
