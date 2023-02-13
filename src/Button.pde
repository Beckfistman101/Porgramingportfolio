class Button {
  //member Varibles
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;

  //constucter
  Button (int x, int y, int w, int h, char val) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.val= val;
    c1 = color(150,255,100);
    c2 = color(255,50,50);
    on = false;
  }
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h,25);
    textAlign(CENTER);
    fill(0);

    if (val == 'c') {
      text("AC", x, y);
    } else {
      text(val, x, y);
    }
  }
  void hover(int mx, int my) {
    on = (mx>x-w/2 && mx < x+w/2&& my>y-h/2&&my<y+h/2);
  }
}
