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

	<script type="text/javascript">
	$(document).ready(function(){
		if ($("#user-rank").text() == "3") {
			$(".main-page").attr("href", "/teacher/teacherHome.jsp");
			$("#manage-assistants").show();
		}
		else {
			$(".main-page").attr("href", "/assistant/assistantHome.jsp");
			$("#manage-assistants").hide();
		}
	});
	</script>

</head>


<body>
<p id = "user-rank" style = "display:none">${username.rank }</p>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom" >
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<a class = "main-page"><img src="/assets/images/logo.png" alt="Progressus HTML5 template"></a>
			</div>
	
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a class = "main-page">首页</a></li>
					<li><a href="/teacher/manageStudent">管理学生</a></li>
					<li><a href="/teacher/addNoticeview">发布公告</a></li>
					<li><a href="/teacher/addHomeworkview">发布作业</a></li>
					<li><a href="/upload">发布资料</a></li>
					<li class="active" id = "manage-assistants"><a href="/teacher/addAssitantview">管理助教</a></li>
					<li><a href="/teacher/lookHomeworkview">查看作业</a></li>
					<li><a href="/logout">注销</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div> 
	<!-- /.navbar -->

	<header id="head" class="secondary"></header>
	
	<div class="container">

		<ol class="breadcrumb">
			<li><a class = "main-page">首页</a></li>
			<li class="active">添加助教</li>
		</ol>

		<div class="row">
			<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h3 class="page-title">添加助教</h1>
				</header>
				
				
			<form id="assistant" action="/teacher/addAssistant" method="post">
				<fieldset class="solid">
				
					<input type="hidden" name="blog.id" />
					<div>
						<label>助教ID </label>
						<input type="text" name="userName" ></input>
					</div>
					<br>
					<div>
						<label>助教密码 </label>
						<input type="text" name="password" ></input>
					</div>
					<br>
					<div>
						<label>助教编号</label>
						<input type="text" name="sno" />
					</div>
					<br>
					<div>
						<label>助教邮箱</label>
						<input type="text" name="email" />
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
					</div>
				</fieldset>
			</form>
			</article>
			</div>
		</div>
	</div>

</body>
</html>