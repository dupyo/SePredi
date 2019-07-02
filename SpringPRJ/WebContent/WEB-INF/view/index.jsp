<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="poly.controller.UserController"%>
<%@page import="com.fasterxml.jackson.databind.JsonNode"%>
<%@page import="poly.util.CmmUtil"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="manifest" href="/webmanifest/manifest.json" />
	<!-- <link rel="icon" href="favicon.ico"> -->
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
<!-- <button onclick="sibal()">로그아웃</button> -->
	<!-- Navigation -->
	<%@include file="/WEB-INF/view/nav/navigationH.jsp" %>




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
		<header style="margin: 51px 0 0; border-bottom:1px solid #CECECE;">
			<a href="/main.do"><img src="/renda/images/LogoSePredi.png" style="width: 30%;"></a>
		</header>
		
		
		<!-- <video src="https://youtu.be/Q_0ftCADSZk" controls>브라우저가 비디오를 지원하지 않습니다.
		</video> -->
		
		
		<!-- Button trigger modal -->
		<section class="main-slider">
			<ul class="bxslider">
				<li><div class="slider-item"><img src="/renda/images/35d3072d-f49a-4fcc-a46b-f5cb392a81e8_1516072228.jpeg" title="Funky roots" /><h2><a href="#" title="Vintage-Inspired Finds for Your Home">Vintage-Inspired Finds for Your Home</a></h2></div></li>
				<li><div class="slider-item"><img src="/renda/images/soi-keo-xien.jpeg" title="Funky roots" /><h2><a href="#" title="Vintage-Inspired Finds for Your Home">Vintage-Inspired Finds for Your Home</a></h2></div></li>
				<li><div class="slider-item"><img src="/renda/images/background.png" title="Funky roots" /><h2><a href="#" title="Vintage-Inspired Finds for Your Home">Vintage-Inspired Finds for Your Home</a></h2></div></li>
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
					
					
					<!-- Modal -->
					<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="myModalLabel">카카오 로그인</h4>
								</div>
								<div class="modal-body" style="font-size:12px;">
								 카카로 계정으로 로그인하면 쿠키 데이터가 최대 6시간동안 유지됩니다. 그래도 하시겠습니까?
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" id="kakaologin">Accept</button>
								</div>
							</div>
						</div>
					</div>
					
					
					
					
					
					
					
					
				</div>
				
			</div>
		</section>
	</div><!-- /.container -->



	<%@include file="/WEB-INF/view/footer.jsp" %>



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
	<script src="/scripts/pageMove.js"></script>
<!-- <script>
const jsonData = {
		read : $.getJSON('/jsonData/secretKey.json',function(data){
})
}
console.table(jsonData);
console.log(jsonData.read.responseJSON.apikey);
</script> -->
<!-- <script>
$('#myModal').on('shown.bs.modal', function () {
		$('#myInput').focus()
	})
</script> -->
<script>
//Controller로 카카오계정 로그인 url 요청 보내기
$('#kakaologin').click( function () {
	location.href="/accountskakao.do";
})


</script>
<!-- <div style="cursor:pointer" onclick="pageMove.notice('insert')">asdsad</div>
<div style="cursor:pointer" onclick="pageMove.click()">click</div> -->
</body>
</html>