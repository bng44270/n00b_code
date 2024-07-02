VERSION 5.00
Begin VB.Form frmNumberFinder 
   Caption         =   "Number Finder"
   ClientHeight    =   3675
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6840
   LinkTopic       =   "Form1"
   ScaleHeight     =   3675
   ScaleWidth      =   6840
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   495
      Left            =   6000
      TabIndex        =   11
      Top             =   3000
      Width           =   735
   End
   Begin VB.CommandButton cmdReLoadList 
      Caption         =   "Reload List"
      Height          =   495
      Left            =   5040
      TabIndex        =   10
      Top             =   3000
      Width           =   735
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear List"
      Height          =   495
      Left            =   4080
      TabIndex        =   9
      Top             =   3000
      Width           =   735
   End
   Begin VB.CommandButton cmdGetMin 
      Caption         =   "Get Minimum"
      Height          =   495
      Left            =   5400
      TabIndex        =   8
      Top             =   2160
      Width           =   975
   End
   Begin VB.CommandButton cmdGetMax 
      Caption         =   "Get Maximum"
      Height          =   495
      Left            =   4200
      TabIndex        =   7
      Top             =   2160
      Width           =   975
   End
   Begin VB.TextBox txtDisplay 
      Height          =   495
      Left            =   4680
      TabIndex        =   6
      Top             =   1560
      Width           =   1575
   End
   Begin VB.TextBox txtAverage 
      Height          =   495
      Left            =   360
      TabIndex        =   2
      Top             =   2160
      Width           =   1575
   End
   Begin VB.TextBox txtSum 
      Height          =   495
      Left            =   360
      TabIndex        =   1
      Top             =   960
      Width           =   1575
   End
   Begin VB.ListBox lstPriceList 
      Height          =   2595
      ItemData        =   "frmNumberFinder.frx":0000
      Left            =   2160
      List            =   "frmNumberFinder.frx":0002
      TabIndex        =   0
      Top             =   720
      Width           =   1575
   End
   Begin VB.Line Line2 
      X1              =   3960
      X2              =   6840
      Y1              =   2880
      Y2              =   2880
   End
   Begin VB.Line Line1 
      X1              =   3960
      X2              =   3960
      Y1              =   3720
      Y2              =   2880
   End
   Begin VB.Label Label3 
      Caption         =   "Display"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5040
      TabIndex        =   5
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "Average Of Numbers"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   480
      TabIndex        =   4
      Top             =   1680
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "Sum Of Numbers"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   720
      Width           =   1815
   End
End
Attribute VB_Name = "frmNumberFinder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim curPriceList(20) As Currency
Dim curMaxPrice As Currency
Dim curMinPrice As Currency
Dim intArrayCount As Integer

Private Sub cmdClear_Click()
  Dim intI As Integer
  For intI = 0 To intArrayCount - 1
    curPriceList(intI) = 0
  Next intI
  lstPriceList.Clear
  txtSum.Text = ""
  txtAverage.Text = ""
  txtDisplay.Text = ""
End Sub

Private Sub cmdExit_Click()
  End
End Sub

Private Sub cmdGetMax_Click()
  Dim curMax As Currency
  Dim intI As Integer
    
  curMax = curPriceList(0)
  For intI = 0 To intArrayCount - 1
    If curMax < curPriceList(intI) Then
      curMax = curPriceList(intI)
    End If
  Next
  txtDisplay.Text = Format(curMax, "currency")
End Sub

Private Sub cmdGetMin_Click()
  Dim curMin As Currency
  Dim intI As Integer
    
  curMin = curPriceList(0)
  For intI = 0 To intArrayCount - 1
    If curMin > curPriceList(intI) Then
      curMin = curPriceList(intI)
    End If
  Next
  txtDisplay.Text = Format(curMin, "currency")
End Sub

Private Sub cmdReLoadList_Click()
  Dim intI As Integer
  Dim curSum As Currency
  Dim curAverage As Currency
    
  intArrayCount = 0
  Open "u:\visualba\numberfi\prices.txt" For Input As #1
  Do Until EOF(1)
    Input #1, curPriceList(intArrayCount)
    intArrayCount = intArrayCount + 1
  Loop
  Close #1
  For intI = 0 To intArrayCount - 1
    lstPriceList.AddItem Format(curPriceList(intI), "currency"), intI
  Next intI
  
  curSum = 0
  For intI = 0 To intArrayCount - 1
    curSum = curSum + curPriceList(intI)
  Next intI
  curAverage = curSum / intArrayCount
  txtAverage.Text = Format(curAverage, "currency")
  txtSum.Text = Format(curSum, "currency")
End Sub

Private Sub Form_Load()
  Dim intI As Integer
  Dim curSum As Currency
  Dim curAverage As Currency
    
  intArrayCount = 0
  Open "u:\visualba\numberfi\prices.txt" For Input As #1
  Do Until EOF(1)
    Input #1, curPriceList(intArrayCount)
    intArrayCount = intArrayCount + 1
  Loop
  Close #1
  For intI = 0 To intArrayCount - 1
    lstPriceList.AddItem Format(curPriceList(intI), "currency"), intI
  Next intI
  
  curSum = 0
  For intI = 0 To intArrayCount - 1
    curSum = curSum + curPriceList(intI)
  Next intI
  curAverage = curSum / intArrayCount
  txtAverage.Text = Format(curAverage, "currency")
  txtSum.Text = Format(curSum, "currency")
End Sub
