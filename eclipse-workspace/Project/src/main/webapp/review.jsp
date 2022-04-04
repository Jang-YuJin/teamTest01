<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.Date"
	import="java.util.*"
	import="projectDTO.*"
	import="projectDAO.*"
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TDUNBAR</title>
<style>
body {
	margin: auto;
	width: 1200px;
	font-family: 'Times New Roman', Times, serif;
}

a {
	text-decoration-line: none;
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: rgb(133, 106, 71);
}

#head .logoBox {
	display: flex;
	justify-content: space-around;
	align-items: center;
	text-align: center;
}

#head .homeSearch {
	background-color: black;
	color: white;
}

#head .logo {
	width: 400px;
	height: 110px;
}

#head .logoNav {
	width: 200px;
}

#head .mainNav {
	text-align: center;
	font-size: 25px;
	font-weight: bolder;
}

#signed {
	margin: auto;
	padding: 20px;
	width: 700px;
	height: 550px;
	text-align: center;
	font-weight: bolder;
	font-size: 150%;
}

#signed .sDiv {
	width: 600px;
	height: 300px;
	padding: 50px;
}

#signed .sMsg {
	display: flex;
	text-align: center;
	font-size: 85%;
	line-height: 30px;
	flex-direction: column
}

#footer {
	background-color: rgb(53, 53, 53);
	color: white;
	padding: 20px 80px;
	margin-top: 30px;
	line-height: 30px;
	display: flex;
	justify-content: space-between;
	align-items: center
}

#footer .fImg	{
	width: 40px;
	height: 40px;
}

#footer a	{
	color:white;

}
</style>
</head>
<body>
<%
		String p_code = request.getParameter("review_p_code");
		String title = request.getParameter("review_title");
		String content = request.getParameter("review_content");
		
		if(title==null || title.length()==0){
		request.setAttribute("titleAlert", "Enter title");
		pageContext.forward("insertReview.jsp?p_code=");
		} else if(content==null || content.length()==0){
		request.setAttribute("contentAlert", "Enter Content");
		pageContext.forward("insertReview.jsp?p_code=");
		} else {
		ProjectImpl impl = new ProjectImpl();
			
		ReviewDTO rDTO = new ReviewDTO();
		rDTO.setCode(p_code);
		rDTO.setTitle(title);
		rDTO.setContent(content);
		
		impl.inputReview(rDTO);
		
		}
%>
	<header id="head">
		<article class="logoBox">
			<div>
				<input type="text" placeholder="Search...">
				<input type="button" value="Search" class="homeSearch">
			</div>
			<a href="home.jsp"><img src="https://imgdb.in/jGKw.jpg" class="logo"></a>
			<nav class="logoNav">
				<a href="signup.jsp">LOGIN</a> | 
				<a href="signup.jsp">SIGN UP</a> | 
				<a href="signup.jsp">MYPAGE</a>
			</nav>
		</article>
		<nav class="mainNav">
			<hr>
			<a href="list.jsp?p_code=all">PRODUCTS</a> | 
			<a href="list.jsp?p_code=top">TOP</a> | 
			<a href="list.jsp?p_code=outer">OUTER</a> |
			<a href="list.jsp?p_code=bottom">BOTTOM</a> | 
			<a href="list.jsp?p_code=bag">BAGS</a> | 
			<a href="list.jsp?p_code=shoes">SHOES</a>
			<hr>
		</nav>
	</header>
	<section id="signed">
		<hr>
		<h1>WELCOME</h1>
		<hr>
		<div class="sDiv">
			<div class="sMsg">
				<h1>"리뷰 등록 완료"</h1>
				<br> <%= p_code %> 제품에 대한 리뷰가 등록되었습니다.
			</div>
		</div>
	</section>
	<footer id="footer">
		<div>
		LIFE STYLE SELECT SHOP / TDUNBAR.<br> EMIAL : TDUNBAR@GMAIL.COMX<br>
		CUSTOMER CENTER : 02-1515-55324<br> COPYRIGHT (C) TDUNBAR ALL
		RIGHTS RESERVED.
		</div>
		<div>
		<img src="https://cdn-icons-png.flaticon.com/512/1409/1409946.png" class="fImg">
		<img src="https://cdn-icons-png.flaticon.com/512/733/733547.png" class="fImg">
		<img src="https://cdn-icons-png.flaticon.com/512/1409/1409937.png" class="fImg">
		<img src="https://pngimg.com/uploads/youtube/youtube_PNG19.png" class="fImg">
		<br>
		<a href="home.jsp">REGISTER BRAND</a><br>
		www.tdunbar.comx
		</div>
	</footer>
</body>
</html>
</html>