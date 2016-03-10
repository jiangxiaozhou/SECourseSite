<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>软件工程课程网站</title>

<link rel="shortcut icon" href="/assets/images/gt_favicon.png">
	
<!-- <link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700"> -->
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
function checkSubmit() {
	var flag = true;
	if( $("#file").val()=="") {
		alert("未选择任何文件");
		flag = false;
	}	
	return flag;
}
</script>

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
					<li class="active"><a href="/student/lookHomework">查看/提交作业</a></li>
					<li><a href="/student/downloadview">下载资料</a></li>
					<li><a href="/student/studentInfo">修改个人资料</a></li>
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
			<li><a href="/student/lookHomework">查看/提交作业</a></li>
			<li class="active">${homework.title }</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">作业查看/提交</h1>
				</header>
	
				<div class="col-md-6 col-md-offset-1 col-sm-8">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="thin">${homework.title }</h3>
							<hr>
							<p class="text-muted">内容： ${homework.content }</p>
							<p class="text-muted">截止时间： ${homework.deadline }</p>
							<p class="text-muted">发布者：${homework.releaser }</p>
							<hr>
							<form id="form1" action="/student/uploadHomework/${homework.id }" enctype="multipart/form-data" method="post" onsubmit = "return checkSubmit();">
								<div class="top-margin">
									<label>提交作业：</label>
									<input type="file" id="file" name="file"></input>
<!-- 									<button class="btn btn-action" id="btn" type="submit">上传</button> -->
									
									<div class="row">
									<div class="col-lg-12 text-right">
										
										<button class="btn btn-action" type="submit">上传</button>
									</div>
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
</html>