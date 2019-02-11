<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/head.jsp" %>
    <title>Login</title>
</head>
<body>
<div style="margin:100px"></div>
用户名:&nbsp;
<input id="vv" />   <!-- 因为在下面js代码中声明了这是个验证框【 $("#vv").validatebox({}) 】，所以可以不加class="",否则需要加上【参考 #pwd】   -->
<p/>
密&nbsp;&nbsp;码：
<input id="pwd" name="password" type="password" class="easyui-validatebox"
       data-options="required:true" /><p/>
验证密码：
<input id="rpwd" name="password" type="password" class="easyui-validatebox"
       required="required" validType="equals['#password']" /><p/>

邮&nbsp;&nbsp;箱：
<input id="email" />
<script type="text/javascript">
    $("#vv").validatebox({    //声明了这是个验证框,且增加语法限制
        required : true,
        validType : [ "length[1,4]", "zhongwen" ]
        //设置了字符长度限制，中文规则自定义
    });

    $("#email").validatebox({
        required : true,
        validType : [ "length[1,30]", "email" ]       //email规则已经实现,无序自定义
    });
</script>

<script type="text/javascript">
    //自定义验证规则
    $.extend($.fn.validatebox.defaults.rules, {
        zhongwen : {
            validator : function(value) {//value表示在文本框中输入的内容
                if (/^[\u3220-\uFA29]+$/.test(value)) {
                    return true;
                }
            },
            message : "用户名必须填中文"
        },
        equals : {
            validator : function(value, param) {
                return value == $(param[0]).val();
            },
            message : "密码不匹配"
        }
    });
</script>
</body>
</html>
