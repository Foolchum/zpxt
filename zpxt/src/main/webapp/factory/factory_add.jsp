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
			      }else{
			         if(i!=params.length-1){
			           alert("请填写必填选项");
			           return;
			         }
			      }
			    }
			 }
			 
			  $.ajax({ 
	            type: "POST", 
	            data:result,  //用form的id去找对象 ，也可以使用$('form').serialize(),
	            url: basePath+"/FactoryController/save.do", 
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
	<div id="container">
		<div id="nav_links">
			当前位置：员工管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">厂家新增</span>
			<div id="page_close">
				<a onclick="javascript:history.back(-1);">
					<img src="<%=basePath %>/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
					<td class="ui_text_rt" width="80">工厂名称</td>
					<td class="ui_text_lt">
						<input type="text" id="factoryName" name="factoryName" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				<tr>
				<td class="ui_text_rt">地址</td>
					<td class="ui_text_lt">
						<input type="text" id="address" name="address"  class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				<tr>
						<td class="ui_text_rt">固定电话</td>
					<td class="ui_text_lt">
						<input type="text" id="tel" name="tel" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>	
				</tr>
				<tr>
				<td class="ui_text_rt">负责人</td>
					<td class="ui_text_lt">
						<input type="text" id="leaderName" name="leaderName"  class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				<tr>
						<td class="ui_text_rt">负责人电话</td>
					<td class="ui_text_lt">
						<input type="text" id="leaderPhone" name="leaderPhone" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>	
				</tr>
				<tr>
						<td class="ui_text_rt">邮箱</td>
					<td class="ui_text_lt">
						<input type="text" id="mail" name="mail" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>	
				</tr>
				<tr>
						<td class="ui_text_rt">备注</td>
					<td class="ui_text_lt">
						<input type="text" id="description" name="description" class="ui_input_txt02"/><font style="color: red;"></font>
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