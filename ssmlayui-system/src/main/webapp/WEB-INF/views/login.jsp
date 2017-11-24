<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>XXXXXXXXXXXXXXXXXXX公司</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/login.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
</head>
<body>
<div class="layui-carousel video_mask" id="loginCarousel">
	<div carousel-item="">
		<div class="carousel_div1"></div>
		<div class="carousel_div2"></div>
		<div class="carousel_div3"></div>
	</div>
	<div class="login">
		<h1>XXXX管理系统</h1>
	    <form class="layui-form" action="" method="post">
	    	<div class="layui-form-item">
				<input class="layui-input" type="text" name="userName" placeholder="用户名" lay-verify="required" autocomplete="off" value="admin"/>
		    </div>
		    <div class="layui-form-item">
				<input class="layui-input" type="password" name="password" placeholder="密码" lay-verify="required" autocomplete="off" value="111111"/>
		    </div>
			<button class="layui-btn login_btn" lay-submit="" lay-filter="login">登录</button>
		</form>
	</div>
</div>
<script type="text/javascript">
	if(top.location != self.location){
		top.location = self.location;
	}
	
	layui.use(['layer', 'form', 'element', 'carousel'], function(){
		var $ = layui.$,
		layer = layui.layer,
		form = layui.form,
		element = layui.element,
		carousel = layui.carousel;
		
		//背景轮播图
		carousel.render({
			elem: '#loginCarousel',
			width: '100%',
			height: '100%',
			interval: 3000,
			anim: 'fade',
			arrow: 'none',
			indicator:'none'
		});
		
		form.on('submit(login)', function (data) {
			location.href = "${pageContext.request.contextPath }/login.do?userName=admin&password=111111";
			return false;
		});
		
	});
</script>
</body>
</html>
