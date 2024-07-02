/*
Andy's Bouncing Ball
4-9-02
*/

import java.awt.event.*;
import java.awt.*;
import java.applet.Applet;
import java.lang.*;

public class BounceBall extends Applet implements ActionListener, Runnable
  {
    private Thread ball = null;
    private Canvas display = new Canvas();
    private Button startStop = new Button("Start");
    private int x, y;
    private double velocity;

    public void init()
      {
        x = 150;
        y = (int) (10 + 100 * Math.round(2.5 * Math.random()));
        velocity = 0.6 + Math.round(2.5 * Math.random());
        setLayout(new BorderLayout());
        add("South",startStop);
        add("Center",display);
        startStop.addActionListener(this);
      }
    public void actionPerformed(ActionEvent e)
      {
        if (startStop.getLabel().equals("Start"))
          {
            startStop.setLabel("Stop");
            ball = new Thread(this);
            ball.start();
          }
        else
          {
            startStop.setLabel("Start");
            ball.stop();
            display.repaint();
          }
      }
    
    public void run()
      {
        draw();
        while (true)
          {
            move();
            try
              {
                ball.sleep(75);
              }
            catch (InterruptedException e)
              { }
          } //end while
      } //end run

    public void draw()
      {
        Graphics g = display.getGraphics();
        g.setXORMode(Color.green);
        g.fillOval(x,y,5,5);
        g.dispose();
      } //end draw

    public void move()
      {
        int i;

        for (i = 0; i < 10000; i++)
          ;
        //end for

        draw();

        if ((x <= 10) || (x >= 290))
          {
            velocity = -velocity;
          }
        //end if
     
        x = (int)(Math.round(x + velocity));

        draw();
      } //end move
  }