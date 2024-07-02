VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
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
      Height          =   435
      Left            =   2760
      TabIndex        =   11
      Top             =   2400
      Width           =   1215
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset"
      Height          =   435
      Left            =   2760
      TabIndex        =   10
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton cmdCalculate 
      Caption         =   "Calculate Cost"
      Height          =   435
      Left            =   2760
      TabIndex        =   9
      Top             =   1440
      Width           =   1215
   End
   Begin VB.ListBox lstVideoType 
      Height          =   645
      ItemData        =   "Form1.frx":0000
      Left            =   2880
      List            =   "Form1.frx":000D
      TabIndex        =   8
      Top             =   480
      Width           =   1455
   End
   Begin VB.TextBox txtPrice 
      Height          =   495
      Left            =   960
      TabIndex        =   3
      Top             =   2280
      Width           =   1335
   End
   Begin VB.TextBox txtTax 
      Height          =   495
      Left            =   960
      TabIndex        =   2
      Top             =   1680
      Width           =   1335
   End
   Begin VB.TextBox txtRentalCost 
      Height          =   495
      Left            =   960
      TabIndex        =   1
      Top             =   1080
      Width           =   1335
   End
   Begin VB.TextBox txtCustomerName 
      Height          =   495
      Left            =   960
      TabIndex        =   0
      Top             =   480
      Width           =   1335
   End
   Begin VB.Label lblTotPrice 
      Caption         =   "Total Price"
      Height          =   495
      Left            =   120
      TabIndex        =   7
      Top             =   2280
      Width           =   855
   End
   Begin VB.Label lblTax 
      Caption         =   "Tax"
      Height          =   495
      Left            =   600
      TabIndex        =   6
      Top             =   1680
      Width           =   855
   End
   Begin VB.Label lblRentalCost 
      Caption         =   "Rental Cost"
      Height          =   495
      Left            =   0
      TabIndex        =   5
      Top             =   1080
      Width           =   855
   End
   Begin VB.Label lblCustomerName 
      Caption         =   "Customer Name"
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   480
      Width           =   855
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Video Pricer
'by Andy Carlson
Dim sngTax As Single
Dim sngRentalCost As Single
Dim sngTotal As Single
Private Sub cmdCalculate_Click()
    txtTax.Text = Str(Format(sngTax, "currency"))
    txtPrice.Text = Str(Format(sngTotal, "currency"))
End Sub

Private Sub cmdExit_Click()
    End
End Sub

Private Sub cmdReset_Click()
    txtPrice.Text = ""
    txtRentalCost.Text = ""
    txtTax.Text = ""
    txtCustomerName.Text = ""
End Sub

Private Sub lstVideoType_Click()
    Select Case lstVideoType.ListIndex
        Case 0
                txtRentalCost.Text = Str(0.99)
                sngRentalCost = Val(txtRentalCost.Text)
                sngTax = sngRentalCost * 0.07
                txtTax = Str(Format(sngTax, "currency"))
                sngTotal = sngRentalCost + sngTax
        Case 1
                txtRentalCost.Text = Str(1.99)
                sngRentalCost = Val(txtRentalCost.Text)
                sngTax = sngRentalCost * 0.07
                txtTax = Str(Format(sngTax, "currency"))
                sngTotal = sngRentalCost + sngTax
        Case 2
                txtRentalCost.Text = Str(2.99)
                sngRentalCost = Val(txtRentalCost.Text)
                sngTax = sngRentalCost * 0.07
                txtTax = Str(Format(sngTax, "currency"))
                sngTotal = sngRentalCost + sngTax
    End Select
End Sub
