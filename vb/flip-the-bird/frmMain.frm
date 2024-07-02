VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Ace E.'s Stress Relief Kit"
   ClientHeight    =   5430
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2850
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5430
   ScaleWidth      =   2850
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdFlip 
      Caption         =   "Flip The Bird"
      Height          =   735
      Left            =   600
      TabIndex        =   0
      Top             =   4320
      Width           =   1695
   End
   Begin VB.Image imgBDown 
      Height          =   4050
      Left            =   480
      Picture         =   "frmMain.frx":0000
      Top             =   120
      Width           =   1950
   End
   Begin VB.Image imgBUp 
      Height          =   4050
      Left            =   600
      Picture         =   "frmMain.frx":19DB2
      Top             =   120
      Width           =   1950
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdFlip_Click()
  If cmdFlip.Tag = 1 Then
    imgBUp.Visible = False
    imgBDown.Visible = True
    cmdFlip.Tag = 0
  Else
    imgBUp.Visible = True
    imgBDown.Visible = False
    cmdFlip.Tag = 1
  End If
End Sub

Private Sub Form_Load()
  imgBUp.Visible = True
  imgBDown.Visible = False
  cmdFlip.Tag = 1
End Sub
