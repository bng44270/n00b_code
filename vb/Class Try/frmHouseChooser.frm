VERSION 5.00
Begin VB.Form frmHouseChooser 
   Caption         =   "Houses"
   ClientHeight    =   3240
   ClientLeft      =   3360
   ClientTop       =   3120
   ClientWidth     =   4695
   LinkTopic       =   "Form1"
   ScaleHeight     =   3240
   ScaleWidth      =   4695
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   495
      Left            =   2640
      TabIndex        =   14
      Top             =   2520
      Width           =   975
   End
   Begin VB.CommandButton cmdAddHome 
      Caption         =   "Add Home"
      Height          =   495
      Left            =   960
      TabIndex        =   13
      Top             =   2520
      Width           =   975
   End
   Begin VB.TextBox txtPrice 
      Enabled         =   0   'False
      Height          =   285
      Left            =   3240
      TabIndex        =   12
      Top             =   1800
      Width           =   1215
   End
   Begin VB.Frame Frame2 
      Caption         =   "Rooms"
      Height          =   1095
      Left            =   120
      TabIndex        =   7
      Top             =   1200
      Width           =   3015
      Begin VB.OptionButton optRooms 
         Caption         =   "2 Rooms + Den + Master Suite"
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   10
         Top             =   720
         Width           =   2535
      End
      Begin VB.OptionButton optRooms 
         Caption         =   "3 Rooms + Den"
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   9
         Top             =   480
         Width           =   2535
      End
      Begin VB.OptionButton optRooms 
         Caption         =   "4 Rooms"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   8
         Top             =   240
         Width           =   2535
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Garage"
      Height          =   975
      Left            =   3240
      TabIndex        =   4
      Top             =   120
      Width           =   1215
      Begin VB.OptionButton optGarages 
         Caption         =   "3 Cars"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   6
         Top             =   600
         Width           =   855
      End
      Begin VB.OptionButton optGarages 
         Caption         =   "2 Cars"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.ComboBox cboHouseTypes 
      Height          =   315
      ItemData        =   "frmHouseChooser.frx":0000
      Left            =   1560
      List            =   "frmHouseChooser.frx":000D
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   720
      Width           =   1455
   End
   Begin VB.TextBox txtAddress 
      Height          =   375
      Left            =   960
      TabIndex        =   0
      Top             =   240
      Width           =   2055
   End
   Begin VB.Label Label3 
      Caption         =   "Prospective Price"
      Height          =   375
      Left            =   3360
      TabIndex        =   11
      Top             =   1320
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "House Type"
      Height          =   255
      Left            =   480
      TabIndex        =   2
      Top             =   720
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Address"
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   360
      Width           =   735
   End
End
Attribute VB_Name = "frmHouseChooser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim houses(10) As clsHouse
Dim bar As clsBarcelona
Dim mad As clsMadrid
Dim ri As clsRio
Dim intUsed As Integer


Private Sub cmdAddHome_Click()
 
 If cboHouseTypes = "Barcelona" Then
   Dim barc As New clsBarcelona
   
   If Not intUsed > 10 Then
     
     If optGarages(0).Value = True Then
       barc.clsHouse_GarageCount = 2
     ElseIf optGarages(1).Value = True Then
       barc.clsHouse_GarageCount = 3
     End If
     
     If optRooms(0).Value = True Then
       barc.clsHouse_Rooms = 1
     ElseIf optRooms(1).Value = True Then
       barc.clsHouse_Rooms = 2
     ElseIf optRooms(2).Value = True Then
       barc.clsHouse_Rooms = 3
     End If
     
     txtPrice.Text = Str(barc.Calc_Price())
    
     Set houses(intUsed) = barc
     intUsed = intUsed + 1
   End If
 ElseIf cboHouseTypes = "Madrid" Then
   Dim madrid As New clsMadrid
   
   If Not intUsed > 10 Then
     
     If optGarages(0).Value = True Then
       madrid.clsHouse_GarageCount = 2
     ElseIf optGarages(1).Value = True Then
       madrid.clsHouse_GarageCount = 3
     End If
     
     If optRooms(0).Value = True Then
       madrid.clsHouse_Rooms = 1
     ElseIf optRooms(1).Value = True Then
       madrid.clsHouse_Rooms = 2
     ElseIf optRooms(2).Value = True Then
       madrid.clsHouse_Rooms = 3
     End If
     
     txtPrice.Text = Str(madrid.Calc_Price())
     
     Set houses(intUsed) = madrid
     intUsed = intUsed + 1
   End If
 
 ElseIf cboHouseTypes = "Rio" Then
   Dim rio As New clsRio
   
   If Not intUsed > 10 Then
     
     If optGarages(0).Value = True Then
       rio.clsHouse_GarageCount = 2
     ElseIf optGarages(1).Value = True Then
       rio.clsHouse_GarageCount = 3
     End If
     
     If optRooms(0).Value = True Then
       rio.clsHouse_Rooms = 1
     ElseIf optRooms(1).Value = True Then
       rio.clsHouse_Rooms = 2
     ElseIf optRooms(2).Value = True Then
       rio.clsHouse_Rooms = 3
     End If
     
     txtPrice.Text = Str(Format(rio.Calc_Price(), "currency"))
     
     Set houses(intUsed) = rio
     intUsed = intUsed + 1
   End If
 End If
End Sub

Private Sub cmdExit_Click()
  End
End Sub

Private Sub Form_Load()
  intUsed = 0
End Sub
