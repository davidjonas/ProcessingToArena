OSCLink osc;

void setup()
{
  osc = new OSCLink(this, "127.0.0.1", 7001, 7000);
  osc.connect();
}

void draw()
{
  background(0);
  float val = abs(cos(frameCount/100.0));
   
   //osc.sendMessage("/layer2/clip1/video/param9/values", val/2);
   osc.sendMessage("/layer2/clip1/video/param5/values", val/2);
   
   if(mousePressed)
   {
     osc.sendMessage("/layer2/clip1/video/param6/values", 1.0);
   }
   else
   {
     osc.sendMessage("/layer2/clip1/video/param6/values", 0.0);
   }
   
   fill(255, 0,0, 80);
   rect(0, height, width, -height*val);
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* get and print the address pattern and the typetag of the received OscMessage */
  println("### received an osc message with addrpattern "+theOscMessage.addrPattern()+" and typetag "+theOscMessage.typetag());
  theOscMessage.print();
}