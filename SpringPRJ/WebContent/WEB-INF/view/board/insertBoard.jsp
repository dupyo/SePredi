<!DOCTYPE html>
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
		%>
		
<style>
textarea {
	width: 100%;
}

.textwrapper {
	border: 1px solid #999999;
	margin: 5px 0;
	padding: 3px;
}
</style>
<script>
//전송시 유효성 체크
function doSubmit(f){
	
	if(f.title.value == ""){
		alert("제목을 입력하시기 바랍니다.");
		f.title.focus();
		return false;
	}
	
	if(calBytes(f.title.value) > 200){
		alert("최대 200Bytes까지 입력이 가능합니다.");
		f.title.focus();
		return false;
	}	
	
	
	if(f.content.value == ""){
		alert("내용을 입력하시기 바랍니다.");
		f.content.focus();
		return false;
	}	
	
	if(calBytes(f.content.value) > 4000){
		alert("최대 4000Bytes까지 입력이 가능합니다.");
		f.content.focus();
		return false;
	}		
	
	
}

//글자 길이 바이트 단위로 체크하기(바이트값 전달)
function calBytes(str){
	
	var tcount = 0;
	var tmpStr = new String(str);
	var strCnt = tmpStr.length;

	var onechar;
	for (i=0;i<strCnt;i++){
		onechar = tmpStr.charAt(i);
		
		if (escape(onechar).length > 4){
			tcount += 2;
		}else{
			tcount += 1;
		}
	}
	
	return tcount;
}
</script>
	</head>
	<body>
		<%@include file="/WEB-INF/view/nav/navigationB.jsp" %> 

		<div class="container">
			<header style="margin: 51px 0 0;">
				<a href="/main.do"><img src="/renda/images/LogoSePredi.png" style="width: 30%;"></a>
			</header>
			<section>
				<div class="row">
					<form name="f" method="post" action="/insertBoardProc.do" onsubmit="return doSubmit(this);">
						<article class="blog-post" style="padding-bottom: 100px; margin-bottom: 25px; border:1px solid #CECECE; border-radius:5px">
							<div class="blog-post-body">
								<h3 style=""><a href="">A New Bulletin Board</a></h3>
								<div class="post-meta" style="margin-bottom: 15px;"><span class="post-meta"> by <a href="#"><%=name %></a></span></div>
									<div class="blog-post-text" style="padding: 0px 70px 0px 70px;">
										<div style="display: block;" id="" class="formitem">
											<label for="rules" id=""><h4>Title</h4></label>
											<div class="textwrapper" style="margin-bottom: 45px;">
												<input name="title" value="" style="width:100%;" placeholder="제목을 적어주세요."/>
											</div>
												<input type="hidden" name="id" value="<%=id%>" />
										</div>
										<div style="display: block;" id="rulesformitem" class="formitem">
											<label for="rules" id="ruleslabel"><h4>Contents</h4></label>
											<div class="textwrapper">
												<textarea name="content" cols="2" rows="15" id="rules" placeholder="새 글을 작성해보세요."></textarea>
											</div>
										</div>
									</div>
								</div>
						</article>
						
						<button type="submit" class="btn btn-default" style="float:right; margin:0px 30px 25px 0px; border-radius:3px">등록하기</button>
						<div style = "clear : both;"> </div>
					</form>	
						
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