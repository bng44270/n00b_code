VERSION 5.00
Begin VB.Form frmNumberAdder 
   Caption         =   "Number Adder"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4785
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4785
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdClear 
      Caption         =   "&Clear"
      Height          =   495
      Left            =   3120
      TabIndex        =   7
      Top             =   1440
      Width           =   975
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "&Exit"
      Height          =   495
      Left            =   3120
      TabIndex        =   6
      Top             =   2160
      Width           =   975
   End
   Begin VB.CommandButton cmdSumItems 
      Caption         =   "&Sum Items"
      Height          =   495
      Left            =   3120
      TabIndex        =   5
      Top             =   720
      Width           =   975
   End
   Begin VB.CommandButton cmdAddItem 
      Caption         =   "&Add Item"
      Height          =   495
      Left            =   3120
      TabIndex        =   4
      Top             =   0
      Width           =   975
   End
   Begin VB.ListBox lstNumberFromArray 
      Height          =   1425
      ItemData        =   "frmNumberAdder.frx":0000
      Left            =   480
      List            =   "frmNumberAdder.frx":0002
      TabIndex        =   2
      Top             =   1200
      Width           =   1335
   End
   Begin VB.TextBox txtNumberEntered 
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   600
      Width           =   2055
   End
   Begin VB.Label lblNumberBox 
      Caption         =   "Enter Number Here"
      Height          =   255
      Left            =   480
      TabIndex        =   3
      Top             =   240
      Width           =   1455
   End
   Begin VB.Line Line2 
      X1              =   2640
      X2              =   2640
      Y1              =   2760
      Y2              =   0
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   4800
      Y1              =   2760
      Y2              =   2760
   End
   Begin VB.Label lblStatusBar 
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
      Left            =   0
      TabIndex        =   0
      Top             =   2880
      Width           =   4695
   End
End
Attribute VB_Name = "frmNumberAdder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Number Suming Program
'by Andy Carlson
'10-23-01
Dim intCounter As Integer
Dim intArrayOfNumbers(20) As Integer


Private Sub cmdAddItem_Click()
  If (Val(txtNumberEntered.Text) < 32000) And (Val(txtNumberEntered.Text) > -1) And (Counter < 21) Then
    intArrayOfNumbers(intCounter) = txtNumberEntered.Text
    lblStatusBar.Caption = "Number " & intArrayOfNumbers(intCounter) & " added."
    intCounter = intCounter + 1
  Else
    Dim strMsg As String
    strMsg = "Error is one of these:" & vbCrLf
    strMsg = strMsg & "     -Number entered is out of Range" & vbCrLf
    strMsg = strMsg & "     -There is insufficient space for more numbers"
    MsgBox strMsg, vbOKOnly, "ERROR!!!"
    lblStatusBar.Caption = "Try Again"
  End If
End Sub

Private Sub cmdClear_Click()
  txtNumberEntered.Text = ""
  lstNumberFromArray.Clear
  lblStatusBar.Caption = "Please enter a number."
End Sub

Private Sub cmdExit_Click()
  End
End Sub

Private Sub cmdSumItems_Click()
  Dim intI As Integer
  Dim intSum As Integer
  
  intSum = 0
  For intI = 0 To intCounter - 1 Step 1
    lstNumberFromArray.AddItem intArrayOfNumbers(intI)
    intSum = intSum + intArrayOfNumbers(intI)
  Next intI
  
  lstNumberFromArray.AddItem "Sum is " & intSum
  lblStatusBar.Caption = "This is Your Sum"
End Sub

Private Sub Form_Load()
  lblStatusBar.Caption = "Please enter a number."
  intCounter = 0
End Sub
