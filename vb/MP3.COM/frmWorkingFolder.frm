VERSION 5.00
Begin VB.Form frmWorkingFolder 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Working Folder"
   ClientHeight    =   3795
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2370
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3795
   ScaleWidth      =   2370
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   720
      TabIndex        =   1
      Top             =   3240
      Width           =   855
   End
   Begin VB.DirListBox dirFolderList 
      Height          =   2565
      Left            =   240
      TabIndex        =   0
      Top             =   480
      Width           =   1815
   End
End
Attribute VB_Name = "frmWorkingFolder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdOK_Click()
  Dim strPathTmp As String
  dirFolderList.Path = frmMainWindow.strWorkingFolder
  frmWorkingFolder.Hide
  frmMainWindow.Enabled = True
  strPathTmp = dirFolderList.Path + "\mp3crk.ini"
  Open strPathTmp For Output As #1
    Print #1, dirFolderList.Path
    Print #1, frmMainWindow.intMP3Count
  Close #1
End Sub

Private Sub Command1_Click()
  End
End Sub
