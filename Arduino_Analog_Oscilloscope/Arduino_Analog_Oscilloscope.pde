import processing.serial.*;

Serial port;
String val;
int valInt = 0;
IntList data = new IntList();

void setup()
{
  size(640,360);
  String portName = Serial.list()[0]; // you might have to play around with this value until you get the right serial port
  port = new Serial(this,portName,9600);
}
void draw()
{
  background(0);
  if (port.available() > 0)
  {
    val = port.readStringUntil('\n');
    if (val != null)
    {
      try {
        valInt = Integer.parseInt(val.trim());
        data.append(valInt);
      }catch (NumberFormatException npe){}
    }
  }
  else
  {
    data.append(valInt);
  }
  int buffer = data.size() - width;
  for (int i = data.size()-1; i > 0; i--)
  {
    point(i-buffer,data.get(i)/10+180);
    stroke(255,255,0);
  }
}
