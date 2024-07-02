VERSION 5.00
Begin VB.Form frmSort 
   Caption         =   "Number Sorter"
   ClientHeight    =   3750
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   3705
   LinkTopic       =   "Form1"
   ScaleHeight     =   3750
   ScaleWidth      =   3705
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   240
      TabIndex        =   6
      Top             =   3000
      Width           =   1335
   End
   Begin VB.CommandButton cmdClearData 
      Caption         =   "Clear List"
      Height          =   375
      Left            =   240
      TabIndex        =   5
      Top             =   2280
      Width           =   1335
   End
   Begin VB.CommandButton cmdThreeBig 
      Caption         =   "Find 3 Largest"
      Height          =   375
      Left            =   240
      TabIndex        =   4
      Top             =   1560
      Width           =   1335
   End
   Begin VB.CommandButton cmdSort 
      Caption         =   "Sort"
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   840
      Width           =   1335
   End
   Begin VB.CommandButton cmdSwap 
      Caption         =   "Swapper"
      Height          =   375
      Left            =   1920
      TabIndex        =   2
      Top             =   3120
      Width           =   1455
   End
   Begin VB.ListBox lstNumberList 
      Height          =   2595
      ItemData        =   "frmSort.frx":0000
      Left            =   1920
      List            =   "frmSort.frx":0002
      MultiSelect     =   1  'Simple
      TabIndex        =   1
      Top             =   360
      Width           =   1455
   End
   Begin VB.CommandButton cmdAddNumber 
      Caption         =   "Add"
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   1335
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "&Options"
      Begin VB.Menu mnuSwap 
         Caption         =   "&Swapper"
      End
   End
End
Attribute VB_Name = "frmSort"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim intNumberArray(20) As Integer
Dim intArrayCounter As Integer

Private Sub cmdAddNumber_Click()
  intNumberArray(intArrayCounter) = InputBox("Please enter the number to add.", "Add Number")
  lstNumberList.AddItem (Str(intNumberArray(intArrayCounter)))
  intArrayCounter = intArrayCounter + 1
End Sub

Private Sub cmdClearData_Click()
  Dim intI As Integer
  
  lstNumberList.Clear
  For intI = 0 To 20
    intNumberArray(intI) = 0
  Next intI
End Sub

Private Sub cmdExit_Click()
  End
End Sub

Private Sub cmdSort_Click()
  Dim intI As Integer
  Dim intTempHolder As Integer
  Dim blnSorted As Boolean
  
  intArrayCounter = intArrayCounter - 1
  blnSorted = False
  Do Until blnSorted
    blnSorted = True
    For intI = 0 To intArrayCounter - 1
      If (intNumberArray(intI) > intNumberArray(intI + 1)) Then
        Call swap(intNumberArray(intI), intNumberArray(intI + 1))
        blnSorted = False
      End If
    Next intI
  Loop
  lstNumberList.Clear
  For intI = 0 To intArrayCounter
    lstNumberList.AddItem (intNumberArray(intI))
  Next intI
  intArrayCounter = intArrayCounter + 1
End Sub

Private Sub cmdSwap_Click()
  frmSort.Enabled = False
  frmSwap.Enabled = True
  frmSwap.Show
End Sub

Private Sub cmdThreeBig_Click()
  Dim strMessage As String
  
  intArrayCounter = intArrayCounter - 1
  strMessage = "3 Highest #'s" & vbCrLf
  strMessage = strMessage & "--" & Str(intNumberArray(intArrayCounter)) & vbCrLf
  strMessage = strMessage & "--" & Str(intNumberArray(intArrayCounter - 1)) & vbCrLf
  strMessage = strMessage & "--" & Str(intNumberArray(intArrayCounter - 2)) & vbCrLf
  
  MsgBox strMessage, vbInformation, "Number Info"
  intArrayCounter = intArrayCounter + 1
End Sub

Private Sub Form_Load()
  intArrayCounter = 0
  frmSort.Show
  frmSwap.Hide
End Sub

Private Sub mnuSwap_Click()
  frmSort.Enabled = False
  frmSwap.Enabled = True
  frmSwap.Show
End Sub
