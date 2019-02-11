<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>进度条</title>
    <%@ include file="/head.jsp" %>
</head>
<body>
进度条：
<div id="p" style="width:400px;"></div>

<script type="text/javascript">
    $("#p").progressbar({
        width : "auto",
        height : 22,
        value : 0
    });
</script>

<input type="button" value="开始" style="font-size:11px" />

<script type="text/javascript">
    var timeID = null;

    //随机产生1-9之间的整数，包含1和9
    function getNum() {
        return Math.floor(Math.random() * 9) + 1;
    }

    $(":button").click(function() {
        timeID = window.setInterval(function() {
            //获取随机数，例如：9
            var num = getNum();
            //获取进度条当前值，例如：99
            var value = $("#p").progressbar("getValue");
            //如果随机数加当前值小于100的话
            if (value + num < 100) {
                //填充进度条当前值
                $("#p").progressbar("setValue", value + num);
            } else {
                //将进度条当前值设置为100
                $("#p").progressbar("setValue", 100);
                //停止定时器
                window.clearInterval(timeID);
                //将"开始"按钮生效
                $(":button").removeAttr("disabled");
            }
        }, 200);

        //将"开始"按钮失效
        $(this).attr("disabled", "disabled");
    });
</script>
</body>
</html>
