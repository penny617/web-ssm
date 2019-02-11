<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品数量微调</title>
    <%@ include file="/head.jsp" %>
</head>
<body>
购买数量：
<input id="ss" class="easyui-numberspinner" style="width:100px" />

<script type="text/javascript">
    $("#ss").numberspinner({
        value : 1,
        min : 1,
        max : 100,
        editable : true
        //默认可编辑
    });
</script>
<p />
你一共购买了
<span id="num">1</span>件商品。。。

<script type="text/javascript">
    $("#ss").numberspinner({
        onSpinUp : function() {
            //获取数字微调的当前值
            var value = $("#ss").numberspinner("getValue");
            $("#num").text(value).css("color", "red");
            //如果value值为100
            if (value == 100) {
                $("span:first").html("商品已满，不能再购买了").css("color", "blue");
                $("input:first").attr("disabled", "disabled");
            }
        },

        onSpinDown : function() {
            //获取数字微调的当前值
            var value = $("#ss").numberspinner("getValue");
            $("#num").text(value).css("color", "blue");
            //如果value值小于100
            if (value < 100) {
                $("span:first").html("");
                $("input:first").removeAttr("disabled");
            }
        }

    });
</script>

<script type="text/javascript">
    $("#ss").keyup(function(xxx) {
        //将浏览器产生的事件对象设置到myevent变量中
        var myevent = xxx;
        //获取按键的unicode码
        var code = myevent.keyCode;
        var value = $(this).val();
        //如果按钮是回车
        if (code == 13 && value<100 && value>1) {  //添加一些约束
            $("#num").text(value).css("color", "red");
        }
    });
</script>

</body>
</html>
