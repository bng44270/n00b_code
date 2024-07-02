import java.awt.Frame;
import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Color;
import java.awt.GridLayout;
import java.awt.Panel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowAdapter;

public class FourBitBinToHex extends Frame implements ActionListener {
   private Button bitOne = new Button("0");
   private Button bitTwo = new Button("0");
   private Button bitThree = new Button("0");
   private Button bitFour = new Button("0");
   private boolean[] bitValue = new boolean[4];
   private DigiChar hexLED = new DigiChar();
   private byte nibValue;
   private Panel bottomLayout = new Panel();

   public FourBitBinToHex() {
      this.addWindowListener(new WindowAdapter() {
          public void windowClosing(WindowEvent we) {
            dispose();
         }
      });
   }

   public static void main(String[] args) {
      FourBitBinToHex bh = new FourBitBinToHex();
      bh.setBackground(new Color(255, 255, 255));
      bh.setLayout(new BorderLayout());
      bh.add("Center", bh.hexLED);
      bh.bottomLayout.setLayout(new GridLayout(1, 4));
      bh.bottomLayout.add(bh.bitFour);
      bh.bottomLayout.add(bh.bitThree);
      bh.bottomLayout.add(bh.bitTwo);
      bh.bottomLayout.add(bh.bitOne);
      bh.add("South", bh.bottomLayout);
      bh.bitFour.addActionListener(bh);
      bh.bitFour.setActionCommand("Four");
      bh.bitThree.addActionListener(bh);
      bh.bitThree.setActionCommand("Three");
      bh.bitTwo.addActionListener(bh);
      bh.bitTwo.setActionCommand("Two");
      bh.bitOne.addActionListener(bh);
      bh.bitOne.setActionCommand("One");
      bh.nibValue = 0;
      bh.changeBitValue();
      bh.setSize(800, 600); // Set desired window size
      bh.setVisible(true);
   }

   public void actionPerformed(ActionEvent e) {
      String cmd = e.getActionCommand();
      if (cmd.equals("One")) {
         if (this.bitOne.getLabel() == "0") {
            this.bitOne.setLabel("1");
            ++this.nibValue;
            this.changeBitValue();
         } else {
            this.bitOne.setLabel("0");
            --this.nibValue;
            this.changeBitValue();
         }
      } else if (cmd.equals("Two")) {
         if (this.bitTwo.getLabel() == "0") {
            this.bitTwo.setLabel("1");
            this.nibValue = (byte)(this.nibValue + 2);
            this.changeBitValue();
         } else {
            this.bitTwo.setLabel("0");
            this.nibValue = (byte)(this.nibValue - 2);
            this.changeBitValue();
         }
      } else if (cmd.equals("Three")) {
         if (this.bitThree.getLabel() == "0") {
            this.bitThree.setLabel("1");
            this.nibValue = (byte)(this.nibValue + 4);
            this.changeBitValue();
         } else {
            this.bitThree.setLabel("0");
            this.nibValue = (byte)(this.nibValue - 4);
            this.changeBitValue();
         }
      } else if (cmd.equals("Four")) {
         if (this.bitFour.getLabel() == "0") {
            this.bitFour.setLabel("1");
            this.nibValue = (byte)(this.nibValue + 8);
            this.changeBitValue();
         } else {
            this.bitFour.setLabel("0");
            this.nibValue = (byte)(this.nibValue - 8);
            this.changeBitValue();
         }
      }

   }

   public void changeBitValue() {
      this.hexLED.changeChar(this.nibValue);
      this.hexLED.repaint();
   }
}
