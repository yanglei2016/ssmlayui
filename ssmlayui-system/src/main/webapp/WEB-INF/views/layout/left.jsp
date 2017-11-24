<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/include.jsp" %>

<!-- 左侧导航 -->
<div class="layui-side layui-bg-black">
	<div class="user-photo">
		<a class="img" title="我的头像" ><img src="${pageContext.request.contextPath }/static/images/face.jpg"></a>
		<p>你好！<span class="userName">${sessionScope.USER_INFO.userName}</span>, 欢迎登录</p>
	</div>
	<div class="navBar layui-side-scroll">
		
	</div>
</div>
