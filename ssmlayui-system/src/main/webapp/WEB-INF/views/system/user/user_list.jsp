<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/common/include.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/resourcesStyle/sysjs/system/user/user.js"></script>
</head>
<body>
<div class="childrenBody">	
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
	  <legend>用户列表</legend>
	</fieldset>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
		      <col width="150"/>
		      <col width="150"/>
		      <col width="200"/>
		    </colgroup>
			<thead>
				<tr>
					<td align="center">用户编号</td>
					<td align="center">用户名称</td>
					<td align="center">操作</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty resultList}">
				<tr>
					<td align="center" colspan="9">暂无数据</td>
				</tr>
				</c:if>
				<c:if test="${not empty resultList }">
				<c:forEach var="bean" items="${resultList}" varStatus="status">
					<tr ${status.count % 2 == 1 ? "" : "bgcolor='#f2f2f2'"} onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">
						<td align="center">${bean.userId}</td>
						<td align="center">${bean.userName}</td>
						<td align="center">
							<a class="layui-btn layui-btn-normal layui-btn-xs" href="toUserOperation.do?pageType=detail&userId=${bean.userId}">详细</a>
			           		<ssm:auth no="010102"><a class="layui-btn layui-btn-normal layui-btn-xs" href="toUserOperation.do?pageType=update&userId=${bean.userId}">修改</a></ssm:auth>
			           		<ssm:auth no="010103"><a class="layui-btn layui-btn-danger layui-btn-xs" href="toUserOperation.do?pageType=delete&userId=${bean.userId}">删除</a></ssm:auth>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
			
			<!-- 分页 -->
			<tfoot>
				<tr>
					<td colspan="100">
						<%@include file="/common/page_plug_in.jsp" %>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
<script type="text/javascript">

</script>
</body>
</html>