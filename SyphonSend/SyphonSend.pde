import codeanticode.syphon.*;

PGraphics canvas;
SyphonServer server;

void setup() { 
  size(960,540, P3D);
  canvas = createGraphics(width*2, height*2, P3D);
  
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
}

void draw() {
  canvas.beginDraw();
  canvas.background(0);
  canvas.lights();
  canvas.translate(width, height);
  canvas.rotateX(frameCount * 0.01);
  canvas.rotateY(frameCount * 0.01);  
  canvas.box(150);
  canvas.endDraw();
  image(canvas, 0, 0, width, height);
  server.sendImage(canvas);
}