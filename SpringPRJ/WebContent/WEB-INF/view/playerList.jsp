<%@page import="poly.dto.SearchDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="poly.util.CmmUtil"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//검색한 선수가 목록에 존재하면 공백이 아님
	String listlength = CmmUtil.nvl((String) request.getAttribute("listlength"));
	System.out.println("------------------------------------");
	System.out.println("listlength : " + listlength);
	List<SearchDTO> searchList = new ArrayList<SearchDTO>();
	searchList = (List<SearchDTO>) request.getAttribute("searchList");
%>
<script>
/* 	function name(name){
		var player = name;
		console.log("player : "+player);
		$.ajax({
			headers:{
				"Content-Type" : "text/html; charset=UTF-8"
			},
			url: "http://localhost:8080/crawlingNamu.do",
			method:"GET",
			dataType:'text',
			data: {
				"kr" : player
			},
			success: function(data){
				console.log('test success2');
				console.log(data);
				$('#showModal').html(data);
				$('#myModal').modal('toggle');
			}, error: function(error){
			console.log('test failed');
				console.log(error)
			}
		})
	}
 */

</script>
<script>
</script>
<!-- sidebar-widget -->

	<%
		if (searchList.size() > 0) {
			System.out.println("------------------------------------");
	%>
	<div class="widget-container">
		<%
			for (int i = 0; i < searchList.size(); i++) {
		%>
		<article class="widget-post" style="padding: 0px;">
			<div class="post-image">
				<a href="#" onclick="return false;"><img
					src="<%=CmmUtil.nvl(searchList.get(i).getPhoto())%>"></a>
			</div>
			<div id="test<%=i%>"
			<% String cnt = "";
			if(CmmUtil.nvl(searchList.get(i).getName()).contains("Kane") || CmmUtil.nvl(searchList.get(i).getName()).contains("Alli") ) {
				if(CmmUtil.nvl(searchList.get(i).getName()).contains("Kane")) {
					cnt = "k";
				} else if (CmmUtil.nvl(searchList.get(i).getName()).contains("Alli") ) {
						cnt="a";
				}%>
				<%-- onclick="name('<%=searchList.get(i).getName()%>');" --%>
				onclick="namuwikiDetail.KaneOrAlli('<%=cnt%>')"
			<%} %>
				class="post-body" style="">
				<h4 style="text-align: left;">
					<a href="#" onclick="return false;" id="<%=searchList.get(i).getName()%>"><%=searchList.get(i).getName()%></a>
				</h4>
				
				<div style="display: flex">
					<a href="#" onclick="return false;"><img
						src="<%=CmmUtil.nvl(searchList.get(i).getFlag())%>" alt=""></a>
					<a href="#" onclick="return false;"
						style="text-align: left; margin: 4px 20px 4px 4px; font-weight: bold;"><%=CmmUtil.nvl(searchList.get(i).getNationality())%></a>
					<a href="#" onclick="return false;"><img
						src="<%=CmmUtil.nvl(searchList.get(i).getClublogo())%>" alt=""></a>
					<a href="#" onclick="return false;"
						style="text-align: left; margin: 4px 4px 4px 4px; font-weight: bold;"><%=CmmUtil.nvl(searchList.get(i).getClub())%></a>
				</div>
			</div>
		</article>
		<%
			}
		%>
	</div>
	<%
		}
	%>

