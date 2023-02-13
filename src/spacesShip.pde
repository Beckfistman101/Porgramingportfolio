class SpaceShip {
  int x, y, w, ammo, turretCount, health;
  PImage ship;

  //constructer
  SpaceShip() {

    x=0;
    y=0;
    w=90;
    ammo=100;
    turretCount =1;
    health=1000;
    ship=loadImage("Ship.gif");
  }
  void display(int tempX, int tempY) {
    x=tempX;
    y=tempY;
    imageMode(CENTER);
    ship.resize(90, 90);
    image(ship, x, y);
  }

  void move(int tempx, int tempy) {
    x=tempx;
    y=tempy;
  }

  boolean fire() {
    if (ammo>0) {
      ammo=ammo-1;
      return true;
      
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<rock.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
