<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>企业金融运营管理系统</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/easyui/themes/blue/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/easyui/themes/icon.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-1.8.1.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/easyui/easyuiExtend.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/easyui/easyui-lang-zh_CN.js"></script>
		<script src="${pageContext.request.contextPath}/resources/plugin/js/jquery-ui.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>

	<body>
	<div class="easyui-panel" data-option="fit:true" title="APP版本管理" style="padding:10px" >
		<table>
			<tr>
				<td>客户端类型:</td>
				<td>
					<select id="platform" name="platform" onchange="reloadDataGrid('dg')">
						<option value="ANDROID" selected="selected">ANDROID</option>
						<option value="IOS">IOS</option>
					</select>
				</td>
			</tr>
		</table>
	<table id="dg"></table>  
	</div>
	
		
	</body>
<script type="text/javascript">
function reloadDataGrid(tableId){

	//先清空当前页面数据
	var item = $('#'+tableId).datagrid('getRows');
	if (item) {
		for (var i = item.length - 1; i >= 0; i--) {
			var index = $('#'+tableId).datagrid('getRowIndex', item[i]);
			$('#'+tableId).datagrid('deleteRow', index);
		}
	}

	$('#'+tableId).datagrid({
		url:'<%=request.getContextPath()%>/appversion/list/'+$("#platform").val(),
		pageNumber:1
	});
}
var toolbar = [
{
    text: '新增',
    iconCls: 'icon-add',
    handler: function () {window.location.href="<%=request.getContextPath()%>/appversion/add"; }
}, {
    text: '修改',
    iconCls: 'icon-edit',
    handler: function () {
    	var row = $("#dg").datagrid('getSelections');
    	if(row.length==1){
    		var id=row[0].id;
    		window.location.href="<%=request.getContextPath()%>/appversion/edit/"+id;
    	}else{
    		alert("请选择一行");
    	}
    }

},{text: '删除',
		iconCls: 'icon-cut',
		handler: function () {
			var row = $("#dg").datagrid('getSelections');
			if(row.length==1){
				var msg = "您真的确定要删除吗?";
				if (confirm(msg)!=true){
					return;
				}
				var id=row[0].id;
				var deleteUrl = "${pageContext.request.contextPath}/appversion/delete/"+id;
				$.ajax({
					url:deleteUrl,
					dataType:"json",
					type:"post",
					success:function(data){
						alert(data.msg);
						if(data.isSuccess == true){
							//重新加载数据
							window.location.href="<%=request.getContextPath()%>/appversion/list";
						}
					},
					error:function(data){
						alert("删除失败");
					}
				});
			}else{
				alert("请选择一行");
			}
		}}/*,{text: '测试',
		iconCls: 'icon-cut',
		handler: function () {
			var row = $("#dg").datagrid('getSelections');
			if(row.length==1){
				var id=row[0].id;
				var deleteUrl = "${pageContext.request.contextPath}/appversion/test/"+3;
				/!*$.ajax({
					url:deleteUrl,
					dataType:"json",
					type:"post",
					success:function(data){
						alert(data.msg);
						if(data.isSuccess == true){
							//重新加载数据
							window.location.href="<%=request.getContextPath()%>/appversion/list";
						}
					}
				});*!/
				$.post(deleteUrl,function(data){
					alert(data.msg);
				});


			}else{
				alert("请选择一行");
			}
		}}*/

];
	$('#dg').datagrid({    
    url:'<%=request.getContextPath()%>/appversion/list/'+$("#platform").val(),
    columns:[[ 
		{field:'id',title:'编号',checkbox:true},
		{field:'url',title:'下载地址',
			formatter: function(value,row,index){
				return "<a href='"+value+"'>"+value+"</a>";
			}
		},
        {field:'title',title:'标题'},
		{field:'content',title:'内容',formatter:function(value){
			if(value!=''){
				return value.replace(/\n/g,"<br>");
			}
		}},
		{field:'latestVersion',title:'是否最新版本',width:100,formatter:function(value){
			if(value==1){
				return "<b style='color:red'>最新版本</b>";
			}
			return "否";
		}},
		{field:'versionCode',title:'当前版本号'},
		{field:'forceUpdateCode',title:'最大强制升级版本号'},
		{field:'platform',title:'客户端类型'},
		{field:'createdDate',title:'创建时间',formatter:formatDatebox},
        {field:'modifiedDate',title:'修改时间',formatter:formatDatebox},
        {field:'operator',title:'操作人'}
        
    ]] ,
	toolbar: toolbar,
	pagination:true,
	pageSize: 10,
	pageList: [10,25,50]
});  

	Date.prototype.format = function (format) {
	    var o = {
	        "M+": this.getMonth() + 1, // month
	        "d+": this.getDate(), // day
	        "h+": this.getHours(), // hour
	        "m+": this.getMinutes(), // minute
	        "s+": this.getSeconds(), // second
	        "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
	   		"S": this.getMilliseconds()
	        // millisecond
	    }
	    if (/(y+)/.test(format))
	        format = format.replace(RegExp.$1, (this.getFullYear() + "")
	            .substr(4 - RegExp.$1.length));
	    for (var k in o)
	        if (new RegExp("(" + k + ")").test(format))
	            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
	    return format;
	}
	function formatDatebox(value) {
	    if (value == null || value == '') {
	        return '';
	    }
	    var dt;
	    if (value instanceof Date) {
	        dt = value;
	    } else {
	        dt = new Date(value);
	    }

	    return dt.format("yyyy-MM-dd hh:mm:ss"); //扩展的Date的format方法(上述插件实现)
	}
</script>
</html>