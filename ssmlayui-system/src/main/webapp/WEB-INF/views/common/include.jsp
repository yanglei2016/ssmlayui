<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.yanglei.com/system-tags" prefix="ssm" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/main.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/ssm_common.js"></script>

	
<script type="text/javascript">
layui.config({
	base: '${pageContext.request.contextPath }/static/js/modules/' //假设这是你存放拓展模块的根目录
}).extend({ //设定模块别名
	bodyTab: 'bodyTab' //如果 mymod.js 是在根目录，也可以不用设定别名
});
</script>