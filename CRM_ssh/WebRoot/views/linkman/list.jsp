<%@ page language="java" pageEncoding="UTF-8"%>

<%-- 导入标签库 --%>
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
<title>联系人管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 联系人管理 <span class="c-gray en">&gt;</span> 联系人列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<form method="post" action="${pageContext.request.contextPath}/customer_list">
	<div class="text-c"> 
		关键词：
		<input type="text" class="input-text" style="width:600px" placeholder="请输入关键词" id="keyWord" name='keyWord' value=''>
		<!-- <button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button> -->
		
		<input type="button" onclick="gotoPage('0')" value="搜索" class="btn btn-success radius"> 
	</div>

	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
		<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		<a href="javascript:;" onclick="member_add('添加联系人','${pageContext.request.contextPath}/linkman_toAdd','','450')" class="btn btn-primary radius">
		<i class="Hui-iconfont">&#xe600;</i> 添加联系人</a>
		</span> 
		<span class="r">共有数据：<strong><s:property value="totalCount"/></strong> 条</span> 
	</div>
	
	
	<div class="mt-20">
	
	<!-- 数据展示区 -->
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr class="text-c">
				<th width="20"><input type="checkbox" name="" value=""></th>
				<th width="20">序号</th>
				<th width="80">联系人名称</th>
				<th width="100">所属客户</th>
				<th width="90">联系人性别</th>
				<th width="60">办公电话</th>
				<th width="60">联系人手机</th>
				<th width="60">联系人邮箱</th>
				<th width="60">联系人QQ</th>
				<th width="60">联系人职位</th>
				<th width="60">联系人备注</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		
		<%--
			迭代联系人列表
				带var：     把迭代出的每一个数据暂时存放在context中
				不带var：  把迭代出的每一个数据暂时存放在root中
							可以不带#号获取数据
		 --%>
		 <s:iterator value="linkmanList" status="sta">
		 
		 <tr class="text-c">
				<td><input type="checkbox" value='1' name="custIDS"></td>
				<%--
					序号： (curPage-1)*pageSize + #sta.count
						固定写法： 带入法：
							当前页 1  ：   1                                                       从1开始
							当前页2：  （2-1）*2 +1 = 3                 从3开始
				 --%>
				<td><b><s:property value="(curPage-1)*pageSize + #sta.count"/></b></td>
				<td><s:property value="lkm_name"/></td>
				<td><s:property value="customer.custName"/></td>
				<td><s:property value="lkm_gender"/></td>
				<td><s:property value="lkm_phone"/></td>
				<td><s:property value="lkm_mobile"/></td>
				<td><s:property value="lkm_email"/></td>
				<td><s:property value="lkm_qq"/></td>
				<td><s:property value="lkm_position"/></td>
				<td><s:property value="lkm_memo"/></td>
				<td class="td-manage"> 
				<a title="编辑" href="javascript:;" onclick="customer_edit('')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>  
				<a title="删除" href="javascript:;" onclick="customer_del('')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
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
			
			<s:select list="{'2','10','25','50'}" name="pageSize" id="query_pageSize"></s:select>

			 条
		</label>
		</div>
	</div>
	<div class="dataTables_paginate paging_simple_numbers" >
		<%-- 
		
			
			
		 --%>
		<a href="javascript:void(0);" onclick='gotoPage("1")' class="paginate_button previous">首页</a>
		<a href="javascript:void(0);" onclick='gotoPage("<s:property value="prePage"/>")' class="paginate_button previous">上一页</a>
		<span>
			<a class="paginate_button current" >第  <s:property value="curPage"/> 页</a>
		</span>
		<a href="javascript:void(0);" onclick='gotoPage("<s:property value="nextPage"/>")'  class="paginate_button next">下一页</a>
		<a href="javascript:void(0);" onclick='gotoPage("<s:property value="totalPage"/>")'  class="paginate_button next">末页</a>
		<button class="btn disabled radius">共 <s:property value="totalPage"/>  页</button>
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
	var url = '${pageContext.request.contextPath}/book/books_delete?id='+id;
	layer.confirm('确认要删除吗？',function(index){
		//layer_show("删除",url,"350","350");
		
		//layer.msg('已删除!',{icon:1,time:1000});
		
	});
}


function customer_del(id){
	var url = '${pageContext.request.contextPath}/customer_delete?custId='+id;
	layer.confirm('是否要删除？删除后数据无法恢复，请谨慎操作。',function (){
		layer_show("删除联系人信息",url,"350","350");
	});
	
}

function datadel(){
	var ids = "";
	$("input[name='custIDS']:checkbox:checked").each(function(){ 
		ids+=$(this).val()+","; 
	});
	
	//alert(ids);
	
	var url = '${pageContext.request.contextPath}/customer_deleteByIds?ids='+ids;
	layer.confirm('是否要批量删除数据？删除后数据无法恢复，请谨慎操作。',function (){
		layer_show("删除联系人信息",url,"350","350");
	});
}


function customer_edit(id){
	var url = '${pageContext.request.contextPath}/customer_edit?custId='+id;
	layer_show('修改联系人信息',url,'500','450');
}



function gotoPage(page){
	
	//1、当前页面
	var curPage = page;
	
	//2、拿到每页多少条
	var pp = document.getElementById("query_pageSize");
	var pageSize = pp.options[pp.selectedIndex].value;
	
	
	//3、获取关键字
	if(page == '0'){
		curPage = 1;
	}
	var keyWord = document.getElementById("keyWord").value;
	
	//3、调用action的方法
	window.location.href="${pageContext.request.contextPath}/linkman_list?pageSize="+pageSize+"&curPage="+curPage+"&keyWord="+keyWord;
	
}
</script> 
</body>
</html>
