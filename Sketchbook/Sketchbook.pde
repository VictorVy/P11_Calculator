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

int btnSkinWidthX;
int btnSkinWidthY;

void setup()
{
  size(350, 400);
  background(background);

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
  
  btnSkinWidthX = buttonSize / 4 + 2;
  btnSkinWidthY = buttonSize - buttonSize / 4;
}

void draw()
{
  mousePos();
  
  textBox();
  buttons();
  
  println(mousePos);
}

void mousePos()
{
  mousePos = "";
  
  if(mouseY > row1 && mouseY < row1 + buttonSize)
  {
    if(mouseX > column1 && mouseX < column1 + buttonSize)
      mousePos = "1";
    else if(mouseX > column2 && mouseX < column2 + buttonSize)
      mousePos = "2";
    else if(mouseX > column3 && mouseX < column3 + buttonSize)
      mousePos = "3";
    else if(mouseX > column4 && mouseX < column4 + buttonSize)
      mousePos = "+";
  }
  else if(mouseY > row2 && mouseY < row2 + buttonSize)
  {
    if(mouseX > column1 && mouseX < column1 + buttonSize)
      mousePos = "4";
    else if(mouseX > column2 && mouseX < column2 + buttonSize)
      mousePos = "5";
    else if(mouseX > column3 && mouseX < column3 + buttonSize)
      mousePos = "6";
    else if(mouseX > column4 && mouseX < column4 + buttonSize)
      mousePos = "-";
  }
  else if(mouseY > row3 && mouseY < row3 + buttonSize)
  {
    if(mouseX > column1 && mouseX < column1 + buttonSize)
      mousePos = "7";
    else if(mouseX > column2 && mouseX < column2 + buttonSize)
      mousePos = "8";
    else if(mouseX > column3 && mouseX < column3 + buttonSize)
      mousePos = "9";
    else if(mouseX > column4 && mouseX < column4 + buttonSize)
      mousePos = "*";
  }
  else if(mouseY > row4 && mouseY < row4 + buttonSize)
  {
    if(mouseX > column1 && mouseX < column1 + buttonSize)
      mousePos = ".";
    else if(mouseX > column2 && mouseX < column2 + buttonSize)
      mousePos = "0";
    else if(mouseX > column3 && mouseX < column3 + buttonSize)
      mousePos = "c";
    else if(mouseX > column4 && mouseX < column4 + buttonSize)
      mousePos = "/";
  }
}

void textBox() //draws the text box
{
  stroke(black);
  strokeWeight(1);
  fill(textBG);
  rect(textBoxCorner, textBoxCorner, textBoxWidth, textBoxHeight);
}

void buttons() //draws the buttons
{
  stroke(black); //buttons
  strokeWeight(1);
  
  fill(ui); //number buttons
  button(column1, row1, buttonSize); 
  fill(ui);
  button(column2, row1, buttonSize);
  fill(ui);
  button(column3, row1, buttonSize);
  fill(ui);
  button(column1, row2, buttonSize);
  fill(ui);
  button(column2, row2, buttonSize);
  fill(ui);
  button(column3, row2, buttonSize);
  fill(ui);
  button(column1, row3, buttonSize);
  fill(ui);
  button(column2, row3, buttonSize);
  fill(ui);
  button(column3, row3, buttonSize);
  fill(ui);
  button(column2, row4, buttonSize);
  
  fill(ui); //operator buttons
  button(column4, row1, buttonSize);
  fill(ui);
  button(column4, row2, buttonSize);
  fill(ui);
  button(column4, row3, buttonSize);
  fill(ui);
  button(column4, row4, buttonSize);
  
  fill(ui); //misc buttons
  button(column1, row4, buttonSize);
  fill(ui);
  button(column3, row4, buttonSize);

  fill(black); //text
  textSize(40);

  buttonText("1", column1, row1); //number text
  buttonText("2", column2, row1);
  buttonText("3", column3, row1);
  buttonText("4", column1, row2);
  buttonText("5", column2, row2);
  buttonText("6", column3, row2);
  buttonText("7", column1, row3);
  buttonText("8", column2, row3);
  buttonText("9", column3, row3);
  buttonText("0", column2, row4);
  
  buttonText("+", column4 - 3, row1); //operator text
  buttonText("-", column4 + 1, row2);
  buttonText("*", column4 + 3, row3);
  buttonText("/", column4 + 3, row4);
  
  buttonText(".", column1 + 6, row4);
  buttonText("c", column3 + 2, row4 - 4);
}

void button(int x, int y, int size) //draws button
{
  rect(x, y, size, size);
}

void buttonText(String text, int x, int y)
{
  text(text, x + btnSkinWidthX, y + btnSkinWidthY);
}
