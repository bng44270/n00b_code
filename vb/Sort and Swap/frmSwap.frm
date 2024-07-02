VERSION 5.00
Begin VB.Form frmSwap 
   Caption         =   "Number Swapper"
   ClientHeight    =   2535
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3975
   LinkTopic       =   "Form1"
   ScaleHeight     =   2535
   ScaleWidth      =   3975
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdBack 
      Caption         =   "Back to Sorter"
      Height          =   615
      Left            =   2280
      TabIndex        =   5
      Top             =   1800
      Width           =   1335
   End
   Begin VB.CommandButton cmdSwap 
      Caption         =   "Swap"
      Height          =   615
      Left            =   360
      TabIndex        =   4
      Top             =   1800
      Width           =   1335
   End
   Begin VB.TextBox txtSecondNumber 
      Height          =   735
      Left            =   2160
      TabIndex        =   3
      Top             =   720
      Width           =   1695
   End
   Begin VB.TextBox txtFirstNumber 
      Height          =   735
      Left            =   120
      TabIndex        =   0
      Top             =   720
      Width           =   1695
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   3960
      Y1              =   1560
      Y2              =   1560
   End
   Begin VB.Label lblTwo 
      Caption         =   "Number Two"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2160
      TabIndex        =   2
      Top             =   240
      Width           =   1815
   End
   Begin VB.Label lblOne 
      Caption         =   "Number One"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   240
      Width           =   1815
   End
End
Attribute VB_Name = "frmSwap"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Text1_Change()

End Sub

Private Sub cmdBack_Click()
  frmSwap.Hide
  frmSort.Enabled = True
End Sub

Private Sub cmdSwap_Click()
  Dim intFirstTmp As Integer
  Dim intSecondTmp As Integer
  
  intFirstTmp = Val(txtFirstNumber.Text)
  intSecondTmp = Val(txtSecondNumber.Text)
  
  Call swap(intFirstTmp, intSecondTmp)
  txtFirstNumber.Text = Str(intFirstTmp)
  txtSecondNumber.Text = Str(intSecondTmp)
End Sub
