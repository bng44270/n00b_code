VERSION 5.00
Begin VB.Form frmChangePeoplesNames 
   Caption         =   "People Viewer"
   ClientHeight    =   4020
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   2430
   LinkTopic       =   "Form1"
   ScaleHeight     =   4020
   ScaleWidth      =   2430
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdSaveExit 
      Caption         =   "Save and Exit"
      Height          =   495
      Left            =   1320
      TabIndex        =   5
      Top             =   3360
      Width           =   975
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "Save And Not Exit"
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   3360
      Width           =   975
   End
   Begin VB.CommandButton cmdDeleteItem 
      Caption         =   "Delete Item From Box"
      Height          =   495
      Left            =   1320
      TabIndex        =   3
      Top             =   2640
      Width           =   975
   End
   Begin VB.CommandButton cmdAddItem 
      Caption         =   "Add Item To Box"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   2640
      Width           =   975
   End
   Begin VB.ComboBox cboPeoplesNames 
      Height          =   315
      Left            =   240
      Sorted          =   -1  'True
      TabIndex        =   1
      Top             =   1800
      Width           =   1695
   End
   Begin VB.TextBox txtChangeData 
      Height          =   405
      Left            =   480
      TabIndex        =   0
      Top             =   600
      Width           =   1215
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   2400
      Y1              =   2400
      Y2              =   2400
   End
   Begin VB.Label lblListBox 
      Caption         =   "People's Names"
      Height          =   375
      Left            =   480
      TabIndex        =   7
      Top             =   1320
      Width           =   1215
   End
   Begin VB.Label lblPersonName 
      Caption         =   "Enter the Name Here"
      Height          =   375
      Left            =   480
      TabIndex        =   6
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmChangePeoplesNames"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'People Viewer Program
'by Andy Carlson
'10-9-01
'Inputs peoples names from file and allows user to
'manipulate file

Private Sub cmdAddItem_Click()
  If txtChangeData.Text = "" Then
    MsgBox "Please Enter Data into Box"
    txtChangeData.SetFocus
  Else
    cboPeoplesNames.AddItem txtChangeData.Text
    MsgBox "Item Added!"
  End If
  txtChangeData.Text = ""
End Sub

Private Sub cmdDeleteItem_Click()
  Dim intI As Integer
  If cboPeoplesNames.ListIndex > -1 Then
    cboPeoplesNames.RemoveItem cboPeoplesNames.ListIndex
    MsgBox "Item Deleted!"
  Else
    MsgBox "No Items Found!"
  End If
End Sub

Private Sub cmdSave_Click()
  Dim intI As Integer
  Open "names.txt" For Output As #2
  For intI = 0 To cboPeoplesNames.ListCount - 1
    Write #2, cboPeoplesNames.List(intI)
  Next intI
  Close #2
  MsgBox "File Saved!"
End Sub

Private Sub cmdSaveExit_Click()
  Dim intI As Integer
  Open "u:\visualba\peopleho\names.txt" For Output As #2
  For intI = 0 To cboPeoplesNames.ListCount - 1
    Write #2, cboPeoplesNames.List(intI)
  Next intI
  Close #2
  End
End Sub

Private Sub Form_Load()
  Dim strName As String
  Open "names.txt" For Input As #1
  Do Until EOF(1)
    Input #1, strName
    cboPeoplesNames.AddItem strName
  Loop
  Close #1
End Sub
