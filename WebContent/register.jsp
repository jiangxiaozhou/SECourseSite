<!DOCTYPE html>
<html lang="en">
<%@page pageEncoding="UTF-8" %>
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">
	
	<title>Sign up - 软工课程网站</title>

	<link rel="shortcut icon" href="/assets/images/gt_favicon.png">
	
	<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/css/font-awesome.min.css">

	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="/assets/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="/assets/css/main.css">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="/assets/js/html5shiv.js"></script>
	<script src="/assets/js/respond.min.js"></script>
	<![endif]-->
	
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
	function checkSubmit(){
		var flag=true;
		
		if($("#user-no").val()==""){
			$("#user-no").addClass("warn");
			$(".empty-no").html("学号不能为空");
			$(".empty-no").css({"display":"inline","color":"red"});
			flag=false;
		}
		else{
			$("#user-no").removeClass("warn");
			$(".empty-no").css("display","none");
		}
		
		if($("#user-id").val()==""){
			$("#user-id").addClass("warn");
			$(".empty-id").html("ID不能为空");
			$(".empty-id").css({"display":"inline","color":"red"});
			flag=false;
		}
		else{
			$("#user-id").removeClass("warn");
			$(".empty-id").css("display","none");
		}
		
		if($("#user-mail").val()==""){
			$("#user-mail").addClass("warn");
			$(".empty-mail").html("邮箱不能为空");
			$(".empty-mail").css({"display":"inline","color":"red"});
			flag=false;
		}
		else{
			$("#user-mail").removeClass("warn");
			$(".empty-mail").css("display","none");
		}
		
		if($("#password").val()==""){
			$("#password").addClass("warn");
			$(".empty-password").html("密码不能为空");
			$(".empty-password").css({"display":"inline","color":"red"});
			flag=false;
		}
		else{
			$("#password").removeClass("warn");
			$(".empty-password").css("display","none");
		}
		
		if($("#password2").val()==$("#password").val()){
			$("#password2").removeClass("warn");
			$(".inconsistent-password").css("display","none");
		}
		else{
			$("#password2").addClass("warn");
			$(".inconsistent-password").html("密码不一致");
			$(".inconsistent-password").css({"display":"inline","color":"red"});
			flag=false;
		}
		
		return flag;
	}
	</script>
	<style type="text/css">
	.warn{
		border:1px solid red;
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
			<li><a href="index.html">Home</a></li>
			<li class="active">Sign up</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">Sign up</h1>
				</header>
				
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="thin text-center">Register a new account</h3>
							<p class="text-center text-muted">如果您已经有账号，请点击 <a href="/login">Login</a> 进行登录。 </p>
							<hr>

							<form action="/register/add" method="post" onsubmit="return checkSubmit()">
								<div class="top-margin">
									<label>请输入您的学号 <span class="text-danger">*</span></label>
									<input id="user-no" type="text" class="form-control" name="sno">
									<span class="error empty-no"></span>
								</div>
								<div class="top-margin">
									<label>请输入您的ID <span class="text-danger">*</span></label>
									<input id="user-id" type="text" class="form-control" name="userName">
									<span class="error empty-id"></span>
								</div>
								<div class="top-margin">
									<label>请输入您的邮箱 <span class="text-danger">*</span></label>
									<input id="user-mail" type="text" class="form-control" name="email">
									<span class="error empty-mail"></span>
								</div>

								<div class="row top-margin">
									<div class="col-sm-6">
										<label>请输入您的密码 <span class="text-danger">*</span></label>
										<input id="password" type="password" class="form-control" name="password">
										<span class = "error empty-password"></span>
									</div>
									<div class="col-sm-6">
										<label>再次输入密码 <span class="text-danger">*</span></label>
										<input id="password2" type="password" class="form-control" name="password2">
										<span class = "error inconsistent-password"></span>
									</div>
								</div>
								<p><font color="#ff0000">${msg }</font></p>
								<hr>

								<div class="row">
									<div class="col-lg-12 text-right">
										<button class="btn btn-action" type="submit">Sign up</button>
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
	
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	
	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="/assets/js/headroom.min.js"></script>
	<script src="/assets/js/jQuery.headroom.min.js"></script>
	<script src="/assets/js/template.js"></script>
</body>
</html>