<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JOIN TDUNBAR</title>
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

#ReviewUp {
	margin: auto;
	padding: 20px;
	width: 700px;
	text-align: center;
	font-weight: bolder;
	font-size: 150%;
}

#ReviewUp .rInput {
	line-height: 35px;
}

#ReviewUp .alert	{
	font-size: 75%;
	color: red;
}

#ReviewUp .suDivider {
	width: 30px;
}

#ReviewUp .tArea	{
	width : 500px;
	height: 300px;
	resize: noresize;
}

#ReviewUp .signUpButton {
	margin: 20px 0px;
	background-color: black;
	color: white;
	width: 150px;
	height: 60px;
	font-size: 20px;
	cursor: pointer;
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
		String p_code = request.getParameter("p_code");
		String titleAlert = (String) request.getAttribute("titleAlert");
		String contentAlert = (String) request.getAttribute("contentAlert");
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
	<section id="ReviewUp">
		<h1>REVIEW</h1>
		<hr>
		<form name="Login" method="post" action="review.jsp">
			<article class="rInput">
				<input type="hidden" value="<%=p_code%>" name="review_p_code">
				<span>REVIEW TITLE</span><br>
				<%if(titleAlert!=null) {%>
				<span class="alert"><%= titleAlert %></span><br>
				<%} %>
				<input type="text" placeholder="Enter title" name="review_title">
				<hr class="rDivider">
				<span>CONTENT</span><br>
				<%if(contentAlert!=null) {%>
				<span class="alert"><%= contentAlert %></span><br>
				<%} %>
				<input type="text" placeholder="Enter review" name="review_content"><br>
				<input type="submit" value="UPLOAD" class="signUpButton">
			<hr>
			</article>
		</form>
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