VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMainWindow 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "M3U to HTML Converter"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdRemoveFile 
      Caption         =   "&Remove File"
      Height          =   495
      Left            =   2160
      TabIndex        =   4
      Top             =   960
      Width           =   1575
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   495
      Left            =   2160
      TabIndex        =   3
      Top             =   2400
      Width           =   1575
   End
   Begin VB.CommandButton cmdConvertFiles 
      Caption         =   "&Convert Files"
      Height          =   495
      Left            =   2160
      TabIndex        =   2
      Top             =   1680
      Width           =   1575
   End
   Begin VB.CommandButton cmdAddFile 
      Caption         =   "&Add File"
      Height          =   495
      Left            =   2160
      TabIndex        =   1
      Top             =   240
      Width           =   1575
   End
   Begin MSComDlg.CommonDialog cdDialog 
      Left            =   1440
      Top             =   960
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.ListBox lstFileList 
      Height          =   2205
      ItemData        =   "frmMainWindow.frx":0000
      Left            =   240
      List            =   "frmMainWindow.frx":0002
      MultiSelect     =   2  'Extended
      TabIndex        =   0
      Top             =   360
      Width           =   1455
   End
   Begin VB.Label lblHelp 
      Caption         =   "?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4080
      TabIndex        =   5
      Top             =   1320
      Width           =   255
   End
End
Attribute VB_Name = "frmMainWindow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Base 1
Dim M3UFileArray(50) As String
Dim HTMLfilearray(50) As String
Dim FileCount As Integer

Private Sub cmdAddFile_Click()
  If FileCount = 51 Then
    MsgBox "Maximum of 50 File to convert", vbOKOnly + vbInformation, "Sorry"
  Else
    cdDialog.Filter = "MP3 Playlist Files |*.m3u"
    cdDialog.ShowOpen
    M3UFileArray(FileCount) = cdDialog.FileName
    lstFileList.AddItem cdDialog.FileName
    FileCount = FileCount + 1
  End If
End Sub

Private Sub cmdConvertFiles_Click()
  Dim i As Integer
  Dim strMP3File As String
  
  For i = 1 To FileCount - 1 Step 1
    Open M3UFileArray(i) For Input As #1
      Input #1, strMP3File
    Close #1
    HTMLfilearray(i) = M3UFileArray(i) & ".html"
    Open HTMLfilearray(i) For Output As #1
      Print #1, "<a href=" & strMP3File & ">Your MP3 File</a><br><br><br><i>Provided by M3UtoHTML</i>"
    Close #1
  Next i
  MsgBox "Files Successfully Converted", vbOKOnly + vbInformation, "Done"
End Sub

Private Sub cmdExit_Click()
  End
End Sub

Private Sub cmdRemoveFile_Click()
  Dim i As Integer
  
  lstFileList.Clear
  For i = 1 To FileCount - 1 Step 1
    M3UFileArray(i) = ""
  Next i
  FileCount = 1
End Sub

Private Sub Form_Load()
  FileCount = 1
End Sub

Private Sub lblHelp_Click()
  Dim strhelp As String
  
  strhelp = "This file is used to extract the name" & vbCrLf
  strhelp = strhelp & "of the first MP3 file reference at" & vbCrLf
  strhelp = strhelp & "beginning of a M3U playlist file and" & vbCrLf
  strhelp = strhelp & "write it into an HTML file with the same" & vbCrLf
  strhelp = strhelp & "name.  Enjoy!!"
  MsgBox strhelp, vbOKOnly + vbInformation, "Help"
End Sub
