VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsRange"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Dim down As Integer
Dim up As Integer

Public Property Let Top(t As Integer)
  up = t
End Property
Public Property Get Top() As Integer
  Top = up
End Property
Public Property Let Bottom(b As Integer)
  down = b
End Property
Public Property Get Bottom() As Integer
  Bottom = down
End Property

Function inRange(ByVal test As Integer) As Boolean
  If (test <= Top) And (test >= Bottom) Then
    inRange = True
  Else
    inRange = False
  End If
End Function
