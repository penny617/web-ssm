<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>示例管理</title>
    <script
            <%@ include file="/head.jsp" %>
    <style>
        body {
            padding: 0;
            margin: 0
        }
    </style>
</head>
<body>
<div class="easyui-layout" style="width: 100%; height: 100%;">
    <div data-options="region:'north'"  class="query-panel"  title="查询条件" style="height: 80px;">
        <form id="demoModelForm_Query" method="post">
            <label>姓名：</label><input class="easyui-textbox" style="width: 110px" name="name">
            <label>地址：</label><input class="easyui-textbox" style="width: 110px" name="address">
            <label>身份证：</label><input class="easyui-textbox"style="width: 110px" name="cardNo">
            <input type="hidden" name="rule" value="name*eq@address*eq@cardNo*eq">
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search"
               onclick='javascript:$("#grid_demoModel").datagrid("load",jQuery("#demoModelForm_Query").serializeObject());'>查询</a>
        </form>
    </div>
    <div data-options="region:'center',title:'示例列表'">
        <table id="grid_demoModel"></table>
        <div id="dialog_demoModel" class="easyui-dialog"
             style="width: 400px; height: 280px; padding: 10px 20px;"
             closed="true">
            <form id="demoModelForm_Manager">
                姓名:<input name="name" class="easyui-validatebox textbox"
                          style="width: 150px" data-options="required:true  "><br>
                地址:<input name="address" class="easyui-validatebox textbox"
                          style="width: 150px" data-options="required:true  "><br>
                身份证:<input id="uniquecardNo" name="cardNo"
                           class="easyui-validatebox textbox" style="width: 150px"
                           data-options="required:true">
            </form>
        </div>
    </div>
</div>
</body>
</html>