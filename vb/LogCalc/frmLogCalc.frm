VERSION 5.00
Begin VB.Form frmLogCalc 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Ace E's Logarithmic Calculator"
   ClientHeight    =   3645
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5805
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3645
   ScaleWidth      =   5805
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExit 
      Caption         =   "&Exit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   3600
      TabIndex        =   7
      Top             =   840
      Width           =   855
   End
   Begin VB.CommandButton cmdHelp 
      Caption         =   "&Help"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   3600
      TabIndex        =   6
      Top             =   120
      Width           =   855
   End
   Begin VB.CommandButton cmdCalcLog 
      Caption         =   "&Calculate"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   1920
      TabIndex        =   5
      Top             =   2160
      Width           =   1215
   End
   Begin VB.TextBox txtSubject 
      Height          =   495
      Left            =   1200
      TabIndex        =   2
      Top             =   1200
      Width           =   1695
   End
   Begin VB.TextBox txtBase 
      Height          =   495
      Left            =   1200
      TabIndex        =   0
      Top             =   120
      Width           =   1695
   End
   Begin VB.Line Line10 
      BorderWidth     =   5
      X1              =   1920
      X2              =   1920
      Y1              =   600
      Y2              =   1200
   End
   Begin VB.Line Line9 
      BorderWidth     =   5
      X1              =   1560
      X2              =   1920
      Y1              =   2520
      Y2              =   2520
   End
   Begin VB.Line Line8 
      BorderColor     =   &H000000FF&
      BorderWidth     =   5
      X1              =   4440
      X2              =   5400
      Y1              =   2880
      Y2              =   2880
   End
   Begin VB.Line Line7 
      BorderColor     =   &H000000FF&
      BorderWidth     =   5
      X1              =   4440
      X2              =   5400
      Y1              =   2160
      Y2              =   2160
   End
   Begin VB.Line Line6 
      BorderColor     =   &H000000FF&
      BorderWidth     =   5
      X1              =   5400
      X2              =   5400
      Y1              =   2160
      Y2              =   2880
   End
   Begin VB.Line Line5 
      BorderColor     =   &H000000FF&
      BorderWidth     =   5
      X1              =   4440
      X2              =   4440
      Y1              =   2160
      Y2              =   2880
   End
   Begin VB.Line Line4 
      BorderWidth     =   5
      X1              =   4320
      X2              =   4080
      Y1              =   2520
      Y2              =   2760
   End
   Begin VB.Line Line3 
      BorderWidth     =   5
      X1              =   4080
      X2              =   4320
      Y1              =   2280
      Y2              =   2520
   End
   Begin VB.Line Line2 
      BorderWidth     =   5
      X1              =   3120
      X2              =   4320
      Y1              =   2520
      Y2              =   2520
   End
   Begin VB.Line Line1 
      BorderWidth     =   5
      X1              =   1560
      X2              =   1560
      Y1              =   1680
      Y2              =   2520
   End
   Begin VB.Label lblExponent 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4560
      TabIndex        =   4
      Top             =   2280
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "Subject"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   1320
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Base"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   360
      TabIndex        =   1
      Top             =   240
      Width           =   735
   End
End
Attribute VB_Name = "frmLogCalc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCalcLog_Click()
  If (txtBase.Text = "") Or (txtSubject.Text = "") Then
    MsgBox "You must enter a base and a subject to calculate on.", vbInformation + vbOKOnly, "Error"
    txtBase.SetFocus
    Exit Sub
  ElseIf Val(txtSubject.Text) <= 0 Then
    MsgBox "Logarithm subject can't bee less than or equal to zero.", vbInformation + vbOKOnly, "Error"
    txtSubject.Text = ""
    txtSubject.SetFocus
    Exit Sub
  ElseIf Val(txtBase.Text) = 1 Then
    MsgBox "Logarithm base can't be one.", vbOKOnly + vbInformation, "Error"
    txtBase.Text = ""
    txtBase.SetFocus
    Exit Sub
  End If
  lblExponent.Caption = (Log(Val(txtSubject)) / Log(Val(txtBase.Text)))
End Sub

Private Sub cmdExit_Click()
  End
End Sub

Private Sub cmdHelp_Click()
  Dim strMsg As String
  
  strMsg = "This is a simple logarithmic calculator.  It" + vbCrLf
  strMsg = strMsg + "accepts a base and a subject (to take log of)" + vbCrLf
  strMsg = strMsg + "and calculates the logarithm.  This is a free program," + vbCrLf
  strMsg = strMsg + "so please give it away for others to use, too." + vbCrLf + vbCrLf
  strMsg = strMsg + "PEACE :)  Ace E. Rawker" + vbCrLf + vbCrLf
  strMsg = strMsg + "(P) 2002"
  
  MsgBox strMsg, vbOKOnly + vbInformation, "Help"
End Sub
