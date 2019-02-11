<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html >
<html>
<head>

    <meta charset="UTF-8">
    <title>Basic DataGrid - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/jquery-easyui-1.4.5/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/jquery-easyui-1.4.5/themes/icon.css">
    <script type="text/javascript" src="<%=path%>/jquery-1.11.2.js"></script>
    <script type="text/javascript" src="<%=path%>/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
    <script>
        $(function(){
            $("#datagrid").datagrid({

                url:'<%=path%>/userController/showAllUser.do',
                pagination:true,
                rownumbers:true,
                fitColumns:true,
                striped:true,
                nowrap: false,
                striped: true,
                collapsible: true,
                idField: 'id',
                remoteSort: false,
                frozenColumns:[[
                    { field: 'ck', checkbox: true }  ]],
                columns:[[
                    {field:'id',title:'id',width:100,hidden:true},
                    {field:'username',title:'username',width:100,align:'right'},
                    {field:'password',title:'password',width:100,align:'right'},
                    {field:'age',title:'年龄',width:100,align:'center',

                        formatter:function(value,row,index){

                            return '<a href="<%=path%>/userController/deletUser.do?id='+row.id+'" >删除</a>&nbsp;' +
                                '<a href="<%=path%>/userController/updateUser.do?id1='+row.id+'">修改</a>';
                        }
                    }
                ]]
            });
            $('#datagrid').datagrid({
                onLoadSuccess: function () {
                    $('.datagrid-toolbar').append($('#txtSearch'));
                    $('#txtSearch').show();
                },
                toolbar: [{
                    id: 'btnSearch',
                    text: '搜索',
                    disabled: false,
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#datagrid').datagrid('options').url = '<%=path%>/userController/likeSelect.do?news=' + escape($('#txtSearch').val());
                        $('#datagrid').datagrid("reload");
                    }

                },
                    {
                        iconCls: 'icon-no',
                        handler: function(){
                            var selRow = $("#datagrid").datagrid("getSelections");//将选的行提出来

                            if (selRow.length>0&&selRow!=null) {
                                var ids=new Array();
                                for (var int = 0; int < selRow.length; int++) {
                                    var id=selRow[int].id;
                                    ids.push(id);
                                }

                                if (confirm("确定要删除选中的吗?")) {
                                    location.href= "<%=path%>/userController/batchDelete.do?ids="+ids;

                                }

                            }else{
                                alter("请选择一行");

                            }




                        }
                    }
                ]
            });
        });
        function woai() {

            var test=$("#aa1").val();
            alert(test);
        }
    </script>
    <!-- <script type="text/javascript">
	function getUserAll() {
		alert(123);
		$.getJSON("<%=path%>/userController/showAllUser.do", function(json) {
			var html="";
			for (var i = 0; i <json.length; i++) {
				html+="<tr>";
				html+="<td>"+json[i].id+"</td>";
				html+="<td>"+json[i].name+"</td>";
				html+="<td>"+json[i].pwd+"</td>";
			    html+="<td><a href='<%=path%>/userController/deletUser.do?id="+json[i].id+"'>删除</a>&nbsp;
			    <a href='<%=path%>/userController/updateUser.do?id1="+json[i].id+"'>修改</a></td>" ;
				html+="</tr>";
			};
			  $("#FORLIST").append(html);
		});
	}</script> -->


</head>
<body>
<h1 style="padding-top: 10px;text-align:center">你好：${user.userName}</h1>
<a href="<%=path%>/showAllUser.jsp" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查看全部</a>
<a href="<%=path%>/addUser.jsp"class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加新用户</a>
<a href="<%=path%>/deletUser.jsp"class="easyui-linkbutton" data-options="iconCls:'icon-add'">删除用户</a>

<div id="datagrid" style="text-align:center;"> </div>
<div id="tb" hidden="hidden">
    <input class="easyui-textbox" data-options="iconCls:'icon-search'" style="display: none;" id="txtSearch" >
</div>

</body>
</html>