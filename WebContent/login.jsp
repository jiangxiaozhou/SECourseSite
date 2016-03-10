<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>软件工程课程网站</title>

<link rel="shortcut icon" href="/assets/images/gt_favicon.png">
	
<!-- 	<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700"> -->
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/css/font-awesome.min.css">

	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="/assets/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="/assets/css/main.css">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
	
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
function checkSubmit() {

	var flag = true;
	if( $("#user-id").val()=="") {
		$("#user-id").addClass("warn");
		$(".empty-id").html("ID不能为空");
		$(".empty-id").css({
			"display":"inline",
			"color":"red"        	   
		});
		flag = false;
	}
	else {
		$("#user-id").removeClass("warn");
		$(".empty-id").css("display","none");
	}
	
	if( $("#password").val()=="") {
		$("#password").addClass("warn");
		$(".empty-password").html("密码不能为空");
		$(".empty-password").css({
			"display":"inline",
			"color":"red"        	   
		});
		flag = false;
	}
	else {
		$("#password").removeClass("warn");
		$(".empty-password").css("display","none");
	}
	
	return flag;
}
</script>

<style type="text/css">
.warn
{
border: 1px solid red;
}
</style>
	
</head>
<body>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom" >
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<a class="navbar-brand" href="/index.jsp"><img src="/assets/images/logo.png" alt="Progressus HTML5 template"></a>
			</div>
		</div>
	</div> 
	<!-- /.navbar -->
	
	<header id="head" class="secondary"></header>
	
	<!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="/index">Home</a></li>
			<li class="active">Sign in</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Sign in</h1>
				</header>
				
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="thin text-center">Sign in to your account</h3>
							<p class="text-center text-muted">如果您还没有该网站的账号，请点击<a href="/register">Register</a> 进行注册。 </p>
							<hr>
		
							<form action="/login/comfirm" method="post" onsubmit = "return checkSubmit();">
								<div class="top-margin">
									<label>请输入您的ID <span class="text-danger">*</span></label>
									<input id = "user-id" type="text" class="form-control" name="userName"/>
									<span class = "error empty-id"></span>
								</div>
								<div class="top-margin">
									<label>请输入您的密码  <span class="text-danger">*</span></label>
									<input id = "password" type="password" class="form-control" name="password" />
									<span class = "error empty-password"></span>
								</div>
								<p><font color="#ff0000">${msg }</font></p>
								<hr>

								<div class="row">
									<div class="col-lg-12 text-right">
										<button class="btn btn-action" type="submit">Sign in</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
				
			</article>
			<!-- /Article -->

		</div>
	</div>	<!-- /container -->
	
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	
	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
<!-- 	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="/assets/js/headroom.min.js"></script>
	<script src="/assets/js/jQuery.headroom.min.js"></script>
	<script src="/assets/js/template.js"></script>
	
</body>
</html>