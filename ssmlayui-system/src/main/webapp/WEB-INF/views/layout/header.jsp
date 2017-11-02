<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="layui-header header">
	<div class="layui-main">
		<a href="#" class="logo">layui后台管理</a>
		<!-- 显示/隐藏菜单 -->
		<a href="javascript:;" class="iconfont hideMenu icon-menu1"></a>
	    <!-- 顶部右侧菜单 -->
	    <ul class="layui-nav top_menu">
	    	<li class="layui-nav-item showNotice" id="showNotice" pc>
				<a href="javascript:;"><i class="iconfont icon-gonggao"></i><cite>系统公告</cite></a>
			</li>
			<li class="layui-nav-item lockcms" pc>
				<a href="javascript:;"><i class="iconfont icon-lock1"></i><cite>锁屏</cite></a>
			</li>
			<li class="layui-nav-item" pc>
				<a href="javascript:;">
					<img src="${pageContext.request.contextPath }/static/images/face.jpg" class="layui-circle" width="35" height="35">
					<cite>${sessionScope.USER_INFO.userId} / ${sessionScope.USER_INFO.userName}</cite>
				</a>
				<dl class="layui-nav-child">
					<dd><a href="javascript:;" data-url="page/user/userInfo.html"><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人资料</cite></a></dd>
					<dd><a href="javascript:;" data-url="page/user/changePwd.html"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>修改密码</cite></a></dd>
					<dd><a href="javascript:;" class="changeSkin"><i class="iconfont icon-huanfu"></i><cite>更换皮肤</cite></a></dd>
					<dd><a href="page/login/login.html" class="signOut"><i class="iconfont icon-loginout"></i><cite>退出</cite></a></dd>
				</dl>
			</li>
		</ul>
	</div>
</div>
<!-- 顶部 -->
