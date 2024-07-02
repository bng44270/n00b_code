VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsHouse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Name
Property Let Name(strN As String)
  
End Property

Property Get Name() As String
  
End Property

'Garage Count
Property Let GarageCount(intGC As Integer)
  
End Property

Property Get GarageCount() As Integer

End Property

'Rooms
'1 = 4 Rooms
'2 = 3 Rooms and Den
'3 = 2 Rooms, Den, and Master Suite
Property Let Rooms(intR As Integer)
  
End Property

Property Get Rooms() As Integer

End Property

