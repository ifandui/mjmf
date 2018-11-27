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
		<title>孟津民丰村镇银行——机关员工评价</title>
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
		<link href="resources/css/jquery-ui-1.9.2.custom.min.css" rel="stylesheet">
		<style type="text/css">
  .cl{
    float: left;
    clear: left;
    width: 300px;
    margin: 15px;
  }
  table{padding-left:4px;}
  td{border:3px #fef222 dashed;}
  div .sp{font-weight:bold;color:red;padding-top:6px;float:left;width:20px;}
</style>

	</head>

	<body>
		<div style="text-align:center;margin:30px 0px;font-size:40px;">2018年3季度总行机关员工评价表</div>

<div style="text-align:center;">
<div id="containerdiv" style="overflow:hidden; display:inline-block;">
<c:forEach items="${users }" var="item">
<div style="display:inline-block;padding:10px;">
<table><tr><td colspan="2" style="font-weight:bold;background-color:khaki;border-color:khaki;border-style:solid;font-size:20px;">${item.username }</td>     </tr>
<tr><td>政策水平</td><td><div class="cl" id="zcsp_${item.id }">10</div><div data-name="${item.username }" class="sp sp_${item.id }" id="sp_zcsp_${item.id }"></div></td></tr>
<tr><td>指导能力</td><td><div class="cl" id="zdnl_${item.id }">10</div><div data-name="${item.username }" class="sp sp_${item.id }" id="sp_zdnl_${item.id }"></div></td></tr>
<tr><td>服务态度</td><td><div class="cl" id="fwtd_${item.id }" >10</div><div data-name="${item.username }" class="sp sp_${item.id }" id="sp_fwtd_${item.id }"></div></td></tr>
<tr><td>服务效率</td><td><div class="cl" id="fwxl_${item.id }">10</div><div data-name="${item.username }" class="sp sp_${item.id }" id="sp_fwxl_${item.id }"></div></td></tr>
<tr><td>服务质量</td><td><div class="cl" id="fwzl_${item.id }">10</div><div data-name="${item.username }" class="sp sp_${item.id }" id="sp_fwzl_${item.id }"></div></td></tr>   </table>
</div>
</c:forEach>

		<div style="clear:both;"></div>
		<div>
		<div style="text-align:center;">
 <select class="form-control" id="department" name="department" style="display:inline;width:400px;">
 <option value="-1">--请选择--</option>
												<option value="孟津民丰村镇银行营业部">孟津民丰村镇银行营业部</option>
												<option value="孟津民丰村镇银行城关支行">孟津民丰村镇银行城关支行</option>
												<option value="孟津民丰村镇银行麻屯支行">孟津民丰村镇银行麻屯支行</option>
												<option value="孟津民丰村镇银行白鹤支行">孟津民丰村镇银行白鹤支行</option>
												<option value="孟津民丰村镇银行会盟支行">孟津民丰村镇银行会盟支行</option>
											</select>
</div>
<div>${ip }</div>
		<div><input type="button" value="提交" id="btn_commit"/></div>
		<div class="rules"><p>规则：不得有相同分数。</div>
		</div>
	</div>	
		</div>
		
		

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src="resources/js/all.js"></script>
		<script type="text/javascript" src="resources/js/jquery/jquery-ui.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript"
		src="resources/bootstrap/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
		var ip='${ip}';
		
		function randomString(len) {
			　　len = len || 32;
			　　var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';    /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
			　　var maxPos = $chars.length;
			　　var pwd = '';
			　　for (i = 0; i < len; i++) {
			　　　　pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
			　　}
			　　return pwd;
			}
		
		
		
		
		$(function() {
			
			var tot=new Object();
			    
			$( "div.cl" ).each(function(i,o){
				var value=$(o).text();
				$(o).next().text(value);
				$(o).empty().slider({
				      orientation: "horizontal",
				      range: "min",
				      max: 20,
				      value: value,
				      slide: function(e,ui){
				    	  var v=ui.value;
				    	  $("#sp_"+$(ui.handle).parent("div")[0].id).text(v);
				    	  
				      }
				    });
				
			});
		    
			
			$("#btn_commit").click(function(){
				var sn=randomString(32);
				var tot=new Object();
				var datas=[];
				var department=document.getElementById('department').value;
				if(department=="-1"){
					alert("未选择机构");
					return false;
					}
				$(".sp").each(function(i,o){
					var $o=$(o);

					var name=$o.data("name");
					var tp=o.id.split("_")[1];	
					var id=o.id.split("_")[2];	
					var value=$o.text();
					
					
					var obj=new Object();
					if(tot[id]!=null)
						obj=tot[id];
					obj.username=department;
					obj.sn=sn;
					obj.ip=ip;
					obj.target=$o.data("name");
					obj[tp]=$o.text();
					
					tot[id]=obj;					
				});

				
				console.log(tot);
				var tots={};
				for(var i in tot){
					var t=tot[i];
					var sum=parseInt(t.zcsp)+parseInt(t.zdnl)+parseInt(t.fwtd)+parseInt(t.fwxl)+parseInt(t.fwzl);
					//console.log(t.target+":"+sum);
					if(tots[sum]==null)
						tots[sum]=t.target;
					else{
						//alert(t.target+"与"+tots[sum]+"分数同为"+sum+"，请修改。" );
						//return false;
					}
					datas.push(tot[i]);
				}

				$("#btn_commit").attr('disabled','disabled');
				var jsons=JSON.stringify(datas);
				jQuery.ajax({
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					type : "POST",
					data:jsons,
					url : 'pingfen',
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
