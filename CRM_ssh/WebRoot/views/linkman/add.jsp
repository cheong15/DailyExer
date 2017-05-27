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
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>新增客户</title>

</head>
<body>
<article class="page-container">
	<form action="${pageContext.request.contextPath}/linkman_add" method="post" class="form form-horizontal" id="form-member-add">
		<input type="hidden" name="lkmId" value="" id="lkmId"/>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系人姓名：</label>
			<div class="formControls col-xs-5 col-sm-5">
				<input type="text" name="lkm_name" value="" id="lkmName" class="input-text"/>
			</div>
			<div class="formControls col-xs-3 col-sm-4">
				<font color="red">
				
				</font>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属客户：</label>
			<div class="formControls col-xs-5 col-sm-5">
				
				<%-- 	现在迭代出来的是集合中的每一个对象，把toString的方法显示
							现在为了显示对象中的id与名称
							<option value="id">客户名称</option>
							
							listKey:  <option value="listKey值"></option>
							listValue：<option value="listKey值">listValue值</option>
							
							显示出来如下：
							    <option value="1">广州超干软件</option>
							    <option value="2">深圳飞腾教育公司</option>
							    <option value="3">广州传智播客</option>
							    <option value="4">苏州百捷信息科技有限公司</option>
							
							
							
							
							//cssClass : 代表注入html的css的class
								<style>
									.input-text{
										width: 40px;
									}
								<style>
								<input type="text" class="input-text" style="magin-left:10px;"/>
								
								对应的html标签：
								<s:select list="#cusList"   cssClass="input-text" cssStyle="magin-left:10px;" />
				
				 --%>
				<s:select name="customer.custId" list="#cusList"   listKey="custId" listValue="custName"  cssClass="input-text"/>


			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系人性别：</label>
			<div class="formControls col-xs-7 col-sm-7 skin-minimal">
				<div class="radio-box">
					<input name="lkm_gender" type="radio" value="男"  >
					<label for="sex-1">男</label>
				</div>
				<div class="radio-box">
					<input type="radio" value="女" name="lkm_gender" >
					<label for="sex-2">女</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>固定电话：</label>
			<div class="formControls col-xs-5 col-sm-5">
				<input type="text" name="lkm_phone" value="" id="lkmPhone" class="input-text"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>移动电话：</label>
			<div class="formControls col-xs-5 col-sm-5">
				<input type="text" name="lkm_mobile" value="" id="lkmMobile" class="input-text"/>
			</div>
			<div class="formControls col-xs-3 col-sm-4">
				<font color="red"></font>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系人邮箱：</label>
			<div class="formControls col-xs-5 col-sm-5">
				<input type="text" name="lkm_email" value="" id="lkmEmail" class="input-text"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系人qq：</label>
			<div class="formControls col-xs-5 col-sm-5">
				<input type="text" name="lkm_qq" value="" id="lkmQq" class="input-text"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系人职位：</label>
			<div class="formControls col-xs-5 col-sm-5">
				<input type="text" name="lkm_position" value="" id="lkmPosition" class="input-text"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系人备注：</label>
			<div class="formControls col-xs-5 col-sm-5">
				<input type="text" name="lkm_memo" value="" id="lkmMemo" class="input-text"/>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</article>

</body>
</html>