<!--#include file = "aspdate.asp"-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>checkDate</title>
    <style>
        html, body {
            margin: 0;
            padding: 0;
        }

        .form_control {
            /* display: block;
            width: 100%;
            height: 34px; */
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857;
            color: #555;
            background-color: #FFF;
            background-image: none;
            border: 1px solid #CCC;
            border-radius: 4px;
            box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset;
            transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
            background: #FFF url("img/datePicker.gif") no-repeat scroll 100% 33%;
            width: 100px;
        }

        .form_control:focus {
            border-color: #66AFE9;
            outline: 0px none;
            box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(102, 175, 233, 0.6);
        }

        #para_week{
        		color: red;
        	}
    </style>
</head>
<body>

    <%
      Dim Date1
      if day(now) = 1 then
      date1 = date()
      Else
        date1 = Date()-day(Date()-1)
      end if
    %>

    <p>
        开始日期:<input class="form_control" type="text"  id="ldate" name="Ldate"
                    placeholder="<% =formatdate(date1,1)%>" style="padding-top:3px; margin: 10px 36px 0 0px;">
    </p>
    <p>
        结束日期:<input class="form_control" type="text"  id="edate" name="Ldate"
                    placeholder="<% =formatdate(GetLastDate(date1),1)%>" placeholder=style="padding-top:3px;margin: 10px
                    36px 0 0px;">
    </p>

<script  src = "js/checkDate.js"></script>
<script >
    addLoadEvent(checkdate);
    function checkdate(){
            var ldate = g('ldate');
            var edate = g('edate');
            ldate.onblur = function(){
                IsDate(ldate);
            }
            edate.onblur = function(){
                IsDate(edate);
            }
        }
</script>
</body>
</html>

<%
public function GetLastDate(ldate)

dim o_date

o_date = dateadd("m",1,ldate)

GetLastDate = dateadd("d",-1,o_date)

GetLastDate = replace(GetLastDate,"/","-")

end function


%>