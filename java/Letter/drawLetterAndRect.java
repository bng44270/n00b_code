/*
Andy's Letter Applet

1-22-02
*/

import java.awt.*;
import java.applet.*;

public class drawLetterAndRect extends Applet
  {
    public void paint(Graphics myG)
      {
        myG.setColor(Color.blue);
        myG.fillRect(20,10,80,120);
        myG.setColor(Color.red);
        myG.drawLine(20,40,100,40);
        myG.drawLine(20,70,100,70);
        myG.drawLine(20,100,100,100);
        myG.setColor(Color.green);
        myG.setFont(new Font("Serif",Font.PLAIN,110));
        myG.drawString("A",20,115);
      }
  }
        
