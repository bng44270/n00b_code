/*
Embedded Oval Drawer

Andy Carlson

1-18-02
*/


import java.awt.*;
import java.applet.*;


public class ovalDrawer extends Applet
  {
    public void paint(Graphics myG)
      {
        //Outer Oval
        myG.setColor(Color.red);
        myG.fillOval(10,10,60,30);
        //Second Oval
        myG.setColor(Color.blue);
        myG.fillOval(20,10,40,30);
        //Third Oval
        myG.setColor(Color.orange);
        myG.fillOval(30,10,20,30);
        //Inner Circle
        myG.setColor(Color.green);
        myG.fillOval(35,20,10,10);
      }
  }
