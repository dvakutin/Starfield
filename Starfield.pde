Particle[] tennis = new Particle[100];

void setup()
{
  size(600,775);
  background(4, 139, 4);  //green
  drawtenniscourt();
  
  for(int i = 0; i < tennis.length; i++) {
    if (i % 10 == 0) {
      tennis[i] = new OddballParticle();
    }
    else {
      tennis[i] = new Particle();
    }
  }
}
void drawtenniscourt()
{
   //blue court with white edges
  fill(11, 119, 213); 
  noStroke();
  rect(20, 20, 560, 735);
  drawlines();
}
void drawlines()
{
  strokeWeight(30);
  stroke(4, 139, 4);
  line(0, 0, 775, 0);
  line(0, 0, 0, 775);
  line(600, 0, 600, 775);
  line(0, 775, 600, 775); 
  //fill(255, 255, 255);
  stroke(255, 255, 255);
  //edges
  strokeWeight(6);
  line(20, 20, 580, 20);
  line(20, 755, 580, 755);
  line(20, 20, 20, 755);
  line(580, 20, 580, 755);
  
  //lines 
  strokeWeight(4);
  line(50, 20, 50, 755);
  line(550, 20, 550, 755);
 //middle line (net)
  strokeWeight(8);
  line(0, 387.5, 600, 387.5);
  //service court lines
  strokeWeight(4);
  line(20, 197.75, 580, 197.75);
  line(20, 577.25, 580, 577.25);
  line(300, 197.75, 300, 577.25);
}
void draw()
{
  for(int i = 0; i < tennis.length; i++) {
    tennis[i].move();
    tennis[i].show();
  }
}
class Particle {
  double X;
  double Y;
  int Color;
  double Angle;
  double Speed;
  Particle() {
    X = 300;
    Y = 50;
    Color = color(29, 246, 29);
    Speed = (Math.random() * 10);
    Angle = (Math.random() * 1) * Math.PI;
  }
  void move() {
    fill(11, 119, 213);
    noStroke();
    ellipse((float)X, (float)Y, 35, 35);
    X = X + Math.cos(Angle) * Speed;
    Y = Y + Math.sin(Angle) * Speed;
  }
  void show() {
    fill(Color);
    stroke(Color);
    ellipse((float)X, (float)Y, 25, 25);
    drawlines();
  }
}

class OddballParticle extends Particle //inherits from Particle
{
  OddballParticle() {
    Color = color(255, 255, 255);
    //Speed = (Math.random() * 10);
    //Angle = (Math.random() * 3) * Math.PI/2;
    
}
void move() {
    fill(11, 119, 213);
    noStroke();
    ellipse((float)X, (float)Y, 35, 35);
    X = X + Math.cos(Angle) * Speed;
    Y = Y + Math.sin(Angle) * Speed; 
    if (X >= 560) {
      X = X - (int)(Math.random() * 251);
    }
    if (X <= 20) {
      X = X + (int)(Math.random() * 251);
    }
    if (Y >= 750) {
      Y = Y - (int)(Math.random() * 755);
    }
    
}
}

