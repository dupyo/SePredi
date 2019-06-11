<!DOCTYPE html>
<%@page import="poly.dto.SearchDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.CmmUtil"%>
<html lang="en">
	<head>
	<% 
		//검색한 선수가 목록에 존재하면 공백이 아님
		String listlength = CmmUtil.nvl((String)request.getAttribute("listlength"));
		System.out.println("ooooooooooooooooooooooooo1");
		System.out.println("listlength : " + listlength);
		List<String[]> searchList = new ArrayList<String[]>();
		Iterator<String[]> itlist = searchList.iterator();
		
		/* if (!"".equals(listlength)) {
			System.out.println("ooooooooooooooooooooooooo2");
			itlist = (Iterator<String[]>)request.getAttribute("itlist"); 
		} */
		
		
		//국적 정보 DB
		List<SearchDTO> nationalities = (List<SearchDTO>)request.getAttribute("nationalities");
		
		//리그, 클럽 정보 DB
		List<SearchDTO> leaguenclubs = new ArrayList<SearchDTO>();
		Iterator<SearchDTO> it = leaguenclubs.iterator();
		
		
		//배열 크기 확인
			System.out.println("ooooooooooooooooooooooooo2");
			it = (Iterator<SearchDTO>)request.getAttribute("itleaguenclubs");
	
		SearchDTO LC = new SearchDTO();
		
	%>
		<meta charset="UTF-8">
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
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
					</ul>

				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>

		<div class="container">
			<header style="margin: 51px 0 0;">
				<a href="/main.do"><img src="/renda/images/LogoSePredi.png" style="width: 30%;"></a>
			</header>
			<section>
				<div class="row">
					<article class="blog-post">
						<div class="blog-post-body">
							<h2 style="padding: 0px 0px 0px;"><a href="/search.do">Search your favorite football players.</a></h2>
						</div>
						<div class="blog-post-body">
							<!-- sidebar-widget -->
							<div class="sidebar-widget">
								<!-- search bar -->		
								<div class="s009">
									<form>
									<div class="inner-form">
										<div class="basic-search">
										<div class="input-field">
											<input id="search" type="text" name="player" value="" placeholder="search your players..." />
										
											<div class="icon-wrap" style="cursor:pointer; padding-right: 18px;" id="ajax">
										
										
										
												<!-- get player[0].value -->
												<!-- <script>
													var keywords = document.getElementsByName("player")[0].value;
													$('#ajax').click(function(){
													   $.ajax({
													      url: "http://15.164.79.93:8081/search.do",
													      method:"GET",
													      crossDomain: true,
													      success: function(data){
													         console.log(data)
													      }, error: function(error){
													         console.log(error)
													      }
													   })
													})
												</script> --><!--/. get player[0].value -->	
												
												
												
												
												<img src="/colorlib-search-9/images/test.svg" style="height: 36px; width: 36px;"/>
											</div>
										</div>
										</div>
												
										<div class="advance-search">
										<span class="desc">ADVANCED SEARCH</span>
										<div class="row">
											<div class="input-field">
												<div class="input-select">
													<select data-trigger="" name="choices-single-defaul">
													<option placeholder="" value="">Nationality</option>
													<%for (SearchDTO nationality : nationalities) { %>
														<option id=""><%=nationality.getNationality() %></option>
													<%} %>
													</select>
												</div>
											</div>
										
										
										
										
										
												<!-- get club after league in rest -->
												<!-- <script>
													var keywords = document.getElementsByName("player")[0].value;
													$('#ajax').click(function(){
													   $.ajax({
													      url: "http://15.164.79.93:8081/getLeagueNClub.do",
													      method:"GET",
													      crossDomain: true,
													      success: function(data){
													         console.log(data)
													      }, error: function(error){
													         console.log(error)
													      }
													   })
													})
												</script> --><!--/. get club after league -->	
												
												
												
												
											<button id="test">click</button>
												
											<div class="input-field">
											<div class="input-select">
												<select name="choices-single-defaul">
												<option placeholder="" value="">League</option>
												
												
												
												
												<% int cnt = 0;
												while (it.hasNext()) {
													if (!CmmUtil.nvl(LC.getLeague()).equals(it.next().getLeague())) {
														LC.setLeague(it.next().getLeague());	
												%>
													<option id="<%=cnt%>"><%=LC.getLeague() %></option>
													
													<%cnt++; } %>
												<%} %>
												
												
												
												</select>
											</div>
											</div>
											
											
											
											
											<div class="input-field">
											<div class="input-select">
												<select data-trigger="" name="choices-single-defaul">
												<option placeholder="" value="">Club</option>
												<option>Subject b</option>
												<option>Subject c</option>
												</select>
											</div>
											</div>
										</div>
										
										<div class="row third">
											<div class="input-field">
											<div class="result-count">
												<span>108 </span>results</div>
											<div class="group-btn">
												<button class="btn-delete" id="delete">RESET</button>
												<button class="btn-search">SEARCH</button>
											</div>
											</div>
										</div>
										</div>
									</div>
									</form>
								</div>
								<script src="/colorlib-search-9/js/extention/choices.js"></script>
								<script>
									const customSelects = document.querySelectorAll("select");
									const deleteBtn = document.getElementById('delete')
									const choices = new Choices('select',
									{
										searchEnabled: false,
										itemSelectText: '',
										removeItemButton: true
									});
									deleteBtn.addEventListener("click", function(e)
									{
									e.preventDefault()
									const deleteAll = document.querySelectorAll('.choices__button')
									for (let i = 0; i < deleteAll.length; i++)
									{
										deleteAll[i].click();
									}
									});
							
								</script><!-- /.search bar -->		
							</div><!-- sidebar-widget -->
							
							
							
							<% if (itlist.hasNext()) { System.out.println("oooooooooooooooooooo3"); %>	
							<!-- sidebar-widget -->
							<div class="sidebar-widget">
								<h3 class="sidebar-title">Players List</h3>
								<div class="widget-container">
								<%while(itlist.hasNext()) {
									String[] playerInfo = itlist.next();
								%>
									<article class="widget-post" style="padding:0px;">
										<div class="post-image">
											<a href="#"><img src="<%=CmmUtil.nvl(playerInfo[4]) %>" alt=""></a>
										</div>
										<div class="post-body" style="">
											<h4 style="text-align:left;"><a href="#"><%=playerInfo[2] %></a></h4>
											<div style="display:flex"><a href="#"><img src="<%=CmmUtil.nvl(playerInfo[6]) %>" alt=""></a>
											<a href="#" style="text-align:left; margin:4px 20px 4px 4px; font-weight:bold;"><%=CmmUtil.nvl(playerInfo[5]) %></a>
											<a href="#"><img src="<%=CmmUtil.nvl(playerInfo[10]) %>" alt=""></a>
											<a href="#" style="text-align:left; margin:4px 4px 4px 4px; font-weight:bold;"><%=CmmUtil.nvl(playerInfo[9]) %></a></div>
											<div class="post-meta">
											</div>
										</div>
									</article>
								<% } %>	
									<article class="widget-post">
										<div class="post-image">
											<a href="#"><img src="/renda/images/90x60-5.jpg" alt=""></a>
										</div>
										<div class="post-body">
											<h2><a href="#">The State of the Word 2014</a></h2>
											<div class="post-meta">
											</div>
										</div>
									</article>
								</div>
							</div>
							<% } %>	
							
							
							<!-- sidebar-widget -->
							<div class="sidebar-widget">
								<h3 class="sidebar-title">Categories</h3>
								<div class="widget-container">
									<ul style="text-align: left;">
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
		
		<script>
				<%-- <%while(it.hasNext()){ %>//배열 출력
					leaguenatchclub += <%=it.next(); %>
				}
				<%}%> --%>
			
			$('#0').on("click", function(){
				
				alert(1)
				
			})
		
		</script>
		
	</body>
</html>