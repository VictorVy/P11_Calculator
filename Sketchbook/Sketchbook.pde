import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer buttonSFX;

String input;
int cap;

char[] operators = {'+', '-', '*', '/', '^', '√'};
char operator = ' ';
char op2 = ' ';
char op3 = ' ';
char errorOp = ' ';

double x, y, result;

color black = 0;
color background = #E8E8E8;
color textBG = #FAFAFA;
color ui = #DED6D2;
color uiDark = #B7ADA8;

String mousePos;

int textBoxWidth;
int textBoxHeight;
int textBoxCorner;

int buttonSize;

int column1;
int column2;
int column3;
int column4;

int row1;
int row2;
int row3;
int row4;
int row5;

int btnSkinWidthX;
int btnSkinWidthY;

Button button1;
Button button2;
Button button3;
Button button4;
Button button5;
Button button6;
Button button7;
Button button8;
Button button9;
Button button0;

Button buttonAdd;
Button buttonMinus;
Button buttonTimes;
Button buttonDivide;
Button buttonPow;
Button buttonSqrt;

Button buttonDot;
Button buttonEquals;
Button buttonClear;

void setup()
{
  size(350, 475);
  background(background);
  
  minim = new Minim(this);
  buttonSFX = minim.loadFile("click.wav");
  
  input = "";
  cap = 12;
  
  textBoxWidth = width - 30;
  textBoxHeight = 50;
  textBoxCorner = 15;

  buttonSize = 60;

  column1 = textBoxCorner + 15;
  column2 = column1 + buttonSize + 15;
  column3 = column2 + buttonSize + 15;
  column4 = column3 + buttonSize + 15;

  row1 = 80;
  row2 = row1 + buttonSize + 15;
  row3 = row2 + buttonSize + 15;
  row4 = row3 + buttonSize + 15;
  row5 = row4 + buttonSize + 15;
  
  btnSkinWidthX = buttonSize / 4 + 2;
  btnSkinWidthY = buttonSize - buttonSize / 4;
  
  button1 = new Button(column1, row1, buttonSize, "1");
  button2 = new Button(column2, row1, buttonSize, "2");
  button3 = new Button(column3, row1, buttonSize, "3");
  button4 = new Button(column1, row2, buttonSize, "4");
  button5 = new Button(column2, row2, buttonSize, "5");
  button6 = new Button(column3, row2, buttonSize, "6");
  button7 = new Button(column1, row3, buttonSize, "7");
  button8 = new Button(column2, row3, buttonSize, "8");
  button9 = new Button(column3, row3, buttonSize, "9");
  button0 = new Button(column2, row4, buttonSize, "0");
  
  buttonAdd = new Button(column4, row1, buttonSize, "+");
  buttonMinus = new Button(column4, row2, buttonSize, "-");
  buttonTimes = new Button(column4, row3, buttonSize, "*");
  buttonDivide = new Button(column4, row4, buttonSize, "/");
  buttonPow = new Button(column4, row5, buttonSize, "^");
  buttonSqrt = new Button(column3, row5, buttonSize, "√");
  
  buttonDot = new Button(column1, row4, buttonSize, ".");
  buttonEquals = new Button(column3, row4, buttonSize, "=");
  buttonClear = new Button(column1, row5, buttonSize, "c");
}

void draw()
{
  textBox();
  
  fill(black);
  text(input, textBoxCorner + 2, textBoxCorner, textBoxWidth, textBoxHeight);
  
  mousePos();
  drawButtons();
}

void mouseReleased()
{
  updateInput();
}

void clearInput()
{
  input = "";
}

void replaceInput(String k)
{
  clearInput();
  input = k;
}

void updateInput()
{
  button1.updateInput();
  button2.updateInput();
  button3.updateInput();
  button4.updateInput();
  button5.updateInput();
  button6.updateInput();
  button7.updateInput();
  button8.updateInput();
  button9.updateInput();
  button0.updateInput();
  
  buttonAdd.updateInput();
  buttonMinus.updateInput();
  buttonTimes.updateInput();
  buttonDivide.updateInput();
  buttonPow.updateInput();
  buttonSqrt.updateInput();
  
  buttonDot.updateInput();
  buttonEquals.updateInput();
  buttonClear.updateInput();
}

void mousePos()
{
  mousePos = "";
  
  button1.pos();
  button2.pos();
  button3.pos();
  button4.pos();
  button5.pos();
  button6.pos();
  button7.pos();
  button8.pos();
  button9.pos();
  button0.pos();
  
  buttonAdd.pos();
  buttonMinus.pos();
  buttonTimes.pos();
  buttonDivide.pos();
  buttonPow.pos();
  buttonSqrt.pos();
  
  buttonDot.pos();
  buttonEquals.pos();
  buttonClear.pos();
}

void textBox() //draws the text box
{
  stroke(black);
  strokeWeight(1);
  fill(textBG);
  rect(textBoxCorner, textBoxCorner, textBoxWidth, textBoxHeight);
}

void drawButtons()
{
  button1.drawButton();
  button2.drawButton();
  button3.drawButton();
  button4.drawButton();
  button5.drawButton();
  button6.drawButton();
  button7.drawButton();
  button8.drawButton();
  button9.drawButton();
  button0.drawButton();
  
  buttonAdd.drawButton();
  buttonMinus.drawButton();
  buttonTimes.drawButton();
  buttonDivide.drawButton();
  buttonPow.drawButton();
  buttonSqrt.drawButton();
  
  buttonDot.drawButton();
  buttonEquals.drawButton();
  buttonClear.drawButton();
}

void getOperator()
{
  for(char k : input.toCharArray())
  {
    for(char i : operators)
    {
      if(i == k)
      {
        operator = i;
        
        //if(operator == ' ')
        //  operator = i;
        //else if(op2 == ' ')
        //  op2 = i;
        //else if(op3 == ' ')
        //  op3 = i;
        //else if(errorOp == ' ')
        //{
        //  errorOp = i;
        //  replaceInput("Syntax Error");
        //}
      }
    }
  }
  println(operator, op2, op3, errorOp);
}

void getXY()
{
  x = parseFloat(input.substring(0, input.indexOf(operator)));
  y = parseFloat(input.substring(input.indexOf(operator) + 1, input.length()));
}

void solve()
{
  getOperator();
  getXY();
  
  switch(operator)
  {
    case '+':
      result = x + y;
      break;
    case '-':
      result = x - y;
      break;
    case '*':
      result = x * y;
      break;
    case '/':
      result = x / y;
      break;
    case '^':
      result = Math.pow(x, y);
      break;
  }
  
  replaceInput(Double.toString(result));
}

class Button
{
  int x;
  int y;
  int size;
  String text;
  
  public Button(int x, int y, int size, String text)
  {
    this.x = x;
    this.y = y;
    this.size = size;
    this.text = text;
  }
  
  void drawButton()
  {
    stroke(black);
    strokeWeight(1);
    
    if(mousePos == text)
      fill(uiDark);
    else
      fill(ui);
    
    rect(x, y, size, size);
    
    fill(black); //text
    textSize(40);
    
    text(text, x + btnSkinWidthX, y + btnSkinWidthY);
  }
  
  void pos()
  {
    if((mouseX > x && mouseX < x + buttonSize) && (mouseY > y && mouseY < y + buttonSize))
      mousePos = text;
  }
  
  void updateInput()
  {
    buttonSFX.rewind();
    buttonSFX.play();
    
    if(mousePos == text)
    {
      if(text != "c" && text != "=" && text != "√")
        input = input.concat(text);
      else if(text == "c")
        clearInput();
      else if(text == "=")
        solve();
      else if(text == "√")
      {
        getOperator();
        
        result = sqrt(Float.parseFloat(input));
        replaceInput(Double.toString(result));
      }  
    }
  }
}
