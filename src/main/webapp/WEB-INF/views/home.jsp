<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
		Remove this if you use the .htaccess -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>孟津民丰村镇银行考试系统——首页</title>
		<meta name="viewport"
		content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css"
		rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css"
		rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<style>
			.question-number{
				color: #5cb85c;
				font-weight: bolder;
				display: inline-block;
				width: 30px;
				text-align: center;
			}
			
			.question-number-2{
				color: #5bc0de;
				font-weight: bolder;
				display: inline-block;
				width: 30px;
				text-align: center;
			}
			.question-number-3{
				color: #d9534f;
				font-weight: bolder;
				display: inline-block;
				width: 30px;
				text-align: center;
			}
			
			a.join-practice-btn{
				margin:0;
				margin-left:20px;
			}
			
			.content ul.question-list-knowledge{
				padding:8px 20px;
			}
			
			.knowledge-title{
				background-color:#EEE;
				padding:2px 10px;
				margin-bottom:20px;
				cursor:pointer;
				border:1px solid #FFF;
				border-radius:4px;
			}
			
			.knowledge-title-name{
				margin-left:8px;
			}
			
			.point-name{
				width:200px;
				display:inline-block;
			}
			
			/*下面两个样式是用于遮罩层  */
			#bg{ 
			  display: block;
			  position: absolute;
			  top: 0%;
		      left: 0%;
	          width: 100%;
	          height: 100%;
              background-color: black;
              z-index:1001;
              -moz-opacity: 0.7;
              opacity:.70; 
              filter: alpha(opacity=70);
			}
        	#show{
        	  	display: block;
        	    position: absolute;
        	    top: 20%;
	  	        left: 20%;  
	  	        width: 60%;  
	  	        height: 60%;  
	  	        padding: 8px;  
	  	        border: 8px solid #E8E9F7;  
	  	        background-color: white;  
	  	        z-index:1002;  
	  	        overflow: auto;
        	 }
        	 p{text-indent:2em} 
		</style>

	</head>

	<body>
		<header>
			<jsp:include  page="./commons/head.jsp"/>
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
		<div class="content" style="margin-bottom: 100px;">
			<div class="container" style="height:330px;">
				<div>									
					<div class="row">
						<div class="select-test col-xs-6">
							<div style="height: 100px;">
								<div class="select-test-icon">
									<i class="fa fa-male"></i>
								</div>
								<div class="select-test-content">
									<h3 class="title">孟津民丰村镇银行积分系统</h3>									
									<a class="btn btn-primary" href="customer/cust-list"><i class="fa fa-arrow-right"></i>开始进入</a>
									<br/>
									<br/>
									
									
								</div>
								<!--//content-->
							</div>
						</div>
					</div>
										<div class="row">
						<div class="select-test col-xs-6">
							<div style="height: 100px;">
								<div class="select-test-icon">
									<i class="fa fa-file-text"></i>
								</div>
								<div class="select-test-content">
									<h3 class="title">孟津民丰村镇银行考试系统</h3>									
									<a class="btn btn-primary" data-toggle="modal" data-target=".practice-exampaper-modal"><i class="fa fa-arrow-right"></i>开始竞赛</a>
									<br/>
									<br/>
									<div style="color: red;">${msg}</div>
									<div class="modal fade practice-exampaper-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									    	<div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										        <h6 class="modal-title" id="myModalLabel">选择试卷，参加考试</h6>
										     </div>
										     <div class="modal-body">
										     	<ul>
										     		<c:forEach items="${practicepaper}" var="item">
										     			<li>
										     				<a href="student/examing/${item.id}">${item.name}</a>
										     			</li>
										     		</c:forEach>
										     	</ul>
										     </div>
										     <div class="modal-footer">
        										<button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
      										 </div>									    	
									    </div>
									  </div>
									</div>
								</div>
								<!--//content-->
							</div>
						</div>
					</div>
					
				</div>

			</div>

		</div>
		

		
		<footer>
			<jsp:include  page="./commons/foot.jsp"/>
		</footer>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript"
		src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript"
		src="resources/bootstrap/js/bootstrap.min.js"></script>
		
		<c:choose>
			<c:when test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
				<script type="text/javascript">
					

			    </script>
			</c:when>
		</c:choose>		
		<script>
		
		function hidediv() {
		    document.getElementById("bg").style.display ='none';
		    document.getElementById("show").style.display ='none';
		}		
		
		$(function(){
			bindQuestionKnowledage();
			var result = checkBrowser();
			if (!result){
				alert("请至少更新浏览器版本至IE8或以上版本");
			}
		});
		
		function checkBrowser() {
			var browser = navigator.appName;
			var b_version = navigator.appVersion;
			var version = b_version.split(";");
			var trim_Version = version[1].replace(/[ ]/g, "");
			if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE7.0") {
				return false;
			} else if (browser == "Microsoft Internet Explorer"
					&& trim_Version == "MSIE6.0") {
				return false;
			} else
				return true;
		}
		
		function bindQuestionKnowledage(){
			$(".knowledge-title").click(function(){
				var ul = $(this).parent().find(".question-list-knowledge");
				
				if(ul.is(":visible")){
					$(this).find(".fa-chevron-down").hide();
					$(this).find(".fa-chevron-up").show();
					
					$(".question-list-knowledge").slideUp();
					
				}else{
					$(".fa-chevron-down").hide();
					$(".fa-chevron-up").show();
					
					$(this).find(".fa-chevron-up").hide();
					$(this).find(".fa-chevron-down").show();
					
					$(".question-list-knowledge").slideUp();
					ul.slideDown();
					
				}
				
				
			});
		}
		</script>
	</body>
</html>
