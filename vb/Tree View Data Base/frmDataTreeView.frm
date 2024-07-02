VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form frmDataTreeView 
   Caption         =   "Form1"
   ClientHeight    =   4605
   ClientLeft      =   2220
   ClientTop       =   2715
   ClientWidth     =   7305
   LinkTopic       =   "Form1"
   ScaleHeight     =   4605
   ScaleWidth      =   7305
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
      Connect         =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=U:\vb\Tree View Data Base\Inv.mdb;Persist Security Info=False"
      OLEDBString     =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=U:\vb\Tree View Data Base\Inv.mdb;Persist Security Info=False"
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
   Begin ComctlLib.TreeView tvDataView 
      Height          =   3735
      Left            =   120
      TabIndex        =   0
      Top             =   840
      Width           =   2895
      _ExtentX        =   5106
      _ExtentY        =   6588
      _Version        =   327682
      Style           =   7
      Appearance      =   1
   End
   Begin ComctlLib.ListView lvDataView 
      Height          =   3735
      Left            =   3120
      TabIndex        =   1
      Top             =   840
      Width           =   4095
      _ExtentX        =   7223
      _ExtentY        =   6588
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      MouseIcon       =   "frmDataTreeView.frx":0000
      NumItems        =   3
      BeginProperty ColumnHeader(1) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         Key             =   "colPartNum"
         Object.Tag             =   ""
         Text            =   "Part Number"
         Object.Width           =   35
      EndProperty
      BeginProperty ColumnHeader(2) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   1
         Key             =   "colQuantity"
         Object.Tag             =   ""
         Text            =   "Quantity"
         Object.Width           =   35
      EndProperty
      BeginProperty ColumnHeader(3) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   2
         Key             =   "colPrice"
         Object.Tag             =   ""
         Text            =   "Price"
         Object.Width           =   35
      EndProperty
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
      Left            =   3120
      TabIndex        =   3
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
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   2895
   End
   Begin ComctlLib.ImageList ilSmallDataIcons 
      Left            =   0
      Top             =   240
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   5
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmDataTreeView.frx":031A
            Key             =   "PlumbSmall"
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmDataTreeView.frx":055C
            Key             =   "ClosedFolder"
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmDataTreeView.frx":079E
            Key             =   "OpenFolder"
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmDataTreeView.frx":09E0
            Key             =   "ElecSmall"
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmDataTreeView.frx":0C22
            Key             =   "ToolSmall"
         EndProperty
      EndProperty
   End
   Begin ComctlLib.ImageList ilBigDataIcons 
      Left            =   6600
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   5
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmDataTreeView.frx":0E64
            Key             =   "ElecBig"
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmDataTreeView.frx":10A6
            Key             =   "ClosedFolder"
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmDataTreeView.frx":12E8
            Key             =   "OpenFolder"
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmDataTreeView.frx":152A
            Key             =   "PlumbBig"
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmDataTreeView.frx":176C
            Key             =   "ToolBig"
         EndProperty
      EndProperty
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
Dim nodCurrentNode As Node
'Database strings
Dim strConnect As New ADODB.Connection
Dim strCommand As New ADODB.Command
Dim strRecordSet As New ADODB.Recordset


Private Sub Form_Load()
  '*****************************
  'Set up tree view
  '*****************************
  'Connect to DB
  strConnect.ConnectionString = adoInventory.ConnectionString
  strConnect.Open
  strCommand.ActiveConnection = strConnect
  strCommand.CommandType = adCmdText
  strRecordSet.ActiveCommand = strCommand
  strRecordSet.ActiveConnection = strConnect
  strRecordSet.MoveFirst
  'Set image list for Tree View
  tvDataView.ImageList = ilSmallDataIcons
  'Set Root node
  Set nodRoot = tvDataView.Nodes.Add(, , "Root", "Departments", "ClosedFolder", "OpenFolder")
  'Set up Root folder nodes
  Do Until strRecordSet.EOF
    Set nodCurrentNode = tvDataView.Nodes.Add(nodRoot, tvwChild)
    nodCurrentNode.Text = strRecordSet("fldCategory")
    Call InitCategory(nodCurrentNode, strRecordSet("fldCategory"))
  Loop
End Sub

Sub InitCategory(nodParent As Node, strCategory As String)
  strCommand.CommandText = "SELECT DISTINCT fldCategory FROM tblInventory"
  strRecordSet = strCommand.Execute
  Do Until strRecordSet.EOF
    Set nodCurrentNode = tvDataView.Nodes.Add(nodParent, tvwChild)
    nodCurrentNode.Text = strRecordSet("fldCategory")
    'Call sub category
End Sub
