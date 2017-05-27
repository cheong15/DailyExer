<%@ page language="java" pageEncoding="UTF-8"%>



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
<title>日志管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 日志管理 <span class="c-gray en">&gt;</span> 日志列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<form method="post" action="${pageContext.request.contextPath}/customer_list">
	<div class="text-c"> 
		关键词：
		<input type="text" class="input-text" style="width:200px" placeholder="请输入关键词" id="" name='query.keyWord' value=''>
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div>

	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
		</span> 
		<span class="r">共有数据：<strong></strong> 条</span> 
	</div>
	
	
	<div class="mt-20">
	
	<!-- 数据展示区 -->
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr class="text-c">
				<th width="20"><input type="checkbox" name="" value=""></th>
				<th width="20">序号</th>
				<th width="80">操作者</th>
				<th width="100">操作时间</th>
				<th width="90">干了哪些活</th>
				<th width="60">登录IP</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			
			<tr class="text-c">
				<td><input type="checkbox" value='' name="custIDS"></td>
				<td><b>1</b></td>
				<td>9,纯情小飞飞</td>
				<td>
				
				
				17 days, 19 hours ago
				</td>
				<td>记录日志：gz.itheima.crm.service.impl.LinkmanServiceImpl:save，参数有：【[gz.itheima.crm.entity.Linkman@441bb275]】</td>
				<td>127.0.0.1</td>
				<td class="td-manage"> 
				<a title="编辑" href="javascript:;" onclick="customer_edit('')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>  
				</td>
			</tr>
		
			<tr class="text-c">
				<td><input type="checkbox" value='' name="custIDS"></td>
				<td><b>2</b></td>
				<td>9,纯情小飞飞</td>
				<td>
				
				
				17 days, 17 hours ago
				</td>
				<td>记录日志：gz.itheima.crm.service.impl.UserServiceImpl:save，参数有：【[User [user_id=9, user_code=m001, user_name=纯情小飞飞, user_password=654321, user_state=1]]】</td>
				<td>127.0.0.1</td>
				<td class="td-manage"> 
				<a title="编辑" href="javascript:;" onclick="customer_edit('')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>  
				</td>
			</tr>
		
			<tr class="text-c">
				<td><input type="checkbox" value='' name="custIDS"></td>
				<td><b>3</b></td>
				<td>9,纯情小飞飞</td>
				<td>
				
				
				17 days, 17 hours ago
				</td>
				<td>记录日志：gz.itheima.crm.service.impl.UserServiceImpl:save，参数有：【[User [user_id=9, user_code=m001, user_name=纯情小飞飞, user_password=c33367701511b4f6020ec61ded352059, user_state=1]]】</td>
				<td>127.0.0.1</td>
				<td class="td-manage"> 
				<a title="编辑" href="javascript:;" onclick="customer_edit('')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>  
				</td>
			</tr>
		
			<tr class="text-c">
				<td><input type="checkbox" value='' name="custIDS"></td>
				<td><b>4</b></td>
				<td>9,纯情小飞飞</td>
				<td>
				
				
				17 days, 17 hours ago
				</td>
				<td>记录日志：gz.itheima.crm.service.impl.UserServiceImpl:save，参数有：【[User [user_id=9, user_code=m001, user_name=纯情小飞飞, user_password=e10adc3949ba59abbe56e057f20f883e, user_state=1]]】</td>
				<td>127.0.0.1</td>
				<td class="td-manage"> 
				<a title="编辑" href="javascript:;" onclick="customer_edit('')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>  
				</td>
			</tr>
		</tbody>
	</table>
	
	<!-- 分页显示区 -->
	<div class="dataTables_wrapper " style="margin-bottom:50px;margin-top:10px;">
	<div class="dataTables_info">
		<div class="dataTables_length" id="DataTables_Table_0_length">
		<label>
			显示 
			<select name="query.pageSize" id="query_pageSize" class="select">
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
		<!-- 
			sxxx?name=dfadf
			sxxx?name=%{#pb.firstPage}  把字符串转成ognl表达式
		 -->
		<a href="${pageContext.request.contextPath}/customer_list?query.curPage=&amp;query.pageSize=" class="paginate_button previous">首页</a>
		<a href="${pageContext.request.contextPath}/customer_list?query.curPage=&amp;query.pageSize=" class="paginate_button previous">上一页</a>
		<span>
			<a class="paginate_button current" >第  页</a>
		</span>
		<a href="${pageContext.request.contextPath}/customer_list?query.curPage=&amp;query.pageSize=" class="paginate_button next">下一页</a>
		<a href="${pageContext.request.contextPath}/customer_list?query.curPage=&amp;query.pageSize=" class="paginate_button next">末页</a>
		<button class="btn disabled radius">共  页</button>
	</div>
	</div>
	
	</div>
</div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/laypage/1.2/laypage.js"></script>
<script type="text/javascript">



</script> 
</body>
</html>
