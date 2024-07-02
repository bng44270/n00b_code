VERSION 5.00
Begin VB.Form frmShoppingCart 
   Caption         =   "My Shopping Cart"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   495
      Left            =   3360
      TabIndex        =   5
      Top             =   2040
      Width           =   855
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   495
      Left            =   2280
      TabIndex        =   4
      Top             =   2040
      Width           =   855
   End
   Begin VB.CommandButton cmdSum 
      Caption         =   "Sum"
      Height          =   495
      Left            =   1200
      TabIndex        =   3
      Top             =   2040
      Width           =   855
   End
   Begin VB.CommandButton cmdSelect 
      Caption         =   "Select"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   2040
      Width           =   855
   End
   Begin VB.ListBox lstCost 
      Height          =   1035
      ItemData        =   "frmShoppingCart.frx":0000
      Left            =   2520
      List            =   "frmShoppingCart.frx":0002
      TabIndex        =   1
      Top             =   480
      Width           =   1455
   End
   Begin VB.ListBox lstProdName 
      Height          =   1035
      ItemData        =   "frmShoppingCart.frx":0004
      Left            =   360
      List            =   "frmShoppingCart.frx":0011
      TabIndex        =   0
      Top             =   480
      Width           =   1215
   End
   Begin VB.Line Line1 
      X1              =   4680
      X2              =   0
      Y1              =   1800
      Y2              =   1800
   End
End
Attribute VB_Name = "frmShoppingCart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdClear_Click()
  lstCost.Clear
  cmdSelect.Enabled = True
  cmdSum.Enabled = True
  cmdClear.Enabled = False
End Sub

Private Sub cmdExit_Click()
  End
End Sub

Private Sub cmdSelect_Click()
  Select Case lstProdName.ListIndex
    Case 0
            lstCost.AddItem Format(75, "currency")
    Case 1
            lstCost.AddItem Format(80, "currency")
    Case 2
            lstCost.AddItem Format(15, "currency")
  End Select
End Sub

Private Sub cmdSum_Click()
  Dim intI As Integer       'Index in for loop
  Dim intSum As Integer     'Sum of Cost
  
  intCost = 0
  For intI = 0 To lstCost.ListCount - 1
    intSum = intSum + lstCost.List(intI)
  Next intI
  lstCost.AddItem "_________"
  lstCost.AddItem Format(intSum, "currency")
  cmdSum.Enabled = False
  cmdSelect.Enabled = False
  cmdClear.Enabled = True
End Sub

Private Sub Form_Load()
  cmdClear.Enabled = False
End Sub
