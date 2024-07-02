VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsMachineCode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Dim oc As Byte

Public Property Get BinaryValue() As String
  Dim sBinVal As String
  Dim iOCTmp As Integer
   
  iOCTmp = oc

  If iOCTmp >= 128 Then
    iOCTmp = iOCTmp - 128
    sBinVal = "1"
  Else
    sBinVal = "0"
  End If
  
  If iOCTmp >= 64 Then
    iOCTmp = iOCTmp - 64
    sBinVal = sBinVal & "1"
  Else
    sBinVal = sBinVal & "0"
  End If
   
  If iOCTmp >= 32 Then
    iOCTmp = iOCTmp - 32
    sBinVal = sBinVal & "1"
  Else
    sBinVal = sBinVal & "0"
  End If
  
  If iOCTmp >= 16 Then
    iOCTmp = iOCTmp - 16
    sBinVal = sBinVal & "1"
  Else
    sBinVal = sBinVal & "0"
  End If
  
  If iOCTmp >= 8 Then
    iOCTmp = iOCTmp - 8
    sBinVal = sBinVal & "1"
  Else
    sBinVal = sBinVal & "0"
  End If
  
  If iOCTmp >= 4 Then
    iOCTmp = iOCTmp - 4
    sBinVal = sBinVal & "1"
  Else
    sBinVal = sBinVal & "0"
  End If
  
  If iOCTmp >= 2 Then
    iOCTmp = iOCTmp - 2
    sBinVal = sBinVal & "1"
  Else
    sBinVal = sBinVal & "0"
  End If
  
  If iOCTmp = 1 Then
    sBinVal = sBinVal & "1"
  Else
    sBinVal = sBinVal & "0"
  End If
  
  BinaryValue = sBinVal
End Property


Public Property Get BinLN() As String
  Dim iLN As Integer
  Dim sLN As String
  
  iLN = oc / 16
  
  If iLN >= 8 Then
    iLN = iLN - 8
    sLN = "1"
  Else
    sLN = "0"
  End If
  
  If iLN >= 4 Then
    iLN = iLN - 4
    sLN = sLN & "1"
  Else
    sLN = sLN & "0"
  End If
  
  If iLN >= 2 Then
    iLN = iLN - 2
    sLN = sLN & "1"
  Else
    sLN = sLN & "0"
  End If
  
  If iLN = 1 Then
    sLN = sLN & "1"
  Else
    sLN = sLN & "0"
  End If
  
  BinLN = sLN
End Property



Public Property Get BinUN() As String
  Dim iUN As Integer
  Dim sUN As String
  
  iUN = oc / 16
  
  If iUN >= 8 Then
    iUN = iUN - 8
    sUN = "1"
  Else
    sUN = "0"
  End If
  
  If iUN >= 4 Then
    iUN = iUN - 4
    sUN = sUN & "1"
  Else
    sUN = sUN & "0"
  End If
  
  If iUN >= 2 Then
    iUN = iUN - 2
    sUN = sUN & "1"
  Else
    sUN = sUN & "0"
  End If
  
  If iUN = 1 Then
    sUN = sUN & "1"
  Else
    sUN = sUN & "0"
  End If
  
  BinUN = sUN
End Property

Public Property Get HexValue() As String
  HexValue = Hex$(oc)
End Property

Public Property Get OpCode() As Byte
  OpCode = oc
End Property

Public Property Let OpCode(op As Byte)
  oc = op
End Property
