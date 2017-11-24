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
<script type="text/javascript">
layui.use(['layer', 'element'], function(){
	var $ = layui.$,
	layer = layui.layer,
	element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
	// 监听导航点击
	// 添加新窗口
	$("body").on("click",".layui-nav .layui-nav-item a",function(){
		//如果不存在子级
		if($(this).siblings().length == 0){
			layer.msg($(this).text());
			addTab($(this));
		}
		$(this).parent("li").siblings().removeClass("layui-nav-itemed");
	})
	
	function addTab(menuObj){
		var idNo = new Date().getTime();
		//新增一个Tab项
		element.tabAdd('bodyTab', {
			title: menuObj.text()  
			,content: '内容'+ (Math.random()*1000|0)
			,id: idNo //实际使用一般是规定好的id，这里以时间戳模拟下
		})
		//切换到指定Tab项
		element.tabChange('bodyTab', idNo);
	}
});
</script>