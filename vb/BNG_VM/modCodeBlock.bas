Attribute VB_Name = "modCodeBlock"
Option Base 0
'Stack -- Holds bytecode to be executed
Dim CodeStack(255) As clsMachineCode
'Memory -- 1K of holding space for data
Dim Memory(1023) As clsMachineCode
'Registers
Dim GPRegs(4) As clsMachineCode
Dim OFRegs(4) As clsMachineCode
Dim SegRegs(4) As clsMachineCode
Dim MemPtr(2) As clsMachineCode  '11 of 16 bits used
Dim StkPtr As Integer
  
Sub InitMachine()
  Dim i As Integer
   
  For i = 0 To 255
    CodeStack(i) = 0
  Next i
  StkPtr = 1023
End Sub
  
Sub ParseCode(bc As clsMachineCode)
  Dim param(5) As Byte
  Select Case bc.OpCode
    Case 0
      
      
End Sub

Private Function PopInst() As Byte
  
End Function



