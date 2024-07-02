/*
Andy's Calculator Layout

1-24-02
*/

import java.awt.*;
import java.applet.*;
import java.awt.event.*;
import acee.*;

public class calcWorks extends Applet implements ActionListener
  {
    
    //Create Buttons for Calc and Label them
    Button btnClear = new Button("C");

    TextField numberShowArea = new TextField(); //View Screen of calc
    Panel topCalcLayout = new Panel();          //Top panel of calc
    mainButtonPanel bottomCalcLayout = new mainButtonPanel();
                                                //Bottom Panel

    double firstNumber;
    double total;
    int lastActionSign;                         //Action being performed
                                                // 1 = Plus
                                                // 2 = Minus
                                                // 3 = Times
                                                // 4 = Divide

    public void init()
      {
        int i;          //Index in for loop
        setLayout(new GridLayout(2,1));

        //Set Layouts for top and bottom panels
        topCalcLayout.setLayout(new GridLayout(1,2,5,5));

        //Add buttons to top panel
        topCalcLayout.add(numberShowArea);
        topCalcLayout.add(btnClear);

        //Add Action Listeners to bottom panel
        bottomCalcLayout.getActButton("1").addActionListener(this);
        bottomCalcLayout.getActButton("2").addActionListener(this);
        bottomCalcLayout.getActButton("3").addActionListener(this);
        bottomCalcLayout.getActButton("4").addActionListener(this);
        bottomCalcLayout.getActButton("5").addActionListener(this);
        bottomCalcLayout.getActButton("6").addActionListener(this);
        bottomCalcLayout.getActButton("7").addActionListener(this);
        bottomCalcLayout.getActButton("8").addActionListener(this);
        bottomCalcLayout.getActButton("9").addActionListener(this);
        bottomCalcLayout.getActButton("0").addActionListener(this);
        bottomCalcLayout.getActButton("-").addActionListener(this);
        bottomCalcLayout.getActButton("+").addActionListener(this);
        bottomCalcLayout.getActButton("/").addActionListener(this);
        bottomCalcLayout.getActButton("*").addActionListener(this);
        bottomCalcLayout.getActButton(".").addActionListener(this);
        bottomCalcLayout.getActButton("=").addActionListener(this);


        //Add Action Listener for top button
        btnClear.addActionListener(this);

        numberShowArea.setText("");
        firstNumber = 0;
        total = 0;
        lastActionSign = 0;

        //Add Panels to applet
        add(topCalcLayout);
        add(bottomCalcLayout);
      }
    public void actionPerformed(ActionEvent myE)
      {
        Object source = myE.getSource();
        if (source == bottomPanelLayout.getButton("1"))
          {
            numberShowArea.setText(numberShowArea.getText() + "1");
          }
        else if(myE.getActionCommand().equals("2"))
          {
            numberShowArea.setText(numberShowArea.getText() + "2");
          }
        else if(myE.getActionCommand().equals("3"))
          {
            numberShowArea.setText(numberShowArea.getText() + "3");
          }
        else if(myE.getActionCommand().equals("4"))
          {
            numberShowArea.setText(numberShowArea.getText() + "4");
          }
        else if(myE.getActionCommand().equals("5"))
          {
            numberShowArea.setText(numberShowArea.getText() + "5");
          }
        else if(myE.getActionCommand().equals("6"))
          {
            numberShowArea.setText(numberShowArea.getText() + "6");
          }
        else if(myE.getActionCommand().equals("7"))
          {
            numberShowArea.setText(numberShowArea.getText() + "7");
          }
        else if(myE.getActionCommand().equals("8"))
          {
            numberShowArea.setText(numberShowArea.getText() + "8");
          }
        else if(myE.getActionCommand().equals("9"))
          {
            numberShowArea.setText(numberShowArea.getText() + "9");
          }
        else if(myE.getActionCommand().equals("0"))
          {
            numberShowArea.setText(numberShowArea.getText() + "0");
          }
        else if(myE.getActionCommand().equals("."))
          {
            numberShowArea.setText(numberShowArea.getText() + ".");
          }
        else if(myE.getActionCommand().equals("+"))
          {
            lastActionSign = 1;
            firstNumber = (new Double(numberShowArea.getText())).doubleValue();
            total = firstNumber + total;
            numberShowArea.setText("");
          }
        else if (myE.getActionCommand().equals("-"))
          {
            lastActionSign = 2;
            firstNumber = (new Double(numberShowArea.getText())).doubleValue();
            total = firstNumber - total;
            numberShowArea.setText("");
          }
        else if (myE.getActionCommand().equals("*"))
          {
            lastActionSign = 3;
            firstNumber = (new Double(numberShowArea.getText())).doubleValue();
            total = firstNumber * total;
            numberShowArea.setText("");
          }
        else if (myE.getActionCommand().equals("/"))
          {
            lastActionSign = 4;
            firstNumber = (new Double(numberShowArea.getText())).doubleValue();
            total = firstNumber / total;
            numberShowArea.setText("");
          }
        else if(myE.getActionCommand().equals("="))
          {
            firstNumber = (new Double(numberShowArea.getText())).doubleValue();
            switch(lastActionSign)
              {
                case 1 :
                  total = firstNumber + total;
                  break;
                case 2 :
                  total = firstNumber + total;
                  break;
                case 3 :
                  total = firstNumber + total;
                  break;
                case 4 :
                  total = firstNumber + total;
                  break;
                default :
                  break;
               }
             numberShowArea.setText(String.valueOf(total));   
          }
        else if(myE.getActionCommand().equals("C"))
          {
            firstNumber = 0;
            total = 0;
            numberShowArea.setText("");
          }
    }           
  }
