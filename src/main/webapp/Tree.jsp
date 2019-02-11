<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>树状结构</title>
    <%@ include file="/head.jsp" %>
</head>
<body>

<ul id="ttt"></ul>
<script type="text/javascript">
    $("#ttt").tree({
        url:"tree_data.json",
        lines:true
    });
</script>
<script type="text/javascript">
    $("#ttt").tree({
        onClick:function(node){
            alert(node.text);
        }
    });
</script>
</body>
</html>
