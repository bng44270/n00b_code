VERSION 5.00
Begin VB.Form frmEventDrivenLoop 
   Caption         =   "Enter Numbers"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset"
      Height          =   615
      Left            =   2280
      TabIndex        =   6
      Top             =   2280
      Width           =   735
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   615
      Left            =   3240
      TabIndex        =   5
      Top             =   2280
      Width           =   735
   End
   Begin VB.ListBox lstNumbers 
      Height          =   1425
      ItemData        =   "frmEventDrivenLoop.frx":0000
      Left            =   3120
      List            =   "frmEventDrivenLoop.frx":0002
      TabIndex        =   4
      Top             =   360
      Width           =   1335
   End
   Begin VB.TextBox txtNumber 
      Height          =   615
      Left            =   1200
      TabIndex        =   2
      Top             =   360
      Width           =   1695
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add"
      Height          =   615
      Left            =   360
      TabIndex        =   1
      Top             =   2280
      Width           =   735
   End
   Begin VB.CommandButton cmdTotal 
      Caption         =   "Total"
      Height          =   615
      Left            =   1320
      TabIndex        =   0
      Top             =   2280
      Width           =   735
   End
   Begin VB.Label lblNumbers 
      Caption         =   "Enter Number Here"
      Height          =   735
      Left            =   480
      TabIndex        =   3
      Top             =   360
      Width           =   735
   End
End
Attribute VB_Name = "frmEventDrivenLoop"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Number adder and totaler
'by Andy Carlson
'9-25-01
Dim intNumberTemp As Integer
Dim intTotal As Integer
Private Sub cmdAdd_Click()
  intNumberTemp = Val(txtNumber.Text)
  intTotal = intTotal + intNumberTemp
  lstNumbers.AddItem Str(intNumberTemp)
  txtNumber.Text = ""
  txtNumber.SetFocus
End Sub

Private Sub cmdExit_Click()
  End
End Sub

Private Sub cmdReset_Click()
  txtNumber.Text = ""
  lstNumbers.Clear
  cmdAdd.Enabled = True
  cmdReset.Enabled = False
End Sub

Private Sub cmdTotal_Click()
  lstNumbers.AddItem "______________"
  lstNumbers.AddItem Str(intTotal)
  cmdAdd.Enabled = False
  cmdReset.Enabled = True
End Sub

Private Sub Form_Load()
  cmdReset.Enabled = False
  intNumberTemp = 0
  intTotalTemp = 0
  intSumTemp = 0
End Sub
