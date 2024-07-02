VERSION 5.00
Begin VB.Form frmBinWB 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Binary Workbench"
   ClientHeight    =   3660
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3495
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3660
   ScaleWidth      =   3495
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdInput 
      Caption         =   "&Input"
      Height          =   255
      Left            =   720
      TabIndex        =   18
      Top             =   1200
      Width           =   495
   End
   Begin VB.CommandButton cmdShowNot 
      Caption         =   "&Not"
      Height          =   255
      Left            =   2640
      TabIndex        =   12
      Top             =   1200
      Width           =   495
   End
   Begin VB.CommandButton cmdShowXor 
      Caption         =   "&Xor"
      Height          =   255
      Left            =   2160
      TabIndex        =   11
      Top             =   1200
      Width           =   495
   End
   Begin VB.CommandButton cmdShowOr 
      Caption         =   "&Or"
      Height          =   255
      Left            =   1680
      TabIndex        =   10
      Top             =   1200
      Width           =   495
   End
   Begin VB.CommandButton cmdShowAnd 
      Caption         =   "&And"
      Height          =   255
      Left            =   1200
      TabIndex        =   9
      Top             =   1200
      Width           =   495
   End
   Begin VB.CommandButton cmdShowMain 
      Caption         =   "&Main"
      Height          =   255
      Left            =   240
      TabIndex        =   8
      Top             =   1200
      Width           =   495
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   255
      Left            =   960
      TabIndex        =   6
      Top             =   120
      Width           =   495
   End
   Begin VB.CommandButton cmdSelectReg 
      Caption         =   "&Sel"
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   120
      Width           =   495
   End
   Begin VB.HScrollBar hsbRegSelector 
      Height          =   255
      Left            =   360
      Max             =   9
      TabIndex        =   1
      Top             =   600
      Width           =   1455
   End
   Begin VB.Frame fraMain 
      Caption         =   "Main"
      Height          =   1575
      Left            =   240
      TabIndex        =   7
      Top             =   1440
      Width           =   3135
      Begin VB.Label lblMainHead 
         Caption         =   "Ace E's Binary Workbench for Windows"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1215
         Left            =   480
         TabIndex        =   17
         Top             =   240
         Width           =   2175
      End
   End
   Begin VB.Frame fraAnd 
      Caption         =   "AND"
      Height          =   1575
      Left            =   240
      TabIndex        =   13
      Top             =   1440
      Width           =   3135
      Begin VB.CommandButton cmdAnd 
         Caption         =   "Go"
         Height          =   375
         Left            =   1080
         TabIndex        =   26
         Top             =   960
         Width           =   615
      End
      Begin VB.TextBox txtAndValue 
         Height          =   375
         Left            =   1320
         TabIndex        =   24
         Top             =   360
         Width           =   735
      End
      Begin VB.Label lblAndInHex 
         Height          =   255
         Left            =   2160
         TabIndex        =   35
         Top             =   480
         Width           =   615
      End
      Begin VB.Label Label2 
         Caption         =   "AND value"
         Height          =   495
         Left            =   360
         TabIndex        =   25
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.Frame fraNot 
      Caption         =   "NOT"
      Height          =   1575
      Left            =   240
      TabIndex        =   16
      Top             =   1440
      Width           =   3135
      Begin VB.CommandButton cmdNot 
         Caption         =   "Go"
         Height          =   375
         Left            =   1200
         TabIndex        =   30
         Top             =   600
         Width           =   615
      End
   End
   Begin VB.Frame fraOr 
      Caption         =   "OR"
      Height          =   1575
      Left            =   240
      TabIndex        =   14
      Top             =   1440
      Width           =   3135
      Begin VB.CommandButton cmdOr 
         Caption         =   "Go"
         Height          =   375
         Left            =   1200
         TabIndex        =   33
         Top             =   960
         Width           =   615
      End
      Begin VB.TextBox txtOrValue 
         Height          =   375
         Left            =   1320
         TabIndex        =   32
         Top             =   360
         Width           =   735
      End
      Begin VB.Label lblOrInHex 
         Height          =   255
         Left            =   2160
         TabIndex        =   36
         Top             =   480
         Width           =   615
      End
      Begin VB.Label Label5 
         Caption         =   "OR Value"
         Height          =   495
         Left            =   480
         TabIndex        =   31
         Top             =   360
         Width           =   615
      End
   End
   Begin VB.Frame fraXor 
      Caption         =   "XOR"
      Height          =   1575
      Left            =   240
      TabIndex        =   15
      Top             =   1440
      Width           =   3135
      Begin VB.CommandButton cmdXor 
         Caption         =   "Go"
         Height          =   375
         Left            =   1080
         TabIndex        =   29
         Top             =   960
         Width           =   615
      End
      Begin VB.TextBox txtXorValue 
         Height          =   375
         Left            =   1200
         TabIndex        =   28
         Top             =   360
         Width           =   735
      End
      Begin VB.Label lblXorInHex 
         Height          =   255
         Left            =   2040
         TabIndex        =   37
         Top             =   480
         Width           =   615
      End
      Begin VB.Label Label4 
         Caption         =   "XOR Value"
         Height          =   495
         Left            =   360
         TabIndex        =   27
         Top             =   360
         Width           =   615
      End
   End
   Begin VB.Frame fraInput 
      Caption         =   "Input"
      Height          =   1575
      Left            =   240
      TabIndex        =   19
      Top             =   1440
      Width           =   3135
      Begin VB.CommandButton cmdInitializeRegs 
         Caption         =   "Initialize All Registers"
         Height          =   495
         Left            =   1680
         TabIndex        =   34
         Top             =   960
         Width           =   1095
      End
      Begin VB.CommandButton cmdSet 
         Caption         =   "Set"
         Height          =   375
         Left            =   480
         TabIndex        =   22
         Top             =   960
         Width           =   855
      End
      Begin VB.TextBox txtRegValue 
         Height          =   375
         Left            =   1080
         TabIndex        =   21
         Top             =   360
         Width           =   1095
      End
      Begin VB.Label lblInpInHex 
         Height          =   255
         Left            =   2280
         TabIndex        =   38
         Top             =   480
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "Value (0-255)"
         Height          =   495
         Left            =   240
         TabIndex        =   20
         Top             =   360
         Width           =   615
      End
   End
   Begin VB.Label lblStatusBar 
      Height          =   255
      Left            =   120
      TabIndex        =   23
      Top             =   3240
      Width           =   3255
   End
   Begin VB.Label Label1 
      Caption         =   "Register Value"
      Height          =   375
      Left            =   2760
      TabIndex        =   4
      Top             =   120
      Width           =   615
   End
   Begin VB.Label lblRegValue 
      Height          =   255
      Left            =   2760
      TabIndex        =   3
      Top             =   600
      Width           =   495
   End
   Begin VB.Label lblHead1 
      Caption         =   "Register No."
      Height          =   375
      Left            =   1920
      TabIndex        =   2
      Top             =   120
      Width           =   615
   End
   Begin VB.Label lblRegNumber 
      Height          =   255
      Left            =   2040
      TabIndex        =   0
      Top             =   600
      Width           =   495
   End
End
Attribute VB_Name = "frmBinWB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Base 0
Dim intRegPtr As Integer
Dim Registers(10) As Byte

Private Sub HideFrames()
  fraMain.Visible = False
  fraAnd.Visible = False
  fraOr.Visible = False
  fraXor.Visible = False
  fraNot.Visible = False
End Sub

Private Sub cmdAnd_Click()
  If Val(txtRegValue.Text) > 255 Then
    MsgBox "Data Out of Range", vbOKOnly + vbInformation, "Error"
  Else
    Registers(intRegPtr) = Val(txtRegValue.Text) And Val(txtAndValue.Text)
    lblStatusBar.Caption = "Register " & Str(intRegPtr) & " -- " & Hex$(Registers(intRegPtr))
    lblRegValue.Caption = Hex$(Registers(intRegPtr))
  End If
End Sub

Private Sub cmdExit_Click()
  Unload Me
End Sub

Private Sub cmdInitializeRegs_Click()
  For i = 0 To 9 Step 1
    Registers(i) = 0
  Next i
  
  lblRegValue.Caption = Registers(regptr)
  
  lblStatusBar.Caption = "Registers Initialized"
End Sub

Private Sub cmdInput_Click()
  HideFrames
  fraInput.Visible = True
End Sub

Private Sub cmdNot_Click()
  Registers(intRegPtr) = Not Registers(intRegPtr)
  lblStatusBar.Caption = "Register " & Str(intRegPtr) & " -- " & Hex$(Registers(intRegPtr))
  lblRegValue.Caption = Hex$(Registers(intRegPtr))
End Sub

Private Sub cmdOr_Click()
  If Val(txtRegValue.Text) > 255 Then
    MsgBox "Data Out of Range", vbOKOnly + vbInformation, "Error"
  Else
    Registers(intRegPtr) = Val(txtRegValue.Text) Or Val(txtAndValue.Text)
    lblStatusBar.Caption = "Register " & Str(intRegPtr) & " -- " & Hex$(Registers(intRegPtr))
    lblRegValue.Caption = Hex$(Registers(intRegPtr))
  End If
End Sub

Private Sub cmdSelectReg_Click()
  intRegPtr = hsbRegSelector.Value
  lblStatusBar.Caption = "Register " & Str(intRegPtr) & " selected"
End Sub

Private Sub cmdSet_Click()
  If Val(txtRegValue.Text) > 255 Then
    MsgBox "Data Out of Range", vbOKOnly + vbInformation, "Error"
  Else
    Registers(intRegPtr) = Val(txtRegValue.Text)
    lblStatusBar.Caption = "Register " & Str(intRegPtr) & " -- " & Hex$(Registers(intRegPtr))
    lblRegValue.Caption = Hex$(Registers(intRegPtr))
  End If
End Sub

Private Sub cmdShowAnd_Click()
  HideFrames
  fraAnd.Visible = True
End Sub

Private Sub cmdShowMain_Click()
  HideFrames
  fraMain.Visible = True
End Sub

Private Sub cmdShowNot_Click()
  HideFrames
  fraNot.Visible = True
End Sub

Private Sub cmdShowOr_Click()
  HideFrames
  fraOr.Visible = True
End Sub

Private Sub cmdShowXor_Click()
  HideFrames
  fraXor.Visible = True
End Sub

Private Sub cmdXor_Click()
  If Val(txtRegValue.Text) > 255 Then
    MsgBox "Data Out of Range", vbOKOnly + vbInformation, "Error"
  Else
    Registers(intRegPtr) = Val(txtRegValue.Text) Xor Val(txtAndValue.Text)
    lblStatusBar.Caption = "Register " & Str(intRegPtr) & " -- " & Hex$(Registers(intRegPtr))
    lblRegValue.Caption = Hex$(Registers(intRegPtr))
  End If
End Sub

Private Sub Form_Load()
  For i = 0 To 9 Step 1
    Registers(i) = 0
  Next i
  
  lblRegNumber.Caption = "R" + Hex$(hsbRegSelector.Value)
  lblRegValue.Caption = Hex$(Registers(hsbRegSelector.Value))
  
  intRegPtr = 0
  
  HideFrames
  fraMain.Visible = True
  
  lblStatusBar.Caption = "Registers Initialized -- Register 0 Selected"
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  MsgBox "Thanx for using the Binary Workbench", vbOKOnly + vbInformation, "Bye, Bye"
End Sub

Private Sub hsbRegSelector_Change()
  lblRegNumber.Caption = "R" + Str(hsbRegSelector.Value)
  lblRegValue.Caption = Hex$(Registers(hsbRegSelector.Value))
End Sub

Private Sub txtAndValue_Change()
  lblAndInHex.Caption = "=" & Hex$(Val(txtAndValue))
End Sub

Private Sub txtOrValue_Change()
  lblOrInHex.Caption = "=" & Hex$(Val(txtOrValue))
End Sub

Private Sub txtRegValue_Change()
  lblInpInHex.Caption = "=" & Hex$(Val(txtRegValue))
End Sub

Private Sub txtXorValue_Change()
  lblXorInHex.Caption = "=" & Hex$(Val(txtXorValue))
End Sub
