<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
		$(()=>{
	  		$(".container").after("<span id='mouseImg'><img src='/javaclass/images/dddd.gif' width='141px'/></span>");
	  		$(".container").after("<span id='mouseImg_'><img src='/javaclass/images/cccc.gif' width='141px'/></span>");
	  		$("#mouseImg").css({"position":"absolute"});
	  		$("#mouseImg_").css({
	  			"position":"absolute",
	  			"visibility" : "hidden"
	  			});
			$("body").on("mousemove", (e) => {
				$("#mouseImg").css({"left":(e.pageX+5),"top":(e.pageY+5)});
				console.log(typeof(e.pageX));
			});
			$("body").on("click", (e) => {
				$("#mouseImg_").css({"visibility":"visible","left":(e.pageX-50),"top":(e.pageY-50),"z-index": -1});
			});
		});
</script>