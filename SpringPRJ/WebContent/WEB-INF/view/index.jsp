<!DOCTYPE html>
<%@page import="poly.controller.UserController"%>
<%@page import="com.fasterxml.jackson.databind.JsonNode"%>
<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="manifest" href="/webmanifest/manifest.json" />
	<link rel="icon" href="favicon.ico">
	<title>sepredi</title>
	<!-- Bootstrap core CSS -->
	<link href="/renda/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!-- Custom styles for this template -->
	<link href="/renda/css/jquery.bxslider.css" rel="stylesheet">
	<link href="/renda/css/style.css" rel="stylesheet">
	
	<% String id = CmmUtil.nvl((String)session.getAttribute("id")); %>
	<% String name = CmmUtil.nvl((String)session.getAttribute("name")); %>
	<% String email = CmmUtil.nvl((String)session.getAttribute("email")); %>
	
	<!-- pushtest css -->
	<!-- <style>
	div#pushtest {
		font-family: monospace;
		font-size: 1rem;
		white-space: pre-wrap;
		background-color: skyblue;
	}
	/* button#doIt {
		background-color: skyblue;
	} */
	</style> -->
	
	
	
</head>
<body>
<button onclick="sibal()">로그아웃</button>
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
					<li><a href="#about">Lifestyle</a></li>
					<li><a href="#contact">Travel</a></li>
					<li><a href="/about.do">About Me</a></li>
					<li><a href="/about.do">Contact</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<%if (!"".equals(name)) { %>
					<li style="padding:15px; color:white"><%=name %>님 환영합니다.</li>
					<li><a href="/kakaologout.do">Sign out</a></li>
					<%} else {%>
					<li><a href="https://kauth.kakao.com/oauth/authorize?client_id=<%=UserController.clientID %>&redirect_uri=https://localhost:8443/kakaologin.do&response_type=code">
					Sign in</a></li><!-- rest api 인증키를 받은 후 url을 만들어서 로그인 화면으로 이동 -->
					<!-- <a href="/renda/images/kakao_account_login_btn_medium_narrow.png"></a> -->
					<li><a href="#">Sign up</a></li>
					<%} %>
				</ul>

			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>




<!-- pushtest -->
<!-- <div id="pushtest">

<p style="margin-top: 25px;">This demo shows how to send push notifications with a payload.</p>

<form>
Notification payload: <input id='notification-payload' type='text' value='Insert here a payload'></input>
Notification delay: <input id='notification-delay' type='number' value='5'></input> seconds
Notification Time-To-Live: <input id='notification-ttl' type='number' value='10'></input> seconds
</form>
<button id="doIt">Request sending a notification!</button>


<script src="/service-worker/tools.js"></script>
<script src="/service-worker/index.js"></script>

</div> -->
<!-- pushtest -->





	<div class="container">
		<header>
			<a href="/main.do"><img src="/renda/images/LogoSePredi.png" style="width: 35%;"></a>
		</header>
		<section class="main-slider">
			<ul class="bxslider">
				<li><div class="slider-item"><img src="/renda/images/background.png" title="Funky roots" /><h2><a href="/post.do" title="Vintage-Inspired Finds for Your Home">Vintage-Inspired Finds for Your Home</a></h2></div></li>
				<li><div class="slider-item"><img src="/renda/images/background.png" title="Funky roots" /><h2><a href="/post.do" title="Vintage-Inspired Finds for Your Home">Vintage-Inspired Finds for Your Home</a></h2></div></li>
				<li><div class="slider-item"><img src="/renda/images/background.png" title="Funky roots" /><h2><a href="/post.do" title="Vintage-Inspired Finds for Your Home">Vintage-Inspired Finds for Your Home</a></h2></div></li>
			</ul>
		</section>
		<section>
			<div class="row">
				<div class="col-md-8">
				
					<!-- test pwa -->
					<!-- <div id="image-area" class="wrap">
						Image append here
					</div>
					<script src="/scripts/app.js" async></script> -->
					
					
					
	<%=email %><br>
	<%=name %><br>
	<%=id %>
					<article class="blog-post">
						<div class="blog-post-image">
							<a href="/post.do"><img src="/renda/images/750x500-1.jpg" alt=""></a>
						</div>
					<div class="blog-post-body">
							<h2><a href="/post.do">Vintage-Inspired Finds for Your Home</a></h2>
							<div class="post-meta"><span>by <a href="#">Jamie Mooze</a></span>/<span><i class="fa fa-clock-o"></i>March 14, 2015</span>/<span><i class="fa fa-comment-o"></i> <a href="#">343</a></span></div>
							<p>ew months ago, we found ridiculously cheap plane tickets for Boston and off we went. It was our first visit to the city and, believe it or not, Stockholm in February was more pleasant than Boston in March. It probably has a lot to do with the fact that we arrived completely unprepared. That I, in my converse and thin jacket, did not end up with pneumonia is honestly not even fair.</p>
							<div class="read-more"><a href="#">Continue Reading</a></div>
						</div>
					</article>
					<!-- article -->
					<article class="blog-post">
						<div class="blog-post-image">
							<a href="/post.do"><img src="/renda/images/750x500-2.jpg" alt=""></a>
						</div>
						<div class="blog-post-body">
							<h2><a href="/post.do">The Best Street Style Looks of London Fashion Week</a></h2>
							<div class="post-meta"><span>by <a href="#">Jamie Mooze</a></span>/<span><i class="fa fa-clock-o"></i>March 14, 2015</span>/<span><i class="fa fa-comment-o"></i> <a href="#">343</a></span></div>
							<p>Few months ago, we found ridiculously cheap plane tickets for Boston and off we went. It was our first visit to the city and, believe it or not, Stockholm in February was more pleasant than Boston in March. It probably has a lot to do with the fact that we arrived completely unprepared.</p>
							<div class="read-more"><a href="#">Continue Reading</a></div>
						</div>
					</article>
				</div>
				<div class="col-md-4 sidebar-gutter">
					<aside>
						<!-- sidebar-widget -->
						<div class="sidebar-widget">
							<h3 class="sidebar-title">About Me</h3>
							<div class="widget-container widget-about">
								<a href="/post.do"><img src="/renda/images/author.jpg" alt=""></a>
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
										<a href="/post.do"><img src="/renda/images/90x60-1.jpg" alt=""></a>
									</div>
									<div class="post-body">
										<h2><a href="/post.do">The State of the Word 2014</a></h2>
										<div class="post-meta">
											<span><i class="fa fa-clock-o"></i> 2. august 2015</span> <span><a href="/post.do"><i class="fa fa-comment-o"></i> 23</a></span>
										</div>
									</div>
								</article>
								<article class="widget-post">
									<div class="post-image">
										<a href="/post.do"><img src="/renda/images/90x60-2.jpg" alt=""></a>
									</div>
									<div class="post-body">
										<h2><a href="/post.do">Why The Muppets Needs to Channel 30 Rock</a></h2>
										<div class="post-meta">
											<span><i class="fa fa-clock-o"></i> 2. august 2015</span> <span><a href="/post.do"><i class="fa fa-comment-o"></i> 23</a></span>
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



	<!-- pushtest javascript -->
	<!-- <script>
	var button = document.getElementById("notifications");
	console.log(1);
	
	if (button) {
		console.log(1);
		button.addEventListener('click', function(e) {
			Notification.requestPermission().then(function(result) {
				if(result === 'granted') {
					randomNotification();
				}
			});
		});
		alert('Hello world, '+event.button.value);
	}
	
	function randomNotification() {
		var randomItem = Math.floor(Math.random()*games.length);
		var notifTitle = games[randomItem].name;
		var notifBody = 'Created by '+games[randomItem].author+'.';
		var notifImg = 'data/img/'+games[randomItem].slug+'.jpg';
		var options = {
			body: notifBody,
			icon: notifImg
		}
		var notif = new Notification(notifTitle, options);
		setTimeout(randomNotification, 10000);
	}
	</script> -->
	<!-- pushtest javascript -->




	<!-- Bootstrap core JavaScript
		================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="/renda/js/bootstrap.min.js"></script>
	<script src="/renda/js/jquery.bxslider.js"></script>
	<script src="/renda/js/mooz.scripts.min.js"></script>
<script>
const jsonData = {
		read : $.getJSON('/jsonData/secretKey.json',function(data){
})
}
console.table(jsonData);
console.log(jsonData.read.responseJSON.apikey);
</script>
</body>
</html>