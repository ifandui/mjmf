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
		<title>孟津民丰村镇银行——个人设置</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
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
						<li>
							<a href="home"><i class="fa fa-home"></i>主页</a>
						</li>						
						<li class="active">
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

			<div class="container" style="min-height:450px;">

				<div class="row">
					<div class="col-xs-3">
						<ul class="nav default-sidenav">
							<li class="active">
								<a> <i class="fa fa-cogs"></i> 基本资料 </a>
							</li>
							<li>
								<a href="student/change-password"> <i class="fa fa-wrench"></i> 修改密码 </a>
							</li>

						</ul>

					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1><i class="fa fa-cogs"></i> 基本资料</h1>
						</div>
						<div class="page-content row">
							<form class="form-horizontal" id="form-change-password" action="student/setting" style="margin-top:40px;" method="post">
									
									<!-- password -->
									<div class="form-group form-username">
										<label class="control-label col-md-2" for="username">姓名</label>
										<div class="col-md-5">
											<input type="text" class="form-control" name="username" id="username" disabled="disabled" value="${user.truename }">
											<span class="form-message"></span>
										</div>
									</div>
									
									<!-- password-confirm -->
									<div class="form-group form-password-confirm">
										<label class="control-label col-md-2" for="phone">手机</label>
										<div class="col-md-5">
											<input type="text" class="form-control" name="phone" id="phone" value="${user.phone }">
											<span class="form-message"></span>
										</div>
									</div>

									<!-- password-confirm -->
									<div class="form-group form-password-confirm">
										<label class="control-label col-md-2" for="address">部门</label>
										<div class="col-md-5">
											<select class="form-control" id="department" name="department">
												<option <c:if test="${'孟津民丰村镇银行营业部' eq user.department}">selected</c:if> value="孟津民丰村镇银行营业部">孟津民丰村镇银行营业部</option>
												<option <c:if test="${'孟津民丰村镇银行城关支行' eq user.department}">selected</c:if> value="孟津民丰村镇银行城关支行">孟津民丰村镇银行城关支行</option>
												<option <c:if test="${'孟津民丰村镇银行麻屯支行' eq user.department}">selected</c:if> value="孟津民丰村镇银行麻屯支行">孟津民丰村镇银行麻屯支行</option>
												<option <c:if test="${'孟津民丰村镇银行白鹤支行' eq user.department}">selected</c:if> value="孟津民丰村镇银行白鹤支行">孟津民丰村镇银行白鹤支行</option>
												<option <c:if test="${'孟津民丰村镇银行会盟支行' eq user.department}">selected</c:if> value="孟津民丰村镇银行营业部">孟津民丰村镇银行会盟支行</option>
												<option <c:if test="${'孟津民丰村镇银行机关' eq user.department}">selected</c:if> value="孟津民丰村镇银行机关">孟津民丰村镇银行机关</option>
											</select>
											<span class="form-message"></span>
										</div>
									</div>

									<!-- Buttons -->
									<div class="form-group">
										<!-- Buttons -->
										<div class="col-md-5 col-md-offset-2">
											<button type="submit" class="btn" id="btn-reg">
												确认修改
											</button>
										
										</div>
									</div>
								</form>
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
		<script type="text/javascript" src="resources/chart/raphael-min.js"></script>
		<script type="text/javascript" src="resources/chart/morris.js"></script>
		<script type="text/javascript" src="resources/js/modify-user.js"></script>
	</body>
</html>