VERSION 5.00
Begin VB.Form frmScrollBarLetterGrade 
   Caption         =   "Scroll Bar Example"
   ClientHeight    =   3870
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3870
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.VScrollBar vsbAverage 
      Height          =   1935
      Left            =   3120
      TabIndex        =   9
      Top             =   360
      Width           =   495
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   615
      Left            =   3360
      TabIndex        =   5
      Top             =   2880
      Width           =   975
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Reset"
      Height          =   615
      Left            =   2160
      TabIndex        =   4
      Top             =   2880
      Width           =   975
   End
   Begin VB.CommandButton cmdLetterGrade 
      Caption         =   "Get Letter Grade"
      Height          =   615
      Left            =   960
      TabIndex        =   3
      Top             =   2880
      Width           =   975
   End
   Begin VB.TextBox txtLetterGrade 
      Height          =   615
      Left            =   1080
      TabIndex        =   2
      Top             =   1920
      Width           =   1215
   End
   Begin VB.TextBox txtNumberGrade 
      Height          =   615
      Left            =   1080
      TabIndex        =   1
      Top             =   1080
      Width           =   1215
   End
   Begin VB.TextBox txtName 
      Height          =   615
      Left            =   1080
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "Letter Grade"
      Height          =   615
      Left            =   240
      TabIndex        =   8
      Top             =   1920
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "Number Grade"
      Height          =   615
      Left            =   240
      TabIndex        =   7
      Top             =   1080
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "Name"
      Height          =   615
      Left            =   240
      TabIndex        =   6
      Top             =   240
      Width           =   735
   End
End
Attribute VB_Name = "frmScrollBarLetterGrade"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Letter Grade Example
'by Andy Carlson
'9-25-01
Dim intNumber As Integer

Private Sub cmdClear_Click()
  vsbAverage.Value = 0
  txtName.Text = ""
  txtNumberGrade.Text = ""
  txtLetterGrade.Text = ""
End Sub

Private Sub cmdExit_Click()
  End
End Sub

Private Sub cmdLetterGrade_Click()
intNumber = Val(txtNumberGrade.Text)
Select Case Val(intNumber)
    Case 90 To 100
            txtLetterGrade.Text = "A"
    Case 80 To 89
            txtLetterGrade.Text = "B"
    Case 70 To 79
            txtLetterGrade.Text = "C"
    Case 60 To 69
            txtLetterGrade.Text = "D"
    Case Else
            txtLetterGrade.Text = "F"
  End Select
End Sub

Private Sub Form_Load()
  intNumber = 0
  vsbAverage.Max = 0
  vsbAverage.Min = 100
End Sub

Private Sub vsbAverage_Change()
  txtNumberGrade.Text = vsbAverage.Value
End Sub
