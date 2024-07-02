VERSION 5.00
Begin VB.Form frmColorChooser 
   BackColor       =   &H8000000A&
   Caption         =   "Color Chooser"
   ClientHeight    =   2715
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   6150
   LinkTopic       =   "Form1"
   ScaleHeight     =   2715
   ScaleWidth      =   6150
   StartUpPosition =   3  'Windows Default
   Begin VB.HScrollBar hsbBlue 
      Height          =   375
      Left            =   720
      TabIndex        =   2
      Top             =   1800
      Width           =   3615
   End
   Begin VB.HScrollBar hsbRed 
      Height          =   375
      Left            =   720
      TabIndex        =   1
      Top             =   600
      Width           =   3615
   End
   Begin VB.HScrollBar hsbGreen 
      Height          =   375
      Left            =   720
      TabIndex        =   0
      Top             =   1200
      Width           =   3615
   End
   Begin VB.Label Label3 
      Caption         =   "B"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   360
      TabIndex        =   5
      Top             =   1680
      Width           =   495
   End
   Begin VB.Label Label2 
      Caption         =   "G"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   360
      TabIndex        =   4
      Top             =   1080
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "R"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   360
      TabIndex        =   3
      Top             =   480
      Width           =   495
   End
   Begin VB.Shape shpColorSource 
      BackStyle       =   1  'Opaque
      BorderColor     =   &H80000007&
      BorderStyle     =   0  'Transparent
      FillStyle       =   0  'Solid
      Height          =   1695
      Left            =   4680
      Shape           =   3  'Circle
      Top             =   600
      Width           =   1455
   End
   Begin VB.Menu mnuExit 
      Caption         =   "E&xit"
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
   End
End
Attribute VB_Name = "frmColorChooser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
  hsbRed.Max = 255
  hsbRed.Min = 0
  hsbRed.Value = 0
  hsbGreen.Max = 255
  hsbGreen.Min = 0
  hsbGreen.Value = 0
  hsbBlue.Max = 255
  hsbBlue.Min = 0
  hsbBlue.Value = 0
End Sub

Private Sub hsbBlue_Change()
  shpColorSource.FillColor = RGB(hsbRed.Value, hsbGreen.Value, hsbBlue.Value)
End Sub

Private Sub hsbGreen_Change()
  shpColorSource.FillColor = RGB(hsbRed.Value, hsbGreen.Value, hsbBlue.Value)
End Sub

Private Sub hsbRed_Change()
  shpColorSource.FillColor = RGB(hsbRed.Value, hsbGreen.Value, hsbBlue.Value)
End Sub

Private Sub mnuExit_Click()
  End
End Sub

Private Sub mnuHelp_Click()
  Dim strHelp As String
  
  strHelp = "This is a color selection program." & vbCrLf
  strHelp = strHelp & "The idea behind this program is" & vbCrLf
  strHelp = strHelp & "that if you use it enough, you'll" & vbCrLf
  strHelp = strHelp & "figure out your favorite color!!!"
  MsgBox strHelp, vbInformation, "About"
End Sub
