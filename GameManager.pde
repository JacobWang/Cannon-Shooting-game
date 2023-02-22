// A class functioning as the game helper
public class GameManager {
private int speed;
private int level;
private int state=0;
private PImage bg;
// Constructor for creating the GameManager
public GameManager() {
    level=1;
    speed = 30 - level*10;
    bg=  loadImage("small_back.jpg");
    textAlign(CENTER, CENTER);
  }
// a main method for deciding the status of the game and priting the corresponding text respect to the status
public void run() {   
    background(bg);
    if (state==0) { //when the game does not start
      fill(45, 80, 247, 200);
      stroke(255, 100);
      strokeWeight(4);
      if (abs(mouseX-width/2)<170/2&&abs(mouseY-height/2)<70/2) {
        fill(255, 200);
        if (mousePressed) { // using the click of the mouse to change the status if the game
          state=1;
        }
      }
      rect(width/2-170/2, height/2-70/2, 170, 70, 30);
      fill(241, 181, 71);
      textSize(50);
      text("Start", width/2, height/2-7); // priting the start in the middle of the screen 
    } else if (state==1) { 
      // drawing the cannon and the tank given the specific level 
      cannon.draw();
      tank.draw();
      fill(241, 181, 71);
      textSize(32);
      text("Score: "+score, 80, 84);
      gameManager.level = score/10+1;
      speed = gameManager.getSpeed();
      text("Level: "+gameManager.level, 80, 46);
      if (score < -4) { // if lose to many times turnning the state to the lose state
        state=2;
      }
      if (score>=30) { // if the score is over 30 then wining the game and printing the wining sign
        state=3;
      }

      for (Ball ball : balls) { // pring the ball in the arrayList
        ball.draw();
        ball.step();
        if (intersects(tank, ball)) {
          tank = new Tank(int(random(100, 700)), int(random(100, 540))); // creating a new tank if the previous tank was intersects with the ball
          score += 5;
        }
      }
    } else {
      fill(45, 80, 247, 200);
      stroke(255, 100);
      strokeWeight(4);
      if (abs(mouseX-width/2)<170/2&&abs(mouseY-height/2)<70/2) {
        fill(255, 200);
        if (mousePressed) {
          state=1;
          gameManager=new GameManager();
          balls = new ArrayList<Ball>(); 
          cannon = new Cannon(400, 600);
          tank = new Tank(int(random(100, 700)), int(random(100, 540)));
          score = 0;
        }
      }
      rect(width/2-170/2, height/2-70/2, 170, 70, 30);
      fill(241, 181, 71);
      textSize(40);
      text("Restart", width/2, height/2-7);
    } 
    if (state==2) {  
      fill(241, 181, 71);
      textSize(50);
      text("You missed too many! Lose", width/2, height/2-100); // printing loosing if it is equal to state two
    } else if (state==3) {  
      fill(241, 181, 71);
      textSize(50);
      text("Good job, you win!", width/2, height/2-100); // printing wining if the state is equal to three
    }
  }
// method returning the speed
  public int getSpeed() {
    speed = 30 - level*10;
    return speed;
  }
}
