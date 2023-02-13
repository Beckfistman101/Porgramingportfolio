//alex neeley |oct 31 2022
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal="0.0";
boolean left= true;
float l, r, result;
char op= ' ';

void setup() {
  size(500, 500);
  numButtons[0] = new Button(40, 225, 50, 50, '0');
  numButtons[1] = new Button(40, 280, 50, 50, '1');
  numButtons[2] = new Button(40, 335, 50, 50, '2');
  numButtons[3] = new Button(40, 390, 50, 50, '3');
  numButtons[4] = new Button(40, 445, 50, 50, '4');
  numButtons[5] = new Button(95, 225, 50, 50, '5');
  numButtons[6] = new Button(95, 280, 50, 50, '6');
  numButtons[7] = new Button(95, 335, 50, 50, '7');
  numButtons[8] = new Button(95, 390, 50, 50, '8');
  numButtons[9] = new Button(95, 445, 50, 50, '9');
  opButtons[0]= new Button(230, 445, 100, 50, '=');
  opButtons[1]= new Button(150, 335, 50, 50, '÷');
  opButtons[2]= new Button(150, 390, 50, 50, '+');
  opButtons[3]= new Button(150, 445, 50, 50, '-');
  opButtons[4]= new Button(150, 280, 50, 50, 'x');
  opButtons[5]= new Button(150, 225, 50, 50, '±');
  opButtons[6]= new Button(205, 280, 50, 50, '%');
  opButtons[7]= new Button(230, 335, 100, 50, 'π');
  opButtons[8]= new Button(230, 390, 100, 50, '√');
  opButtons[9]= new Button(205, 225, 50, 50, '²');
  opButtons[10]= new Button(257, 225, 45, 50, 'c');
  opButtons[11]= new Button(257, 280, 45, 50, '.');
}

void draw() {
  background(50);
  fill(10, 15, 255);
  rect(150, 280, 300, 400, 20);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      if (dVal.equals("0.0")) {
        dVal = str(numButtons[i].val);
      } else {
        dVal += str(numButtons[i].val);
      }
    }
    if (left) {
      l=float(dVal);
    } else {
      r= float(dVal);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val== 'c') {
      dVal= "0.0";
      left =true;
      l=0.0;
      r=0.0;
      result =0.0;
      op= ' ';
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      op ='+';
      dVal ="0.0";
      left=false;
    } else if (opButtons[i].on && opButtons[i].val == 'x') {
      op ='x';
      dVal ="0.0" ;
      left=false;
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      op ='÷';
      dVal ="0.0" ;
      left=false;
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      op ='±';
      dVal ="±" ;
      left=false;
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      op ='%';
      dVal ="%" ;
      left=false;
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      op ='π';
      dVal ="π" ;
      left=false;
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      op ='√';
      dVal ="√" ;
      left=false;;
    } else if (opButtons[i].on && opButtons[i].val == '²') {
      op ='²';
      dVal ="²" ;
      left=false;;
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      op ='.';
      dVal ="." ;
      left=false;
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      op ='-';
      dVal ="0.0" ;
      left=false;
    }else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    }
  }
  println("l:"+ l+"r:"+ r+ "op:" +op+"result:" + result + "left" + left);
}

void updateDisplay() {
  fill(245);
  rect(147, 145, 265, 100, 10);
  fill (0);
  textSize(15);
  textAlign(RIGHT);
  text(dVal, width-255, 155);
}

void performCalculation() {
  if (op == '+') {
    result = l+ r;
  } else if (op == '-') {
    result = l - r;
  } else if (op=='x') {
    result= l * r;
  } else if (op=='÷') {
    result= l/r;
  }
  dVal=str(result);
}
