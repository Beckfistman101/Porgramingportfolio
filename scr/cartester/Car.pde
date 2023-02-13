class Car {
  color c;
  float xpos, ypos, xspeed;
  

  //constuctor
  Car() {
    c= color(random(255), random(255), random(255));
    xpos=random(width);
    ypos=random(height);
    xspeed=random(-5,5);
  }
  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10);
    fill(0);
    rect(xpos-6, ypos-6, 6, 3);
    rect(xpos-6, ypos+7, 6, 3);
    rect(xpos+6, ypos-6, 6, 3);
    rect(xpos+6, ypos+7, 6, 3);
    fill(255);
    rect(xpos+3, ypos, 3, 6);
  }
  void drive() {
    xpos+=xspeed;
    if (xpos>width) {
      xpos=0;
    }
  }
}
