VERSION 5.00
Begin VB.Form frmSizeAndColor 
   Caption         =   "Form1"
   ClientHeight    =   3300
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   5610
   LinkTopic       =   "Form1"
   ScaleHeight     =   3300
   ScaleMode       =   0  'User
   ScaleWidth      =   6610
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtMemoPad 
      Height          =   2895
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   240
      Width           =   4455
   End
   Begin VB.Menu mnuAppear 
      Caption         =   "&Appearance"
      Begin VB.Menu mnuColorMenu 
         Caption         =   "&Color"
         Begin VB.Menu mnuColor 
            Caption         =   "&Black"
            Index           =   0
         End
         Begin VB.Menu mnuColor 
            Caption         =   "&White"
            Index           =   1
         End
         Begin VB.Menu mnuColor 
            Caption         =   "&Green"
            Index           =   2
         End
      End
      Begin VB.Menu mnuSizeMenu 
         Caption         =   "&Size"
         Begin VB.Menu mnuSize 
            Caption         =   "&Small"
            Index           =   0
         End
         Begin VB.Menu mnuSize 
            Caption         =   "&Medium"
            Index           =   1
         End
         Begin VB.Menu mnuSize 
            Caption         =   "&Big"
            Index           =   2
         End
      End
   End
   Begin VB.Menu mnuExit 
      Caption         =   "&Exit"
   End
End
Attribute VB_Name = "frmSizeAndColor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Menu Program with text box
Dim intColorTempIndex As Integer
Dim intSizeTempIndex As Integer
Dim intSizeCounter As Integer
Dim intColorCounter As Integer

Private Sub Form_Load()
  intColorTempIndex = 0
  intSizeTempIndex = 0
  intColorCounter = 0
  intSizeCounter = 0
End Sub

Private Sub Form_Resize()
  txtMemoPad.Height = ScaleHeight
  txtMemoPad.Width = ScaleWidth - 100
End Sub

Private Sub mnuColor_Click(Index As Integer)
  Dim intI As Integer
  
  For intI = 0 To 2
    mnuColor(intI).Checked = False
  Next intI
  Select Case Index
    Case 0
      txtMemoPad.BackColor = vbBlack
      txtMemoPad.ForeColor = vbWhite
    Case 1
      txtMemoPad.BackColor = vbWhite
      txtMemoPad.ForeColor = vbBlack
    Case 2
      txtMemoPad.BackColor = vbGreen
      txtMemoPad.ForeColor = vbRed
  End Select
  mnuColor(Index).Checked = True
End Sub

Private Sub mnuExit_Click()
  End
End Sub

Private Sub mnuSize_Click(Index As Integer)
  Dim intI As Integer
    
  For intI = 0 To 2
    mnuSize(intI).Checked = False
  Next intI
  Select Case Index
    Case 0
      frmSizeAndColor.Height = 2000
      frmSizeAndColor.Width = 3000
    Case 1
      frmSizeAndColor.Height = 5085
      frmSizeAndColor.Width = 6390
    Case 2
      frmSizeAndColor.Height = 8325
      frmSizeAndColor.Width = 12120
  End Select
  mnuSize(Index).Checked = True
End Sub
