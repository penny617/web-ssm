<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>消息窗口</title>
    <%@ include file="/head.jsp" %>
</head>
<body>
<input type="button" value="警告框"/>
<input type="button" value="确认框"/>
<input type="button" value="输入框"/>
<input type="button" value="显示框"/>
<hr/>
<div style="margin:200px"></div>
<script type="text/javascript">
    $(":button").click(function(){
        var tip = $(this).val();
        tip = $.trim(tip);
        if("警告框" == tip){
            $.messager.alert("警告框","没有时间了","warning");
        }else if("确认框" == tip){
            $.messager.confirm("确认框","确认关闭窗口吗?",function(flag){
                alert(flag);
            });
        }else if("输入框" == tip){
            $.messager.prompt("输入框","你的校验问题名?",function(value){
                alert(value);
            });
        }else if("显示框" == tip){
            $.messager.show({
                title:"显示框",
                msg:"信息显示，时间为5秒",
                showType:"fade",
                width:200,
                height:200,
                timeout:5000  //5秒后消失
            });
        }
    });
</script>
</body>
</html>
