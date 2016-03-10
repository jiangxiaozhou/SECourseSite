<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.model.user, java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li id = "manage-assistants"><a href="/teacher/addAssitantview">管理助教</a></li>
					<li class="active"><a href="/teacher/lookHomeworkview">查看作业</a></li>
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
			<li class="active">查看作业</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
			<header class="page-header">
				<h1 class="page-title">按时提交</h1>
			</header>
			<table border="1" style="margin-left:120px;">
			<tr>
			<th width = "120" style="text-align: middle;">作业</th>
			<th width = "120" style="text-align: middle;">提交时间</th>
			<th width = "120" style="text-align: middle;">提交者</th>
			</tr>
			<c:forEach items="${homeworkRlist1}" var="homeworkR">
				<tr>
				<td style="text-align: left;" width = "120"><a href="/teacher/downloadHomework/${homeworkR.id }">${homeworkR.filename}</a></td>
				<td style="text-align: left;" width = "120">${homeworkR.submittime }</td>
				<td style="text-align: left;" width = "120">${homeworkR.sno }</td>
				</tr>
			</c:forEach>
			</table>
			
			<header class="page-header">
				<h1 class="page-title">过期提交</h1>
			</header>
			<table border="1" style="margin-left:120px;">
			<tr>
			<th width = "120" style="text-align: middle;">作业</th>
			<th width = "120" style="text-align: middle;">提交时间</th>
			<th width = "120" style="text-align: middle;">提交者</th>
			</tr>
			<c:forEach items="${homeworkRlist2}" var="homeworkR">
				<tr>
				<td style="text-align: left;" width = "120"><a href="/teacher/downloadHomework/${homeworkR.id }">${homeworkR.filename}</a></td>
				<td style="text-align: left;" width = "120">${homeworkR.submittime }</td>
				<td style="text-align: left;" width = "120">${homeworkR.sno }</td>
				</tr>
			</c:forEach>
			</table>
				
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