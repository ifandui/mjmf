<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- <%@taglib uri="spring.tld" prefix="spring"%> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
    	<base href="<%=basePath%>">
    
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>孟津民丰村镇银行——积分维护</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<link href="resources/css/exam.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">

	</head>
	<body>
		<header>
			<jsp:include  page="../commons/head.jsp"/>
		</header>
		<!-- Navigation bar starts -->

		<div class="navbar bs-docs-nav" role="banner">
			<div class="container">
				<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
					<ul class="nav navbar-nav">
						<li class="active">
							<a href="home"><i class="fa fa-home"></i>主页</a>
						</li>					
						<li>
							<a href="student/setting"><i class="fa fa-cogs"></i>个人设置</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>

		<!-- Navigation bar ends -->

		<!-- Slider starts -->

		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;">

				<div class="row">
					<div class="col-xs-3">
						<ul class="nav default-sidenav">
						<li>
								<a href="customer/cust-list"> <i class="fa fa-wrench"></i> 存量客户 </a>
							</li>
							<li class="active">
								<a> <i class="fa fa-times"></i> 差错录入 </a>
							</li>
													
						</ul>
					</div>
					<div class="col-xs-9">
						
						<div class="page-content row">
							<div id="d_month"></div>
							<div>${userinfo.truename }</div>
							
							<select class="form-control" id="sel_points">
							<option value="-1">请选择</option>
							<c:forEach items="${pointlist }" var="item">
								<option data-text="${item.type }--${item.name }--${item.point }" value="${item.id}">${item.type }--${item.name }--${item.point }</option>
							</c:forEach>
							</select>
							<div>
								<ul id="ul_temp_list">
									
								</ul>
							</div>
							

						</div>
						<!--  -->
						<div class="expand-bk-content" id="bk-conent-exampaper">
						<div id="exampaper-header">
							<div id="exampaper-title">
								<i class="fa fa-send"></i> <span id="exampaper-title-name">合计：${sumPoints }
								</span>
							</div>

							<div id="exampaper-desc-container">
								<div id="exampaper-desc" class="exampaper-filter">
									<span
										class="efi-qt-singlechoice efi-selected1">个人基础</span>
								</div>
								<table style="width: 100%;">
									<tr>
										<td class="efi-selected">月份</td>
										<td class="efi-selected">项目</td>
										<td class="efi-selected">规则</td>
										<td class="efi-selected">分值</td>
									</tr>
									<c:forEach items="${pointsMap['个人基础']}" var="item">
										<tr>
											<td>${item.month }</td>
											<td>${item.description }</td>
											<td>${item.name }</td>
											<td>${item.point }</td>
										</tr>

									</c:forEach>
								</table>
							</div>

				<div id="exampaper-desc-container">
								<div id="exampaper-desc" class="exampaper-filter">
									<span
										class="efi-qt-singlechoice efi-selected1">业务素质</span>
								</div>
								<table style="width: 100%;">
									<tr>
										<td class="efi-selected">月份</td>
										<td class="efi-selected">项目</td>
										<td class="efi-selected">规则</td>
										<td class="efi-selected">分值</td>
									</tr>
									<c:forEach items="${pointsMap['业务素质']}" var="item">
										<tr>
											<td>${item.month }</td>
											<td>${item.description }</td>
											<td>${item.name }</td>
											<td>${item.point }</td>
										</tr>

									</c:forEach>
								</table>
							</div>
							
							<div id="exampaper-desc-container">
								<div id="exampaper-desc" class="exampaper-filter">
									<span
										class="efi-qt-singlechoice efi-selected1">团队意识</span>
								</div>
								<table style="width: 100%;">
									<tr>
										<td class="efi-selected">月份</td>
										<td class="efi-selected">项目</td>
										<td class="efi-selected">规则</td>
										<td class="efi-selected">分值</td>
									</tr>
									<c:forEach items="${pointsMap['团队意识']}" var="item">
										<tr>
											<td>${item.month }</td>
											<td>${item.description }</td>
											<td>${item.name }</td>
											<td>${item.point }</td>
										</tr>

									</c:forEach>
								</table>
							</div>
							<div id="exampaper-desc-container">
								<div id="exampaper-desc" class="exampaper-filter">
									<span
										class="efi-qt-singlechoice efi-selected1">自我成长</span>
								</div>
								<table style="width: 100%;">
									<tr>
										<td class="efi-selected">月份</td>
										<td class="efi-selected">项目</td>
										<td class="efi-selected">规则</td>
										<td class="efi-selected">分值</td>
									</tr>
									<c:forEach items="${pointsMap['自我成长']}" var="item">
										<tr>
											<td>${item.month }</td>
											<td>${item.description }</td>
											<td>${item.name }</td>
											<td>${item.point }</td>
										</tr>

									</c:forEach>
								</table>
							</div>
							<div id="exampaper-desc-container">
								<div id="exampaper-desc" class="exampaper-filter">
									<span
										class="efi-qt-singlechoice efi-selected1">工作数量</span>
								</div>
								<table style="width: 100%;">
									<tr>
										<td class="efi-selected">月份</td>
										<td class="efi-selected">项目</td>
										<td class="efi-selected">规则</td>
										<td class="efi-selected">分值</td>
									</tr>
									<c:forEach items="${pointsMap['工作数量']}" var="item">
										<tr>
											<td>${item.month }</td>
											<td>${item.description }</td>
											<td>${item.name }</td>
											<td>${item.point }</td>
										</tr>

									</c:forEach>
								</table>
							</div>
							<div id="exampaper-desc-container">
								<div id="exampaper-desc" class="exampaper-filter">
									<span
										class="efi-qt-singlechoice efi-selected1">工作质量</span>
								</div>
								<table style="width: 100%;">
									<tr>
										<td class="efi-selected">月份</td>
										<td class="efi-selected">项目</td>
										<td class="efi-selected">规则</td>
										<td class="efi-selected">分值</td>
									</tr>
									<c:forEach items="${pointsMap['工作质量']}" var="item">
										<tr>
											<td>${item.month }</td>
											<td>${item.description }</td>
											<td>${item.name }</td>
											<td>${item.point }</td>
										</tr>

									</c:forEach>
								</table>
							</div>
							<div id="exampaper-desc-container">
								<div id="exampaper-desc" class="exampaper-filter">
									<span
										class="efi-qt-singlechoice efi-selected1">工作态度</span>
								</div>
								<table style="width: 100%;">
									<tr>
										<td class="efi-selected">月份</td>
										<td class="efi-selected">项目</td>
										<td class="efi-selected">规则</td>
										<td class="efi-selected">分值</td>
									</tr>
									<c:forEach items="${pointsMap['工作态度']}" var="item">
										<tr>
											<td>${item.month }</td>
											<td>${item.description }</td>
											<td>${item.name }</td>
											<td>${item.point }</td>
										</tr>

									</c:forEach>
								</table>
							</div>
							<div id="exampaper-desc-container">
								<div id="exampaper-desc" class="exampaper-filter">
									<span
										class="efi-qt-singlechoice efi-selected1">工作业绩</span>
								</div>
								<table style="width: 100%;">
									<tr>
										<td class="efi-selected">月份</td>
										<td class="efi-selected">项目</td>
										<td class="efi-selected">规则</td>
										<td class="efi-selected">分值</td>
									</tr>
									<c:forEach items="${pointsMap['工作业绩']}" var="item">
										<tr>
											<td>${item.month }</td>
											<td>${item.description }</td>
											<td>${item.name }</td>
											<td>${item.point }</td>
										</tr>

									</c:forEach>
								</table>
							</div>
							<div id="exampaper-desc-container">
								<div id="exampaper-desc" class="exampaper-filter">
									<span
										class="efi-qt-singlechoice efi-selected1">支行评价</span>
								</div>
								<table style="width: 100%;">
									<tr>
										<td class="efi-selected">月份</td>
										<td class="efi-selected">项目</td>
										<td class="efi-selected">规则</td>
										<td class="efi-selected">分值</td>
									</tr>
									<c:forEach items="${pointsMap['支行评价']}" var="item">
										<tr>
											<td>${item.month }</td>
											<td>${item.description }</td>
											<td>${item.name }</td>
											<td>${item.point }</td>
										</tr>

									</c:forEach>
								</table>
							</div>
						</div>
						<input type="hidden" id="hist-id" value="1606"> <input
							type="hidden" id="paper-id" value="1">
						<ul id="exampaper-body">

						</ul>
					</div>
						
						
						
						
						
					</div>
				</div>
			</div>
		</div>

		<footer>
			<jsp:include  page="../commons/foot.jsp"/>
		</footer>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src="resources/js/all.js"></script>
		
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script>
		
		
		function removeLi(point_id){
			$("#ul_temp_list_"+point_id).remove();
		}
			$(function(){
				var date=new Date();
				var month=date.getMonth()+1;
				if(month>9)
					$("#d_month").text(date.getFullYear()+""+month);
				else
					$("#d_month").text(date.getFullYear()+"0"+month);
				
				
				$("#sel_points").change(function(){
					var cur_option=$(this).find("option:selected");
					var point_id=cur_option.val();
					if(point_id<1) return false;
					var point_text=cur_option.text();
					var $ul_temp_list=$("#ul_temp_list");					
					$ul_temp_list.append("<li id=\"ul_temp_list_"+point_id+"\">"+point_text+"<span class=\"fa fa-times\" style=\"padding-left:5px;cursor:pointer;\" onclick=\"removeLi("+point_id+")\"></span></li>");

				});
				
				$("#btn_save").click(function(){
					var inpts=$(".inp-misscount");
					var res=[];
					inpts.each(function(i,item){
						var obj=new Object();
						obj.id=$(item).data("id");
						obj.miss_count=$(item).val();
						res.push(obj);
					});
					if(res.length==0) return;
					var datas=JSON.stringify(res)
					console.log(datas);
					
					jQuery.ajax({
						headers : {
							'Accept' : 'application/json',
							'Content-Type' : 'application/json'
						},
						type : "POST",
						data:datas,
						url : 'user/miss-fullfill-list',
						success : function(message,tst,jqXHR) {
							if(!util.checkSessionOut(jqXHR))return false;
							console.log(message);
							if (message.result == "success") {
								util.success("操作成功！", function(){
									 window.location.reload();
								});
							} else {
								util.error(message.result);
							}
						},
						error : function(jqXHR, textStatus) {
							util.error("操作失败请稍后尝试");
						}
					});
					
					
				});
				
			});
		
		</script>
	</body>
</html>