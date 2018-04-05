import ddf.minim.*;

Minim minim;
AudioInput in;

import codeanticode.syphon.*;

PGraphics canvas;
SyphonServer server;

void setup()
{
  //fullScreen(P3D);
  size(800, 600, P3D);
  canvas = createGraphics(width, height, P3D);
  background(0);
  colorMode(HSB);
  
  minim = new Minim(this);
  in = minim.getLineIn();
  
  server = new SyphonServer(this, "Processing Syphon");
}

void draw()
{
  canvas.beginDraw();
  float high = 0;
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    if (in.left.get(i) > high)
    {
      high = in.left.get(i);
    }
    if (in.right.get(i) > high)
    {
      high = in.right.get(i);
    }
  }
  
  //background(0);
  canvas.fill(0, 180);
  canvas.noStroke();
  canvas.rect(0,0,width,height);
  
  
  canvas.noFill();
  for(int i=0; i<200; i++)
  {
    canvas.stroke(40+i/2, 100, 200, 30);
    float h = (cos((frameCount+i)/30.0)*height/2) + height/2;
    float w = i*10 + 10000*high;
    canvas.bezier(width/2-50, height/2, (width/2)+w, h, (width/2)-w, h, width/2+50, height/2);
  }
  
  for(int i=0; i<200; i++)
  {
    canvas.stroke(40+i/2, 100, 200, 30);
    float h = (sin((frameCount+i)/30.0)*height/2) + height/2;
    float w = i*10 + 10000*high;
    canvas.bezier(400, height/2, (width/2)+w, h, (width/2)-w, h, width-400, height/2);
  }
  
  for(int i=0; i<200; i++)
  {
    canvas.stroke(40+i/2, 100, 200, 30);
    float h = (sin((frameCount+i)/30.0)*height/2) + height/2;
    float w = i*10 + 10000*high;
    canvas.bezier(0, height/2, (width/2)+w, h, (width/2)-w, h, width, height/2);
  }
  canvas.endDraw();
  server.sendImage(canvas);
  //filter(BLUR, 3);
}