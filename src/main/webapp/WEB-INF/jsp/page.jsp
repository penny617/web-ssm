<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserPage</title>
</head>
<body>
<script>

    #parse("ui:path")
    jQuery(document).ready(function(){
        client.initView();
    });
    var client = {
        grid:null,
        updateEntity:false,
        initView:function(){
            var me = this;
            var toolbar = me.createToolbar();
            var grid = me.initGrid({toolbar:toolbar,url:'${path}/ssm/userController/page.do'});
        },
        initGrid:function(param){
            this.grid = jQuery("#grid_userController").datagrid({
                url:param.url,
                pagination:true,
                singleSelect:true,
                fit:true,
                fitColumns:true,
                toolbar:param.toolbar,
                columns:[[
                    {field:'name',title:'姓名' },
                    {field:'address',title:'地址' },
                    {field:'cardNo',title:'身份证' }
                    ]]
            });
            return this.grid;
        },
        openInsertDialog:function(){
            var me = this;
            me.updateEntity = false;
            jQuery("#uniquecardNo").attr("readonly",false);
            me.clearForm();
            me.setDialog({name:'#dialog_demoModel',button:me.executeButton(),title:'新增示例'});
        },
        openMergerDialog:function(){
            var me = this;
            var row = jQuery("#grid_demoModel").datagrid("getSelected");
            if (row) {
                me.updateEntity = true;
                jQuery("#uniquecardNo").attr("readonly",true);
                me.setDialog({name:'#dialog_demoModel',button:me.executeButton(),title:'修改示例'});
                me.clearForm();
                jQuery("#demoModelForm_Manager").form("load", row);
            }

        },
        openRemoveConfirm:function(){
            var row = jQuery("#grid_demoModel").datagrid("getSelected");
            if (row) {
                jQuery.messager.confirm('系统提示', '是否删除？', function (r) {
                    if (r) {
                        var rtn = server.deleteObject(row);
                        if(rtn.STATU == '801'){
                            client.reload();
                        }
                    }
                });
            }
        },
        executeButton:function(){
            var me = this;
            return [{
                text:'保存',
                iconCls:'icon-save',
                handler:function(){
                    var obj = jQuery("#demoModelForm_Manager").serializeObject();
                    if(obj.cardNo){
                        var codecardNo = server.uniqueCode({cardNo:obj.cardNo,rule:'cardNo*eq'});
                        $('#uniquecardNo').tooltip("hide");
                        if(codecardNo&&!me.updateEntity){
                            $('#uniquecardNo').tooltip({
                                position: 'right',
                                content: '<span style="color:#000000">该编码已被占用.</span>',
                                onShow: function(){
                                    $(this).tooltip('tip').css({
                                        borderColor: 'red'
                                    });
                                }
                            }).tooltip("show");
                            return;
                        }
                    }
                    var validate = jQuery("#demoModelForm_Manager").form('enableValidation').form('validate');
                    if(validate){
                        if(me.updateEntity){
                            var row = jQuery("#grid_demoModel").datagrid("getSelected");
                            obj['id'] = row.id;
                        }
                        var rtn = server.saveOrUpdate(obj);
                        if(rtn.STATU == '801'){
                            me.reload();
                        }
                        me.dialogControl({dialog:'#dialog_userController',control:'close'});
                    }
                }
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:function(){
                    me.dialogControl({dialog:'#dialog_userController',control:'close'});
                }
            }];
        },
        reload:function(){
            var me = this;
            me.grid.datagrid("load");
        },
        setDialog:function(param){
            jQuery(param.name).dialog({
                modal:true,
                buttons:param.button
            }).dialog('open').dialog('setTitle', param.title);
        },
        createToolbar:function(){
            var btns = server.btns();
            var toolbar = [];
            jQuery.each(btns,function(i,n){
                with(n){
                    toolbar.push({text:btnName,iconCls:icon,handler:function(){eval(fun);}});
                }
            });
            return toolbar;
        },
        clearForm:function(){
            jQuery("#demoModelForm_Manager").form('clear');
        },
        dialogControl:function(param){
            jQuery(param.dialog).dialog(param.control);
        }
    };
    var server = {
        btns:function(){
            var btns = [
                {btnId:'1',btnName:'新增',icon:'icon-add',enabled:'Y',fun:'client.openInsertDialog();'},
                {btnId:'2',btnName:'编辑',icon:'icon-edit',enabled:'Y',fun:'client.openMergerDialog();'},
                {btnId:'3',btnName:'删除',icon:'icon-remove',enabled:'Y',fun:'client.openRemoveConfirm();'}];
            return btns;
        },
        saveOrUpdate:function(param){
            var rtn = null;
            jQuery.ajax({
                type: "POST",
                data: param,
                cache:false,
                async:false,
                url: "${path}/ssm/userController/sou.do",
                success: function(msg){
                    rtn = msg;
                }
            });
            return rtn;
        },
        deleteObject:function(param){
            var rtn = null;
            jQuery.ajax({
                type: "POST",
                cache:false,
                async:false,
                data: param,
                url: "${path}/ssm/userController/delete.do",
                success: function(msg){
                    rtn = msg;
                }
            });
            return rtn;
        },
        uniqueCode:function(param){
            var rtn = false;
            jQuery.ajax({
                type: "POST",
                cache:false,
                async:false,
                data: param,
                url: "${path}/ssm/userController/findAll.do",
                success: function(msg){
                    rtn = false;
                    if(msg.ReturnObjs.length>0){
                        rtn = true;
                    }
                }
            });
            return rtn;
        }
    };


</script>
</body>
</html>
