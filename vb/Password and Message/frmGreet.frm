VERSION 5.00
Begin VB.Form frmGreet 
   Caption         =   "Welcome"
   ClientHeight    =   960
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   2340
   LinkTopic       =   "Form1"
   ScaleHeight     =   960
   ScaleWidth      =   2340
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuMessage 
         Caption         =   "&Message"
         Shortcut        =   {F2}
      End
      Begin VB.Menu mnuExit 
         Caption         =   "&Exit"
         Shortcut        =   {F3}
      End
   End
End
Attribute VB_Name = "frmGreet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'frmGreet
Private Sub mnuExit_Click()
  End
End Sub

Private Sub mnuMessage_Click()
  Dim strName As String
  strName = InputBox("Enter Your Name", "Name")
  MsgBox "Hello, " & strName, vbInformation, "Hi!"
End Sub
