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
		<title>孟津民丰村镇银行——业务量录入</title>
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
							<li>
								<a href="customer/cust-fullfill-list"> <i class="fa fa-list-ul"></i> 新客户认领 </a>
							</li>
							<li class="active">
								<a> <i class="fa fa-wrench"></i> 业务量录入 </a>
							</li>
													
						</ul>
					</div>
					<div class="col-xs-9">
						
						<div class="page-content row">
<div style="font-weight:bold;text-align:center;border-bottom:3px solid #428bca;padding:10px 0px;">${curr_department }</div>
							<div id="question-list">
								<table class="table-striped table">
									<thead>
										<tr>
											<td>月份</td>
											<td>OA号</td>											
											<td>姓名</td>											
											<td>总业务量</td>
											<td>差错数</td>											
											<td>差错率</td>
											<td></td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${mistakeList }" var="item">
											<tr>												
												<td>${item.month }</td>
												<td>${item.oa_num }</td>
												<td>${item.oa_nm }</td>
												<td><input type="text" class="inp-totalcount" data-id="${item.id}" id="inp_total_count_${item.id }" value='${item.total_count }' /></td>
												
												<td>${item.miss_count }</td>
												<td>${item.mis_rate }</td>
												<!-- <td></td> -->
												<td>
													
												</td>
											</tr>
										</c:forEach>
										
									</tbody><tfoot></tfoot>
								</table>
							</div>
							<div id="page-link-content">
							<c:if test="${! empty totalRecord}">
								<div><input type="button" value="保存" id="btn_save" /></div></c:if>
								<ul class="pagination pagination-sm">${pageStr}</ul>
							</div>

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
			$(function(){
				$("#department").change(function(){
					var dept=$(this).val()
					
					location.href="user/miss-fullfill-list?dept="+dept;
				});
				
				$("#btn_save").click(function(){
					var inpts=$(".inp-totalcount");
					var res=[];
					inpts.each(function(i,item){
						var obj=new Object();
						obj.id=$(item).data("id");
						obj.total_count=$(item).val();
						res.push(obj);
					});
					var datas=JSON.stringify(res)
					console.log(datas);
					
					jQuery.ajax({
						headers : {
							'Accept' : 'application/json',
							'Content-Type' : 'application/json'
						},
						type : "POST",
						data:datas,
						url : 'user/total-fullfill-list',
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