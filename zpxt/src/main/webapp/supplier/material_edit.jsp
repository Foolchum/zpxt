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
<title>进销存系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=basePath %>/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="<%=basePath %>/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="<%=basePath %>/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="<%=basePath %>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/*
		 * 提交
		 */
		$("#submitbutton").click(function() {
			 // alert($("#submitForm").serialize());
			  var clothID = $("#material").val();
		         if(clothID == ""){
		           alert("请输入名称!");
		           return;
		         }
			 var param = $("#submitForm").serialize();
			 var params = param.split("&");
			 var result = "";
			 for(var i = 0;i<params.length;i++){
			    var paramTemp = params[i].split("=");
			    if(paramTemp.length==2){
			      if(paramTemp[1] != ""){
			        if(result.length==0)
			            result = params[i];
			        else
			            result += "&"+params[i];
			      }
			    }
			 }
			 
			  $.ajax({ 
	            type: "POST", 
	            data:result,  //用form的id去找对象 ，也可以使用$('form').serialize(),
	            url: basePath+"/MaterialController/update.do", 
	            success: function(data){    
	               alert(data);
	            } 
      		  });  
		});
	});
	
	
</script>
</head>
<body>
<form id="submitForm" name="submitForm" method="post">
<input name="id" value="${material.id}" hidden="hidden"/>
	<div id="container">
		<div id="nav_links">
			当前位置：面料管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">面料修改</span>
			<div id="page_close">
				<a onclick="javascript:history.back(-1);">
					<img src="<%=basePath %>/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
					<td class="ui_text_rt" width="80">面料名称</td>
					<td class="ui_text_lt">
						<input type="text" id="material" name="material" value="${material.material}" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">颜色${pList}</td>
					<td class="ui_text_lt">
						<select name="colorID" id="colorID" class="ui_select01">
                             <c:forEach items="${plist}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" <c:if test="${material.colorID == ps.id}">selected</c:if>>${ps.colorName}</option>
                             </c:forEach>
                        </select><font style="color: red;">*</font>
					</td>
					
					<td class="ui_text_rt">成份</td>
					<td class="ui_text_lt">
					  <input type="text" id="component" name="component" value="${material.component}"  class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				<tr>
				<td class="ui_text_rt">克重</td>
					<td class="ui_text_lt">
						<input type="text" id="gramWeight" name="gramWeight" value="${material.gramWeight}"  class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">幅宽</td>
					<td class="ui_text_lt">
						<input id="width" name="width" type="text" value="${material.width}"  class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">有效幅宽</td>
					<td class="ui_text_lt">
						<input id="validWidth" name="validWidth" value="${material.validWidth}" type="text" class="ui_input_txt02"/>
					</td>
				</tr>
				<tr>
				<td class="ui_text_rt">花高</td>
					<td class="ui_text_lt">
						<input type="text" id="gramWeight" name="gramWeight" value="${material.gramWeight}"  class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">供应商</td>
					<td class="ui_text_lt">
						<select name="supplierID" id="supplierID" class="ui_select01">
                             <c:forEach items="${dlist}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" <c:if test="${material.supplierID == ps.id}">selected</c:if>>${ps.supplierName}</option>
                             </c:forEach>
                        </select>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
						&nbsp;<input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
						&nbsp;<input id="cancelbutton" type="button" value="取消"  onclick="javascript:history.back(-1);" class="ui_input_btn01"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>
	<jsp:include page="../common.jsp"></jsp:include>
</body>
</html>