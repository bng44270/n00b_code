VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Jedi Break In Tool"
   ClientHeight    =   5130
   ClientLeft      =   3480
   ClientTop       =   2280
   ClientWidth     =   5820
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5130
   ScaleWidth      =   5820
   ShowInTaskbar   =   0   'False
   Begin VB.Timer timMoveArm 
      Enabled         =   0   'False
      Left            =   5040
      Top             =   2040
   End
   Begin VB.CommandButton cmdBreakIn 
      Caption         =   "Break In"
      Height          =   735
      Left            =   1920
      TabIndex        =   0
      Top             =   480
      Width           =   1815
   End
   Begin VB.Image imgBanner 
      Height          =   1485
      Left            =   120
      Picture         =   "frmMain.frx":0000
      Top             =   120
      Width           =   5640
   End
   Begin VB.Image imgArm 
      Height          =   3060
      Index           =   2
      Left            =   2040
      Picture         =   "frmMain.frx":1B47A
      Top             =   1920
      Width           =   2640
   End
   Begin VB.Image imgArm 
      Height          =   3060
      Index           =   1
      Left            =   2040
      Picture         =   "frmMain.frx":3597C
      Top             =   1920
      Width           =   2640
   End
   Begin VB.Image imgArm 
      Height          =   3060
      Index           =   0
      Left            =   2040
      Picture         =   "frmMain.frx":4FE7E
      Top             =   1920
      Width           =   2640
   End
   Begin VB.Image imgObiWan 
      Height          =   3030
      Left            =   120
      Picture         =   "frmMain.frx":6A380
      Top             =   2040
      Width           =   1980
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim intArmValue As Integer

Private Sub cmdBreakIn_Click()
  intArmValue = 0
  imgBanner.Visible = True
  timMoveArm.Enabled = True
  cmdBreakIn.Visible = False
End Sub



Private Sub Form_Load()
  Dim i As Integer
  timMoveArm.Interval = 1000
  
  For i = 0 To 2 Step 1
  imgArm(i).Visible = False
  Next i
  imgBanner.Visible = False
  intArmValue = 0
End Sub

Private Sub imgExit_Click()
  End
End Sub

Private Sub timMoveArm_Timer()
  Select Case intArmValue
    Case 0
      imgArm(0).Visible = True
      imgArm(1).Visible = False
      imgArm(2).Visible = False
    Case 1
      imgArm(0).Visible = False
      imgArm(1).Visible = True
      imgArm(2).Visible = False
    Case 2
      imgArm(0).Visible = False
      imgArm(1).Visible = False
      imgArm(2).Visible = True
    Case 3
      imgArm(2).Visible = False
      imgBanner.Visible = False
      cmdBreakIn.Visible = True
      timMoveArm.Enabled = False
  End Select
  intArmValue = intArmValue + 1
End Sub
