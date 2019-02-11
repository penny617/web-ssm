<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>省市联动</title>
    <%@ include file="/head.jsp" %>

</head>
<body>
你所在的城市：
<input id="cc" name="city" value="广州" />

<script type="text/javascript">
    $("#cc").combobox({
        //url表示引入json文件的路径
        //textField表示在下拉框中看得见的内容,<option>长沙</option>
        //valueField表示在下拉框中看不见的内容，用于向后台传递数据<option value="cs">长沙</option>
        url : "combobox_data.json",
        valueField : "id",
        textField : "text"
    });
</script>
</body>
</html>
