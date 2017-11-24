<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/include.jsp" %>

<!-- 左侧导航 -->
<div class="layui-side layui-bg-black">
	<div class="user-photo">
		<a class="img" title="我的头像" ><img src="${pageContext.request.contextPath }/static/images/face.jpg"></a>
		<p>你好！<span class="userName">${sessionScope.USER_INFO.userName}</span>, 欢迎登录</p>
	</div>
	<div class="navBar layui-side-scroll">
		<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="leftMenu" style="margin-right: 10px;">
			<li class="layui-nav-item layui-nav-itemed">
			  <a href="javascript:;">默认展开</a>
			  <dl class="layui-nav-child">
			    <dd><a href="javascript:;">选项一</a></dd>
			    <dd><a href="javascript:;">选项二</a></dd>
			    <dd><a href="javascript:;">选项三</a></dd>
			    <dd><a href="javascript:;">跳转项</a></dd>
			  </dl>
			</li>
			<li class="layui-nav-item">
			  <a href="javascript:;">解决方案</a>
			  <dl class="layui-nav-child">
			    <dd><a href="javascript:;">移动模块</a></dd>
			    <dd><a href="javascript:;">后台模版</a></dd>
			    <dd><a href="javascript:;">电商平台</a></dd>
			  </dl>
			</li>
			<li class="layui-nav-item"><a href="javascript:;">云市场</a></li>
			<li class="layui-nav-item"><a href="javascript:;">社区</a></li>
		</ul>
	</div>
</div>
