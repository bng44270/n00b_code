VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4185
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7125
   LinkTopic       =   "Form1"
   ScaleHeight     =   4185
   ScaleWidth      =   7125
   StartUpPosition =   3  'Windows Default
   Begin MSAdodcLib.Adodc adcInventory 
      Height          =   375
      Left            =   480
      Top             =   3480
      Width           =   2040
      _ExtentX        =   3598
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   1
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=U:\vb\ADO Project\Inventory.mdb;Persist Security Info=False"
      OLEDBString     =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=U:\vb\ADO Project\Inventory.mdb;Persist Security Info=False"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "SELECT * FROM tblInventory"
      Caption         =   "Inventory"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "&Update"
      Height          =   495
      Left            =   4800
      TabIndex        =   8
      Top             =   3480
      Width           =   855
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "&Exit"
      Height          =   495
      Left            =   5760
      TabIndex        =   7
      Top             =   3480
      Width           =   855
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "&Delete"
      Height          =   495
      Left            =   3840
      TabIndex        =   6
      Top             =   3480
      Width           =   855
   End
   Begin VB.OptionButton optCategory 
      Caption         =   "Category 3"
      Height          =   255
      Index           =   2
      Left            =   4200
      TabIndex        =   5
      Top             =   960
      Width           =   1215
   End
   Begin VB.OptionButton optCategory 
      Caption         =   "Category 2"
      Height          =   255
      Index           =   1
      Left            =   2880
      TabIndex        =   4
      Top             =   960
      Width           =   1215
   End
   Begin VB.OptionButton optCategory 
      Caption         =   "Category 1"
      Height          =   255
      Index           =   0
      Left            =   1560
      TabIndex        =   3
      Top             =   960
      Width           =   1215
   End
   Begin MSDataGridLib.DataGrid dgInventoryDisplay 
      Bindings        =   "Form1.frx":0000
      Height          =   1815
      Left            =   360
      TabIndex        =   2
      Top             =   1320
      Width           =   5775
      _ExtentX        =   10186
      _ExtentY        =   3201
      _Version        =   393216
      HeadLines       =   1
      RowHeight       =   15
      FormatLocked    =   -1  'True
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   5
      BeginProperty Column00 
         DataField       =   "fldPartNum"
         Caption         =   "Part #"
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   "fldCategory"
         Caption         =   "Category"
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column02 
         DataField       =   "fldCost"
         Caption         =   "Cost"
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   1
            Format          =   """$""#,##0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column03 
         DataField       =   "fldDescription"
         Caption         =   "Description"
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column04 
         DataField       =   "fldStock"
         Caption         =   "Stock"
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         BeginProperty Column00 
            ColumnWidth     =   915.024
         EndProperty
         BeginProperty Column01 
            ColumnWidth     =   915.024
         EndProperty
         BeginProperty Column02 
            ColumnWidth     =   1739.906
         EndProperty
         BeginProperty Column03 
            ColumnWidth     =   1739.906
         EndProperty
         BeginProperty Column04 
            ColumnWidth     =   915.024
         EndProperty
      EndProperty
   End
   Begin VB.TextBox txtPercentIncrease 
      DataSource      =   "adcInventory"
      Height          =   375
      Left            =   2280
      TabIndex        =   1
      Top             =   480
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Price Increase"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   720
      TabIndex        =   0
      Top             =   480
      Width           =   1575
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Andy's ADO Try
'2-6-02
Dim strConnectString As New ADODB.Connection    'Connection String
Dim strCommandString As New ADODB.Command       'Command String
Dim strCategory As String                       'String to store category
                                                'globaly
'Delete a given record
Private Sub cmdDelete_Click()
  Dim strItem As String         'Item to delete
  Dim strCommand As String      'Private Command String
  
  strItem = InputBox("Please enter the part number of the item you wish to delete.")
  If strItem = "" Then
    MsgBox "Sorry, no data!", vbInformation, "Error"
  Else
    'Delete Selected Record
    strCommand = "DELETE * FROM tblInventory WHERE fldPartNum = " & strItem
    strCommandString.CommandText = strCommand
    strCommandString.Execute
    
    'Refresh Data Grid
    adcInventory.RecordSource = "SELECT * FROM tblInventory WHERE fldCategory = 1"
    adcInventory.Refresh
  End If
End Sub

'Exit Program
Private Sub cmdExit_Click()
  End
End Sub
'Update record with % entered increase
Private Sub cmdUpdate_Click()
  Dim strCommand As String          'Private Command String

  If txtPercentIncrease.Text = "" Then
    MsgBox "Please enter a percent", vbExclamation, "Error"
  Else
    'Update string
    strCommand = "UPDATE tblInventory SET fldCost = fldCost + (fldCost * (" & Val(txtPercentIncrease.Text) & "/100)) " & strCategory
    strCommandString.CommandType = adCmdText
    strCommandString.CommandText = strCommand
    strCommandString.Execute
  
    'Refresh grid
    adcInventory.RecordSource = "SELECT * FROM tblInventory WHERE fldCategory = 1"
    adcInventory.Refresh
  End If
End Sub
'Form Load Procedure
Private Sub Form_Load()
  'Connect to DB
  strConnectString.ConnectionString = adcInventory.ConnectionString
  strConnectString.Open
  strCommandString.ActiveConnection = strConnectString
  strCommandString.CommandType = adCmdText
  optCategory_Click (0)
End Sub
'Change Category
Private Sub optCategory_Click(Index As Integer)
  
  Dim strCommand As String      'Private Command String
  
  'Select Category
  If Index = 0 Then
    strCategory = " WHERE fldCategory = 1 "
  ElseIf Index = 1 Then
    strCategory = " WHERE fldCategory = 2 "
  ElseIf Index = 2 Then
    strCategory = " WHERE fldCategory = 3 "
  End If
  
  
  
  'Reconnect to DB
  strCommand = "SELECT * FROM tblInventory" & strCategory & "ORDER BY fldPartNum"
  strCommandString.CommandText = strCommand
  strCommandString.Execute
  
  'Refresh Grid
  adcInventory.RecordSource = strCommand
  adcInventory.Refresh
  
  
End Sub
