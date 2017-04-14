<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加App版本</title>
    <!-- 引入 Bootstrap -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min-3.3.7.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/plugin/js/jquery-1.9.1.mini.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugin/js/jquery.form.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/plugin/css/config_global.css">
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/easyui/themes/blue/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/easyui/themes/icon.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/easyui/easyuiExtend.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common.js"></script>
    <script type="text/javascript">

        $(function(){
            //点击提交按钮
            $("#submitBtn").click(addAppVersion);

            $("#cancelBtn").click(function(){
                window.history.go(-1);
            });
        });


        /**
         * 提交保存AppVersion信息的表单
         */
        function addAppVersion(){
            if($("#versionCode").val=='' || $("#url").val()==''){
                alert("请输入版本号或者下载地址");
                return;
            }
            //取消提交按钮的绑定事件,防止重复提交
            $("#submitBtn").unbind('click', addAppVersion);
            var addUrl = "${pageContext.request.contextPath}/appversion/add";

            $("#add_appversion_form").ajaxSubmit({
                type: "POST",
                url : addUrl,
                dataType:"json",
                success : function (result) {
                    $("#submitBtn").click(addAppVersion);
                    if (result.isSuccess==true) {
                        alert(result.msg);
                        window.history.go(-1);
                    } else {
                        //处理失败，重新绑定点击事件
                        alert(result.msg);
                    }
                },
                error:function(){
                    alert("保存APP版本信息失败");
                    $("#submitBtn").click(addAppVersion);
                }
            });

        }
    </script>
</head>
<body>
<div class="easyui-panel" data-option="fit:true" title="新增APP版本" style="padding:10px" >
    <!-- 自定义 -->
    <div class="container" style="margin-left: 10px">
        <div class="row">
            <div class="col-md-10 col-sm-10 col-xs-10">
                <form id="add_appversion_form" method="post" class="form-horizontal" role="form">

                    <div class="form-group">
                        <label for="versionCode" class="col-sm-2 col-md-2 control-label">版本号</label>
                        <div class="col-sm-10">
                            <input type="text" name="versionCode" id="versionCode" class="form-control"  placeholder="格式为:x.x.x,x为数字,必填">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="forceUpdateCode" class="col-sm-2 col-md-2 control-label" >强制升级</label>
                        <div class="col-sm-10">
                            <input type="text" name="forceUpdateCode" id="forceUpdateCode" class="form-control"  placeholder="格式为:x.x.x,x为数字">
                            <span class="help-block">小于等于该版本需要强制升级</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="title" class="col-sm-2 col-md-2 col-lg-2 control-label">标题</label>
                        <div class="col-sm-10">
                            <input type="text" name="title" id="title" class="form-control"  >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="content" class="col-sm-2 col-md-2 control-label">更新内容</label>
                        <div class="col-sm-10">
                            <textarea name="content" id="content" class="form-control" style="resize: none;height: 200px"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="url" class="col-sm-2 col-md-2 control-label">下载地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="url" id="url" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 col-md-2 control-label">客户端</label>
                        <label class="checkbox-inline">
                            <input type="radio" name="platform" value="ANDROID" checked="true">ANDROID
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="platform" value="IOS">IOS
                        </label>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 col-md-2 control-label">最新版本</label>
                        <label class="checkbox-inline">
                            <input type="radio" name="latestVersion" value="1" checked="true">是
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="latestVersion" value="0">否
                        </label>
                    </div>

                    <div class="form-group" style="margin-left: 60px">
                            <input type="button" value="保存" id="submitBtn" class="btn btn-primary" >
                            <input type="button" value="取消" id="cancelBtn" class="btn btn-warning" >
                        </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>