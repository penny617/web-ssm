<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>日期选择</title>
    <%@ include file="/head.jsp" %>
</head>
<body>
入职时间：<input id="dd" type="text"></input>
<script type="text/javascript">
    $("#dd").datebox({
        required:true
    });
</script>
<script type="text/javascript">
    $("#dd").datebox({
        onSelect:function(date){
            alert(date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate());
        }
    });
</script>
</body>
</html>
