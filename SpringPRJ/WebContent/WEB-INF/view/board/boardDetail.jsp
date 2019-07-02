<!DOCTYPE html>
<%@page import="poly.filter.UrlFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="poly.dto.BoardDTO"%>
<%@page import="poly.util.CmmUtil"%>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- <link rel="icon" href="favicon.ico"> -->
		<title>post</title>
		<!-- Bootstrap core CSS -->
		<link href="/renda/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<!-- Custom styles for this template -->
		<link href="/renda/css/jquery.bxslider.css" rel="stylesheet">
		<link href="/renda/css/style.css" rel="stylesheet">
		
		<%
			String id = CmmUtil.nvl((String)session.getAttribute("id"));
			String name = CmmUtil.nvl((String)session.getAttribute("name"));
			String email = CmmUtil.nvl((String)session.getAttribute("email"));
			BoardDTO bDTO = (BoardDTO)request.getAttribute("bDTO");
			boolean matchSession = (boolean)request.getAttribute("matchSession");
		%>
	</head>
	<body>
		<!-- Navigation -->
		<%@include file="/WEB-INF/view/nav/navigationB.jsp" %> 

		<div class="container">
			<header style="margin: 51px 0 0;">
				<a href="/main.do"><img src="/renda/images/LogoSePredi.png" style="width: 30%;"></a>
				<h1 style="text-align: left; margin-left: 3%"> <p style="margin-left: 0.3%;">게시판입니다.</p></h1>
			</header>
			<section>
				<div class="row">
						<article class="blog-post" style="padding-bottom: 100px; margin-bottom: 25px; border:1px solid #CECECE; border-radius:5px">
							<div class="blog-post-body">
												<h2 style=""><a href="#"><%=CmmUtil.restoreXSS(bDTO.getTitle()) %></a></h2>
								<div class="post-meta" style="margin-bottom: 55px;"><span class="post-meta"> by <a href="#"><%=CmmUtil.nvl(bDTO.getUserName()) %></a> / <i class="fa fa-clock-o"></i><%=CmmUtil.nvl(bDTO.getRegDate()) %></span></div>
									<div class="blog-post-text" style="padding: 0px 70px 0px 70px;">
										<div style="display: block;" id="rulesformitem" class="formitem">
											<label for="rules" id="ruleslabel"><h4>Contents</h4></label>
											<div class="textwrapper">
												<textarea style="width:100%;"name="content" cols="2" rows="15" id="rules" readonly><%=CmmUtil.restoreXSS(bDTO.getContent()) %></textarea>
											</div>
										</div>
									</div>
								</div>
						</article>
						
						<%if (matchSession) { %>
							<button onclick="location.href='/deleteBoardProc.do?boardNo=<%=bDTO.getBoardNo() %>'"type="button" class="btn btn-default" style="float:right; margin:0px 30px 25px 0px; border-radius:3px">삭제하기</button>
							<div style = "clear : both;"> </div>
						<%} %>
				</div>
			</section>
		</div><!-- /.container -->

		<footer class="footer">

			<div class="footer-socials">
				<a href="#"><i class="fa fa-facebook"></i></a>
				<a href="#"><i class="fa fa-twitter"></i></a>
				<a href="#"><i class="fa fa-instagram"></i></a>
				<a href="#"><i class="fa fa-google-plus"></i></a>
				<a href="#"><i class="fa fa-dribbble"></i></a>
				<a href="#"><i class="fa fa-reddit"></i></a>
			</div>

			<div class="footer-bottom">
				<i class="fa fa-copyright"></i> Copyright 2015. All rights reserved.<br>
				Theme made by <a href="http://www.moozthemes.com">MOOZ Themes</a>
			</div>
		</footer>

		<!-- Bootstrap core JavaScript
			================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="/renda/js/bootstrap.min.js"></script>
		<script src="/renda/js/jquery.bxslider.js"></script>
		<script src="/renda/js/mooz.scripts.min.js"></script>
	</body>
</html>