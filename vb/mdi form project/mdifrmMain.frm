VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.MDIForm mdifrmMain 
   BackColor       =   &H8000000C&
   Caption         =   "Ace E's Text Editor"
   ClientHeight    =   4455
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   6240
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog cdDialogBox 
      Left            =   2280
      Top             =   2280
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileNew 
         Caption         =   "&New"
      End
      Begin VB.Menu mnuFileOpen 
         Caption         =   "&Open"
      End
      Begin VB.Menu mnuSeperator 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
   End
End
Attribute VB_Name = "mdifrmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Type tDocType
  Active As Boolean
  frmCurrent As frmData
End Type
Private Files() As tDocType
Public intDocCount As Integer

Function GetFormIndex(strCaption As String, booNew As Boolean, strFileName As String)
  Dim intCurrentDoc As Integer
  Dim blnFound As Boolean
  
  If booNew = True Then
    intDocCount = UBound(Files)
    For intCurrentDoc = 1 To intDocCount
      If Files(intCurrentDoc).Active = False Then
        blnFound = True
        Exit For
      End If
    Next intCurrentDoc
    If Not blnFound Then
      intCurrentDoc = intDocCount + 1
      ReDim Preserve Files(intCurrentDoc)
    End If
    With Files(intCurrentDoc)
      Set .frmCurrent = New frmData
      .frmCurrent.Tag = intCurrentDoc
      .frmCurrent.Caption = strCaption
      .frmCurrent.booNewFile = True
      .frmCurrent.Show
      .Active = True
    End With
    GetFormIndex = intCurrentDoc
  Else
    intDocCount = UBound(Files)
    For intCurrentDoc = 1 To intDocCount
      If Files(intCurrentDoc).Active = False Then
        blnFound = True
        Exit For
      End If
    Next intCurrentDoc
    If Not blnFound Then
      intCurrentDoc = intDocCount + 1
      ReDim Preserve Files(intCurrentDoc)
    End If
    With Files(intCurrentDoc)
      Set .frmCurrent = New frmData
      .frmCurrent.Tag = intCurrentDoc
      .frmCurrent.Caption = strCaption
      .frmCurrent.rtbDataArea.FileName = strFileName
      .frmCurrent.Show
      .frmCurrent.booNewFile = False
      .Active = True
    End With
  End If
End Function

Public Sub NewFile()
  Dim intCurrentDoc As Integer
  
  intCurrentDoc = GetFormIndex("New File", True, "")
End Sub

Private Sub MDIForm_Load()
  frmData.Hide
  intDocCount = 0
  ReDim Files(0)
  
End Sub

Private Sub MDIForm_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  Dim intExit As Integer
  
  intExit = MsgBox("Are you sure you want to exit?", vbQuestion + vbYesNo, "WAIT!!!")
  If intExit = vbNo Then
    Cancel = True
  End If
End Sub

Private Sub mnuExit_Click()
  Unload Me
End Sub

Private Sub mnuFileNew_Click()
  Call NewFile
End Sub

Private Sub mnuFileOpen_Click()
  Dim strFileName As String
  Dim intCurrentDoc As Integer
  
  With cdDialogBox
    .Filter = "Text File (*.txt)|*.txt|Rich Text Format (*.rtf)|*.rtf"
    .DialogTitle = "Open File"
    .ShowOpen
  End With
  
  intCurrentDoc = GetFormIndex(cdDialogBox.FileName, False, cdDialogBox.FileName)
  cdDialogBox.FileName = ""
End Sub

Private Sub mnuHelp_Click()
  Dim strHelp As String
  
  strHelp = "  This program is really primative.  To use the text" & vbCrLf
  strHelp = strHelp & "modification actions, first you must select the text to" & vbCrLf
  strHelp = strHelp & "modify.  Good Luck!"
  
  MsgBox strHelp, vbInformation + vbOKOnly, "Info"
End Sub
