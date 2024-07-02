VERSION 5.00
Begin VB.Form frmStudentScores 
   Caption         =   "Student Data Input Form"
   ClientHeight    =   5205
   ClientLeft      =   3540
   ClientTop       =   1905
   ClientWidth     =   5505
   LinkTopic       =   "Form1"
   ScaleHeight     =   5205
   ScaleWidth      =   5505
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   255
      Left            =   2880
      TabIndex        =   13
      Top             =   3480
      Width           =   1695
   End
   Begin VB.CommandButton cmdClearFields 
      Caption         =   "Clear Fields"
      Height          =   255
      Left            =   2880
      TabIndex        =   12
      Top             =   3120
      Width           =   1695
   End
   Begin VB.CommandButton cmdPrintReport 
      Caption         =   "Print Report"
      Height          =   255
      Left            =   720
      TabIndex        =   11
      Top             =   3480
      Width           =   1695
   End
   Begin VB.CommandButton cmdCalculate 
      Caption         =   "Calculate"
      Height          =   255
      Left            =   720
      TabIndex        =   10
      Top             =   3120
      Width           =   1695
   End
   Begin VB.TextBox txtScoreOne 
      Height          =   495
      Left            =   1800
      TabIndex        =   4
      Top             =   1080
      Width           =   2535
   End
   Begin VB.TextBox txtScoreTwo 
      Height          =   495
      Left            =   1800
      TabIndex        =   3
      Top             =   1800
      Width           =   2535
   End
   Begin VB.TextBox txtStudentName 
      Height          =   495
      Left            =   1800
      TabIndex        =   2
      Top             =   240
      Width           =   2535
   End
   Begin VB.TextBox txtScoreThree 
      Height          =   495
      Left            =   1800
      TabIndex        =   1
      Top             =   2520
      Width           =   2535
   End
   Begin VB.TextBox txtAverage 
      Height          =   495
      Left            =   1320
      TabIndex        =   0
      Top             =   4560
      Width           =   2535
   End
   Begin VB.Label Label3 
      Caption         =   "Average"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   1680
      TabIndex        =   9
      Top             =   3960
      Width           =   1935
   End
   Begin VB.Label Label2 
      Caption         =   "Score #3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   840
      TabIndex        =   8
      Top             =   2520
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Score #2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   840
      TabIndex        =   7
      Top             =   1800
      Width           =   975
   End
   Begin VB.Label lblScoreOne 
      Caption         =   "Score #1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   720
      TabIndex        =   6
      Top             =   1080
      Width           =   975
   End
   Begin VB.Label lblStudentName 
      Caption         =   "Student Name"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   840
      TabIndex        =   5
      Top             =   240
      Width           =   1215
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   5520
      Y1              =   3840
      Y2              =   3840
   End
End
Attribute VB_Name = "frmStudentScores"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Student Average Program
'by Andy Carlson
'Date:  9-6-01
Option Explicit
Dim intScoreOne As Integer
Dim intScoreTwo As Integer
Dim intScoreThree As Integer
Dim douAverage As Double
Dim strReport As String
Private Sub cmdCalculate_Click()
  intScoreOne = Val(txtScoreOne.Text)
  intScoreTwo = Val(txtScoreTwo.Text)
  intScoreThree = Val(txtScoreThree.Text)
  douAverage = (intScoreOne + intScoreTwo + intScoreThree) / 3
  txtAverage.Text = Format(douAverage, "fixed")
End Sub

Private Sub cmdClearFields_Click()
  txtStudentName.Text = ""
  txtScoreOne.Text = ""
  txtScoreTwo.Text = ""
  txtScoreThree.Text = ""
  txtAverage.Text = ""
End Sub

Private Sub cmdExit_Click()
  End
End Sub

Private Sub cmdPrintReport_Click()
  frmStudentScores.PrintForm
  strReport = "This was printed:" & vbCrLf & vbCrLf
  strReport = strReport & "Student Name:  " & txtStudentName.Text & vbCrLf
  strReport = strReport & "   Score #1:  " & intScoreOne & "%" & vbCrLf
  strReport = strReport & "   Score #2:  " & intScoreTwo & "%" & vbCrLf
  strReport = strReport & "   Score #3:  " & intScoreThree & "%" & vbCrLf & vbCrLf
  strReport = strReport & "   AVERAGE:  " & Format(douAverage, "fixed") & "%"
  MsgBox strReport, vbOKOnly, "Student Report"
End Sub
