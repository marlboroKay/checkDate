<%
Function formatDate(Byval t,Byval ftype)  
dim y, m, d, h, mi, s  
formatDate="" 
If IsDate(t)=False Then Exit Function 
y=cstr(year(t))  
m=cstr(month(t))  
If len(m)=1 Then m="0" & m  
d=cstr(day(t))  
If len(d)=1 Then d="0" & d  
h = cstr(hour(t))  
If len(h)=1 Then h="0" & h  
mi = cstr(minute(t))  
If len(mi)=1 Then mi="0" & mi  
s = cstr(second(t))  
If len(s)=1 Then s="0" & s  
select case cint(ftype)  
case 1  
' yyyy-mm-dd  
formatDate=y & "-" & m & "-" & d  
case 2  
' yy-mm-dd  
formatDate=right(y,2) & "-" & m & "-" & d  
case 3  
' mm-dd  
formatDate=m & "-" & d  
case 4  
' yyyy-mm-dd hh:mm:ss  
formatDate=y & "-" & m & "-" & d & " " & h & ":" & mi & ":" & s  
case 5  
' hh:mm:ss  
formatDate=h & ":" & mi & ":" & s  
case 6  
' yyyy年mm月dd日  
formatDate=y & "年" & m & "月" & d & "日" 
case 7  
' yyyymmdd  
formatDate=y & m & d  
case 8  
'yyyymmddhhmmss  
formatDate=y & m & d & h & mi & s  
end select  
End Function
%>