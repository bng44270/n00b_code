VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "BitStatus"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Dim intBitState As Integer

Public Property Let State(intState As Integer)
  If (intState = 1) Or (intState = 0) Then
    intBitState = intState
  End If
End Property

Public Property Get State() As Integer
  State = intBitState
End Property

Private Sub Class_Initialize()
  intBitState = 0
End Sub
