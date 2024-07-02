VERSION 5.00
Begin VB.Form frmScrollFirst 
   Caption         =   "List Box Example"
   ClientHeight    =   4725
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6165
   LinkTopic       =   "Form1"
   ScaleHeight     =   4725
   ScaleWidth      =   6165
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox lstNameAndGrade 
      Height          =   1815
      ItemData        =   "frmScrollFirst.frx":0000
      Left            =   4440
      List            =   "frmScrollFirst.frx":0002
      TabIndex        =   9
      Top             =   600
      Width           =   1575
   End
   Begin VB.TextBox txtAverage 
      Height          =   495
      Left            =   4440
      TabIndex        =   8
      Top             =   3960
      Width           =   1575
   End
   Begin VB.TextBox txtNumberGrade3 
      Height          =   495
      Left            =   1200
      TabIndex        =   3
      Top             =   2400
      Width           =   1575
   End
   Begin VB.TextBox txtNumberGrade2 
      Height          =   495
      Left            =   1200
      TabIndex        =   2
      Top             =   1680
      Width           =   1575
   End
   Begin VB.TextBox txtLetterGrade 
      Height          =   495
      Left            =   960
      TabIndex        =   7
      Top             =   3960
      Width           =   1575
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   495
      Left            =   2040
      TabIndex        =   5
      Top             =   3120
      Width           =   855
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset Values"
      Height          =   495
      Left            =   3000
      TabIndex        =   6
      Top             =   3120
      Width           =   855
   End
   Begin VB.CommandButton cmdAverageGetLetterGrade 
      Caption         =   "Average and Get Letter Grade"
      Height          =   495
      Left            =   240
      TabIndex        =   4
      Top             =   3120
      Width           =   1455
   End
   Begin VB.TextBox txtStudentName 
      Height          =   495
      Left            =   1200
      TabIndex        =   0
      Top             =   360
      Width           =   1575
   End
   Begin VB.TextBox txtNumberGrade1 
      Height          =   495
      Left            =   1200
      TabIndex        =   1
      Top             =   960
      Width           =   1575
   End
   Begin VB.Label lblAverage 
      Caption         =   "Average"
      Height          =   495
      Left            =   3360
      TabIndex        =   13
      Top             =   3960
      Width           =   855
   End
   Begin VB.Line Line4 
      X1              =   720
      X2              =   1200
      Y1              =   1920
      Y2              =   1920
   End
   Begin VB.Line Line3 
      X1              =   1200
      X2              =   240
      Y1              =   2760
      Y2              =   2160
   End
   Begin VB.Line Line2 
      X1              =   360
      X2              =   1200
      Y1              =   1560
      Y2              =   1200
   End
   Begin VB.Label lblLetterGrade 
      Caption         =   "Letter Grade"
      Height          =   495
      Left            =   120
      TabIndex        =   12
      Top             =   3960
      Width           =   855
   End
   Begin VB.Label lblGrade 
      Caption         =   "Grades to Average"
      Height          =   495
      Left            =   0
      TabIndex        =   11
      Top             =   1680
      Width           =   855
   End
   Begin VB.Label lblName 
      Caption         =   "Name"
      Height          =   495
      Left            =   720
      TabIndex        =   10
      Top             =   480
      Width           =   855
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   6120
      Y1              =   3720
      Y2              =   3720
   End
End
Attribute VB_Name = "frmScrollFirst"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Scroll Bar Example Program
' by Andy Carlson
'9-11-01
Dim intNum1 As Integer
Dim intNum2 As Integer
Dim intNum3 As Integer
Dim intAverage As Integer
Dim strLetterGrade As String
Private Sub cmdAverageGetLetterGrade_Click()
  intNum1 = Val(txtNumberGrade1.Text)
  intNum2 = Val(txtNumberGrade2.Text)
  intNum3 = Val(txtNumberGrade3.Text)
  intAverage = (intNum1 + intNum2 + intNum3) / 3
  txtAverage.Text = Str(intAverage)
  Select Case Val(intAverage)
    Case 90 To 100
            strLetterGrade = "A"
            txtLetterGrade.Text = strLetterGrade
    Case 80 To 89
            strLetterGrade = "B"
            txtLetterGrade.Text = strLetterGrade
    Case 70 To 79
            strLetterGrade = "C"
            txtLetterGrade.Text = strLetterGrade
    Case 60 To 69
            strLetterGrade = "D"
            txtLetterGrade.Text = strLetterGrade
    Case Else
            strLetterGrade = "F"
            txtLetterGrade.Text = strLetterGrade
  End Select
  lstNameAndGrade.AddItem txtStudentName.Text
  lstNameAndGrade.AddItem strLetterGrade
End Sub

Private Sub cmdExit_Click()
    End
End Sub

Private Sub cmdReset_Click()
    txtNumberGrade1.Text = ""
    txtNumberGrade2.Text = ""
    txtNumberGrade3.Text = ""
    lstNameAndGrade.Clear
    txtStudentName.Text = ""
    txtLetterGrade.Text = ""
    txtAverage.Text = ""
End Sub

Private Sub Form_Load()
    lstNameAndGrade.Clear
    intNum1 = 0
    intNum2 = 0
    intNum3 = 0
    intAverage = 0
End Sub
