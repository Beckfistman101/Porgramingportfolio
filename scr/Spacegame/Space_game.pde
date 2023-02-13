// alex neeley | 28 nov 2022| space game
import processing.sound.*;
SoundFile pew;
SoundFile rockgoboom;
SoundFile spaceshiphit;
SoundFile SpaceStationhit;
SoundFile determination;
SpaceShip s1;
Timer  rockTimer, powerUpTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Star[] stars=new Star[250];
int score, level, rockCount, laserCount, station;
boolean play;

void setup() {
  size(800, 800);
  pew = new SoundFile(this, "pew.wav");
  rockgoboom= new SoundFile(this, "rockgoboom.wav");
  spaceshiphit= new SoundFile(this, "spaceshiphit.wav");
  SpaceStationhit= new SoundFile(this, "SpaceStationhit.wav");
  determination= new SoundFile(this,"determination.wav");
  s1= new SpaceShip();
  rockTimer= new Timer(800);
  rockTimer.start();
  powerUpTimer= new Timer(6000);
  powerUpTimer.start();
  for (int i=0; i<stars.length; i++) {
    stars[i]=new Star ();
  }
  score=0;
  level=1;
  rockCount=0;
  laserCount=0;
  play= false;
  station=5000;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(2);
    //rendering stars
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }


    noCursor();
    //dis poweruspsssss
     if (powerUpTimer.isFinished()) {
      powerUps.add(new PowerUp());
      powerUpTimer.start();
      
    }
    //render powerupsspspps
    for (int i = 0; i < powerUps.size(); i++) {
      PowerUp pu = powerUps.get(i);
      if (pu.intersect(s1)) {
        if(pu.val=='H'){
          s1.health+=100;
        }else if(pu.val=='A'){
          s1.ammo+=100;
        }else{
          s1.turretCount++;
        }
        

        //add effects
        powerUps.remove(pu);
        
      }
      if (pu.reachedBottom()) {
        rocks.remove(pu);
       
        
      } else {
        pu.display();
        pu.move();
      }
    }
    //add rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      println("rocks:" +rocks.size());
    }

    //rendering rocks
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=r.diam;

        //add effects
        rocks.remove(r);
        spaceshiphit.play();
        spaceshiphit.stop();
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
        println("rocks:" +rocks.size());
        station-=r.diam;
        score-=r.diam;
        SpaceStationhit.stop();
        SpaceStationhit.play();
      } else {
        r.display();
        r.move();
      }
    }


    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          lasers.remove(l);
          r.diam-= 70;
          if (r.diam<10) {
            rocks.remove(r);
            rockgoboom.stop();
            rockgoboom.play();
          }
          score+=100;
        }
        if (l.reachedTop()) {
          lasers.remove(l);
        } else {
          l.display();
          l.move();
        }
      }
    }
    s1.display(mouseX, mouseY);
    infoPanel();
    if (s1.health<1) {
      gameOver();
    }if(station<1){
      gameOver();
    }
  }
}
//add laser
void mousePressed() {

  handleEvent();
}
void keyPressed() {

  if (key==' ') {
    handleEvent();
  }
}
void handleEvent() {
  if (play) {

    if (s1.fire()&& s1.turretCount==1) {
      pew.stop();
      pew.play();
      lasers.add(new Laser(s1.x, s1.y));
      println("Lasers:"+ lasers.size());
    } else if (s1.fire()&& s1.turretCount==2) {
      pew.stop();
      pew.play();
      lasers.add(new Laser(s1.x+20, s1.y));
      lasers.add(new Laser(s1.x-20, s1.y));
      println("Lasers:"+ lasers.size());
    } else if (s1.fire()&& s1.turretCount==3) {
      pew.stop();
      pew.play();
      lasers.add(new Laser(s1.x, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      lasers.add(new Laser(s1.x-20, s1.y));
      println("Lasers:"+ lasers.size());
    } else if (s1.fire()&& s1.turretCount==4) {
      pew.stop();
      pew.play();
      lasers.add(new Laser(s1.x+40, s1.y));
      lasers.add(new Laser(s1.x-40, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      lasers.add(new Laser(s1.x-20, s1.y));
      println("Lasers:"+ lasers.size());
    } else {
      pew.stop();
      pew.play();
      lasers.add(new Laser(s1.x+40, s1.y));
      lasers.add(new Laser(s1.x-40, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x, s1.y));
      println("Lasers:"+ lasers.size());
    }
  }
}


void infoPanel() {
  fill(128, 127);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255, 200, 0);
  textSize(28);
  textAlign(CENTER);
  text("Ship Health:"+s1.health+"|Station health"+ station+"| level:"+level+" score:" +score+"| Ammo:"+ s1.ammo, width/2, 35);
}
void startScreen() {
  background(0);
  fill(255, 200, 0);
  textAlign(CENTER);
  textSize(30);
  text("Click or press any key to start...", width/2, height/2);
  if (mousePressed|| keyPressed) {
    play=true;
  }
}
void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Game Over", width/2, height/2);
  play= false;
  determination.play();
  noLoop();
  
}
