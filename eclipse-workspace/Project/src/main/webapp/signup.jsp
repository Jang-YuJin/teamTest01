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

#signUp {
	margin: auto;
	padding: 20px;
	width: 700px;
	text-align: center;
	font-weight: bolder;
	font-size: 150%;
}

#signUp .suInput {
	line-height: 35px;
}

#signUp .alert	{
	font-size: 75%;
	color: red;
}

#signUp .suDivider {
	width: 30px;
}

#signUp .signUpButton {
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
		String idAlert = (String) request.getAttribute("idAlert");
		String pwAlert = (String) request.getAttribute("pwAlert");
		String pwcheckAlert = (String) request.getAttribute("pwcheckAlert");
		String nameAlert = (String) request.getAttribute("nameAlert");
		String telAlert = (String) request.getAttribute("telAlert");
		String addressAlert = (String) request.getAttribute("addressAlert");
		String birthAlert = (String) request.getAttribute("birthAlert");
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
	<section id="signUp">
		<h1>SIGN UP</h1>
		<hr>
		<article class="suInput">
			<form name="Login" method="post" action="signed.jsp">
			<span>ID</span><br>
			<%if(idAlert!=null) {%>
			<span class="alert"><%= idAlert %></span><br>
			<%} %>
			<input type="text" placeholder="Enter ID" name="user_id">
			<hr class="suDivider">
			<span>PASSWORD</span><br>
			<%if(pwAlert!=null) {%>
			<span class="alert"><%= pwAlert %></span><br>
			<%} %>
			<input type="password" placeholder="Enter password" name="user_pw">
			<hr class="suDivider">
			<span>CHECK PASSWORD</span><br>
			<%if(pwcheckAlert!=null) {%>
			<span class="alert"><%= pwcheckAlert %></span><br>
			<%} %>
			<input type="password" placeholder="Enter password again" name="user_pwCheck">
			<hr class="suDivider">
			<span>NAME</span><br>
			<%if(nameAlert!=null) {%>
			<span class="alert"><%= nameAlert %></span><br>
			<%} %>
			<input type="text" placeholder="Enter name" name="user_name">
			<hr class="suDivider">
			<span>TEL</span><br>
			<%if(telAlert!=null) {%>
			<span class="alert"><%= telAlert %></span><br>
			<%} %>
			<input type="text" placeholder="Enter tel (without -)" name="user_tel">
			<hr class="suDivider">
			<span>ADDRESS</span><br>
			<%if(addressAlert!=null) {%>
			<span class="alert"><%= addressAlert %></span><br>
			<%} %>
			<input type="text" placeholder="Enter address" name="user_address">
			<hr class="suDivider">
			<span>BIRTH</span><br>
			<%if(birthAlert!=null) {%>
			<span class="alert"><%= birthAlert %></span><br>
			<%} %>
			<input type="text" placeholder="Enter ex) 2022-03-26" name="user_birth"><br>
			<input type="submit" value="SIGN UP" class="signUpButton">
			</form>
			<hr>
		</article>
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