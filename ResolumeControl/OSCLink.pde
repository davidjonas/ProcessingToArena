import oscP5.*;
import netP5.*;

class OSCLink
{
  String host;
  int port;
  NetAddress serverUrl;
  PApplet parent;
  OscP5 oscP5;
  
  
  OSCLink(PApplet par, String h, int inPort, int outPort)
  {
    this.host = h;
    this.port = inPort;
    this.parent = par;
    this.oscP5 = new OscP5(this.parent, this.port);
    this.serverUrl = new NetAddress("127.0.0.1", outPort);
  }
  
  void connect()
  {
    OscMessage m = new OscMessage("/server/connect",new Object[0]);
    OscP5.flush(m,this.serverUrl);  
  }
  
  void sendMessage(String event, String message)
  {
    OscMessage myOscMessage = new OscMessage(event);
    myOscMessage.add(message);
    oscP5.send(myOscMessage, serverUrl);
  }
  
  void sendMessage(String event, float message)
  {
    OscMessage myOscMessage = new OscMessage(event);
    myOscMessage.add(message);
    oscP5.send(myOscMessage, serverUrl);
  }
}