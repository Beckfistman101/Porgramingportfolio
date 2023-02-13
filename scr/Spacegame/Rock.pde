class Rock {
  int x, y, diam, speed;
  PImage rock;

  //constucter
  Rock() {
    x=int(random(width));
    y=-50;
    diam =int(random(50, 250));
    speed= int(random(1, 7));
    rock= loadImage("Rock.png");
  }
  void display() {
    rock.resize(diam, diam);
    imageMode(CENTER);
    image(rock, x, y);
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
}
