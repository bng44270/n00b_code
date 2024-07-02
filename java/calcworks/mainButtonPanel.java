package acee;

import java.awt.*;

  public class mainButtonPanel extends Panel
    {
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

      public void init()
        {
          setLayout(new GridLayout(4,4,5,5));

          //Add specific buttons to bottom panel
          add(btnSeven);
          add(btnEight);
          add(btnNine);
          add(btnDivide);
          add(btnFour);
          add(btnFive);
          add(btnSix);
          add(btnMult);
          add(btnOne);
          add(btnTwo);
          add(btnThree);
          add(btnSubt);
          add(btnZero);
          add(btnDecimal);
          add(btnEqual);
          add(btnPlus);
        }
        
      public Button getActButton(String caption)
        {
          if(caption == "1")
            return btnOne;
          else if (caption == "2")
            return btnTwo;
          else if (caption == "3")
            return btnThree;
          else if (caption == "4")
            return btnFour;
          else if (caption == "5")
            return btnFive;
          else if (caption == "6")
            return btnSix;
          else if (caption == "7")
            return btnSeven;
          else if (caption == "8")
            return btnEight;
          else if (caption == "9")
            return btnNine;
          else if (caption == "0")
            return btnZero;
          else if (caption == "+")
            return btnPlus;
          else if (caption == "-")
            return btnSubt;
          else if (caption == "*")
            return btnMult;
          else if (caption == "/")
            return btnDivide;
          else if (caption == "=")
            return btnEqual;
          else
            return btnDecimal;            
        } //end getButton
    }
