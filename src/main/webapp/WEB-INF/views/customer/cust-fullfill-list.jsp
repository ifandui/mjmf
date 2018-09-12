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
		<title>孟津民丰村镇银行——新客户认领</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<link href="resources/css/exam.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">
<style type="text/css">
			.disable-btn, .enable-btn{
				text-decoration: underline;
			}
			.disable-btn, .enable-btn{
				cursor:pointer;
			}
		</style>
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
								<a href="customer/cust-list"> <i class="fa fa-list-ul"></i> 存量客户 </a>
							</li>
							<li class="active">
								<a> <i class="fa fa-list-ul"></i> 新客户认领 </a>
							</li>						
						</ul>
					</div>
					<div class="col-xs-9">
						
						<div class="page-content row">

							
							<div id="question-list">
								<table class="table-striped table">
									<thead>
										<tr>
											<td>客户号</td>											
											<td>姓名</td>
											<td>年日均</td>											
											<td>当前余额</td>											
											<td>开户日期</td><td>归属</td><td></td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${custList }" var="item">
											<tr>
												<td>${item.cust_no }</td><td>${item.cust_name }</td>
												<td>${item.tot_y_acm }</td>
												<td>${item.tot_amt_now }</td>
												<!-- <td></td> -->
												<td>
													${item.open_dt }
												</td>
												<td><select class="form-control" name="oa_num" id="oa_num_${item.data_id}">
													<option value=""> 请选择</option>
													<c:forEach items="${userlist}" var="v">
													<option value="${v.username}">${v.truename}</option>
													</c:forEach>
												</select></td><td><span class="label label-success enable-btn" data-id="${item.data_id}">确认</span></td>
											</tr>
										</c:forEach>
										
									</tbody><tfoot></tfoot>
								</table>
							</div>
							<div id="page-link-content">
							<c:if test="${! empty totalRecord}">
								<div>共${totalRecord}条记录</div></c:if>
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
				
				
				$(".enable-btn").click(function(){
					var data_id=$(this).data("id");
					
					var data_id=data_id;
					var oa_num=$("#oa_num_"+data_id).val();
					var oa_nm=$("#oa_num_"+data_id).find("option:selected").text();
					var data={'data_id':data_id,'oa_num':oa_num,'oa_nm':oa_nm};
					console.log(data);
					var message = "确定要提交吗？";
					var answer = confirm(message);
					if(!answer){
						return false;
					}
					jQuery.ajax({
						headers : {
							'Accept' : 'application/json',
							'Content-Type' : 'application/json'
						},
						type : "POST",
						data:JSON.stringify(data),
						url : 'customer/cust-fullfill',
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