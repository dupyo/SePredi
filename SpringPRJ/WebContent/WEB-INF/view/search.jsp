<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="poly.dto.SearchDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.CmmUtil"%>
<html lang="en">
<head>
<%
	//검색한 선수가 목록에 존재하면 공백이 아님
	String listlength = CmmUtil.nvl((String) request.getAttribute("listlength"));
	System.out.println("ooooooooooooooooooooooooo1");
	System.out.println("listlength : " + listlength);

	//국적 정보 DB
	List<SearchDTO> nationalities = (List<SearchDTO>) request.getAttribute("nationalities");

	//리그, 클럽 정보 DB
	List<SearchDTO> leaguenclubs = new ArrayList<SearchDTO>();

	//배열 크기 확인
	System.out.println("ooooooooooooooooooooooooo2");
	List<SearchDTO> lLeaguenclubs = (List<SearchDTO>) request.getAttribute("lLeaguenclubs");

	SearchDTO LC = new SearchDTO();

	String id = CmmUtil.nvl((String) session.getAttribute("id"));
	String name = CmmUtil.nvl((String) session.getAttribute("name"));
	String email = CmmUtil.nvl((String) session.getAttribute("email"));
%>
<script>
		var leagueclub = [];
		<%for(SearchDTO sDTO : lLeaguenclubs) {%>
			leagueclub.push({ "league" : "<%=sDTO.getLeague()%>" , "club" : "<%=sDTO.getClub()%>"});
			
		<%}%>
		
	</script>
<script src="/scripts/namuwikiDetail.js"/></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>search</title>
<!-- Bootstrap core CSS -->
<link href="/renda/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="/renda/css/jquery.bxslider.css" rel="stylesheet">
<link href="/renda/css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:400,600,700"
	rel="stylesheet" />
<link href="/colorlib-search-9/css/main.css" rel="stylesheet" />
<link href="/renda/css/wiki.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	
<style>
	li.dropdown-item {
		font-size: 14px;
		cursor: pointer;
		-o-transition:.2s;
		-ms-transition:.2s;
		-moz-transition:.2s;
		-webkit-transition:.2s;
		transition:.2s;
		margin:0px;
	}
	
	li.dropdown-item:hover { 
		color: #d3d3d3; 
	}
	
</style>
</head>
<body>
	<!-- Navigation -->
	<%@include file="/WEB-INF/view/nav/navigationS.jsp"%>

	<div class="container">
		<header style="margin: 51px 0 0; border-bottom: 1px solid #CECECE;">
			<a href="/main.do"><img src="/renda/images/LogoSePredi.png"
				style="width: 30%;"></a>
		</header>
		<section>
			<div class="row">
				<article class="blog-post">
					<div class="blog-post-body">
						<h3 style="padding: 0px 0px 0px;">
							<a href="/search.do">Search your favorite football players.</a>
						</h3>
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
												<input id="search" type="text" name="searchbox" value=""
													placeholder="search your players..." />

												<div class="icon-wrap restapi"
													style="cursor: pointer; padding-right: 18px;" id="ajax">
													<img src="/colorlib-search-9/images/test.svg"
														style="height: 36px; width: 36px;" />
												</div>
											</div>
										</div>

										<div class="advance-search">
											<span class="desc">ADVANCED SEARCH</span>
											<div class="row">

												<!-- //국적 셀렉트 박스 -->
												<div class="dropdown" id="" style="padding-bottom: 5px;">
													<button class="btn btn-secondary dropdown-toggle"
														type="button" id="dropdownMenuButton1"
														data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false"
														style="width: 233px; height: 40px; border: 1px #d3d3d3 solid; background-color: white; color: #6d6d6d;">
														Nationality</button>
													<ul class="dropdown-menu"
														aria-labelledby="dropdownMenuButton1" id="nationalitySlc"
														style="width: 233px; height: 300px; overflow: scroll;">
														<!-- 드롭다운이 div와 a태그로 이루어져 있을 경우 항목을 클릭했을떄 페이지가 새로고침 되어서 깜빡임이 발생한 -> 될 수 있으면 ul과 li태그로 구성하는 것을 권장 -->
														<li class="dropdown-item" id="Nationality">Nationality</li>
														<%
															for (SearchDTO nationality : nationalities) {
														%>
														<li class="dropdown-item" role="menuitem" tabindex="-1"
															id="<%=nationality.getNationality()%>"><%=nationality.getNationality()%></li>
														<%
															}
														%>
													</ul>
												</div>


												<!-- //리그 셀렉트 박스 -->
												<div class="dropdown" id="leagueSlc" style="padding-bottom: 5px;">
													<button class="btn btn-secondary dropdown-toggle"
														type="button" id="dropdownMenuButton2"
														data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false"
														style="width: 233px; height: 40px; border: 1px #d3d3d3 solid; background-color: white; color: #6d6d6d;">
														League</button>
													<ul class="dropdown-menu"
														aria-labelledby="dropdownMenuButton2" id="testid"
														style="width: 233px;">
														<!-- 드롭다운이 div와 a태그로 이루어져 있을 경우 항목을 클릭했을떄 페이지가 새로고침 되어서 깜빡임이 발생한 -> 될 수 있으면 ul과 li태그로 구성하는 것을 권장 -->
														<li class="dropdown-item" id="League">League</li>
														<%
															for (int i = 0; i < lLeaguenclubs.size(); i++) {
																if (!CmmUtil.nvl(LC.getLeague()).equals(lLeaguenclubs.get(i).getLeague())) {
																	LC.setLeague(lLeaguenclubs.get(i).getLeague());
														%>
														<li class="dropdown-item" id="<%=LC.getLeague()%>"><%=LC.getLeague()%></li>

														<%
															}
														%>
														<%
															}
														%>
													</ul>
												</div>


												<!-- //클럽 셀렉트 박스 -->
												<div class="dropdown" style="padding-bottom: 5px;">
													<button class="btn btn-secondary dropdown-toggle"
														type="button" id="dropdownMenuButton3"
														data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false"
														style="width: 233px; height: 40px; border: 1px #d3d3d3 solid; background-color: white; color: #6d6d6d;">
														Club</button>
													<ul class="dropdown-menu"
														aria-labelledby="dropdownMenuButton3" id="clubselect"
														style="width: 233px; height: 300px; overflow: scroll;">
														<!-- 드롭다운이 div와 a태그로 이루어져 있을 경우 항목을 클릭했을떄 페이지가 새로고침 되어서 깜빡임이 발생한 -> 될 수 있으면 ul과 li태그로 구성하는 것을 권장 -->
													</ul>
												</div>

											</div>


											<div class="row third">
												<div class="input-field">
													<div class="result-count">
														<span> </span>
													</div>
													<div class="group-btn">
														<button class="btn-search restapi">SEARCH</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>


							<!-- get club after league in rest -->
							<script>
							 function enterKey(){
									
									var keywords = document.getElementsByName("searchbox")[0].value;
									var nationality = $('#dropdownMenuButton1').text();
									var club = $('#dropdownMenuButton3').text();
									if($('#dropdownMenuButton1').text().indexOf("Nationality") != -1) {
										nationality = "";
									}
									if($('#dropdownMenuButton3').text().indexOf("Club") != -1) {
										club = "";
									}
									if(nationality == "nationality") {
										nationality = "";
									}
									
									if(club == "club") {
										club = "";
									}
								
									 $.ajax({
											url: "http://localhost:8080/searchPlayers.do",
											type:"GET",
											dataType:'text',
											data: {
												"keywords" : keywords,
												"nationality" : nationality,
												"club" : club
											},
											success: function(data){
												console.log('test success1');
												$('#showList').empty();
												$('#showList').html(data).fadeIn('slow');
												
											}, error: function(error){
											console.log('test failed');
											
												console.log(error)
											}
									})
							 }	
									
								$('.restapi').on("click", enterKey)
							</script>
							<!-- /.get club after league in rest -->


							<!-- 선수 상세정보 모달 버튼 -->
							<button type="button" class="btn btn-primary btn-lg"
								style="display:none;"></button>
<!-- 								data-toggle="modal" data-target="#myModal"></button> -->
							<!-- /.선수 상세정보 모달 버튼 -->
							
							<div id="show"></div>



							<!-- Modal -->
							<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">축구선수 상세정보</h4>
										</div>
										<div class="modal-body" style="width:100%;" id="showModal">
										</div>
										<div class="modal-footer">
											<!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary" id="">Accept</button> -->
										</div>
									</div>
								</div>
							</div>


						</div><!-- /.sidebar-widget -->


						<div class="sidebar-widget">
							<h3 class="sidebar-title">Players List</h3>
							<div id="showList"></div>
						</div>


					</div>
				</article>
			</div>
		</section>

	</div>
	<!-- /.container -->

	<%@include file="/WEB-INF/view/footer.jsp" %>
	

	<!-- Bootstrap core JavaScript
			================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/renda/js/bootstrap.min.js"></script>
	<script src="/renda/js/jquery.bxslider.js"></script>
	<script src="/renda/js/mooz.scripts.min.js"></script>
	<script src="/scripts/pageMove.js"></script>

<script>

	
	$("#search").on('keypress', function(e){ 
		if(e.keyCode == 13){ 
			e.preventDefault();
			enterKey();
			return false;
		}
	});
	
	
	/* 국적 */
	$('#nationalitySlc>li').on("click", function(){
		var selectedNationality = $(this).attr("id");
		console.log(selectedNationality);
		$('#dropdownMenuButton1').text(selectedNationality);
		
	})
	
	/* 리그 */
	$('#testid>li').on("click", function(){
		$('#clubselect').html('');
		var selectedLeague = $(this).attr("id");
		console.log(selectedLeague);
		$('#dropdownMenuButton2').text(selectedLeague);
		/* $('#leagueSlc>button').html('')
		$('#leagueSlc>button').html('<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 233px; height: 40px;">' + selectedLeague + '</button>') */
		var clubs = [];
		for(var i of leagueclub) {
			if( i["league"] == selectedLeague) {
				clubs.push(i["club"]);
			}
		}	
		console.log(clubs);
		$('#clubselect').append('<li class="dropdown-item" id="Club">Club</li>');
		for(var i of clubs) {
			$('#clubselect').append('<li class="dropdown-item" id="' + i + '">' + i + '</li>');
		}
		var a = document.getElementById('clubselect').querySelectorAll('li'); 
		for(var i = 0; i < a.length; i++) {
			a[i].addEventListener("click",test);
		}
	})
	
	/* 클럽 */
	function test(){
		var selectedClub = $(this).attr("id");
		console.log(selectedClub);
		$('#dropdownMenuButton3').text(selectedClub);
	}
	
	
</script>

</body>
</html>