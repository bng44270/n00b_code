VERSION 5.00
Begin VB.Form frmDataSort 
   Caption         =   "Array Data Finder"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   495
      Left            =   1560
      TabIndex        =   3
      Top             =   2520
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Total Monthly Salaries"
      Height          =   495
      Left            =   2400
      TabIndex        =   2
      Top             =   1800
      Width           =   1335
   End
   Begin VB.CommandButton cmdAvgMonSal 
      Caption         =   "Average Monthly Salaries"
      Height          =   495
      Left            =   480
      TabIndex        =   1
      Top             =   1800
      Width           =   1335
   End
   Begin VB.ListBox lstSalaries 
      Height          =   1035
      ItemData        =   "frmDataSort.frx":0000
      Left            =   960
      List            =   "frmDataSort.frx":0002
      TabIndex        =   0
      Top             =   480
      Width           =   2655
   End
End
Attribute VB_Name = "frmDataSort"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim dblSalaries(6, 3) As Double
Dim intValueCounter As Integer

Private Sub cmdAvgMonSal_Click()
  Dim intR As Integer
  Dim intC As Integer
  Dim strMessage As String
  Dim dblPerAvg As Double
  Dim dblEngAvg As Double
  Dim dblSalAvg As Double
  
  dblPerAvg = 0
  dblEngAvg = 0
  dblSalAvg = 0
  
  For intR = 0 To 2
    For intC = 0 To 5
      If intR = 0 Then
        dblPerAvg = dblPerAvg + dblSalaries(intC, intR)
      ElseIf intR = 1 Then
        dblEngAvg = dblEngAvg + dblSalaries(intC, intR)
      ElseIf intR = 2 Then
        dblSalAvg = dblSalAvg + dblSalaries(intC, intR)
      End If
    Next intC
  Next intR
  dblPerAvg = dblPerAvg / 6
  dblEngAvg = dblEngAvg / 6
  dblSalAvg = dblSalAvg / 6
  
  strMessage = "Averages:" & vbCrLf
  strMessage = strMessage & "--Personel:     $" & Str(Format(dblPerAvg, "currency")) & vbCrLf
  strMessage = strMessage & "--Engineering:  $" & Str(Format(dblEngAvg, "currency")) & vbCrLf
  strMessage = strMessage & "--Sales:        $" & Str(Format(dblSalAvg, "currency"))
  MsgBox strMessage, vbInformation, "Averages"
        
      
End Sub

Private Sub cmdExit_Click()
  End
End Sub

Private Sub Command1_Click()
  Dim intC As Integer
  Dim intR As Integer
  Dim dblJanAvg As Double
  Dim dblFebAvg As Double
  Dim dblMarAvg As Double
  Dim dblAprAvg As Double
  Dim dblMayAvg As Double
  Dim dblJunAvg As Double
  Dim strMessage As String
      
  dblJanAvg = 0
  dblFebAvg = 0
  dblMarAvg = 0
  dblAprAvg = 0
  dblMayAvg = 0
  dblJunAvg = 0
  
  For intC = 0 To 5
    For intR = 0 To 2
      If intC = 0 Then
        dblJanAvg = dblJanAvg + dblSalaries(intC, intR)
      ElseIf intC = 1 Then
        dblFebAvg = dblFebAvg + dblSalaries(intC, intR)
      ElseIf intC = 2 Then
        dblMarAvg = dblMarAvg + dblSalaries(intC, intR)
      ElseIf intC = 3 Then
        dblAprAvg = dblAprAvg + dblSalaries(intC, intR)
      ElseIf intC = 4 Then
        dblMayAvg = dblMayAvg + dblSalaries(intC, intR)
      ElseIf intC = 5 Then
        dblJunAvg = dblJunAvg + dblSalaries(intC, intR)
      End If
    Next intR
  Next intC
  
  dblJanAvg = dblJanAvg / 3
  dblFebAvg = dblFebAvg / 3
  dblMarAvg = dblMarAvg / 3
  dblAprAvg = dblAprAvg / 3
  dblMayAvg = dblMayAvg / 3
  dblJunAvg = dblJunAvg / 3
  
  strMessage = "Averages" & vbCrLf
  strMessage = strMessage & "--Jan.: $" & Str(Format(dblJanAvg, "currency")) & vbCrLf
  strMessage = strMessage & "--Feb.: $" & Str(Format(dblFebAvg, "currency")) & vbCrLf
  strMessage = strMessage & "--Mar.: $" & Str(Format(dblMarAvg, "currency")) & vbCrLf
  strMessage = strMessage & "--Apr.: $" & Str(Format(dblAprAvg, "currency")) & vbCrLf
  strMessage = strMessage & "--May : $" & Str(Format(dblMayAvg, "currency")) & vbCrLf
  strMessage = strMessage & "--Jun.: $" & Str(Format(dblJunAvg, "currency")) & vbCrLf
  MsgBox strMessage, vbInformation, "Averages"
End Sub

Private Sub Form_Load()
  Dim intR As Integer
  Dim intC As Integer
    
  Open "salary.txt" For Input As #1
    For intR = 0 To 2
      For intC = 0 To 5
        Input #1, dblSalaries(intC, intR)
        If intR = 0 Then
          If intC = 0 Then
            lstSalaries.AddItem ("Personel for Jan.: " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 1 Then
            lstSalaries.AddItem ("Personel for Feb.: " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 2 Then
            lstSalaries.AddItem ("Personel for Mar.: " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 3 Then
            lstSalaries.AddItem ("Personel for Apr.: " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 4 Then
            lstSalaries.AddItem ("Personel for May : " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 5 Then
            lstSalaries.AddItem ("Personel for June: " & Format(dblSalaries(intC, intR), "currency"))
          End If
        ElseIf intR = 1 Then
          If intC = 0 Then
            lstSalaries.AddItem ("Engineering for Jan.: " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 1 Then
            lstSalaries.AddItem ("Engineering for Feb.: " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 2 Then
            lstSalaries.AddItem ("Engineering for Mar.: " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 3 Then
            lstSalaries.AddItem ("Engineering for Apr.: " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 4 Then
            lstSalaries.AddItem ("Engineering for May : " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 5 Then
            lstSalaries.AddItem ("Engineering for June: " & Format(dblSalaries(intC, intR), "currency"))
          End If
        ElseIf intR = 2 Then
          If intC = 0 Then
            lstSalaries.AddItem ("Sales for Jan.: " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 1 Then
            lstSalaries.AddItem ("Sales for Feb.: " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 2 Then
            lstSalaries.AddItem ("Sales for Mar.: " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 3 Then
            lstSalaries.AddItem ("Sales for Apr.: " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 4 Then
            lstSalaries.AddItem ("Sales for May : " & Format(dblSalaries(intC, intR), "currency"))
          ElseIf intC = 5 Then
            lstSalaries.AddItem ("Sales for June: " & Format(dblSalaries(intC, intR), "currency"))
          End If
        End If
      Next intC
    Next intR
  Close #1
End Sub

