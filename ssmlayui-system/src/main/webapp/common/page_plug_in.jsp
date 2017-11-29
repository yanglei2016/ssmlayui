<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${not empty resultList}">
<c:if test="${not empty parameterMap.PAGE_PARAMS}">
<form id="page_plug_in_form" name="page_plug_in_form" action="#">
<!-- 查询参数  start-->
<c:if test="${not empty parameterMap }">
	<c:forEach var="parameter" items="${parameterMap}">   
		<input type="hidden" name="${parameter.key }" value="${parameter.value }" />
	</c:forEach>
</c:if>
<!-- 查询参数 end-->
<div class="layui-box layui-laypage layui-laypage-default">
  <!-- 分页对象 -->
  <c:set var="page" value="${parameterMap.PAGE_PARAMS }" />
  <!-- 分页条显示的页码数量 -->
  <c:set var="showCount" value="5" />
  <!-- 当前页 -->
  <c:set var="currentPage" value="${page.currentPage }" />
  <c:if test="${currentPage<0 }">
 	<c:set var="currentPage" value="0" />
  </c:if>
  <span class="layui-laypage-count">
  	共&nbsp;<strong>${page.count }</strong>&nbsp;条记录&nbsp;&nbsp;<strong>${page.pageSize }</strong>&nbsp;条/页
  	<input type="hidden" name="pageSize" id="pageSize" class="form-control" value="${page.pageSize }">
  </span>
  <a href="javascript:void(0);" class="layui-laypage-next" onclick="setPage('1')">首页</a>
  <c:if test="${page.totalPage > 1 }">
  	<a href="javascript:void(0);" class="layui-laypage-prev" onclick="setPage('${currentPage}')">上一页</a>
  </c:if>
  <c:set var="startPage" value="1" />
  <c:set var="endPage" value="${showCount}" />
  <c:choose>
  	<c:when test="${currentPage<3}">
  		<c:set var="startPage" value="1"/>
  	</c:when>
  	<c:when test="${currentPage>=3}">
  		<c:set var="startPage" value="${currentPage-1}"/>
  		<c:set var="endPage" value="${currentPage+3}"/>
  	</c:when>
  </c:choose>

  <c:forEach begin="${startPage }" end="${endPage }" varStatus="co">
  	<c:if test="${co.index <= page.totalPage }">
  		<c:if test="${currentPage+1 eq co.index }">
  			<span class="layui-laypage-curr" onclick="setPage('${co.index}')">
  				<em class="layui-laypage-em"></em>
  				<em>${co.index }</em>
  			</span>
  			
  		</c:if>
  		<c:if test="${currentPage+1 ne co.index }">
  			<a href="javascript:void(0);" onclick="setPage('${co.index}')">${co.index }</a>
  		</c:if>
  	</c:if>
  </c:forEach>
   <c:if test="${currentPage+1 <= page.totalPage }">
   		<a href="javascript:void(0);" class="layui-laypage-next" onclick="setPage('${currentPage+2}')">下一页</a>
   </c:if>
    
  	<a href="javascript:void(0);" class="layui-laypage-next" onclick="setPage('${page.totalPage }')">尾页</a>
    <span class="layui-laypage-count">
    	共&nbsp;<strong>${page.totalPage }</strong>&nbsp;页&nbsp;&nbsp;跳转到
	    <input type="hidden" name="totalPage" id="totalPage" value="${page.totalPage }" class="layui-input"/>
	    <input type="text" name="currentPage" id="currentPage" class="form-control" value="${currentPage+1 }" />页
	    <button type="button" class="layui-laypage-btn" onclick="submitPage();">确认</button>
    </span>
</div>
</form>
<script type="text/javascript">
// 选择分页
function setPage(currentPage){
	if (flagPage(currentPage)){
		$("#currentPage").val(currentPage);
		submitPage();
	}
}

// 跳转页面
function submitPage(){
	if (flagPage($("#currentPage").val())){
		page_plug_in_form.submit();
	}
}
// 判断页面
function flagPage(currentPage){
	var result = true;
	if (parseInt(currentPage) < 1){
		result = false;
		alert("跳转页数小于【1】页");
	}else if (parseInt(currentPage) > parseInt($("#totalPage").val())){
		result = false;
		alert("跳转页数不能大于最大【"+$("#totalPage").val()+"】页");
	}else {
		result = true;
	}
// 	alert(currentPage + " totalPage=" + $("#totalPage").val() + "result=" + result );
	return result;
}
</script>
</c:if>  
</c:if> 
