<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>UserSystem</title>

    <!--引入默认CSS文件 -->
    <link type="text/css" rel="stylesheet" href="/easyui/themes/default/easyui.css" />
    <!--引入默认图片CSS文件 -->
    <link type="text/css" rel="stylesheet" href="/easyui/themes/icon.css" />
    <!--引入JQuery文件 -->
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <!--引入EasyUI文件 -->
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <!--引入EasyUI本地化汉语支持文件 -->
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>

</body>
</html>
