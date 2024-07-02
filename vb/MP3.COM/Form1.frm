VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "SHDOCVW.DLL"
Begin VB.Form frmMainWindow 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "MP3.com Streaming Audio Crack"
   ClientHeight    =   1005
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   4020
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1005
   ScaleWidth      =   4020
   StartUpPosition =   3  'Windows Default
   Begin SHDocVwCtl.WebBrowser wbMP3Page 
      Height          =   615
      Left            =   1080
      TabIndex        =   0
      Top             =   120
      Width           =   1695
      ExtentX         =   2990
      ExtentY         =   1085
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
   Begin MSComDlg.CommonDialog cdFileOpen 
      Left            =   120
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuOpenFile 
         Caption         =   "&Open"
      End
      Begin VB.Menu mnuWorkingFolder 
         Caption         =   "&Working Folder"
      End
      Begin VB.Menu mnuAbout 
         Caption         =   "&About"
      End
      Begin VB.Menu sep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
End
Attribute VB_Name = "frmMainWindow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public strWorkingFolder As String
Public intMP3Count As Integer
Dim strM3UFileName As String
Dim strMP3URLName As String

Private Sub Form_Load()
  Open ".\mp3crk.ini" For Input As #1
    Input #1, strWorkingFolder
  Close #1
  frmWorkingFolder.Hide
  cdFileOpen.Filter = "MP3.com Streaming Audio File/MP3 Playlist | *.m3u"
End Sub

Private Sub Form_Unload(Cancel As Integer)
  End
End Sub

Private Sub mnuAbout_Click()
  Dim strMsgTmp As String
  strMsgTmp = "To use this program, all you" & vbCrLf
  strMsgTmp = strMsgTmp & "have to do is go to MP3.com, " & vbCrLf
  strMsgTmp = strMsgTmp & "right click on the broadband stream," & vbCrLf
  strMsgTmp = strMsgTmp & "and click save target as (you might" & vbCrLf
  strMsgTmp = strMsgTmp & "need MP3.com authentication, but it's" & vbCrLf
  strMsgTmp = strMsgTmp & "free).  This open the M3U file you" & vbCrLf
  strMsgTmp = strMsgTmp & "downloaded.  Then you can simply right" & vbCrLf
  strMsgTmp = strMsgTmp & "click on the Your MP3 link and click" & vbCrLf
  strMsgTmp = strMsgTmp & "save target as.  Wala, you have MP3." & vbCrLf & vbCrLf
  strMsgTmp = strMsgTmp & " (P) 2002 Ace E. Rawker"
  
  MsgBox strMsgTmp, vbOKOnly + vbInformation, "About"
End Sub

Private Sub mnuExit_Click()
  End
End Sub

Private Sub mnuOpenFile_Click()
  Dim strHTMLSrc As String
  cdFileOpen.ShowOpen
  strM3UFileName = cdFileOpen.FileName
  Open strM3UFileName For Input As #1
    Input #1, strMP3URLName
  Close #1
  strHTMLSrc = strWorkingFolder & "mp3crk" & intMP3Count & ".html"
  Open strHTMLSrc For Output As #1
    Print #1, "<a href=" + strMP3URLName + ">Your MP3</a>"
  Close #1
  wbMP3Page.Navigate strHTMLSrc
End Sub

Private Sub mnuWorkingFolder_Click()
  frmMainWindow.Enabled = False
  frmWorkingFolder.Show
End Sub
