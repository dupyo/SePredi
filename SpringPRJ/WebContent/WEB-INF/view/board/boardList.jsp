<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="poly.dto.BoardDTO"%>
<!DOCTYPE html>
<%@page import="poly.dto.SearchDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.CmmUtil"%>
<%
	
%>
<html lang="en">
<head>
<meta charset="UTF-8">

	<% 
		//검색한 선수가 목록에 존재하면 공백이 아님
		System.out.println("ooooooooooooooooooooooooo1");
		
		//게시판 목록
		List<BoardDTO> bList = (List<BoardDTO>)request.getAttribute("bList");
		

		String id = CmmUtil.nvl((String)session.getAttribute("id"));
		String name = CmmUtil.nvl((String)session.getAttribute("name"));
		String email = CmmUtil.nvl((String)session.getAttribute("email"));
		
	%>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- <link rel="icon" href="favicon.ico"> -->
	<title>search</title>
	<!-- Bootstrap core CSS -->
	<link href="/renda/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!-- Custom styles for this template -->
	<link href="/renda/css/jquery.bxslider.css" rel="stylesheet">
	<link href="/renda/css/style.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,600,700" rel="stylesheet" />
	<link href="/colorlib-search-9/css/main.css" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
<style>
	.elps {
	 	overflow: hidden; 
		text-overflow: ellipsis; 
		white-space: nowrap; 
	 }
</style>
</head>
<body>
	<!-- Navigation -->
	<%@include file="/WEB-INF/view/nav/navigationB.jsp" %> 


	<div class="container">
		<header style="margin: 51px 0px 0px; border-bottom:1px solid #CECECE;">
			<a href="/main.do"><img src="/renda/images/LogoSePredi.png" style="width: 30%;"></a>
		</header>
		<section>
	
			<div class="row">
				<article class="blog-post">
					<div class="blog-post-body">
						
						
						<% if (bList.size() > 0) { System.out.println("oooooooooooooooooooo3"); %>	
						<!-- sidebar-widget -->
						<div class="sidebar-widget">
							<h3 class="sidebar-title">Board List</h3>
							<div class="widget-container">
								<article class="widget-post" style="margin-bottom: 20px; padding:0px;">
									<div class="post-body" style="">
										<a class="col-md-1" href="" style="text-align:center; margin:4px 4px 4px 4px; font-weight:bold;">글번호</a>
										<a class="col-md-5" href="" style="text-align:center; margin:4px 4px 4px 4px; font-weight:bold;">제목</a>
										<a class="col-md-2" href="" style="text-align:center; margin:4px 4px 4px 4px; font-weight:bold;">작성자</a>	<!-- 작성자 이름 -->
										<a class="col-md-3" href="" style="text-align:center; margin:4px 4px 4px 4px; font-weight:bold;">작성일</a>
										<div class="post-meta">
										</div>
									</div>
								</article>
							<%for (int i=0; i < bList.size(); i++) {
							%>
								<article onclick="location.href='/boardDetail.do?id=<%=bList.get(i).getId() %>&boardNo=<%=bList.get(i).getBoardNo() %>'" class="widget-post" style="margin: 20px 0px 0px 0px; padding:0px; cursor:pointer;">
									<div onclick="location.href='/boardDetail.do?id=<%=bList.get(i).getId() %>&boardNo=<%=bList.get(i).getBoardNo() %>'" class="post-body" style="">
										<a class="col-md-1" href="/boardDetail.do?id=<%=bList.get(i).getId() %>&boardNo=<%=bList.get(i).getBoardNo() %>" style="text-align:center; margin:4px 4px 4px 4px; font-weight:bold;"><%=CmmUtil.nvl(bList.get(i).getBoardNo()) %></a>
										<a class="col-md-5 elps" href="/boardDetail.do?id=<%=bList.get(i).getId() %>&boardNo=<%=bList.get(i).getBoardNo() %>" style="text-align:center; margin:4px 4px 4px 4px; font-weight:bold;"><%=CmmUtil.restoreXSS(bList.get(i).getTitle()) %></a>
										<a class="col-md-2" href="/boardDetail.do?id=<%=bList.get(i).getId() %>&boardNo=<%=bList.get(i).getBoardNo() %>" style="text-align:center; margin:4px 4px 4px 4px; font-weight:bold;"><%=CmmUtil.nvl(bList.get(i).getUserName()) %></a>	<!-- 작성자 이름 -->
										<a class="col-md-3" href="/boardDetail.do?id=<%=bList.get(i).getId() %>&boardNo=<%=bList.get(i).getBoardNo() %>" style="text-align:center; margin:4px 4px 4px 4px; font-weight:bold;"><%=CmmUtil.nvl(bList.get(i).getRegDate()) %></a>
									</div>
								</article>
							<% } %>	
							
							
							
							</div>
						</div><!-- /.sidebar-widget -->
						<% } %>	
						
						<button type="button" onclick="location.href='/insertBoard.do'" class="btn btn-default" style="float:right; margin:0px 30px 25px 0px; border-radius:3px">등록하기</button>
						<div style = "clear : both;"> </div>
						
						
					</div>
				</article>
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
	<script src="/renda/js/bootstrap.min.js"></script>
	<script src="/renda/js/jquery.bxslider.js"></script>
	<script src="/renda/js/mooz.scripts.min.js"></script>
	 <script src="/scripts/pageMove.js"></script>
	
</body>
</html>