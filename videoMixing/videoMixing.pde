import processing.video.*;

Capture videoA;
Capture videoB;
void setup() {
  size(640, 360);
  videoA = new Capture(this, Capture.list()[0]);
  videoB = new Capture(this, Capture.list()[12]);
  videoA.start();
  videoB.start();
}

void captureEvent(Capture vid) {
  vid.read();
}
int res=10;

void draw() {  
  image(videoB,0,0,640,360);
  res=1+int(40.0*float(mouseX)/float(width));
  for (int y=0; y<height; y+=res) {
    for (int x=0; x<width; x+=res) {
      color c = videoA.get(x, y);
      color r=(c&0xFF0000)>>16;
      color g=(c&0x00FF00)>>8;
      color b=(c&0xFF);
      color alpha=(c&0xFF000000)>>24;
      alpha=int(256.0*float(mouseY)/float(height));
      //int gray= (r+g+b)/3;
      //      r=g=b=gray;
      //      r=0;
      color c2=(alpha<<24)+(r<<16)+(g<<8)+b;
      fill(c2);
      noStroke();
      ellipse(x, y, res, res);
    }
  }
}
