<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

#head .promoBox {
	width: 1200px;
	height: 857px;
	background-image: url("https://wwd.com/wp-content/uploads/2021/06/SSENSE-BURBERRY.jpg");
	background-size: contain;
}

#items {
	text-align: center;
	font-size: 200%;
}

#items .itemBox {
	display: flex;
	flex-direction: column;
	align-content: center;
	flex-wrap: wrap;
}

#items .itemBox > div {
	width: 700px;
	padding: 50px;
	margin: 30px 0px;
	text-align: center;
	color:white;
	cursor: pointer;
}

#items .iList1	{
	background-image: url("https://enfntsterribles.com/wp-content/uploads/2019/06/Enfntsterribles-AntwerpFashionAcademy-Show2019-VictorWang-07-1000x400.jpg");
	background-size: cover;
}

#items .iList2	{
	background-image: url("https://enfntsterribles.com/wp-content/uploads/2019/06/Enfntsterribles-AntwerpFashionAcademy-Show2019-Quinten-10-1000x400.jpg");
	background-size: cover;
}
#items .iList3	{
	background-image: url("https://enfntsterribles.com/wp-content/uploads/2020/03/enfnts-terribles-final-day-for-real-paris-fw-HEADER-1000x400.jpg");
	background-size: cover;
}
#items .iList4	{
	background-image: url("https://www.pinkvilla.com/files/styles/shopping-hero/public/23heroimg2.jpg?itok=0bHVGagj");
	background-size: cover;
}
#items .iList5	{
	background-image: url("https://cdn.shopify.com/s/files/1/1921/0991/files/quality_2048x.png?v=1646180859");
	background-size: cover;
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
<title>TDUNBAR</title>
</head>
<body>
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
		<article class="promoBox">
        </article>
	</header>
	<section id="items">
		<h1>CATALOG</h1>
		<div class="itemBox">
			<div class="iList1" onclick="location.href='list.jsp?p_code=top';">
				<h1>TOP</h1>
			</div>
			<div class="iList2" onclick="location.href='list.jsp?p_code=outer';">
				<h1>OUTER</h1>
			</div>
			<div class="iList3" onclick="location.href='list.jsp?p_code=bottom';">
				<h1>BOTTOM</h1>
			</div>
			<div class="iList4" onclick="location.href='list.jsp?p_code=bag';">
				<h1>BAGS</h1>
			</div>
			<div class="iList5" onclick="location.href='list.jsp?p_code=shoes';">
				<h1>SHOES</h1>
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