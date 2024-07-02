VERSION 5.00
Begin VB.Form frmPassword 
   Caption         =   "Enter Password"
   ClientHeight    =   1500
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3120
   LinkTopic       =   "Form1"
   ScaleHeight     =   1500
   ScaleWidth      =   3120
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   1680
      TabIndex        =   2
      Top             =   840
      Width           =   975
   End
   Begin VB.CommandButton cmdLogin 
      Caption         =   "Login"
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   840
      Width           =   975
   End
   Begin VB.TextBox txtPassword 
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   360
      PasswordChar    =   "X"
      TabIndex        =   0
      Tag             =   "visualbasic1005"
      Top             =   240
      Width           =   1935
   End
End
Attribute VB_Name = "frmPassword"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'frmPassword
Dim intCount As Integer
Private Sub cmdLogin_Click()
  If txtPassword.Text = txtPassword.Tag Then
    frmGreet.Show
    Unload Me
  Else
    If intCount > 2 Then
      MsgBox "Out of quarters"
      End
    Else
      MsgBox "Try Again"
      intCount = intCount + 1
    End If
  End If
End Sub

Private Sub Form_Load()
  intCount = 0
End Sub
