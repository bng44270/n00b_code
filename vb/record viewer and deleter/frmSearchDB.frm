VERSION 5.00
Begin VB.Form frmSearchDB 
   Caption         =   "Search Windows"
   ClientHeight    =   3540
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3540
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close Window"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   3120
      Width           =   4455
   End
   Begin VB.ListBox lstFoundPeople 
      Height          =   2985
      ItemData        =   "frmSearchDB.frx":0000
      Left            =   120
      List            =   "frmSearchDB.frx":0002
      TabIndex        =   0
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "frmSearchDB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public intAverage As Integer

Private Sub cmdClose_Click()
  Unload frmSearchDB
  
  frmMainDB.Enabled = True
End Sub

Private Sub Form_Load()
  Dim strTestString As String
  Dim strListLine As String
    
  strTestString = "Quiz_Average > " & Str(intAverage)
  frmMainDB.datDataHolder.Recordset.MoveFirst
  frmMainDB.datDataHolder.Recordset.FindFirst strTestString
  If frmMainDB.datDataHolder.Recordset.NoMatch = False Then
    strListLine = frmMainDB.datDataHolder.Recordset("Name") & ", " & frmMainDB.datDataHolder.Recordset("Quiz_Average")
    lstFoundPeople.AddItem strListLine
  End If
  Do While Not (frmMainDB.datDataHolder.Recordset.EOF) And (frmMainDB.datDataHolder.Recordset.NoMatch = False)
    frmMainDB.datDataHolder.Recordset.FindNext strTestString
    If frmMainDB.datDataHolder.Recordset.NoMatch = False Then
      strListLine = frmMainDB.datDataHolder.Recordset("Name") & ", " & frmMainDB.datDataHolder.Recordset("Quiz_Average")
      lstFoundPeople.AddItem strListLine
    End If
  Loop
End Sub
