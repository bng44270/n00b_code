VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsBarcelona"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Barcelona House Class

Implements clsHouse

Dim strAddress As String
Dim intGarageCount As Integer
Dim intRooms As Integer
Dim curPrice As Currency
Const dblPrice = 120000
Private Sub Class_Initialize()
  strAddress = ""
  intGarageCount = 0
  intRooms = 0
  curPrice = 0
End Sub

Property Let clsHouse_Name(strN As String)
  strAddress = strN
End Property

Property Get clsHouse_Name() As String
  clsHouse_Name = strAddress
End Property

Property Let clsHouse_GarageCount(intGC As Integer)
  If intGC < 2 And intGC > 3 Then
    Exit Property
  Else
    intGarageCount = intGC
  End If
End Property

Property Get clsHouse_GarageCount() As Integer
  clsHouse_GarageCount = intGarageCount
End Property

Property Let clsHouse_Rooms(intR As Integer)
  If intR < 1 And intR > 2 Then
    Exit Property
  Else
    intRooms = intR
  End If
End Property

Property Get clsHouse_Rooms() As Integer
  clsHouse_Rooms = intRooms
End Property

Function Calc_Price() As Currency
  If intGC = 3 Then
    CalcHousePrice = CCur(dblPrice + 1500)
  Else
    CalcHousePrice = CCur(dblPrice)
  End If
  
  curPrice = CalcHousePrice
  Calc_Price = curPrice
End Function
