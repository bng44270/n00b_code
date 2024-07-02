VERSION 5.00
Begin VB.Form frmTTI 
   Caption         =   "TeleType Key Codes"
   ClientHeight    =   5430
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6360
   LinkTopic       =   "Form1"
   ScaleHeight     =   5430
   ScaleWidth      =   6360
   StartUpPosition =   3  'Windows Default
   Begin VB.Image Image1 
      Height          =   5085
      Left            =   120
      Picture         =   "frmTTI.frx":0000
      Top             =   120
      Width           =   6030
   End
End
Attribute VB_Name = "frmTTI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_click()
  Dim myString As String
  myString = "I found this picture on a webpage.  It is" & vbCrLf
  myString = myString & "useful if you enjoy cryptic things.   I" & vbCrLf
  myString = myString & "am just making it a little easier to view." & vbCrLf & vbCrLf
  myString = myString & "Here you go!!!"
  MsgBox myString, vbOKOnly + vbInformation, "Help"
End Sub

Private Sub Image1_Click()
  Dim myString As String
  myString = "I found this picture on a webpage.  It is" & vbCrLf
  myString = myString & "useful if you enjoy cryptic things.   I" & vbCrLf
  myString = myString & "am just making it a little easier to view." & vbCrLf & vbCrLf
  myString = myString & "Here you go!!!"
  MsgBox myString, vbOKOnly + vbInformation, "Help"
End Sub
