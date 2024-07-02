import java.awt.Canvas;
import java.awt.Color;
import java.awt.Graphics;

class DigiChar extends Canvas {
   private boolean[] doLines = new boolean[7];
   private int[][] lineX = new int[7][2];
   private int[][] lineY = new int[7][2];

   public void changeChar(byte letter) {
      this.ResetLines();
      switch(letter) {
      case 0:
         this.doLines[0] = true;
         this.doLines[2] = true;
         this.doLines[3] = true;
         this.doLines[4] = true;
         this.doLines[5] = true;
         this.doLines[6] = true;
         break;
      case 1:
         this.doLines[5] = true;
         this.doLines[6] = true;
         break;
      case 2:
         this.doLines[0] = true;
         this.doLines[1] = true;
         this.doLines[2] = true;
         this.doLines[4] = true;
         this.doLines[5] = true;
         break;
      case 3:
         this.doLines[0] = true;
         this.doLines[1] = true;
         this.doLines[2] = true;
         this.doLines[5] = true;
         this.doLines[6] = true;
         break;
      case 4:
         this.doLines[1] = true;
         this.doLines[3] = true;
         this.doLines[5] = true;
         this.doLines[6] = true;
         break;
      case 5:
         this.doLines[0] = true;
         this.doLines[1] = true;
         this.doLines[2] = true;
         this.doLines[3] = true;
         this.doLines[6] = true;
         break;
      case 6:
         this.doLines[0] = true;
         this.doLines[1] = true;
         this.doLines[2] = true;
         this.doLines[3] = true;
         this.doLines[4] = true;
         this.doLines[6] = true;
         break;
      case 7:
         this.doLines[0] = true;
         this.doLines[3] = true;
         this.doLines[5] = true;
         this.doLines[6] = true;
         break;
      case 8:
         for(int i = 0; i < 7; ++i) {
            this.doLines[i] = true;
         }

         return;
      case 9:
         this.doLines[0] = true;
         this.doLines[1] = true;
         this.doLines[2] = true;
         this.doLines[3] = true;
         this.doLines[5] = true;
         this.doLines[6] = true;
         break;
      case 10:
         this.doLines[0] = true;
         this.doLines[1] = true;
         this.doLines[3] = true;
         this.doLines[4] = true;
         this.doLines[5] = true;
         this.doLines[6] = true;
         break;
      case 11:
         this.doLines[1] = true;
         this.doLines[2] = true;
         this.doLines[3] = true;
         this.doLines[4] = true;
         this.doLines[6] = true;
         break;
      case 12:
         this.doLines[0] = true;
         this.doLines[2] = true;
         this.doLines[3] = true;
         this.doLines[4] = true;
         break;
      case 13:
         this.doLines[1] = true;
         this.doLines[2] = true;
         this.doLines[4] = true;
         this.doLines[5] = true;
         this.doLines[6] = true;
         break;
      case 14:
         this.doLines[0] = true;
         this.doLines[1] = true;
         this.doLines[2] = true;
         this.doLines[3] = true;
         this.doLines[4] = true;
         break;
      case 15:
         this.doLines[0] = true;
         this.doLines[1] = true;
         this.doLines[3] = true;
         this.doLines[4] = true;
      }

   }

   public void ResetLines() {
      for(int i = 0; i < 7; ++i) {
         this.doLines[i] = false;
      }

   }

   public DigiChar() {
      this.setBackground(new Color(0, 0, 0));
      this.setSize(60, 100);
      this.lineX[0][0] = 20;
      this.lineY[0][0] = 10;
      this.lineX[0][1] = 40;
      this.lineY[0][1] = 10;
      this.lineX[1][0] = 20;
      this.lineY[1][0] = 50;
      this.lineX[1][1] = 40;
      this.lineY[1][1] = 50;
      this.lineX[2][0] = 20;
      this.lineY[2][0] = 90;
      this.lineX[2][1] = 40;
      this.lineY[2][1] = 90;
      this.lineX[3][0] = 10;
      this.lineY[3][0] = 20;
      this.lineX[3][1] = 10;
      this.lineY[3][1] = 40;
      this.lineX[4][0] = 10;
      this.lineY[4][0] = 60;
      this.lineX[4][1] = 10;
      this.lineY[4][1] = 80;
      this.lineX[5][0] = 50;
      this.lineY[5][0] = 20;
      this.lineX[5][1] = 50;
      this.lineY[5][1] = 40;
      this.lineX[6][0] = 50;
      this.lineY[6][0] = 60;
      this.lineX[6][1] = 50;
      this.lineY[6][1] = 80;
      this.ResetLines();
   }

   public void paint(Graphics g) {
      for(int i = 0; i < 7; ++i) {
         if (this.doLines[i]) {
            g.setColor(new Color(0, 255, 51));
            g.drawLine(this.lineX[i][0], this.lineY[i][0], this.lineX[i][1], this.lineY[i][1]);
         }
      }

   }
}

