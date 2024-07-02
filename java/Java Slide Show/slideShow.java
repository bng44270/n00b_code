import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import java.lang.Thread;

public class slideShow extends Applet implements ActionListener, Runnable
  {
    private AudioClip soundFile;
    private int picIdx;
    private Button startStop = new Button("Start");
    private Thread slideMover = null;
    private Image slides[] = new Image[25];
        
    public void init()
      {
        int i;		//for loop index
        for (i = 0; i < 25; i++)
          slides[i] = getImage(getDocumentBase(),"slide"+(i+1)+".gif");         
        //end for
        soundFile = getAudioClip(getDocumentBase(),"mutiny.mp3");
        picIdx = 0;
        setLayout(new BorderLayout());
        add(BorderLayout.SOUTH,startStop);
        startStop.addActionListener(this);
      }
    
      
    public void drawPictures()
      {
        Graphics g;
        g = getGraphics();
        g.drawImage(slides[picIdx],0,0,this);
      }
            
    public void actionPerformed(ActionEvent e)
      {
        Object src = e.getSource();
        if (src == startStop)
          {            
            if (startStop.getLabel().equals("Start"))
              {
                startStop.setLabel("Stop");
                slideMover = new Thread(this);
                slideMover.start();
                soundFile.loop();
              }
            else if (startStop.getLabel().equals("Stop"))
              {
                startStop.setLabel("Start");
                slideMover.stop();
                slideMover = null;
                soundFile.stop();
              }
          }
      }
    public void run()
      {        
        int i;		
        while (true)
          for (i = 0; i < 25; i++)
            {
              picIdx = i;
              drawPictures();
              try
                {
                  slideMover.sleep(200);
                }
              catch (InterruptedException e)
                {  }
            }
          //end for
        //end while
      }
  } 