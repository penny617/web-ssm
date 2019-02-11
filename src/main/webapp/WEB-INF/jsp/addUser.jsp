<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>添加用户</title>
</head>
<body>
<form action="<%=path%>/userController/addUser.do" method="post" style="text-align:center" >
    账号：<input type="text" name="username" /><br>
    密码 ：<input type="password" name="password" /><br>
    <input type="submit" value="确定" />
</form>
</body>
</html>
