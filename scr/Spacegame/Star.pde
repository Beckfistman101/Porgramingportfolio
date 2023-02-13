class Star {
  int x, y, diam, speed;


  //constucter
  Star() {
    x=int(random(width));
    y=int(random(height));
    diam =int(random(1, 4));
    speed= int(random(2, 10));
  }
  void display() {
    fill(22, 223, 0);
    circle(x, y, diam);
  }


  void move() {
    if (y>height+5) {
      y=-5;
    } else {
      y=y+speed;
    }
  }


  boolean reachedBottom() {
    return true;
  }
}
