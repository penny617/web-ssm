<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <%@ include file="/head.jsp" %>
    <title>我的用户展示页面</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
  </head>

<body>
<form action="/userController/showUser.do" method="post">
    <table class="dv-table" style="width:100%;background:#fafafa;padding:5px;margin-top:5px;">
        <tr>
            <td>userName</td>
            <td><input name="username" class="easyui-validatebox" required="true"></input></td>
            <td>password</td>
            <td><input name="password" class="easyui-validatebox" required="true"></input></td>
        </tr>
        <tr>
            <td>age</td>
            <td><input name="age"></input></td>
            <td>email</td>
            <td><input name="email" class="easyui-validatebox" validType="email"></input></td>
        </tr>
    </table>
    <div style="padding:5px 0;text-align:right;padding-right:30px">
        <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="addUser()">add</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="deletUser()">delet</a>
    </div>
</form>
</body>
</html>