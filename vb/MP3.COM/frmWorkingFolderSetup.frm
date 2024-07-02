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
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   240
      TabIndex        =   3
      Top             =   240
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Exit"
      Height          =   375
      Left            =   1200
      TabIndex        =   2
      Top             =   3360
      Width           =   855
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "Save"
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   3360
      Width           =   855
   End
   Begin VB.DirListBox dirFolderList 
      Height          =   2565
      Left            =   240
      TabIndex        =   0
      Top             =   720
      Width           =   1815
   End
End
Attribute VB_Name = "frmWorkingFolder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdOK_Click()
  Open ".\mp3crk.ini" For Output As #1
    Print #1, dirFolderList.Path
    Print #1, 0
  Close #1
End Sub

Private Sub Command1_Click()
  End
End Sub
