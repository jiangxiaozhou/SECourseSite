<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.file, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>软件工程课程网站</title>

<link rel="shortcut icon" href="assets/images/gt_favicon.png">
	
<!-- <link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700"> -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">

<!-- Custom styles for our template -->
<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen" >
<link rel="stylesheet" href="assets/css/main.css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="assets/js/html5shiv.js"></script>
<script src="assets/js/respond.min.js"></script>
<![endif]-->
	
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	
</head>
<body>
	
	<div class="navbar navbar-inverse navbar-fixed-top headroom" >
		<div class="container">
			<div class="navbar-header">
				
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<a class="navbar-brand" href="/index.jsp"><img src="/assets/images/logo.png" alt="Progressus HTML5 template"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href="studentHome">首页</a></li>
					<li><a href="/student/lookNotice">查看公告</a></li>
					<li><a href="/student/lookHomework">查看/提交作业</a></li>
					<li class="active"><a href="/student/downloadview">下载资料</a></li>
					<li><a href="/student/studentInfo">修改个人资料</a></li>
					<li><a href="/logout">注销</a></li>
				</ul>
			</div>
		</div>
	</div> 
	
	
	<header id="head" class="secondary"></header>
	
	
	
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="/student/studentHome">首页</a></li>
			<li class="active">课程资料</li>
		</ol>
	
        <div class="row">
            <div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">课程资料</h1>
				</header>
                
                <%
				List<file> filelist = file.me.find("select * from files order by uploadtime desc;");
				Collections.reverse(filelist);
				for (file f: filelist) {
					String filename = f.getStr("filename");
					String date = f.getDate("uploadtime").toString().substring(0,10);
					%>
					<div class="col-md-8 col-md-offset-0">
						<div class="panel panel-default">
							<div class="panel-body">
								<h4 class="title"><a href="/upload/download?filename=<%=filename %>"><%=filename %></a></h3>
                    			<hr>
								<p class="text-muted">发布时间： <%=date %></p>
							</div>
						</div>

					</div>
					
				<%}%>
			</article>
		</div>
	</div>
	
	
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