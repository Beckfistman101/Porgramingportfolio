class PowerUp {
  int x, y, diam, speed;
  char val;
  //PImage rock;

  //constucter
  PowerUp() {
    x=int(random(width));
    y=-50;
    diam =int(random(20, 50 ));
    speed= int(random(1, 7));
    //rock= loadImage("Rock.png");
    int rand= int(random(3));
    if (rand == 0) {
      val='A';
    } else if (rand == 1) {
      val='H';
    } else {
      val='P';
    }
  }
  void display() {
    fill(200, 200, 20);
    ellipse(x, y, diam, diam);
    fill(0);
    textAlign(CENTER);
    text(val, x, y);
    // rock.resize(diam, diam);
    //imageMode(CENTER);
    //image(rock, x, y);
  }


  void move() {
    y=y+speed;
  }


  boolean reachedBottom() {
    if (y> height+30) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(SpaceShip ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
