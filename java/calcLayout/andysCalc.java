/*
Andy's Calculator Layout

1-24-02
*/

import java.awt.*;
import java.applet.*;

public class andysCalc extends Applet
  {
    
    //Buttons for calc
    Button btnClear = new Button("C");
    Button btnSeven = new Button("7");
    Button btnEight = new Button("8");
    Button btnNine = new Button("9");
    Button btnDivide = new Button("/");
    Button btnFour = new Button("4");
    Button btnFive = new Button("5");
    Button btnSix = new Button("6");
    Button btnMult = new Button("*");
    Button btnOne = new Button("1");
    Button btnTwo = new Button("2");
    Button btnThree = new Button("3");
    Button btnSubt = new Button("-");
    Button btnZero = new Button("0");
    Button btnDecimal = new Button(".");
    Button btnEqual = new Button("=");
    Button btnPlus = new Button("+");

    TextField numberShowArea = new TextField(); //View Screen of calc
    Panel topCalcLayout = new Panel();          //Top panel of calc
    Panel bottomCalcLayout = new Panel();       //Bottom panel for calc

    public void init()
      {
        int i;          //Index in for loop
        setLayout(new BorderLayout());

        bottomCalcLayout.setLayout(new GridLayout(4,4));
        topCalcLayout.setLayout(new GridLayout(1,2));

        bottomCalcLayout.add(btnSeven);
        bottomCalcLayout.add(btnEight);
        bottomCalcLayout.add(btnNine);
        bottomCalcLayout.add(btnDivide);
        bottomCalcLayout.add(btnFour);
        bottomCalcLayout.add(btnFive);
        bottomCalcLayout.add(btnSix);
        bottomCalcLayout.add(btnMult);
        bottomCalcLayout.add(btnOne);
        bottomCalcLayout.add(btnTwo);
        bottomCalcLayout.add(btnThree);
        bottomCalcLayout.add(btnSubt);
        bottomCalcLayout.add(btnZero);
        bottomCalcLayout.add(btnDecimal);
        bottomCalcLayout.add(btnEqual);
        bottomCalcLayout.add(btnPlus);

        topCalcLayout.add(numberShowArea);
        topCalcLayout.add(btnClear);
        add(BorderLayout.SOUTH,bottomCalcLayout);
        add(BorderLayout.NORTH,topCalcLayout);
      }
  }



        
