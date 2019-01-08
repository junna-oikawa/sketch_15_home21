import java.awt.*;
import java.awt.event.*;
import javax.swing.*;



PImage myImage;
PImage[] img;
PImage gameover;
PImage hiyoko1;
PImage clear;
PImage start;


float hx = 270;
float speed = 18.0;

int a1 = int(random(0,2));
int a2 = int(random(3,4));
int a3 = int(random(0,2));
int a4 = int(random(0,2));
int a5 = int(random(3,4));
int a6 = int(random(0,2));
int a7 = int(random(0,2));
int a8 = int(random(5));
int a9 = int(random(5));
int a10 = int(random(5));

int x1 = int(random(320));
int x2 = int(random(320, 560));
int x3 = int(random(320));
int x4 = int(random(320, 560));
int x5 = int(random(320));
int x6 = int(random(320));
int x7 = int(random(320, 560));
int x8 = int(random(320));
int x9 = int(random(60, 580));
int x10 = int(random(320));
int y = int(random(-300, 0));

int y1 = -240;
int y2 = -720;
int y3 = -1200;
int y4 = -1680;
int y5 = -2160;
int y6 = -2640;
int y7 = -3120;
int y8 = -3600;
int y9 = -4080;
int y10 = -4560;

int y1speed = 20;
int y2speed = 20;
int y3speed = 20;
int y4speed = 20;
int y5speed = 20;
int y6speed = 20;
int y7speed = 20;
int y8speed = 20;
int y9speed = 20;
int y10speed = 20;

int mode=1;


int xPos, yPos;
boolean inStopMode;



void setup(){
  
  img = new PImage[5];
  
  myImage = loadImage("sougen2.png");
  gameover = loadImage("gameover2.png");
  img[0] = loadImage("cake.png");
  img[1] = loadImage("candy.png");
  img[2] = loadImage("choco.png");
  img[3] = loadImage("carrot.png");
  img[4] = loadImage("tomato2.png");
  hiyoko1 = loadImage("hiyoko1.png");
  clear = loadImage("clear.png");
  start = loadImage("start.png");
  
  size(640, 480);
  colorMode(RGB, 255);
  frameRate(10);
  
  xPos = 0;
  yPos = 0;
  inStopMode = true;
  
 ControllWindow controllWindow = new ControllWindow(this); 
 controllWindow.setVisible(true);
}

void keyPressed(){
 if(key == CODED){
  if(keyCode == RIGHT){
   hx += speed; 
  }
  else if (keyCode == LEFT){
   hx -= speed; 
  }
 }
}


void draw(){

  
  
  if( mode == 0 ){
//! = obstract    !inStopMode == false
    fill(0, 0, 0, 60);
  image(myImage, 0, 0);
  



  image(img[a1],x1, y1);
  image(img[a2],x2, y2);
  image(img[a3],x3, y3);
  image(img[a4],x4, y4);
  image(img[a5],x5, y5);
  image(img[a6],x6, y6);  
  image(img[a7],x7, y7);  
  
  image(hiyoko1, hx, 330);
  

//  image(img[a8],x8, y8);  
//  image(img[a9],x9, y9);  
//  image(img[a10],x10, y10);  

  y1 += y1speed;
  y2 += y2speed;
  y3 += y3speed;
  y4 += y4speed;
  y5 += y5speed;
  y6 += y6speed;
  y7 += y7speed;
  
  if(y1 > 640 || y3 > 640 || y4 > 640 ||y6 > 640 || y7 > 640 ){
    mode = 2;
  }
  
  if( x2 >= hx && x2 <= hx + 50 && y2 >= 330 && y2 <=480 ){
  mode = 2;
  }
  
  if( x5 >= hx && x5 <= hx +50 && y5  >= 330&& y5 <= 480){
   mode = 2;
  }
  
  if(x1 >= hx && x1 <= hx + 50 && y1 >= 330  ){
    y1 = -100;
    y1speed = 0;
  }
   else if(x3 >= hx && x3 <= hx + 50 && y3 >= 330 ){
    y3 = -100;
    y3speed = 0;
  }
   else if(x4 >= hx && x4 <= hx + 50 && y4 >= 330 ){
    y4 = -100;
    y4speed = 0;
  }
   else if(x6 >= hx && x6 <= hx + 50 && y6 >= 330 ){
    y6 = -100;
    y6speed = 0;
  }
   else if(x7 >= hx && x7 <= hx + 50 && y7 >= 330 ){
    y7 = -4000;
    y7speed = 0;
  }
  
  if(y7 == -4000){
  mode = 3;
  }
  }
  
  if( mode == 2){
   image(gameover, 0, 0); 
  
  }


  if( mode == 1 ){
    image(start, 0, 0);
  }
  
  if( mode == 3){
   image(myImage, 0, 0);
    fill(random(255));
   noStroke();
   rect(210 ,80 ,230, 80);
   image(clear, 220, 100);
   image(clear, 220, 100); 
   image(hiyoko1, 300, 330);
  }
}

void eventsCalledFromControllWindow(String actionCommand){
  if(actionCommand.equals("startButton_Pushed")){ 
   mode = 0;
  }
  else if(actionCommand.equals("stopButton_Pushed") ){
   mode = 1;
  }
}

//serch "MDI SDI" (= window System)