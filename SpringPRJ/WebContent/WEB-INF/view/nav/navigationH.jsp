<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<li class="active"><a href="/main.do" style="color:#39A2FF;">Home</a></li>
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