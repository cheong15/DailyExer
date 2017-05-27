<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>


<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>会员管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span> 用户列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 用户名称：
		<input type="text" class="input-text" style="width:500px" placeholder="请输入用户名称" id="" name="">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜会员</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
		<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		<a href="javascript:;" onclick="member_add('添加用户','${pageContext.request.contextPath}/views/user/add.jsp','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a>
		</span> 
		<span class="r">共有数据：<strong>88</strong> 条</span> 
	</div>
	
	
	<div class="mt-20">
	
	<!-- 数据展示区 -->
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="25">序号</th>
				<th width="80">用户名称</th>
				<th width="40">用户编号</th>
				<th width="70">用户状态</th>
				<th width="60">操作</th>
			</tr>
		</thead>
		<tbody>
		 
		 <%--  用户列表迭代 
		 		var:
		 			1、有var的话，把迭代出的数据保存到context中，用#
		 				<s:iterator value="uList" var="u">
		 				<s:property value="#u.user_id"/>
		 			2、没有var的话，把迭代出的数据保存root中，不用#
		 				
		 
		 --%>
		 <s:iterator value="uList" status="stu">
		 	<tr class="text-c">
				<td><input type="checkbox" value='<s:property value="user_id"/>' name=""></td>
				<td><b><s:property value="#stu.count"/></b></td>
				<td><s:property value="user_name"/></td> 
				<td><s:property value="user_code"/></td>
				<td class="td-status">
					<s:if test="user_state == 1">
					<span class="label label-success radius">正常</span>
					</s:if>
					<s:else>
					<span class="label label-danger radius">暂停</span>
					</s:else>
				</td>
				<td class="td-manage"> 
				<a title="编辑" href="javascript:;" onclick="member_edit('编辑','${pageContext.request.contextPath}/views/user/add.jsp','4','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>  
				<a title="删除" href="javascript:;" onclick="member_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
				</td>
			</tr>
		 </s:iterator>
		</tbody>
	</table>
	
	<!-- 分页显示区 -->
	<div class="dataTables_wrapper " style="margin-bottom:50px;margin-top:10px;">
	<div class="dataTables_info">
		<div class="dataTables_length" id="DataTables_Table_0_length">
		<label>
			显示 
			<select name="pb.pageSize" id="pb_pageSize" class="select">
    <option value="10">10</option>
    <option value="25">25</option>
    <option value="50">50</option>
    <option value="100">100</option>


</select>


			 条
		</label>
		</div>
	</div>
	<div class="dataTables_paginate paging_simple_numbers" >
		<a href="${pageContext.request.contextPath}/customer_list?query.curPage=" class="paginate_button previous">首页</a>
		<a href="${pageContext.request.contextPath}/customer_list?query.curPage=" class="paginate_button previous">上一页</a>
		<span>
			<a class="paginate_button current" >第  页</a>
		</span>
		<a href="${pageContext.request.contextPath}/customer_list?query.curPage=" class="paginate_button next">下一页</a>
		<a href="${pageContext.request.contextPath}/customer_list?query.curPage=" class="paginate_button next">末页</a>
		<button class="btn disabled radius">共  页</button>
	</div>
	</div>
	
	
	<!-- <table class="table table-bg">
		<tr class="text-r">
			<td colspan="8">
				<a href="#" class="btn btn-default">1</a>
				<a href="#" class="btn btn-default">2</a>
				<a href="#" class="btn btn-primary radius">3</a>
				<a href="#" class="btn btn-default">4</a>
				<a href="#" class="btn btn-default">5</a>
				
				<button class="btn disabled radius">共 5 页</button>
			</td>
		</tr>
	</table> -->
	
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script> 
</body>
</html>
