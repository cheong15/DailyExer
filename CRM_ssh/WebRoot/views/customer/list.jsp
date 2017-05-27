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
<title>客户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 客户管理 <span class="c-gray en">&gt;</span> 客户列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

<form method="post" action="${pageContext.request.contextPath}/customer_list">
	<div class="text-c"> 
	
		<s:select list="{'朋友介绍','已购买产品客户','来自网络搜索'}" name="query.custSource" headerKey="" headerValue="==全部信息来源=="/>
		
		<s:select list="{'互联网行业','教育培训行业','手机制造业'}" name="query.custIndustry" headerKey="" headerValue="==全部所属行业=="/>
<%-- <select name="query.custLevel" id="query_custLevel">
		    <option value="" >==全部客户==</option>
		    <option value="1" >普通客户</option>
		    <option value="2" >金牌客户</option>
		    <option value="3" >白金客户</option>
		</select> --%>

		<s:select list="#{'':'==全部客户==','1':'普通客户','2':'金牌客户','3':'白金客户'}" name="query.custLevel"></s:select>
		
		关键词：
		<!-- <input type="text" class="input-text" style="width:200px" placeholder="请输入关键词" id="" name='query.keyWord' value=''> -->
		<s:textfield name="query.keyWord" cssClass="input-text" cssStyle="width:200px"></s:textfield>
		
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div>

	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
		<a href="javascript:;" onclick="delCus()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		<a href="javascript:;" onclick="member_add('添加客户','${pageContext.request.contextPath}/views/customer/add.jsp','','400')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加客户</a>
		</span> 
		<span class="r">共有数据：<strong><s:property value="pg.totalCount"/></strong> 条</span> 
	</div>
	
	
	<div class="mt-20">
	
	<!-- 数据展示区 -->
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr class="text-c">
				<th width="20"><input type="checkbox" name="" value=""></th>
				<th width="20">序号</th>
				<th width="100">客户名称</th>
				<th width="100">客户信息来源</th>
				<th width="90">客户所属行业</th>
				<th width="60">客户级别</th>
				<th width="60">固定电话</th>
				<th width="60">移动电话</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		
			<s:iterator value="pg.curDataList" status="stu">
			<tr class="text-c">
				<td><input type="checkbox" value='<s:property value="custId"/>' name="custIDS"></td>
				<td><b><s:property value="((pg.curPage-1)*pg.pageSize)+(#stu.count)"/></b></td>
				<td><s:property value="custName"/></td>
				<td><s:property value="custSource"/></td>
				<td><s:property value="custIndustry"/></td>
				<td>
					<s:property value="custLevel"/>
					
					
				
				</td>
				<td><s:property value="custPhone"/></td>
				<td><s:property value="custMobile"/></td>
				<td class="td-manage"> 
				<a title="编辑" href="javascript:;" onclick="customer_edit('<s:property value="custId"/>')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>  
				<a title="删除" href="javascript:;" onclick="customer_del('1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
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
			<s:select list="{'10','25','50','100'}" name="query.pageSize"></s:select>
			 条
		</label>
		</div>
	</div>
	<div class="dataTables_paginate paging_simple_numbers" >
		<!-- 
			sxxx?name=dfadf
			sxxx?name=%{#pb.firstPage}  把字符串转成ognl表达式
		 -->
		<a href="${pageContext.request.contextPath}/customer_list?query.curPage=1&query.pageSize=<s:property value="pg.pageSize"/>" class="paginate_button previous">首页</a>
		<a href="${pageContext.request.contextPath}/customer_list?query.curPage=<s:property value="pg.prePage"/>&query.pageSize=<s:property value="pg.pageSize"/>" class="paginate_button previous">上一页</a>
		<span>
			<a class="paginate_button current" >第 <s:property value="pg.curPage"/> 页</a>
		</span>
		<a href="${pageContext.request.contextPath}/customer_list?query.curPage=<s:property value="pg.nextPage"/>&query.pageSize=<s:property value="pg.pageSize"/>" class="paginate_button next">下一页</a>
		<a href="${pageContext.request.contextPath}/customer_list?query.curPage=<s:property value="pg.totalPage"/>&query.pageSize=<s:property value="pg.pageSize"/>" class="paginate_button next">末页</a>
		<button class="btn disabled radius">共 <s:property value="pg.totalPage"/> 页</button>
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
		layer_show("删除客户信息",url,"350","350");
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
		layer_show("删除客户信息",url,"350","350");
	});
}

//修改客户信息
function customer_edit(id){
	var url = '${pageContext.request.contextPath}/customer_edit?custId='+id;
	layer_show('修改客户信息',url,'500','450');
}


function delCus(){
	var ids = document.getElementsByName("custIDS");
	var delIds = "";
	for(var i=0;i<ids.length;i++){
		if(ids[i].checked==true){
			delIds += ids[i].value+",";
		}
	}
	
	//alert(delIds);
	//拼接删除客户的url
	var url = '${pageContext.request.contextPath}/customer_deleteByIds?query.ids='+delIds;
	layer.confirm('是否要批量删除数据？删除后数据无法恢复，请谨慎操作。',function (){
		layer_show("删除客户信息",url,"350","350");
	});
}

</script> 
</body>
</html>
