<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统</title>
<%@include file="../common/include.jsp" %>
</head>
<body class="main_body">
	<div class="layui-layout layui-layout-admin">
		<!-- top -->
		<%@include file="header.jsp" %>
		
		<!-- left -->
		<jsp:include page="left.jsp" />
		
		
		<!-- 右侧内容 -->
		<div class="layui-body layui-form">
			<div class="layui-tab marg0" lay-filter="bodyTab1" id="top_tabs_box">
				<ul class="layui-tab-title top_tab" id="top_tabs">
					<li class="layui-this" lay-id=""><i class="iconfont icon-computer"></i> <cite>首页</cite></li>
				</ul>
				<ul class="layui-nav closeBox">
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont icon-caozuo"></i> 页面操作</a>
				    <dl class="layui-nav-child">
					  <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
				      <dd><a href="javascript:;" class="closePageOther"><i class="iconfont icon-prohibit"></i> 关闭其他</a></dd>
				      <dd><a href="javascript:;" class="closePageAll"><i class="iconfont icon-guanbi"></i> 关闭全部</a></dd>
				    </dl>
				  </li>
				</ul>
				<div class="layui-tab-content clildFrame">
					<div class="layui-tab-item layui-show">
						<iframe src="welcome.do" align="left" scrolling="no" width="100%"  height="100%" id="systemContentIFrame" name="systemContentIFrame" frameborder="0" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" noresize></iframe>
					</div>
				</div>
			</div>
		</div>
			
		<!-- footer -->
		<jsp:include page="footer.jsp" />
	</div>

<script type="text/javascript">
var leftMenuJson = '${leftMenuJson}';
console.log(leftMenuJson);

var $, tab, skyconsWeather;
layui.use(['bodyTab','form','element','layer','jquery'],function(){
	var form = layui.form,
		layer = layui.layer,
		element = layui.element;
		$ = layui.jquery;
		tab = layui.bodyTab({
			openTabNum : "50",   // 最大可打开窗口数量
			data : leftMenuJson  // 获取菜单json地址
		});
	
	//渲染左侧菜单
	tab.render();
	
	// 添加新窗口
	$("body").on("click",".layui-nav .layui-nav-item a",function(){
		//如果不存在子级
		if($(this).siblings().length == 0){
			addTab($(this));
			$('body').removeClass('site-mobile');  //移动端点击菜单关闭菜单层
		}
		$(this).parent("li").siblings().removeClass("layui-nav-itemed");
	})
	
	//打开新窗口
	function addTab(_this){
		tab.tabAdd(_this);
	}
	
});

</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/leftNav.js"></script>
</body>
</html>
