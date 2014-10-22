class mikehendriks extends Creature{
float agitation;
float x;
float phase;
float radius;
float circleSpeed;

void setup() {
  size(800, 800);
}

void draw(float x,float y) {
    agitation=map(mouseX, 0,800, 0, 1);
  circleSpeed=map(agitation, 0, 1, 50, 30);
  println(circleSpeed);
  
  
  
  background(102);
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount*circleSpeed);
  star(0, 0, 80, 100, 40); 
  popMatrix();
  
    stroke(255);        // every outline will be white
    strokeWeight(5);    // every line will be 5 pixels wide
    noFill();           // the inside of a shape will not have a color
    phase = frameCount * 0.05;                // determine a ‘phase’ for the sine function
    x = sin(phase);                           // this will be a value between -1 and 1
    radius = map(x, -1, 1, 40, 140);          // transform the value to a range of [40, 300]
    ellipse(width / 2, height / 2, radius, radius); // draw a circle with this radius
    
    
    noFill();           // the inside of a shape will not have a color
    phase = frameCount * 0.05;                // determine a ‘phase’ for the sine function
    x = sin(phase);                           // this will be a value between -1 and 1
    radius = map(x, -1, 1, 300, 220);          // transform the value to a range of [40, 300]
    ellipse(width / 2, height / 2, radius, radius); // draw a circle with this radius
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
}
