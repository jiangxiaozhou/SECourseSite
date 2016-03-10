<%@ page language="java" import="com.jfinal.core.Controller,com.model.user" contentType="text/html; charset=UTF-8"
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
	<script src="/assets/js/html5shiv.js"></script>
	<script src="/assets/js/respond.min.js"></script>
	<![endif]-->
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	
</head>


<body>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom" >
		<div class="container">
			<div class="navbar-header">
				Button for smallest screens
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<a class="navbar-brand" href="/index.jsp"><img src="/assets/images/logo.png" alt="Progressus HTML5 template"></a>
			</div>
	
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href="/student/studentHome">首页</a></li>
					<li><a href="/student/lookNotice">查看公告</a></li>
					<li><a href="/student/lookHomework">查看/提交作业</a></li>
					<li><a href="/student/downloadview">下载资料</a></li>
					<li class="active"><a href="/student/studentInfo">修改个人资料</a></li>
					<li><a href="/logout">注销</a></li>
				</ul>
			</div>/.nav-collapse
		</div>
	</div>
	<!-- /.navbar -->

	<header id="head" class="secondary"></header>
	
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="/student/studentHome">首页</a></li>
			<li class="active">修改个人资料</li>
		</ol>

		<div class="row">
			<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h3 class="page-title">修改个人资料</h1>
				</header>
				
				
			<form id="userinfo" action="/student/modifyInfo" method="post">
				<fieldset class="solid">
				
					<input type="hidden" name="blog.id" />
					<div>
						<label>账号 </label>
						<input type="text" name="userName" value="${user.username}" readonly></input>
					</div>
					<br>
					<div>
						<label>密码 </label>
						<input type="password" name="password" value="${user.password }" ></input>
					</div>
					<br>
					<div>
						<label>再次输入密码 </label>
						<input type="password" name="password1" value="${user.password }" ></input>
					</div>
					<br>
					<div>
						<label>学号</label>
						<input type="text" name="sno" value="${user.sno }" readonly/>
					</div>
					<br>
					<div>
						<label>邮箱</label>
						<input type="text" name="email" value="${user.email }" />
					</div>
					<br>
					<div>
						<label>&nbsp;</label> 
						<div class="row">
									<div class="col-lg-12 text-left">
										<button class="btn btn-action" type="submit">确定</button>
										<button class="btn btn-action" type="reset">取消</button>
									</div>
								</div>
						<!-- <input value="提交" type="submit" />
						<input value="取消" type="reset" /> -->
					</div>
				</fieldset>
			</form>
			</article>
			</div>
		</div>
	</div>

</body>
</html>