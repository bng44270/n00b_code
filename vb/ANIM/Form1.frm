VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4665
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7095
   LinkTopic       =   "Form1"
   ScaleHeight     =   4665
   ScaleWidth      =   7095
   StartUpPosition =   3  'Windows Default
   Begin VB.Shape shpPaddle 
      FillStyle       =   0  'Solid
      Height          =   1215
      Left            =   120
      Top             =   1920
      Width           =   375
   End
   Begin VB.Shape shpWall 
      BackColor       =   &H80000000&
      BorderColor     =   &H80000000&
      FillStyle       =   0  'Solid
      Height          =   4455
      Left            =   6240
      Top             =   120
      Width           =   735
   End
   Begin VB.Shape shpBall 
      FillStyle       =   0  'Solid
      Height          =   855
      Left            =   840
      Shape           =   3  'Circle
      Top             =   2040
      Width           =   855
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim intX As Integer, intY As Integer
Dim blnLeftFlag As Boolean, blnRightFlag As Boolean

Private Sub Form_Load()
  intX = 100
  intY = 100
  
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  shpPaddle.Top = Y
End Sub

Private Sub timBallMover_Timer()
  shpBall.Left = intX
  
  If shpBall.Left = shpWall.Left Then
    blnLeftFlag = True
    blnRightFlag = False
  ElseIf shpBall.Left = shpPaddle.Left Then
    blnLeftFlag = True
    blnRightFlag = False
  End If

  If blnRightFlag = True Then
    intX = intX + 10
  ElseIf blnLeftFlag = True Then
    intX = intX - 10
  End If
  
End Sub

