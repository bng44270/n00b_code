VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmDataTreeView 
   Caption         =   "Form1"
   ClientHeight    =   4605
   ClientLeft      =   855
   ClientTop       =   840
   ClientWidth     =   7305
   LinkTopic       =   "Form1"
   ScaleHeight     =   4605
   ScaleWidth      =   7305
   Begin MSComctlLib.ListView lvDataView 
      Height          =   3735
      Left            =   3720
      TabIndex        =   3
      Top             =   720
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   6588
      View            =   3
      Sorted          =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin MSComctlLib.TreeView tvDataView 
      Height          =   3735
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   6588
      _Version        =   393217
      Style           =   7
      Appearance      =   1
   End
   Begin MSAdodcLib.Adodc adoInventory 
      Height          =   375
      Left            =   1320
      Top             =   1920
      Visible         =   0   'False
      Width           =   3135
      _ExtentX        =   5530
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
      Connect         =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\WINDOWS\Desktop\tree_view\Inv.mdb;Persist Security Info=False"
      OLEDBString     =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\WINDOWS\Desktop\tree_view\Inv.mdb;Persist Security Info=False"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "SELECT * FROM tblInventory"
      Caption         =   ""
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
   Begin VB.Label Label2 
      Caption         =   "Product Info"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   3720
      TabIndex        =   1
      Top             =   120
      Width           =   2895
   End
   Begin VB.Label Label1 
      Caption         =   "Departments"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   2895
   End
End
Attribute VB_Name = "frmDataTreeView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Root Node
Dim nodRoot As Node
'Database strings
Dim strConnect As New ADODB.Connection

Private Sub Form_Load()
  '*****************************
  'Set up tree view
  '*****************************
  'Connect to DB
  strConnect.ConnectionString = adoInventory.ConnectionString
  strConnect.Open
  'Set Root node
  Set nodRoot = tvDataView.Nodes.Add(, , "Root", "Departments")
  'Set up Root folder nodes
  Call InitCategory(nodRoot)
End Sub

Sub InitCategory(nodParent As Node)
  Dim strCatCmd As New ADODB.Command
  Dim nodCatNode As Node
  Dim strCategorySet As Recordset
    
  'Command String
  strCatCmd.ActiveConnection = strConnect
  strCatCmd.CommandType = adCmdText
  strCatCmd.CommandText = "SELECT DISTINCT fldCategory FROM tblInventory"
  'Recordset definition
  Set strCategorySet = strCatCmd.Execute
  Do Until strCategorySet.EOF
    'Create Node
    Set nodCatNode = tvDataView.Nodes.Add(nodParent, tvwChild)
    nodCatNode.Text = strCategorySet("fldCategory")
    'Call sub category
    Call InitItem(nodCatNode, strCategorySet("fldCategory"))
    nodCatNode.Sorted = True
    strCategorySet.MoveNext
  Loop
End Sub
Sub InitItem(nodParent As Node, strCategory As String)
  Dim strSubCatCmd As New ADODB.Command
  Dim nodSubCatNode As Node
  Dim strSubCategorySet As Recordset
  
  'Command String
  strSubCatCmd.ActiveConnection = strConnect
  strSubCatCmd.CommandType = adCmdText
  strSubCatCmd.CommandText = "SELECT DISTINCT fldSubCategory FROM tblInventory WHERE fldCategory = '" & strCategory & "'"
  'Recordset definition
  Set strSubCategorySet = strSubCatCmd.Execute
  Do Until strSubCategorySet.EOF
    'Create node
    Set nodSubCatNode = tvDataView.Nodes.Add(nodParent, tvwChild)
    nodSubCatNode.Text = strSubCategorySet("fldSubCategory")
    strSubCategorySet.MoveNext
  Loop
End Sub

Private Sub tvDataView_NodeClick(ByVal Node As MSComctlLib.Node)
  Dim strListViewSet As New ADODB.Recordset
  Dim strListCmd As New ADODB.Command
  Dim lstListViewItem As ListItem
  Dim booDone As Boolean
  
  'Set up List View
  lvDataView.ColumnHeaders.Clear
  lvDataView.View = lvwReport
  lvDataView.ColumnHeaders.Add 1, , "Part Number", 1250
  lvDataView.ColumnHeaders.Add 2, , "Description", 1250
  lvDataView.ColumnHeaders.Add 3, , "Quantity", 1200
  lvDataView.ColumnHeaders.Add 4, , "Price", 1150
  
  booDone = False
  strListCmd.ActiveConnection = strConnect
  strListCmd.CommandType = adCmdText
  strListCmd.CommandText = "SELECT * FROM tblInventory"
  Set strListViewSet = strListCmd.Execute
  Do Until (strListViewSet.EOF) Or (booDone = True)
  
    If Node.Text = strListViewSet("fldCategory") Then
      strListCmd.CommandText = "SELECT * FROM tblInventory WHERE fldCategory='" & Node.Text & "'"
      booDone = True
    ElseIf Node.Text = strListViewSet("fldSubCategory") Then
      strListCmd.CommandText = "SELECT * FROM tblInventory WHERE fldSubCategory='" & Node.Text & "'"
      booDone = True
    ElseIf Node.Text = "Departments" Then
      Exit Sub
    End If
    strListViewSet.MoveNext
  Loop
  
  lvDataView.ListItems.Clear
  strListViewSet.MoveFirst
  Set strListViewSet = strListCmd.Execute
  
  Do Until strListViewSet.EOF
    Set lstListViewItem = lvDataView.ListItems.Add()
    lstListViewItem.Text = strListViewSet("fldPartNumber")
    lstListViewItem.ListSubItems.Add , "Description", strListViewSet("fldDescription")
    lstListViewItem.ListSubItems.Add , "Quantity", strListViewSet("fldQuantity")
    lstListViewItem.ListSubItems.Add , "Price", strListViewSet("fldPrice")
    strListViewSet.MoveNext
  Loop
End Sub
