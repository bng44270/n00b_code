VERSION 5.00
Object = "{37F26DE0-BB2F-11D6-B4F7-00C04F358390}#1.0#0"; "DIGICHAR.OCX"
Begin VB.Form frmConversion 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "All This Nerd in One Program"
   ClientHeight    =   4950
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5070
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4950
   ScaleWidth      =   5070
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExit 
      Caption         =   "&Exit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   3600
      TabIndex        =   2
      Top             =   3120
      Width           =   1215
   End
   Begin VB.CommandButton cmdAbout 
      Caption         =   "&About"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   3600
      TabIndex        =   1
      Top             =   2160
      Width           =   1215
   End
   Begin DigiChar.DigiCharCtl HexDigit 
      Height          =   1935
      Left            =   1320
      TabIndex        =   3
      Top             =   120
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   3413
   End
   Begin VB.Label Label4 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2640
      TabIndex        =   11
      Top             =   2520
      Width           =   255
   End
   Begin VB.Label Label3 
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2040
      TabIndex        =   10
      Top             =   2520
      Width           =   255
   End
   Begin VB.Label Label2 
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1440
      TabIndex        =   9
      Top             =   2520
      Width           =   255
   End
   Begin VB.Label Label1 
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   840
      TabIndex        =   8
      Top             =   2520
      Width           =   255
   End
   Begin VB.Image imgBitOff 
      Height          =   795
      Index           =   3
      Left            =   840
      Picture         =   "frmConversion.frx":0000
      Top             =   3000
      Width           =   300
   End
   Begin VB.Image imgBitOff 
      Height          =   795
      Index           =   2
      Left            =   1440
      Picture         =   "frmConversion.frx":0CAE
      Top             =   3000
      Width           =   300
   End
   Begin VB.Image imgBitOff 
      Height          =   795
      Index           =   1
      Left            =   2040
      Picture         =   "frmConversion.frx":195C
      Top             =   3000
      Width           =   300
   End
   Begin VB.Label lblBitVal 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   840
      TabIndex        =   7
      Top             =   3960
      Width           =   375
   End
   Begin VB.Label lblBitVal 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   1440
      TabIndex        =   6
      Top             =   3960
      Width           =   375
   End
   Begin VB.Label lblBitVal 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   2040
      TabIndex        =   5
      Top             =   3960
      Width           =   375
   End
   Begin VB.Label lblBitVal 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   2640
      TabIndex        =   4
      Top             =   3960
      Width           =   375
   End
   Begin VB.Image imgBitOn 
      Height          =   795
      Index           =   3
      Left            =   840
      Picture         =   "frmConversion.frx":260A
      Top             =   3000
      Width           =   300
   End
   Begin VB.Image imgBitOn 
      Height          =   795
      Index           =   2
      Left            =   1440
      Picture         =   "frmConversion.frx":32B8
      Top             =   3000
      Width           =   300
   End
   Begin VB.Image imgBitOn 
      Height          =   795
      Index           =   1
      Left            =   2040
      Picture         =   "frmConversion.frx":3F66
      Top             =   3000
      Width           =   300
   End
   Begin VB.Image imgBitOn 
      Height          =   795
      Index           =   0
      Left            =   2640
      Picture         =   "frmConversion.frx":4C14
      Top             =   3000
      Width           =   300
   End
   Begin VB.Label lblHex 
      Caption         =   "H"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   48
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   3120
      TabIndex        =   0
      Top             =   480
      Width           =   735
   End
   Begin VB.Image imgBitOff 
      Height          =   795
      Index           =   0
      Left            =   2640
      Picture         =   "frmConversion.frx":58C2
      Top             =   3000
      Width           =   300
   End
End
Attribute VB_Name = "frmConversion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim BitState(4) As New BitStatus
Dim CurrentBit As Integer
Dim CurrentBitValue As Integer

Private Sub DisplayHex()
  Dim DecTmp As Integer
      
  'Initialize DecTmp1
  DecTmp = 0
  
  'Get Decimal Equ.
  If BitState(0).State = 1 Then
    DecTmp = DecTmp + 1
  End If
  If BitState(1).State = 1 Then
    DecTmp = DecTmp + 2
  End If
  If BitState(2).State = 1 Then
    DecTmp = DecTmp + 4
  End If
  If BitState(3).State = 1 Then
    DecTmp = DecTmp + 8
  End If
  
   
  'Display Hex Data
  Select Case DecTmp
    Case 0
      HexDigit.SetValue ("0")
    Case 1
      HexDigit.SetValue ("1")
    Case 2
      HexDigit.SetValue ("2")
    Case 3
      HexDigit.SetValue ("3")
    Case 4
      HexDigit.SetValue ("4")
    Case 5
      HexDigit.SetValue ("5")
    Case 6
      HexDigit.SetValue ("6")
    Case 7
      HexDigit.SetValue ("7")
    Case 8
      HexDigit.SetValue ("8")
    Case 9
      HexDigit.SetValue ("9")
    Case 10
      HexDigit.SetValue ("a")
    Case 11
      HexDigit.SetValue ("b")
    Case 12
      HexDigit.SetValue ("c")
    Case 13
      HexDigit.SetValue ("d")
    Case 14
      HexDigit.SetValue ("e")
    Case 15
      HexDigit.SetValue ("f")
  End Select
  
End Sub

Private Sub cmdAbout_Click()
  Dim strInfo As String
  strInfo = "This program is designed to provide" & vbCrLf
  strInfo = strInfo + "the user who may be an assembly" & vbCrLf
  strInfo = strInfo + "language programmer or who might be studying" & vbCrLf
  strInfo = strInfo + "number systems the luxury of converting from" & vbCrLf
  strInfo = strInfo + "binary to hexidecimal with this straight forward" & vbCrLf
  strInfo = strInfo + "and easy to use converter.  It displays values in" & vbCrLf
  strInfo = strInfo + "4-bit format, but all binary and hex values are" & vbCrLf
  strInfo = strInfo + "made up of many 4-bit value that represent values" & vbCrLf
  strInfo = strInfo + "in the same way.  So, without further introduction," & vbCrLf
  strInfo = strInfo + "start converting and feel free to distribute this" & vbCrLf
  strInfo = strInfo + "program as much as you want." & vbCrLf & vbCrLf
  strInfo = strInfo + "PEACE :)  Ace E. Rawker" & vbCrLf & vbCrLf
  strInfo = strInfo + "(P) 2002"
  
  MsgBox strInfo, vbOKOnly + vbInformation, "About"
End Sub

Private Sub cmdExit_Click()
  End
End Sub

Private Sub Form_Load()
  Dim i As Integer 'for for loop
  
  'Reset States
  For i = 0 To 3 Step 1
    BitState(i).State = 0
    lblBitVal(i).Caption = "0"
    imgBitOn(i).Visible = False
    imgBitOff(i).Visible = True
  Next i
  'Initialize LED's
  HexDigit.SetValue ("0")
End Sub

Private Sub imgBitOff_Click(Index As Integer)
  imgBitOff(Index).Visible = False
  imgBitOn(Index).Visible = True
  lblBitVal(Index).Caption = "1"
  BitState(Index).State = 1
  DisplayHex
End Sub

Private Sub imgBitOn_Click(Index As Integer)
  imgBitOff(Index).Visible = True
  imgBitOn(Index).Visible = False
  lblBitVal(Index).Caption = "0"
  BitState(Index).State = 0
  DisplayHex
End Sub
