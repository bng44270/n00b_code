/*
Andy's Calculator that works

2-24-01
*/

import java.awt.*;
import java.awt.event.*;

public class myCalculator extends java.applet.Applet implements ActionListener 
  {
    Button clearButton = new Button("C");			//Clear Button
    TextArea numberShowArea = new TextArea();		//Number display
    
    Button zeroButton = new Button("0");			//0 key
    Button oneButton = new Button("1");				//1 key
    Button twoButton = new Button("2");				//2 key
    Button threeButton = new Button("3");			//3 key
    Button fourButton = new Button("4");			//4 key
    Button fiveButton = new Button("5");			//5 key
    Button sixButton = new Button("6");				//6 key
    Button sevenButton = new Button("7");			//7 key
    Button eightButton = new Button("8");			//8 key
    Button nineButton = new Button("9");			//9 key
    Button equalButton = new Button("=");			//= key
    Button plusButton = new Button("+");			//+ key
    Button minusButton = new Button("-");			//- key
    Button timesButton = new Button("*");			//* key
    Button divideButton = new Button("/");			// "/" key
    Button decimalButton = new Button(".");			// . key
        
    Panel bottomPanel = new Panel();				//Bottom Panel
    Panel topPanel = new Panel();					//Top Panel
    
    double total;									//Total of numbers
    int mathAction;									//Action that took place last
													// 1 = plus
													// 2 = minus
													// 3 = times
													// 4 = divide
    
    public void init()
      {
        //Set Applet Layout
        setLayout(new BorderLayout());
        //Set Top Panel Layout
        topPanel.setLayout(new GridLayout(1,2));
        //Set Bottom Panel Layout
        bottomPanel.setLayout(new GridLayout(4,4,10,10));
               
        //Take care of bottom panel
        putBottomButtons();
        
        //Take care of top panel
        topPanel.add(numberShowArea);
        topPanel.add(clearButton);
        clearButton.addActionListener(this);
        
        
        //Add panels to Applet
        add(topPanel,BorderLayout.NORTH);
        add(bottomPanel,BorderLayout.SOUTH);
        
        numberShowArea.setText("");
        total = 0;
      } //end init
    
    public void actionPerformed(ActionEvent e)
      {
        //Number to work with
                        
        if (e.getActionCommand().equals("1"))
          numberShowArea.setText(numberShowArea.getText() + "1");
        else if (e.getActionCommand().equals("2"))
          numberShowArea.setText(numberShowArea.getText() + "2");
        else if (e.getActionCommand().equals("3"))
          numberShowArea.setText(numberShowArea.getText() + "3");
        else if (e.getActionCommand().equals("4"))
          numberShowArea.setText(numberShowArea.getText() + "4");
        else if (e.getActionCommand().equals("5"))
          numberShowArea.setText(numberShowArea.getText() + "5");
        else if (e.getActionCommand().equals("6"))
          numberShowArea.setText(numberShowArea.getText() + "6");
        else if (e.getActionCommand().equals("7"))
          numberShowArea.setText(numberShowArea.getText() + "7");
        else if (e.getActionCommand().equals("8"))
          numberShowArea.setText(numberShowArea.getText() + "8");
        else if (e.getActionCommand().equals("9"))
          numberShowArea.setText(numberShowArea.getText() + "9");
        else if (e.getActionCommand().equals("0"))
          numberShowArea.setText(numberShowArea.getText() + "0");
        else if (e.getActionCommand().equals("."))
          numberShowArea.setText(numberShowArea.getText() + ".");
        else if (e.getActionCommand().equals("C"))
          {
            numberShowArea.setText("");
            total = 0;
          }
        else if (e.getActionCommand().equals("+"))
          {
            Double numToUse = new Double(numberShowArea.getText());
            total = total + numToUse.doubleValue();
            numberShowArea.setText("");
            mathAction = 1;
          }
        else if (e.getActionCommand().equals("-"))
          {
            if (total < 0) total = Math.abs(total);
            Double numToUse = new Double(numberShowArea.getText());
            total = total - numToUse.doubleValue();
            numberShowArea.setText("");
            mathAction = 2;
          }
        else if (e.getActionCommand().equals("*"))
          {
            Double numToUse = new Double(numberShowArea.getText());
            total = total * numToUse.doubleValue();
            numberShowArea.setText("");
            mathAction = 3;
          }
        else if (e.getActionCommand().equals("/"))
          {
            Double numToUse = new Double(numberShowArea.getText());
            total = total / numToUse.doubleValue();
            numberShowArea.setText("");
            mathAction = 4;
          }
        else if (e.getActionCommand().equals("="))
          {
            Double numToUse = new Double(numberShowArea.getText());
            //Determine action
            if (mathAction == 1)
              total = total + numToUse.doubleValue();
            else if (mathAction == 2)
              total = total - numToUse.doubleValue();
            else if (mathAction == 3)
              total = total * numToUse.doubleValue();
            else if (mathAction == 4)
              total = total / numToUse.doubleValue();
            //end if actionSign

            numberShowArea.setText(String.valueOf(total));
          }
        //end if actionCommand
      } //end actionPerformed
    
    void putBottomButtons()
      {
        //Add buttons to bottom Panel
        bottomPanel.add(sevenButton);
        bottomPanel.add(eightButton);
        bottomPanel.add(nineButton);
        bottomPanel.add(divideButton);
        bottomPanel.add(fourButton);
        bottomPanel.add(fiveButton);
        bottomPanel.add(sixButton);
        bottomPanel.add(timesButton);
        bottomPanel.add(oneButton);
        bottomPanel.add(twoButton);
        bottomPanel.add(threeButton);
        bottomPanel.add(minusButton);
        bottomPanel.add(zeroButton);
        bottomPanel.add(decimalButton);
        bottomPanel.add(equalButton);
        bottomPanel.add(plusButton);
        
        //Add action listeners
        sevenButton.addActionListener(this);
        eightButton.addActionListener(this);
        nineButton.addActionListener(this);
        divideButton.addActionListener(this);
        fourButton.addActionListener(this);
        fiveButton.addActionListener(this);
        sixButton.addActionListener(this);
        timesButton.addActionListener(this);
        oneButton.addActionListener(this);
        twoButton.addActionListener(this);
        threeButton.addActionListener(this);
        minusButton.addActionListener(this);
        zeroButton.addActionListener(this);
        decimalButton.addActionListener(this);
        equalButton.addActionListener(this);
        plusButton.addActionListener(this);
      }  //end putBottomButtons
  }  //end myCalculator