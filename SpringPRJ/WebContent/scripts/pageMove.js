const pageMove ={
		board : function(){
			location.href="/notice/"+param+".do";
		},
		click : function(){
			location.href="/accountskakao.do";
		},
		search : function(param){
			console.log("search : " +param);
			location.href="/searchFromCSV.do?keywords="+param;
		}
}

/*const selector={
		kakaoId : document.getElementById('kakaologin')
}

selector.kakaoId.addEventListener('click',function(){
	location.href="/accountskakao.do";
})*/