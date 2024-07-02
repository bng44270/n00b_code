VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form1 
   Caption         =   "Kill Microfocus COBOL"
   ClientHeight    =   3195
   ClientLeft      =   3420
   ClientTop       =   3180
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MouseIcon       =   "Form1.frx":0000
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   Begin MSComctlLib.Slider sliSpeed 
      Height          =   375
      Left            =   1560
      TabIndex        =   1
      Top             =   2640
      Width           =   2895
      _ExtentX        =   5106
      _ExtentY        =   661
      _Version        =   393216
      Min             =   1
      Max             =   100
      SelStart        =   1
      Value           =   1
   End
   Begin VB.CommandButton cmdDone 
      Caption         =   "Done"
      Height          =   495
      Left            =   1920
      TabIndex        =   0
      Top             =   1920
      Width           =   855
   End
   Begin VB.Timer timBlowUp 
      Left            =   3000
      Top             =   2040
   End
   Begin VB.Timer timMoveVB 
      Interval        =   1
      Left            =   1200
      Top             =   1920
   End
   Begin VB.Label Label1 
      Caption         =   "Speed"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   480
      TabIndex        =   2
      Top             =   2640
      Width           =   1095
   End
   Begin VB.Image imgBlowUp 
      Height          =   675
      Index           =   4
      Left            =   120
      Picture         =   "Form1.frx":030A
      Top             =   1080
      Width           =   615
   End
   Begin VB.Image imgBlowUp 
      Height          =   675
      Index           =   3
      Left            =   3840
      Picture         =   "Form1.frx":1918
      Top             =   480
      Width           =   615
   End
   Begin VB.Image imgBlowUp 
      Height          =   675
      Index           =   2
      Left            =   3120
      Picture         =   "Form1.frx":2F26
      Top             =   1440
      Width           =   615
   End
   Begin VB.Image imgBlowUp 
      Height          =   675
      Index           =   1
      Left            =   240
      Picture         =   "Form1.frx":4534
      Top             =   120
      Width           =   615
   End
   Begin VB.Image imgBlowUp 
      Height          =   675
      Index           =   0
      Left            =   840
      Picture         =   "Form1.frx":5B42
      Top             =   1080
      Width           =   615
   End
   Begin VB.Image imgVBKill 
      Height          =   675
      Left            =   1800
      Picture         =   "Form1.frx":7150
      Top             =   480
      Width           =   615
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim X As Integer
Dim Y As Integer
Dim velocity As Integer
Dim shapeRangeX As New clsRange
Dim shapeRangeY As New clsRange
Dim intImageIndex As Integer
Dim intBlowUpX As Integer
Dim intBlowUpY As Integer

Private Sub cmdDone_Click()
  End
End Sub

Private Sub Form_Load()
  Dim i As Integer
  
  For i = 0 To 4 Step 1
    imgBlowUp(i).Visible = False
  Next i
  intImageIndex = 0
  velocity = 40
  shapeRangeX.Bottom = imgVBKill.Left
  shapeRangeX.Top = imgVBKill.Left + imgVBKill.Width
  shapeRangeY.Bottom = imgVBKill.Top
  shapeRangeY.Top = imgVBKill.Top + imgVBKill.Height
End Sub



Private Sub imgVBKill_Click()
  'MsgBox "Good Job!!! You Killed Visual Basic!!!!"
  timMoveVB.Interval = 0
  timBlowUp.Interval = 20
  intBlowUpX = imgVBKill.Left
  intBlowUpY = imgVBKill.Top
  imgVBKill.Visible = False
End Sub



Private Sub sliSpeed_Change()
  timMoveVB.Interval = sliSpeed.Value
End Sub

Private Sub timBlowUp_Timer()
  Dim i As Integer
  
  If intImageIndex > 0 Then
    imgBlowUp(intImageIndex - 1).Visible = False
  End If
  If intImageIndex = 5 Then
    For i = 0 To 4 Step 1
      imgBlowUp(i).Visible = False
    Next i
    timBlowUp.Interval = 0
    timMoveVB.Interval = 1
    intImageIndex = 0
    imgVBKill.Visible = True
    Exit Sub
  End If
  If intImageIndex = 4 Then
    timBlowUp.Interval = 500
  End If
  imgBlowUp(intImageIndex).Visible = True
  imgBlowUp(intImageIndex).Left = intBlowUpX
  imgBlowUp(intImageIndex).Top = intBlowUpY
  intImageIndex = intImageIndex + 1
End Sub

'Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'  If (shapeRangeX.inRange(X)) And (shapeRangeY.inRange(Y)) Then
'    MsgBox "Good Job!!! You Killed Visual Basic!!!!"
'  End If
'End Sub

Private Sub timMoveVB_Timer()

timMoveVB.Interval = sliSpeed.Value
X = imgVBKill.Left
If X < Form1.Width - imgVBKill.Width - 120 Then
  X = X + velocity
Else
  velocity = velocity * -1
  X = X + velocity
End If
If X > 0 Then
  X = X + velocity
Else
  velocity = velocity * -1
  X = X + velocity
End If
imgVBKill.Left = X
shapeRangeX.Bottom = imgVBKill.Left
shapeRangeX.Top = imgVBKill.Left + imgVBKill.Width
shapeRangeY.Bottom = imgVBKill.Top
shapeRangeY.Top = imgVBKill.Top + imgVBKill.Height

End Sub
