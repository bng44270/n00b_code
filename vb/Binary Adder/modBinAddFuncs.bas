Attribute VB_Name = "modBinAddFuncs"
Function DecodeBin(ByRef intBin() As Integer) As Integer
  Dim DecTmp As Integer
  
  DecTmp = 0
  
  If intBin(7) = 1 Then
    DecTmp = DecTmp + 128
  End If
  If intBin(6) = 1 Then
    DecTmp = DecTmp + 64
  End If
  If intBin(5) = 1 Then
    DecTmp = DecTmp + 32
  End If
  If intBin(4) = 1 Then
    DecTmp = DecTmp + 16
  End If
  If intBin(3) = 1 Then
    DecTmp = DecTmp + 8
  End If
  If intBin(2) = 1 Then
    DecTmp = DecTmp + 4
  End If
  If intBin(1) = 1 Then
    DecTmp = DecTmp + 2
  End If
  If intBin(0) = 1 Then
    DecTmp = DecTmp + 1
  End If
  
  DecodeBin = DecTmp
End Function
