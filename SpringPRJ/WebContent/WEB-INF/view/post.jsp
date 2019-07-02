<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="poly.util.CmmUtil"%>
<html lang="en">
	<head>
		<meta charset="utf-8">
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
		%>
		
	</head>
	<body>
		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="/main.do">Home</a></li>
						<li><a href="/search.do">Search</a></li>
						<li><a href="/boardList.do">Board</a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right">
						<%if (!"".equals(name)) { %>
						<li style="padding:15px; color:white"><%=name %>님 환영합니다.</li>
						<li><a href="/kakaologout.do">Sign out</a></li>
						<%} else {%>
						<li><a href="/accountskakao.do">
						Sign in</a></li><!-- rest api 인증키를 받은 후 url을 만들어서 로그인 화면으로 이동 -->
						<!-- <a href="/renda/images/kakao_account_login_btn_medium_narrow.png"></a> -->
						<%} %>
					</ul>

				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>

		<div class="container">
			<header style="margin: 51px 0 0; border-bottom:1px solid #CECECE;">
				<a href="/main.do"><img src="/renda/images/LogoSePredi.png" style="width: 30%;"></a>
			</header>
			<section>
				<div class="row">
					<div class="col-md-8">
						<article class="blog-post">
							<div class="blog-post-image">
								<a href="/search.do"><img src="/renda/images/750x500-5.jpg" alt=""></a>
							</div>
							<div class="blog-post-body">
								<h2><a href="/search.do">Vintage-Inspired Finds for Your Home</a></h2>
								<div class="post-meta"><span>by <a href="#">Jamie Mooze</a></span>/<span><i class="fa fa-clock-o"></i>March 14, 2015</span>/<span><i class="fa fa-comment-o"></i> <a href="#">343</a></span></div>
								<div class="blog-post-text">

									<h3>Math reveals structure in neural activity in the brain</h3>
									<p>A newly-developed mathematical method can detect
										geometric structure in neural activity in the brain.
										“Previously, in order to understand this structure, scientists
										needed to relate neural activity to some specific external
										stimulus,” said Vladimir Itskov, associate professor of
										mathematics at Penn State University. “Our method is the first
										to be able to reveal this structure without our knowing an
										external stimulus ahead of time. We’ve now shown that our new
										method will allow us to explore the organizational structure of
										neurons without knowing their function in advance.”</p>
	
									<p>The method — clique topology — was developed by an
										interdisciplinary team of researchers at Penn State, the
										University of Pennsylvania, the Howard Hughes Medical
										Institute, and the University of Nebraska-Lincoln. The method
										is described in a paper that will be posted in the early online
										edition of the journal Proceedings of the National Academy of
										Sciences during the week ending October 23, 2015.</p>


								</div>
							</div>
						</article>
					</div>
					<div class="col-md-4 sidebar-gutter">
						<aside>
							<!-- sidebar-widget -->
							<div class="sidebar-widget">
								<h3 class="sidebar-title">Board</h3>
								<div class="widget-container widget-about">
									<a href="/search.do"><img src="/renda/images/author.jpg" alt=""></a>
									<h4>Jamie Mooz</h4>
									<div class="author-title">Designer</div>
									<p>While everyone’s eyes are glued to the runway, it’s hard to ignore that there are major fashion moments on the front row too.</p>
								</div>
							</div>
							<!-- sidebar-widget -->
							<div class="sidebar-widget">
								<h3 class="sidebar-title">Featured Posts</h3>
								<div class="widget-container">
									<article class="widget-post">
										<div class="post-image">
											<a href="/search.do"><img src="/renda/images/90x60-1.jpg" alt=""></a>
										</div>
										<div class="post-body">
											<h2><a href="/search.do">The State of the Word 2014</a></h2>
											<div class="post-meta">
												<span><i class="fa fa-clock-o"></i> 2. august 2015</span> <span><a href="/search.do"><i class="fa fa-comment-o"></i> 23</a></span>
											</div>
										</div>
									</article>
									<article class="widget-post">
										<div class="post-image">
											<a href="/search.do"><img src="/renda/images/90x60-2.jpg" alt=""></a>
										</div>
										<div class="post-body">
											<h2><a href="/search.do">Why The Muppets Needs to Channel 30 Rock</a></h2>
											<div class="post-meta">
												<span><i class="fa fa-clock-o"></i> 2. august 2015</span> <span><a href="/search.do"><i class="fa fa-comment-o"></i> 23</a></span>
											</div>
										</div>
									</article>
									<article class="widget-post">
										<div class="post-image">
											<a href="/search.do"><img src="/renda/images/90x60-3.jpg" alt=""></a>
										</div>
										<div class="post-body">
											<h2><a href="/search.do">The State of the Word 2014</a></h2>
											<div class="post-meta">
												<span><i class="fa fa-clock-o"></i> 2. august 2015</span> <span><a href="/search.do"><i class="fa fa-comment-o"></i> 23</a></span>
											</div>
										</div>
									</article>
									<article class="widget-post">
										<div class="post-image">
											<a href="/search.do"><img src="/renda/images/90x60-4.jpg" alt=""></a>
										</div>
										<div class="post-body">
											<h2><a href="/search.do">Vintage-Inspired Finds for Your Home</a></h2>
											<div class="post-meta">
												<span><i class="fa fa-clock-o"></i> 2. august 2015</span> <span><a href="/search.do"><i class="fa fa-comment-o"></i> 23</a></span>
											</div>
										</div>
									</article>
									<article class="widget-post">
										<div class="post-image">
											<a href="/search.do"><img src="/renda/images/90x60-5.jpg" alt=""></a>
										</div>
										<div class="post-body">
											<h2><a href="/search.do">The State of the Word 2014</a></h2>
											<div class="post-meta">
												<span><i class="fa fa-clock-o"></i> 2. august 2015</span> <span><a href="/search.do"><i class="fa fa-comment-o"></i> 23</a></span>
											</div>
										</div>
									</article>
								</div>
							</div>
							<!-- sidebar-widget -->
							<div class="sidebar-widget">
								<h3 class="sidebar-title">Socials</h3>
								<div class="widget-container">
									<div class="widget-socials">
										<a href="#"><i class="fa fa-facebook"></i></a>
										<a href="#"><i class="fa fa-twitter"></i></a>
										<a href="#"><i class="fa fa-instagram"></i></a>
										<a href="#"><i class="fa fa-google-plus"></i></a>
										<a href="#"><i class="fa fa-dribbble"></i></a>
										<a href="#"><i class="fa fa-reddit"></i></a>
									</div>
								</div>
							</div>
							<!-- sidebar-widget -->
							<div class="sidebar-widget">
								<h3 class="sidebar-title">Categories</h3>
								<div class="widget-container">
									<ul>
										<li><a href="#">Fashion</a></li>
										<li><a href="#">Art</a></li>
										<li><a href="#">Design</a></li>
										<li><a href="#">Featured</a></li>
										<li><a href="#">Graphics</a></li>
										<li><a href="#">Peoples</a></li>
										<li><a href="#">Uncategorized</a></li>
									</ul>
								</div>
							</div>
						</aside>
					</div>
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