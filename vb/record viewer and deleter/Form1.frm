VERSION 5.00
Begin VB.Form frmMainDB 
   Caption         =   "Database Form"
   ClientHeight    =   5235
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4305
   LinkTopic       =   "Form1"
   ScaleHeight     =   5235
   ScaleWidth      =   4305
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdLast 
      Caption         =   "Last"
      Height          =   495
      Left            =   2880
      TabIndex        =   14
      Top             =   3480
      Width           =   615
   End
   Begin VB.CommandButton cmdFirst 
      Caption         =   "First"
      Height          =   495
      Left            =   480
      TabIndex        =   13
      Top             =   3480
      Width           =   615
   End
   Begin VB.PictureBox imgNext 
      Height          =   1095
      Left            =   2160
      Picture         =   "Form1.frx":0000
      ScaleHeight     =   1035
      ScaleWidth      =   555
      TabIndex        =   12
      Top             =   3000
      Width           =   615
   End
   Begin VB.PictureBox imgPrevious 
      Height          =   1095
      Left            =   1200
      Picture         =   "Form1.frx":22A6
      ScaleHeight     =   1035
      ScaleWidth      =   555
      TabIndex        =   11
      Top             =   3000
      Width           =   615
   End
   Begin VB.CommandButton cmdSearch 
      Caption         =   "Search"
      Height          =   615
      Left            =   360
      TabIndex        =   10
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Delete Record"
      Height          =   615
      Left            =   3000
      TabIndex        =   9
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmdNewRecord 
      Caption         =   "New Record"
      Height          =   615
      Left            =   1680
      TabIndex        =   8
      Top             =   4440
      Width           =   975
   End
   Begin VB.TextBox txtLetterGrade 
      DataField       =   "Letter_Grade"
      DataSource      =   "datDataHolder"
      Height          =   495
      Left            =   1680
      TabIndex        =   3
      Top             =   2400
      Width           =   1935
   End
   Begin VB.TextBox txtQuizGrade 
      DataField       =   "Quiz_Average"
      DataSource      =   "datDataHolder"
      Height          =   495
      Left            =   1680
      TabIndex        =   2
      Top             =   1680
      Width           =   1935
   End
   Begin VB.TextBox txtIDNumber 
      DataField       =   "ID_Number"
      DataSource      =   "datDataHolder"
      Height          =   495
      Left            =   1680
      TabIndex        =   1
      Top             =   960
      Width           =   1935
   End
   Begin VB.TextBox txtName 
      DataField       =   "Name"
      DataSource      =   "datDataHolder"
      Height          =   495
      Left            =   1680
      TabIndex        =   0
      Top             =   240
      Width           =   1935
   End
   Begin VB.Data datDataHolder 
      Caption         =   "Student Data"
      Connect         =   "Access"
      DatabaseName    =   "U:\vb\record viewer and deleter\student.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   495
      Left            =   480
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "Name"
      Top             =   3000
      Visible         =   0   'False
      Width           =   3255
   End
   Begin VB.Label Label4 
      Caption         =   "Letter Grade"
      Height          =   375
      Left            =   360
      TabIndex        =   7
      Top             =   2520
      Width           =   1335
   End
   Begin VB.Label Label3 
      Caption         =   "Quiz Grade"
      Height          =   375
      Left            =   360
      TabIndex        =   6
      Top             =   1800
      Width           =   1335
   End
   Begin VB.Label Label2 
      Caption         =   "Student ID"
      Height          =   375
      Left            =   360
      TabIndex        =   5
      Top             =   1080
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "Name"
      Height          =   375
      Left            =   360
      TabIndex        =   4
      Top             =   360
      Width           =   1335
   End
End
Attribute VB_Name = "frmMainDB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdDelete_Click()
 If datDataHolder.Recordset.EOF Then
    MsgBox "No More Data!!!", vbInformation, "Error"
  Else
    datDataHolder.Recordset.Delete
    datDataHolder.Recordset.MoveLast
  End If
End Sub

Private Sub cmdFirst_Click()
  If datDataHolder.Recordset.BOF Then
    MsgBox "This is the First Record", vbInformation
    datDataHolder.Recordset.MoveFirst
  Else
    datDataHolder.Recordset.MoveFirst
  End If
End Sub

Private Sub cmdLast_Click()
  datDataHolder.Recordset.MoveLast
End Sub

Private Sub cmdNewRecord_Click()
  datDataHolder.Recordset.AddNew
  txtName.Text = ""
  txtIDNumber.Text = ""
  txtQuizGrade.Text = ""
  txtLetterGrade.Text = ""
End Sub

Private Sub cmdSearch_Click()
  Dim intAverage As Integer
  
  intAverage = InputBox("Enter the lowest average")
  
  If intAverage = vbCancel Then
    Exit Sub
  Else
    Load frmSearchDB
    frmSearchDB.intAverage = intAverage
    frmSearchDB.Show
    frmMainDB.Enabled = False
  End If
End Sub

Private Sub imgNext_Click()
  If datDataHolder.Recordset.EOF Then
    MsgBox "This is the Last Record", vbInformation
    datDataHolder.Recordset.MoveLast
  Else
    datDataHolder.Recordset.MoveNext
  End If
End Sub

Private Sub imgPrevious_Click()
  If datDataHolder.Recordset.BOF Then
    MsgBox "This is the First Record", vbInformation
    datDataHolder.Recordset.MoveFirst
  Else
    datDataHolder.Recordset.MovePrevious
  End If
End Sub

Private Sub txtQuizGrade_Change()
  If Not txtQuizGrade.Text = "" Then
    If Val(txtQuizGrade.Text) > 89 Then
      txtLetterGrade.Text = "A"
    ElseIf (Val(txtQuizGrade.Text) > 79) And (Val(txtQuizGrade.Text) < 90) Then
      txtLetterGrade.Text = "B"
    ElseIf (Val(txtQuizGrade.Text) > 69) And (Val(txtQuizGrade.Text) < 80) Then
      txtLetterGrade.Text = "C"
    ElseIf (Val(txtQuizGrade.Text) > 59) And (Val(txtQuizGrade.Text) < 70) Then
      txtLetterGrade.Text = "D"
    ElseIf Val(txtQuizGrade.Text) < 60 Then
      txtLetterGrade.Text = "F"
    End If
  End If
End Sub
