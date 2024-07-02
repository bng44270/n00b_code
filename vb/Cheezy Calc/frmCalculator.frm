VERSION 5.00
Begin VB.Form frmCalculator 
   Caption         =   "Add 2 Numbers"
   ClientHeight    =   1965
   ClientLeft      =   4230
   ClientTop       =   3270
   ClientWidth     =   3495
   LinkTopic       =   "Form1"
   ScaleHeight     =   1965
   ScaleWidth      =   3495
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   1080
      TabIndex        =   3
      Top             =   1320
      Width           =   1095
   End
   Begin VB.CommandButton cmdAddNumbers 
      Caption         =   "Add"
      Height          =   375
      Left            =   1080
      TabIndex        =   2
      Top             =   720
      Width           =   1095
   End
   Begin VB.TextBox txtTwo 
      Height          =   375
      Left            =   2160
      TabIndex        =   1
      Top             =   120
      Width           =   855
   End
   Begin VB.TextBox txtOne 
      Height          =   375
      Left            =   600
      TabIndex        =   0
      Top             =   120
      Width           =   855
   End
   Begin VB.Label lblTwo 
      Caption         =   "#2"
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
      Left            =   1680
      TabIndex        =   5
      Top             =   120
      Width           =   495
   End
   Begin VB.Label lblOne 
      Caption         =   "#1"
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
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   495
   End
End
Attribute VB_Name = "frmCalculator"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim intOne As Integer       'Integer #1
Dim intTwo As Integer       'Integer #1
Dim intSum As Integer       'Integer for Sum
Private Sub cmdAddNumbers_Click()
  intOne = txtOne.Text
  intTwo = txtTwo.Text
  intSum = intOne + intTwo
  txtOne.Text = ""
  txtTwo.Text = ""
  MsgBox "The Answer is " & intSum, vbOKOnly, "Answer"
  txtOne.SetFocus
End Sub

Private Sub cmdExit_Click()
  End
End Sub
