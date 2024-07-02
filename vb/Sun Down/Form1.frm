VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Sun Down"
   ClientHeight    =   4380
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6645
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MouseIcon       =   "Form1.frx":030A
   MousePointer    =   99  'Custom
   ScaleHeight     =   4380
   ScaleWidth      =   6645
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer timMissleMove 
      Left            =   1320
      Top             =   3120
   End
   Begin VB.Timer timSunMove 
      Left            =   240
      Top             =   2640
   End
   Begin VB.Image imgSadSun 
      Height          =   2100
      Left            =   3600
      Picture         =   "Form1.frx":0614
      Top             =   120
      Width           =   2190
   End
   Begin VB.Image imgMissle 
      Height          =   1335
      Left            =   4080
      Picture         =   "Form1.frx":F6F6
      Top             =   2640
      Width           =   660
   End
   Begin VB.Image imgHappySun 
      Height          =   2100
      Left            =   1680
      Picture         =   "Form1.frx":1251C
      Top             =   240
      Width           =   2190
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim X As Integer
Dim velocity As Integer
Dim Y As Integer
Dim CoordsX As New clsRange
Dim coordsY As New clsRange
Dim intScore As Integer

Private Sub Form_Load()
  intScore = 0
  Form1.Caption = "Score is " & Str(intScore)
  velocity = 20
  imgMissle.Visible = False
  imgSadSun.Visible = False
  timSunMove.Interval = 1
  timMissleMove.Interval = 0
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  imgMissle.Visible = True
  timMissleMove.Interval = 1
  imgMissle.Top = Y
  imgMissle.Left = X
End Sub

Private Sub timMissleMove_Timer()
  CoordsX.Bottom = imgHappySun.Left
  CoordsX.Top = imgHappySun.Left + imgHappySun.Width
  coordsY.Bottom = imgHappySun.Top
  coordsY.Top = imgHappySun.Top + imgHappySun.Height
  
  imgMissle.Top = imgMissle.Top - 20
  
  If (CoordsX.inRange(imgMissle.Left)) And (coordsY.inRange(imgMissle.Top)) Then
    timSunMove.Interval = 0
    imgSadSun.Left = imgHappySun.Left
    imgSadSun.Top = imgHappySun.Top
    imgSadSun.Visible = True
    MsgBox "You Got It"
    timMissleMove.Interval = 0
    imgSadSun.Visible = False
    timSunMove.Interval = 1
    imgMissle.Visible = False
    intScore = intScore + 1
    Form1.Caption = "Score is " & Str(intScore)
    If intScore = 10 Then
      MsgBox "Congratulations You've WON.  Game Over", vbOKOnly, "Bye Bye"
      End
    End If
  End If
End Sub

Private Sub timSunMove_Timer()
X = imgHappySun.Left
If X < Form1.Width - imgHappySun.Width Then
  X = X + velocity
Else
  velocity = velocity * -1
  X = X + velocity
End If
If X < 0 Then
  velocity = velocity * -1
  X = X + velocity
Else
  X = X + velocity
End If
imgHappySun.Left = X
End Sub
