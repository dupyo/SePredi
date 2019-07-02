var pageMove ={
		boardInsert : function(){
			alert('asdasd')
			//location.href="/insertBoard.do";
		},
		click : function(){
			location.href="/accountskakao.do";
		},
		search : function(param){
			console.log("search : " +param);
			location.href="/searchFromCSV.do?keywords="+param;
		},
		boardDetail : function(param){
			console.log("boardDetail : " +param);
			location.href="/boardDetail.do?id="+param;
		}
}

/*const selector={
		kakaoId : document.getElementById('kakaologin')
}

selector.kakaoId.addEventListener('click',function(){
	location.href="/accountskakao.do";
})*/