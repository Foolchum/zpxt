<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="<%=basePath%>/scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="<%=basePath%>/scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="<%=basePath%>/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="<%=basePath %>/js/store/colorList.js"></script>
<script type="text/javascript" src="<%=basePath %>/My97DatePicker/WdatePicker.js"></script>
<title>颜色</title>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body style="height: 319px; ">
	<form id="submitForm" name="submitForm" action="" method="post">
	  <input name="allIDCheck" hidden="hidden" id="allIDCheck"/>
		<div id="container">
			<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_center">
						    颜色名称&nbsp;&nbsp;<input type="text" id="colorName" name="colorName" class="ui_input_txt02" value="${supplierName}"/>
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="新增" class="ui_input_btn01" id="addBtn" /> 
							<input type="button" value="编辑" class="ui_input_btn01" id="editBtn" /> 
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
						</div>
					</div>
				</div>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th width="30"><input type="checkbox" id="all" onclick="selectOrClearAllCheckbox(this);" />
							</th>
							<th>色系</th>
							<th>编号</th>
							<th>状态</th>
							<th>名称</th>
							<th>创建人</th>
							<th>创建日期</th>
						</tr>
						  <c:forEach items="${pagehelper.list}" var="ps"  varStatus="i">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="${ps.id}" class="acb" /></td>
								<td>${ps.colorScheme}</td>
								<td>${ps.code}</td>
								<td>${ps.status}</td>
								<td>${ps.statusName}</td>
								<td>${ps.colorName}</td>
								<td>${ps.createPerson}</td>
								<td>${ps.createDate}</td>
							</tr>
						  </c:forEach>
					</table>
				</div>
				<div>
				  <%@ include file="../pagehelper.jsp"%> 
			   </div>
			</div>
		</div>
	</form>
	<jsp:include page="../common.jsp"></jsp:include>
  </body>
</html>
