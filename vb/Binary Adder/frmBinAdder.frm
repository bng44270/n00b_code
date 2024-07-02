VERSION 5.00
Begin VB.Form frmBinAdder 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Binary Adder"
   ClientHeight    =   3285
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   5565
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3285
   ScaleWidth      =   5565
   StartUpPosition =   3  'Windows Default
   Begin VB.Shape shpSumBit 
      FillStyle       =   0  'Solid
      Height          =   495
      Index           =   8
      Left            =   0
      Shape           =   3  'Circle
      Top             =   2520
      Width           =   495
   End
   Begin VB.Shape shpSumBit 
      FillStyle       =   0  'Solid
      Height          =   495
      Index           =   7
      Left            =   600
      Shape           =   3  'Circle
      Top             =   2520
      Width           =   495
   End
   Begin VB.Shape shpSumBit 
      FillStyle       =   0  'Solid
      Height          =   495
      Index           =   6
      Left            =   1200
      Shape           =   3  'Circle
      Top             =   2520
      Width           =   495
   End
   Begin VB.Shape shpSumBit 
      FillStyle       =   0  'Solid
      Height          =   495
      Index           =   5
      Left            =   1800
      Shape           =   3  'Circle
      Top             =   2520
      Width           =   495
   End
   Begin VB.Shape shpSumBit 
      FillStyle       =   0  'Solid
      Height          =   495
      Index           =   4
      Left            =   2400
      Shape           =   3  'Circle
      Top             =   2520
      Width           =   495
   End
   Begin VB.Shape shpSumBit 
      FillStyle       =   0  'Solid
      Height          =   495
      Index           =   3
      Left            =   3000
      Shape           =   3  'Circle
      Top             =   2520
      Width           =   495
   End
   Begin VB.Shape shpSumBit 
      FillStyle       =   0  'Solid
      Height          =   495
      Index           =   2
      Left            =   3600
      Shape           =   3  'Circle
      Top             =   2520
      Width           =   495
   End
   Begin VB.Shape shpSumBit 
      FillStyle       =   0  'Solid
      Height          =   495
      Index           =   1
      Left            =   4200
      Shape           =   3  'Circle
      Top             =   2520
      Width           =   495
   End
   Begin VB.Shape shpSumBit 
      FillStyle       =   0  'Solid
      Height          =   495
      Index           =   0
      Left            =   4800
      Shape           =   3  'Circle
      Top             =   2520
      Width           =   495
   End
   Begin VB.Image ImgByteTwoOn 
      Height          =   795
      Index           =   7
      Left            =   720
      Picture         =   "frmBinAdder.frx":0000
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image ImgByteTwoOn 
      Height          =   795
      Index           =   6
      Left            =   1320
      Picture         =   "frmBinAdder.frx":0CAE
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image ImgByteTwoOn 
      Height          =   795
      Index           =   5
      Left            =   1920
      Picture         =   "frmBinAdder.frx":195C
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image ImgByteTwoOn 
      Height          =   795
      Index           =   4
      Left            =   2520
      Picture         =   "frmBinAdder.frx":260A
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image ImgByteTwoOn 
      Height          =   795
      Index           =   3
      Left            =   3120
      Picture         =   "frmBinAdder.frx":32B8
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image ImgByteTwoOn 
      Height          =   795
      Index           =   2
      Left            =   3720
      Picture         =   "frmBinAdder.frx":3F66
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image ImgByteTwoOn 
      Height          =   795
      Index           =   1
      Left            =   4320
      Picture         =   "frmBinAdder.frx":4C14
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image imgByteTwoOff 
      Height          =   795
      Index           =   7
      Left            =   720
      Picture         =   "frmBinAdder.frx":58C2
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image imgByteTwoOff 
      Height          =   795
      Index           =   6
      Left            =   1320
      Picture         =   "frmBinAdder.frx":6570
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image imgByteTwoOff 
      Height          =   795
      Index           =   5
      Left            =   1920
      Picture         =   "frmBinAdder.frx":721E
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image imgByteTwoOff 
      Height          =   795
      Index           =   4
      Left            =   2520
      Picture         =   "frmBinAdder.frx":7ECC
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image imgByteTwoOff 
      Height          =   795
      Index           =   3
      Left            =   3120
      Picture         =   "frmBinAdder.frx":8B7A
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image imgByteTwoOff 
      Height          =   795
      Index           =   2
      Left            =   3720
      Picture         =   "frmBinAdder.frx":9828
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image imgByteTwoOff 
      Height          =   795
      Index           =   1
      Left            =   4320
      Picture         =   "frmBinAdder.frx":A4D6
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image imgByteOneOn 
      Height          =   795
      Index           =   7
      Left            =   720
      Picture         =   "frmBinAdder.frx":B184
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOn 
      Height          =   795
      Index           =   6
      Left            =   1320
      Picture         =   "frmBinAdder.frx":BE32
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOn 
      Height          =   795
      Index           =   5
      Left            =   1920
      Picture         =   "frmBinAdder.frx":CAE0
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOn 
      Height          =   795
      Index           =   4
      Left            =   2520
      Picture         =   "frmBinAdder.frx":D78E
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOn 
      Height          =   795
      Index           =   3
      Left            =   3120
      Picture         =   "frmBinAdder.frx":E43C
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOn 
      Height          =   795
      Index           =   2
      Left            =   3720
      Picture         =   "frmBinAdder.frx":F0EA
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOn 
      Height          =   795
      Index           =   1
      Left            =   4320
      Picture         =   "frmBinAdder.frx":FD98
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOff 
      Height          =   795
      Index           =   7
      Left            =   720
      Picture         =   "frmBinAdder.frx":10A46
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOff 
      Height          =   795
      Index           =   6
      Left            =   1320
      Picture         =   "frmBinAdder.frx":116F4
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOff 
      Height          =   795
      Index           =   5
      Left            =   1920
      Picture         =   "frmBinAdder.frx":123A2
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOff 
      Height          =   795
      Index           =   4
      Left            =   2520
      Picture         =   "frmBinAdder.frx":13050
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOff 
      Height          =   795
      Index           =   3
      Left            =   3120
      Picture         =   "frmBinAdder.frx":13CFE
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOff 
      Height          =   795
      Index           =   2
      Left            =   3720
      Picture         =   "frmBinAdder.frx":149AC
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOff 
      Height          =   795
      Index           =   1
      Left            =   4320
      Picture         =   "frmBinAdder.frx":1565A
      Top             =   120
      Width           =   300
   End
   Begin VB.Line Line3 
      BorderWidth     =   3
      X1              =   360
      X2              =   360
      Y1              =   1920
      Y2              =   1440
   End
   Begin VB.Line Line2 
      BorderWidth     =   3
      X1              =   120
      X2              =   600
      Y1              =   1680
      Y2              =   1680
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   0
      X2              =   5520
      Y1              =   2160
      Y2              =   2160
   End
   Begin VB.Image imgByteOneOn 
      Height          =   795
      Index           =   0
      Left            =   4920
      Picture         =   "frmBinAdder.frx":16308
      Top             =   120
      Width           =   300
   End
   Begin VB.Image imgByteOneOff 
      Height          =   795
      Index           =   0
      Left            =   4920
      Picture         =   "frmBinAdder.frx":16FB6
      Top             =   120
      Width           =   300
   End
   Begin VB.Image ImgByteTwoOn 
      Height          =   795
      Index           =   0
      Left            =   4920
      Picture         =   "frmBinAdder.frx":17C64
      Top             =   1200
      Width           =   300
   End
   Begin VB.Image imgByteTwoOff 
      Height          =   795
      Index           =   0
      Left            =   4920
      Picture         =   "frmBinAdder.frx":18912
      Top             =   1200
      Width           =   300
   End
   Begin VB.Menu mntMenu 
      Caption         =   "Menu"
      Begin VB.Menu mnuReset 
         Caption         =   "&Reset Bits"
      End
      Begin VB.Menu mnuNumSum 
         Caption         =   "&Numeric Sum"
      End
      Begin VB.Menu mnuHelp 
         Caption         =   "&Help"
      End
      Begin VB.Menu sep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
End
Attribute VB_Name = "frmBinAdder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Base 0
Dim intByteOneStat(7) As Integer
Dim intByteTwoStat(7) As Integer
Dim intPSum As Integer

Private Sub Form_Load()
  Dim i As Integer
  
  For i = 0 To 7 Step 1
    intByteOneStat(i) = 0
    intByteTwoStat(i) = 0
    imgByteOneOff(i).Visible = True
    imgByteOneOn(i).Visible = False
    imgByteTwoOff(i).Visible = True
    ImgByteTwoOn(i).Visible = False
    shpSumBit(i).FillColor = vbBlack
  Next i
  shpSumBit(8).FillColor = vbBlack
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  MsgBox "Thanx for using my Binary Adder", vbOKOnly + vbInformation, "Bye, Bye"
End Sub

Private Sub imgByteOneOff_Click(Index As Integer)
  imgByteOneOff(Index).Visible = False
  imgByteOneOn(Index).Visible = True
  intByteOneStat(Index) = 1
  ChangeOut
End Sub

Private Sub imgByteOneOn_Click(Index As Integer)
  imgByteOneOn(Index).Visible = False
  imgByteOneOff(Index).Visible = True
  intByteOneStat(Index) = 0
  ChangeOut
End Sub

Private Sub imgByteTwoOff_Click(Index As Integer)
  imgByteTwoOff(Index).Visible = False
  ImgByteTwoOn(Index).Visible = True
  intByteTwoStat(Index) = 1
  ChangeOut
End Sub

Private Sub ImgByteTwoOn_Click(Index As Integer)
  ImgByteTwoOn(Index).Visible = False
  imgByteTwoOff(Index).Visible = True
  intByteTwoStat(Index) = 0
  ChangeOut
End Sub

Private Sub ChangeOut()
  Dim intDecTmpB1 As Integer
  Dim intDecTmpB2 As Integer
  Dim intSum As Integer
  
  intDecTmpB1 = DecodeBin(intByteOneStat)
  intDecTmpB2 = DecodeBin(intByteTwoStat)
  
  intSum = intDecTmpB1 + intDecTmpB2
  
  intPSum = intSum
  
  If intSum >= 256 Then
    shpSumBit(8).FillColor = vbRed
    intSum = intSum Mod 256
  Else
    shpSumBit(8).FillColor = vbBlack
  End If
  If intSum >= 128 Then
    shpSumBit(7).FillColor = vbRed
    intSum = intSum Mod 128
  Else
    shpSumBit(7).FillColor = vbBlack
  End If
  If intSum >= 64 Then
    shpSumBit(6).FillColor = vbRed
    intSum = intSum Mod 64
  Else
    shpSumBit(6).FillColor = vbBlack
  End If
  If intSum >= 32 Then
    shpSumBit(5).FillColor = vbRed
    intSum = intSum Mod 32
  Else
    shpSumBit(5).FillColor = vbBlack
  End If
  If intSum >= 16 Then
    shpSumBit(4).FillColor = vbRed
    intSum = intSum Mod 16
  Else
    shpSumBit(4).FillColor = vbBlack
  End If
  If intSum >= 8 Then
    shpSumBit(3).FillColor = vbRed
    intSum = intSum Mod 8
  Else
    shpSumBit(3).FillColor = vbBlack
  End If
  If intSum >= 4 Then
    shpSumBit(2).FillColor = vbRed
    intSum = intSum Mod 4
  Else
    shpSumBit(2).FillColor = vbBlack
  End If
  If intSum >= 2 Then
    shpSumBit(1).FillColor = vbRed
    intSum = intSum Mod 2
  Else
    shpSumBit(1).FillColor = vbBlack
  End If
  If intSum = 1 Then
    shpSumBit(0).FillColor = vbRed
  Else
    shpSumBit(0).FillColor = vbBlack
  End If
End Sub

Private Sub mnuExit_Click()
  Unload Me
End Sub

Private Sub mnuHelp_Click()
  Dim strHelp As String
  
  strHelp = "** Binary Adder Help **" & vbCrLf & vbCrLf
  strHelp = strHelp & "Simply click on switches to" & vbCrLf
  strHelp = strHelp & "toggle bit.  When the black is" & vbCrLf
  strHelp = strHelp & "on the top, the bit is on." & vbCrLf
  strHelp = strHelp & "When red is on the top, the" & vbCrLf
  strHelp = strHelp & "bit is off.  Good Luck Adding!" & vbCrLf & vbCrLf
  strHelp = strHelp & "Ace E. Rawker  :)"
  
  MsgBox strHelp, vbOKOnly + vbInformation, "Help"
End Sub

Private Sub mnuNumSum_Click()
  Dim strSum As String
  
  strSum = "Decimal: " & Str(intPSum) & vbCrLf
  strSum = strSum & "Hex: " & Hex$(intPSum)
  
  MsgBox strSum, vbOKOnly + vbInformation, "Sum"
End Sub

Private Sub mnuReset_Click()
  Dim i As Integer
  
  For i = 0 To 7 Step 1
    intByteOneStat(i) = 0
    intByteTwoStat(i) = 0
    imgByteOneOff(i).Visible = True
    imgByteOneOn(i).Visible = False
    imgByteTwoOff(i).Visible = True
    ImgByteTwoOn(i).Visible = False
    shpSumBit(i).FillColor = vbBlack
  Next i
  shpSumBit(8).FillColor = vbBlack
End Sub
