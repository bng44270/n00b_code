import java.awt.*;
import java.awt.event.*;

public class colorSelector extends java.applet.Applet
  {
    //Declare Scrollbars
    Scrollbar redBar = new Scrollbar(Scrollbar.HORIZONTAL,256,0,0,255);
    Scrollbar greenBar = new Scrollbar(Scrollbar.HORIZONTAL,256,0,0,255);
    Scrollbar blueBar = new Scrollbar(Scrollbar.HORIZONTAL,256,0,0,255);
    //Declare TextFields
    TextField redValue = new TextField();
    TextField greenValue = new TextField();
    TextField blueValue = new TextField();
    //Declare Labels
    colorLabel redLabel = new colorLabel("R");
    colorLabel greenLabel = new colorLabel("G");
    colorLabel blueLabel = new colorLabel("B");
    //Declare Color Canvas
    colorSource rgbColor = new colorSource(this);
    //Declare Panel
    Panel leftPanel = new Panel();
    //Declare integer values for color
    int redVal;
    int greenVal;
    int blueVal;
    
    public void init()
      {
        //Set Layouts
        setLayout(new GridLayout(1,2));
        leftPanel.setLayout(new GridLayout(3,3,10,10));

	  
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
        
        //Action Setup
        redBar.addAdjustmentListener(new Handler(this));
        greenBar.addAdjustmentListener(new Handler(this));
        blueBar.addAdjustmentListener(new Handler(this));
        
        //Right Panel Setup
                
        //Add Panels to Applet
        add(leftPanel);
        add(rgbColor);
        
        //Set Values
        setRed(0);
        setGreen(0);
        setBlue(0);      
      }
    
    //Color Setters and Getters
    public void setRed(int r)
      {  redVal = r;
         redValue.setText(String.valueOf(redVal));
      }
    public int getRed()
      {  return redVal;  }
    public void setGreen(int g)
      {
        greenVal = g;
        greenValue.setText(String.valueOf(greenVal));
      }
    public int getGreen()
      {  return greenVal;  }
    public void setBlue(int b)
      {
        blueVal = b;
        blueValue.setText(String.valueOf(blueVal));
      }
    public int getBlue()
      {  return blueVal;  }
    public colorSource getRGB()
      {  return rgbColor;  }
    
  } 
 
//Class for color labels
class colorLabel extends Canvas
  {
    Graphics g;

    public colorLabel(String labelChar)
      {
        super.setSize(1,1);
        g.setFont(new Font("Serif",Font.BOLD,12));
        g.drawString(labelChar,0,0);
      }
  }

//Class for color circle
class colorSource extends Canvas
  {
    private colorSelector cS;
    
    public colorSource (colorSelector c)
      {  cS = c;  }
    public void paint(Graphics g)
      {
        g.setColor(new Color(cS.getRed(),cS.getGreen(),cS.getBlue()));
        g.fillOval(0,0,100,100);
      }
  }

//Adjustment handler class
class Handler implements AdjustmentListener
  {
    colorSelector colorEventObj;
    
    public Handler(colorSelector c)
      {  colorEventObj = c;  }
    public void adjustmentValueChanged(AdjustmentEvent e)
      {
        Object src = e.getSource();
        if (src == colorEventObj.redBar)
          {
            colorEventObj.setRed(e.getValue());
            colorEventObj.getRGB().repaint();
          }
        else if (src == colorEventObj.blueBar)
          {
            colorEventObj.setBlue(e.getValue());
            colorEventObj.getRGB().repaint();
          }
        else if (src == colorEventObj.greenBar)
          {
            colorEventObj.setGreen(e.getValue());
            colorEventObj.getRGB().repaint();
          }
      }
  }