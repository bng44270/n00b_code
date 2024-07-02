VERSION 5.00
Begin VB.Form frmKillCobol 
   Caption         =   "Kill Cobol"
   ClientHeight    =   4710
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4185
   LinkTopic       =   "Form1"
   ScaleHeight     =   4710
   ScaleWidth      =   4185
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer timKillImage 
      Enabled         =   0   'False
      Left            =   1560
      Top             =   1440
   End
   Begin VB.Timer timImageMove 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   3120
      Top             =   1200
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2520
      TabIndex        =   1
      Top             =   3600
      Width           =   975
   End
   Begin VB.CommandButton cmdStartStop 
      Caption         =   "Start"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   720
      TabIndex        =   0
      Top             =   3600
      Width           =   975
   End
   Begin VB.Image imgCobolIco 
      Height          =   795
      Index           =   5
      Left            =   1080
      Picture         =   "frmKillCobol.frx":0000
      Top             =   3000
      Width           =   675
   End
   Begin VB.Image imgCobolIco 
      Height          =   795
      Index           =   4
      Left            =   2520
      Picture         =   "frmKillCobol.frx":1C6A
      Top             =   1800
      Width           =   675
   End
   Begin VB.Image imgCobolIco 
      Height          =   795
      Index           =   3
      Left            =   2760
      Picture         =   "frmKillCobol.frx":38D4
      Top             =   2640
      Width           =   675
   End
   Begin VB.Image imgCobolIco 
      Height          =   795
      Index           =   2
      Left            =   2160
      Picture         =   "frmKillCobol.frx":553E
      Top             =   480
      Width           =   675
   End
   Begin VB.Image imgCobolIco 
      Height          =   795
      Index           =   1
      Left            =   720
      Picture         =   "frmKillCobol.frx":71A8
      Top             =   360
      Width           =   675
   End
   Begin VB.Image imgCobolIco 
      Height          =   795
      Index           =   0
      Left            =   360
      Picture         =   "frmKillCobol.frx":8E12
      Top             =   1680
      Width           =   675
   End
End
Attribute VB_Name = "frmKillCobol"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim velocity As Integer

Private Sub cmdStartStop_Click()
  If UCase(cmdStartStop.Caption) = "START" Then
    cmdStartStop.Caption = "Stop"
    timImageMove.Enabled = True
  Else
    cmdStartStop.Caption = "Start"
    timImageMove.Enabled = False
  End If
End Sub

Private Sub Form_Load()
  Dim i As Integer
  
  For i = 1 To 5 Step 1
    imgCobolIco(i).Visible = False
  Next i
  
  velocity = 70
  
  
End Sub


Private Sub timImageMove_Timer()
  If imgCobolIco(0).Left = frmKillCobol.Width - imgCobolIco(0).Width Then
    velocity = velocity * -1
  End If
  If imgCobolIco(0).Left = 0 Then
    velocity = velocity * -1
  End If
  
  imgCobolIco(0).Left = imgCobolIco(0).Left + velocity
End Sub
