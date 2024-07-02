VERSION 5.00
Begin VB.UserControl DigiCharCtl 
   BackColor       =   &H80000007&
   ClientHeight    =   1950
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1380
   ScaleHeight     =   130
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   92
   Begin VB.Line figure 
      BorderColor     =   &H0000FF00&
      Index           =   6
      X1              =   80
      X2              =   80
      Y1              =   72
      Y2              =   104
   End
   Begin VB.Line figure 
      BorderColor     =   &H0000FF00&
      Index           =   5
      X1              =   8
      X2              =   8
      Y1              =   72
      Y2              =   104
   End
   Begin VB.Line figure 
      BorderColor     =   &H0000FF00&
      Index           =   4
      X1              =   80
      X2              =   80
      Y1              =   24
      Y2              =   56
   End
   Begin VB.Line figure 
      BorderColor     =   &H0000FF00&
      Index           =   3
      X1              =   8
      X2              =   8
      Y1              =   24
      Y2              =   56
   End
   Begin VB.Line figure 
      BorderColor     =   &H0000FF00&
      Index           =   2
      X1              =   16
      X2              =   72
      Y1              =   112
      Y2              =   112
   End
   Begin VB.Line figure 
      BorderColor     =   &H0000FF00&
      Index           =   1
      X1              =   16
      X2              =   72
      Y1              =   64
      Y2              =   64
   End
   Begin VB.Line figure 
      BorderColor     =   &H0000FF00&
      Index           =   0
      X1              =   16
      X2              =   72
      Y1              =   16
      Y2              =   16
   End
End
Attribute VB_Name = "DigiCharCtl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Dim strCharValue As String

Public Sub SetValue(v As String)
  strCharValue = v
  Select Case UCase(v)
    Case "0"
      ClearChar
      figure(0).Visible = True
      figure(2).Visible = True
      figure(3).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "1"
      ClearChar
      figure(4).Visible = True
      figure(6).Visible = True
    Case "2"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(2).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
    Case "3"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(2).Visible = True
      figure(4).Visible = True
      figure(6).Visible = True
    Case "4"
      ClearChar
      figure(1).Visible = True
      figure(3).Visible = True
      figure(4).Visible = True
      figure(6).Visible = True
    Case "5"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(2).Visible = True
      figure(3).Visible = True
      figure(6).Visible = True
    Case "6"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(2).Visible = True
      figure(3).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "7"
      ClearChar
      figure(0).Visible = True
      figure(4).Visible = True
      figure(6).Visible = True
    Case "8"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(2).Visible = True
      figure(3).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "9"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(2).Visible = True
      figure(3).Visible = True
      figure(4).Visible = True
      figure(6).Visible = True
    Case "A"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(3).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "B"
      ClearChar
      figure(1).Visible = True
      figure(2).Visible = True
      figure(3).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "C"
      ClearChar
      figure(0).Visible = True
      figure(2).Visible = True
      figure(3).Visible = True
      figure(5).Visible = True
    Case "D"
      ClearChar
      figure(1).Visible = True
      figure(2).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "E"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(2).Visible = True
      figure(3).Visible = True
      figure(5).Visible = True
    Case "F"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(3).Visible = True
      figure(5).Visible = True
    Case "G"
      ClearChar
      figure(0).Visible = True
      figure(2).Visible = True
      figure(3).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "H"
      ClearChar
      figure(1).Visible = True
      figure(3).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "I"
      ClearChar
      figure(4).Visible = True
      figure(6).Visible = True
    Case "J"
      ClearChar
      figure(2).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "K"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "L"
      ClearChar
      figure(2).Visible = True
      figure(3).Visible = True
      figure(5).Visible = True
    Case "M"
      ClearChar
      figure(0).Visible = True
      figure(3).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "N"
      ClearChar
      figure(1).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "O"
      ClearChar
      figure(0).Visible = True
      figure(2).Visible = True
      figure(3).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "P"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(3).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
    Case "Q"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(3).Visible = True
      figure(4).Visible = True
      figure(6).Visible = True
    Case "R"
      ClearChar
      figure(1).Visible = True
      figure(5).Visible = True
    Case "S"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(2).Visible = True
      figure(3).Visible = True
      figure(6).Visible = True
    Case "T"
      ClearChar
      figure(0).Visible = True
      figure(3).Visible = True
      figure(5).Visible = True
    Case "U"
      ClearChar
      figure(2).Visible = True
      figure(3).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "V"
      ClearChar
      figure(2).Visible = True
      figure(3).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "W"
      ClearChar
      figure(0).Visible = True
      figure(2).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "X"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(5).Visible = True
      figure(6).Visible = True
    Case "Y"
      ClearChar
      figure(1).Visible = True
      figure(3).Visible = True
      figure(4).Visible = True
      figure(6).Visible = True
    Case "Z"
      ClearChar
      figure(0).Visible = True
      figure(1).Visible = True
      figure(2).Visible = True
      figure(4).Visible = True
      figure(5).Visible = True
  End Select
End Sub

Private Sub UserControl_Initialize()
  For i = 0 To 6 Step 1
    figure(i).Visible = False
  Next i
End Sub

Public Sub ClearChar()
  For i = 0 To 6 Step 1
    figure(i).Visible = False
  Next i
End Sub
