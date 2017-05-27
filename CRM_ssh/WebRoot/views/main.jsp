<%@ page language="java" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
 <head> 
  <meta charset="utf-8" /> 
  <meta name="renderer" content="webkit|ie-comp|ie-stand" /> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
  <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" /> 
  <meta http-equiv="Cache-Control" content="no-siteapp" /> 
  <link rel="Bookmark" href="/favicon.ico" /> 
  <link rel="Shortcut Icon" href="/favicon.ico" /> 
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
  <title>传智客户关系管理系统</title> 
 </head> 
 <body> 
 
 	
  <header class="navbar-wrapper"> 
   <div class="navbar navbar-fixed-top"> 
    <div class="container-fluid cl"> 
     <a class="logo navbar-logo f-l mr-10 hidden-xs" href="#">传智客户关系管理系统</a> 
     <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs"> 
      <ul class="cl"> 
       <li>超级管理员</li> 
       <li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">${sessionScope.user_in_session.user_name} <i class="Hui-iconfont"></i></a> 
        <ul class="dropDown-menu menu radius box-shadow"> 
         <li><a href="javascript:;" onclick="myselfinfo()">个人信息</a></li> 
         <li><a href="javascript:;" onclick="changePwd()">修改密码</a></li> 
         <li><a href="${pageContext.request.contextPath}/login.jsp">退出</a></li> 
        </ul></li> 
       <li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px"></i></a> 
        <ul class="dropDown-menu menu radius box-shadow"> 
         <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li> 
         <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li> 
         <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li> 
         <li><a href="javascript:;" data-val="red" title="红色">红色</a></li> 
         <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li> 
         <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li> 
        </ul></li> 
      </ul> 
     </nav> 
    </div> 
   </div> 
  </header> 
  
  
  
  <aside class="Hui-aside"> 
   <div class="menu_dropdown bk_2"> 
    <dl id="menu-article"> 
     <dt> 
      <i class="Hui-iconfont"></i> 客户管理
      <i class="Hui-iconfont menu_dropdown-arrow"></i> 
     </dt> 
     <dd> 
      <ul> 
       <li><a data-href="${pageContext.request.contextPath}/customer_list" data-title="客户管理" href="javascript:void(0)">客户管理</a></li> 
      </ul> 
      <ul> 
       <li><a data-href="${pageContext.request.contextPath}/linkman_list" data-title="联系人管理" href="javascript:void(0)">联系人管理</a></li> 
      </ul> 
     </dd> 
    </dl> 
    <dl id="menu-admin"> 
     <dt> 
      <i class="Hui-iconfont"></i> 用户管理
      <i class="Hui-iconfont menu_dropdown-arrow"></i> 
     </dt> 
     <dd> 
      <ul> 
       <li><a data-href="${pageContext.request.contextPath}/user_list" data-title="用户列表" href="javascript:void(0)">用户列表</a></li> 
      </ul> 
     </dd> 
    </dl> 
    
    <dl id="menu-admin"> 
     <dt> 
      <i class="Hui-iconfont"></i> 系统管理
      <i class="Hui-iconfont menu_dropdown-arrow"></i> 
     </dt> 
     <dd> 
      <ul> 
       <li><a data-href="${pageContext.request.contextPath}/views/log/list.jsp" data-title="操作日志列表" href="javascript:void(0)">操作日志列表</a></li> 
      </ul> 
     </dd> 
    </dl> 
   </div> 
  </aside> 
  
  	
  <div class="dislpayArrow hidden-xs"> 
   <a class="pngfix" href="javascript:void(0);" onclick="displaynavbar(this)"></a> 
  </div>
  
  
  
  	
  <section class="Hui-article-box"> 
   <div id="Hui-tabNav" class="Hui-tabNav hidden-xs"> 
    <div class="Hui-tabNav-wp"> 
     <ul id="min_title_list" class="acrossTab cl"> 
      <li class="active">
	      <span title="我的桌面" data-href="${pageContext.request.contextPath}/views/welcome.jsp">我的桌面</span> 
	      <em></em>
      </li> 
     </ul> 
    </div> 
    <div class="Hui-tabNav-more btn-group"> 
     <a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont"></i></a>
     <a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont"></i></a> 
    </div> 
   </div> 
   <div id="iframe_box" class="Hui-article"> 
    <div class="show_iframe"> 
     <div style="display:none" class="loading"></div> 
	     
     <iframe scrolling="yes" frameborder="0" src="${pageContext.request.contextPath}/views/welcome.jsp"></iframe> 
    </div> 
   </div> 
  </section> 
  
  
  
  	
  <div class="contextMenu" id="Huiadminmenu"> 
   <ul> 
    <li id="closethis">关闭当前</li> 
    <li id="closeall">关闭全部</li> 
   </ul> 
  </div> 
  
  
  
  
  <!--_footer 作为公共模版分离出去--> 
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/1.9.1/jquery.min.js"></script> 
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/2.4/layer.js"></script> 
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script> 
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script> 
  <!--/_footer 作为公共模版分离出去--> 
  <!--请在下方写此页面业务相关的脚本--> 
  <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery.contextmenu/jquery.contextmenu.r2.js"></script> 
  <script type="text/javascript">
		/*个人信息*/
		function myselfinfo() {
			layer.open({
				type : 1,
				area : [ '300px', '200px' ],
				fix : false, //不固定
				maxmin : true,
				shade : 0.4,
				title : '查看信息',
				content : '<div>纯情小飞飞特制</div>'
			});
		};
		
		
		function changePwd(){
			layer_show("修改密码","${pageContext.request.contextPath}/views/user/changePwd.jsp","400","300");
		}
		
	</script>  
 </body>
</html>