VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmData 
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   480
      Top             =   1320
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   8
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmData.frx":0000
            Key             =   "New"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmData.frx":0BF4
            Key             =   "Open"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmData.frx":17E8
            Key             =   "Bold"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmData.frx":23DC
            Key             =   "Italic"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmData.frx":2FD0
            Key             =   "Underline"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmData.frx":37E4
            Key             =   "Left"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmData.frx":43D8
            Key             =   "Right"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmData.frx":4FCC
            Key             =   "Center"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar tbChildBar 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   4680
      _ExtentX        =   8255
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   8
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "New"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Open"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Bold"
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Italic"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Underline"
            ImageIndex      =   5
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Left"
            ImageIndex      =   6
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Right"
            ImageIndex      =   7
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Center"
            ImageIndex      =   8
         EndProperty
      EndProperty
   End
   Begin RichTextLib.RichTextBox rtbDataArea 
      Height          =   2295
      Left            =   120
      TabIndex        =   0
      Top             =   720
      Width           =   4455
      _ExtentX        =   7858
      _ExtentY        =   4048
      _Version        =   393217
      ScrollBars      =   3
      TextRTF         =   $"frmData.frx":5BC0
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileNew 
         Caption         =   "&New"
      End
      Begin VB.Menu mnuFileOpen 
         Caption         =   "&Open"
      End
      Begin VB.Menu mnuFileSave 
         Caption         =   "&Save"
      End
      Begin VB.Menu mnuFileSaveAs 
         Caption         =   "Save &As"
      End
      Begin VB.Menu mnuSeperator 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "&Options"
      Begin VB.Menu mnuOptionsFont 
         Caption         =   "&Font"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
   End
End
Attribute VB_Name = "frmData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public booNewFile As Boolean
Public booSoiled As Boolean



Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  Dim intAnswer As Integer
  If booSoiled Then
    intAnswer = MsgBox("Lose Changes to " & Me.Caption, vbYesNo + vbQuestion, "Wait!!!")
    If intAnswer = vbNo Then
      Cancel = True
    End If
  End If
End Sub

Private Sub Form_Resize()
  On Error Resume Next
    rtbDataArea.Width = Me.ScaleWidth
    rtbDataArea.Height = Me.ScaleHeight
    rtbDataArea.RightMargin = Me.Width
End Sub

Private Sub mnuExit_Click()
  Unload frmData
End Sub

Private Sub mnuFileNew_Click()
  mdifrmMain.NewFile
End Sub

Private Sub mnuFileOpen_Click()
  Dim strFileName As String
  Dim intCurrentDoc As Integer
  On Error GoTo Bottom
  With mdifrmMain.cdDialogBox
    .Filter = "Text File (*.txt)|*.txt|Rich Text Format (*.rtf)|*.rtf"
    .DialogTitle = "Open File"
    .ShowOpen
    intCurrentDoc = mdifrmMain.GetFormIndex(.cdDialogBox.FileName, False, .cdDialogBox.FileName)
    .FileName = ""
  End With
Bottom:
End Sub
Private Sub SaveFile(frmTmp As frmData, strCap As String)
  On Error GoTo Bottom
  
  
  
  With mdifrmMain.cdDialogBox
    .Filter = "Text File (*.txt)|*.txt|Rich Text Format (*.rtf)|*.rtf"
    .InitDir = "u:\vb"
    .DialogTitle = strCap
    .ShowSave
    If .FilterIndex = 1 Then
      Open .FileName For Output As #1
      Print #1, rtbDataArea.Text
      Close #1
    Else
      frmTmp.rtbDataArea.SaveFile .FileName
      frmTmp.Caption = .FileName
    End If
  End With
  booSoiled = False
Bottom:
End Sub

Private Sub mnuFileSave_Click()
  SaveFile Me, "Save"
End Sub

Private Sub mnuFileSaveAs_Click()
  SaveFile Me, "Save As..."
End Sub

Private Sub mnuHelp_Click()
 Dim strHelp As String
  
  strHelp = "  This program is really primative.  To use the text" & vbCrLf
  strHelp = strHelp & "modification actions, first you must select the text to" & vbCrLf
  strHelp = strHelp & "modify.  Good Luck!"
  
  MsgBox strHelp, vbInformation + vbOKOnly, "Info"
End Sub

Private Sub mnuOptionsFont_Click()
  On Error GoTo Bottom
  With mdifrmMain.cdDialogBox
    If rtbDataArea.SelText = "" Then
      MsgBox "Select text to modify", vbExclamation + vbOKOnly, "Wait"
    Else
      .Flags = cdlCFScreenFonts + cdlCFEffects
      .CancelError = True
      .ShowFont
      'Font Size and Name
      rtbDataArea.SelFontSize = .FontSize
      rtbDataArea.SelFontName = .FontName
      'Underline
      If .FontUnderline = True Then
        rtbDataArea.SelUnderline = True
      Else
        rtbDataArea.SelUnderline = False
      End If
      'Bold
      If .FontBold = True Then
        rtbDataArea.SelBold = True
      Else
        rtbDataArea.SelBold = False
      End If
      'Italic
      If .FontItalic = True Then
        rtbDataArea.SelItalic = True
      Else
        rtbDataArea.SelItalic = False
      End If
    End If
  End With
Bottom:
End Sub

Private Sub rtbDataArea_Change()
  booSoiled = True
End Sub

Private Sub tbChildBar_ButtonClick(ByVal Button As MSComctlLib.Button)
  'New
  If Button.Index = 1 Then
    Call mnuFileNew_Click
  End If
  'Open
  If Button.Index = 2 Then
    Call mnuFileOpen_Click
  End If
  'Bold
  If Button.Index = 3 Then
    If rtbDataArea.SelText = "" Then
      MsgBox "Select text to modify", vbExclamation + vbOKOnly, "Wait"
    Else
      If rtbDataArea.SelBold = False Then
        rtbDataArea.SelBold = True
      Else
        rtbDataArea.SelBold = False
      End If 'end if bold (t or f)
    End If 'end if there is text
  End If 'end if index 3
  
  'Italic
  If Button.Index = 4 Then
    If rtbDataArea.SelText = "" Then
      MsgBox "Select text to modify", vbExclamation + vbOKOnly, "Wait"
    Else
      If rtbDataArea.SelItalic = False Then
        rtbDataArea.SelItalic = True
      Else
        rtbDataArea.SelItalic = False
      End If 'end if italic (t or f)
    End If 'end if there is text
  End If 'end if index 4
  
  'Underline
  If Button.Index = 5 Then
    If rtbDataArea.SelText = "" Then
      MsgBox "Select text to modify", vbExclamation + vbOKOnly, "Wait"
    Else
      If rtbDataArea.SelUnderline = False Then
        rtbDataArea.SelUnderline = True
      Else
        rtbDataArea.SelUnderline = False
      End If 'end if underline (t or f)
    End If 'end if there is text
  End If 'end if index 5
  
  'Left
  If Button.Index = 6 Then
    If rtbDataArea.SelText = "" Then
      MsgBox "Select text to modify", vbExclamation + vbOKOnly, "Wait"
    Else
      rtbDataArea.SelAlignment = rtfLeft
    End If 'end if there is text
  End If 'end if index is 6
  
  'Right
  If Button.Index = 7 Then
    If rtbDataArea.SelText = "" Then
      MsgBox "Select text to modify", vbExclamation + vbOKOnly, "Wait"
    Else
      rtbDataArea.SelAlignment = rtfRight
    End If 'end if there is text
  End If 'end if index is 7
  
  'Center
  If Button.Index = 8 Then
    If rtbDataArea.SelText = "" Then
      MsgBox "Select text to modify", vbExclamation + vbOKOnly, "Wait"
    Else
      rtbDataArea.SelAlignment = rtfCenter
    End If 'end if there is text
  End If 'end if index is 8
    
    
End Sub
