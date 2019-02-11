<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <title>修改页面</title>
</head>u

<body>
<form action="<%=path%>/userController/updateUser.do" method="post" style="text-align:center" >
    姓名：<input type="text" name="name" value="${user.name}">
    账号：<input type="text" name="address" value="${user.address}"/><br>
    密码 ：<input type="text" name="cardNo" value="${user.cardNo}" /><br>
    <input type="submit" value="确定" />
</form> <br>
</body>
</html>