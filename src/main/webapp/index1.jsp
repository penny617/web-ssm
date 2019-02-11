<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>展示</title>
    <%@ include file="/head.jsp" %>
</head>
<body>
<h2>CRUD DataGrid</h2>
<p>Double click the row to begin editing.</p>

<table id="id" title="User" style="width:700px;height:250px"
       toolbar="#toolbar" pagination="true" idField="id"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="id" width="50" editor="{type:'validatebox',options:{required:true}}">id</th>
        <th field="username" width="50" editor="{type:'validatebox',options:{required:true}}">userName</th>
        <th field="password" width="50" editor="{type:'validatebox',options:{required:true}}">password</th>
        <th field="age" width="50" editor="{type:'validatebox',options:{required:true}}">age</th>
        <th field="email" width="50" editor="{type:'validatebox',options:{required:true,validType:'email'}}">email</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#id').datagrid('addUser')">New</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#id').datagrid('destroyUser')">Destroy</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#id').datagrid('updateUser')">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#id').datagrid('deletUser')">delet</a>
</div>
<script type="text/javascript">
    $(function(){
        $('#id').datagrid({
            url: 'showUser.do',
            saveUrl: 'addUser.do',
            updateUrl: 'updateUser.jsp',
            destroyUrl: 'deletUser.jsp'
        });
    });
</script>
</body>
</html>
