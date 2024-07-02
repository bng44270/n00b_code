/*
Andy's Color Selector
2-28-02
*/

import java.awt.*;
import java.awt.event.*;

public class colorSelector extends java.applet.Applet
  {
    Scrollbar redBar = new Scrollbar(Scrollbar.HORIZONTAL,20,0,0,255);
    Scrollbar blueBar = new Scrollbar(Scrollbar.HORIZONTAL,20,0,0,255);
    Scrollbar greenBar = new Scrollbar(Scrollbar.HORIZONTAL,20,0,0,255);
    TextField redValue = new TextField();
    TextField blueValue = new TextField();
    TextField greenValue = new TextField();
    Label redLabel = new Label("R",Label.LEFT);
    Label blueLabel = new Label("B",Label.LEFT);
    Label greenLabel = new Label("G",Label.LEFT);
    colorSource rgbColorSource = new colorSource(this);
    Panel rightPanel = new Panel();
    Panel leftPanel = new Panel();

    public void init()
      {
	  //Layout Setups
        setLayout(new GridLayout(1,2));
        rightPanel.setLayout(new GridLayout(1,1));
        leftPanel.setLayout(new GridLayout(3,3));
        
        //Left Panel Setup
        leftPanel.add(redLabel);
        leftPanel.add(redBar);
        leftPanel.add(redValue);
        leftPanel.add(greenLabel);
        leftPanel.add(greenBar);
        leftPanel.add(greenValue);
        leftPanel.add(blueLabel);
        leftPanel.add(blueBar);
        leftPanel.add(blueValue);
        
        //Action Setups
        redBar.addAdjustmentListener(new Handler(this));	  
        blueBar.addAdjustmentListener(new Handler(this));
        greenBar.addAdjustmentListener(new Handler(this));

        //Right Panel Setup
        rightPanel.add(rgbColorSource);

        add(leftPanel);
        add(rightPanel);
      }
    public colorSource getColorSource()
      {  return rgbColorSource;  }
    public int getRedValue()
      {  return redBar.getValue();  }
    public int getBlueValue()
      {  return blueBar.getValue();  }
    public int getGreenValue()
      {  return greenBar.getValue();  }        
  }

class colorSource extends Canvas
  {
    private Graphics g;
    private colorSelector cS;                  

    public colorSource(colorSelector c)
      {
        cS = c;        
        g.setColor(new Color(c.getRedValue(),c.getGreenValue(),c.getBlueValue()));
        g.drawOval(0,0,100,100); 
      }
    public void refreshColor()
      {
        g.setColor(new Color(cS.getRedValue(),cS.getGreenValue(),cS.getBlueValue()));
        g.drawOval(0,0,100,100); 
      }
  }

class Handler implements AdjustmentListener
  {
    colorSelector colorEventObj;

    public Handler(colorSelector c)
      {  colorEventObj = c;  }
    public void adjustmentValueChanged (AdjustmentEvent e)
      {
        colorEventObj.getColorSource().refreshColor();
      }
  }
        
