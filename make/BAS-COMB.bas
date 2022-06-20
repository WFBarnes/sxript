$Console
_Dest _Console
_Source _Console
$ScreenHide
$Console:Only

Dim LineList(10000) As String
CmdNum = _CommandCount

Print "Combining files..."
k = 0

For j = 1 To CmdNum - 1
    Open Command$(j) For Input As #1
    k = k + 1
    LineList(k) = "' BEGIN " + Command$(j)
    Do While Not EOF(1)
        Line Input #1, a$
        k = k + 1
        LineList(k) = a$
    Loop
    Close #1
    k = k + 1
    LineList(k) = ""
Next

Open Command$(CmdNum) For Output As #1
For n = 1 To k
    Print #1, LineList(n)
Next
Close #1

System

