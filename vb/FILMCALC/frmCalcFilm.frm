VERSION 5.00
Begin VB.Form frmCalcFilm 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Form1"
   ClientHeight    =   2715
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6330
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2715
   ScaleWidth      =   6330
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Shape shpSquare 
      BorderColor     =   &H80000000&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H80000000&
      FillStyle       =   0  'Solid
      Height          =   735
      Index           =   11
      Left            =   5160
      Top             =   1200
      Width           =   855
   End
   Begin VB.Shape shpSquare 
      BorderColor     =   &H80000000&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H80000000&
      FillStyle       =   0  'Solid
      Height          =   735
      Index           =   10
      Left            =   4200
      Top             =   1200
      Width           =   855
   End
   Begin VB.Shape shpSquare 
      BorderColor     =   &H80000000&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H80000000&
      FillStyle       =   0  'Solid
      Height          =   735
      Index           =   9
      Left            =   3240
      Top             =   1200
      Width           =   855
   End
   Begin VB.Shape shpSquare 
      BorderColor     =   &H80000000&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H80000000&
      FillStyle       =   0  'Solid
      Height          =   735
      Index           =   8
      Left            =   2280
      Top             =   1200
      Width           =   855
   End
   Begin VB.Shape shpSquare 
      BorderColor     =   &H80000000&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H80000000&
      FillStyle       =   0  'Solid
      Height          =   735
      Index           =   7
      Left            =   1320
      Top             =   1200
      Width           =   855
   End
   Begin VB.Shape shpSquare 
      BorderColor     =   &H80000000&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H80000000&
      FillStyle       =   0  'Solid
      Height          =   735
      Index           =   6
      Left            =   360
      Top             =   1200
      Width           =   855
   End
   Begin VB.Shape shpSquare 
      BorderColor     =   &H80000000&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H80000000&
      FillStyle       =   0  'Solid
      Height          =   735
      Index           =   5
      Left            =   5160
      Top             =   360
      Width           =   855
   End
   Begin VB.Shape shpSquare 
      BorderColor     =   &H80000000&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H80000000&
      FillStyle       =   0  'Solid
      Height          =   735
      Index           =   4
      Left            =   4200
      Top             =   360
      Width           =   855
   End
   Begin VB.Shape shpSquare 
      BorderColor     =   &H80000000&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H80000000&
      FillStyle       =   0  'Solid
      Height          =   735
      Index           =   3
      Left            =   3240
      Top             =   360
      Width           =   855
   End
   Begin VB.Shape shpSquare 
      BorderColor     =   &H80000000&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H80000000&
      FillStyle       =   0  'Solid
      Height          =   735
      Index           =   2
      Left            =   2280
      Top             =   360
      Width           =   855
   End
   Begin VB.Shape shpSquare 
      BorderColor     =   &H80000000&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H80000000&
      FillStyle       =   0  'Solid
      Height          =   735
      Index           =   1
      Left            =   1320
      Top             =   360
      Width           =   855
   End
   Begin VB.Shape shpSquare 
      BorderColor     =   &H80000000&
      BorderStyle     =   0  'Transparent
      FillColor       =   &H80000000&
      FillStyle       =   0  'Solid
      Height          =   735
      Index           =   0
      Left            =   360
      Top             =   360
      Width           =   855
   End
End
Attribute VB_Name = "frmCalcFilm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FilmBoxRangeX(11) As New clsRange
Dim FilmBoxRangeY(11) As New clsRange

Private Sub Form_Load()
  Dim i As Integer

  For i = 0 To 11 Step 1
    FilmBoxRangeX(i).Bottom = shpSquare(i).Top
    FilmBoxRangeX(i).Top = shpSquare(i).Top + shpSquare(i).Height
    FilmBoxRangeY(i).Bottom = shpSquare(i).Left
    FilmBoxRangeY(i).Top = shpSquare(i).Left + shpSquare(i).Width
    shpSquare(i).Tag = 0
  Next i
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Dim i As Integer
  
  For i = 0 To 11 Step 1
    If (FilmBoxRangeX(i).inRange(X)) And (FilmBoxRangeY(i).inRange(Y)) Then
      If shpSquare(i).Tag = 0 Then
        shpSquare(i).FillColor = &H0&
        shpSquare(i).Tag = 1
      Else
        shpSquare(i).FillColor = &H80000000
        shpSquare(i).Tag = 0
      End If
    End If
  Next i
        
End Sub
