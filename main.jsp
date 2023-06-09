<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.File"%>
<%@ page import="ww.member.vo.*"%>
<%@ page import="ww.upload.controller.*"%>
<%@ page import="ww.upload.vo.*"%>
<%@ page import="ww.upload.model.*"%>
<%@ page import="ww.mypage.controller.*"%>

<!DOCTYPE html>
<html>
<head>
<%
String result = (String) request.getAttribute("uploadId");
Member login_member = (Member) session.getAttribute("login_member");
if (login_member == null) {
%>
<script type="text/javascript">
	alert("로그인 후 이용해주세요");
	location.href = "login.jsp";
</script>
<%
}
%>
<script type="text/javascript">
	function f1(this_img) {
		alert("img click");
		alert(this_img.src);

	}
</script>
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous">
	
</script>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>main page</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<title>Weather Wear</title>
</head>
<body id="body-pd" class="main-app1">

	<!--  -->
	<header>
		<div class="container px-4 px-lg-5 my-5" style="padding-top: 20px;">
			<div class="text-center text-white">
				<img class="weatherIcon" style="float: left;">
				<h4>
					<span class="weatherInfo" style="float: left;"></span>
				</h4>
			</div>
		</div>
	</header>


	<!-- sidebar -->
	<div class="l-navbar" id="navbar">
		<nav class="nav">
			<div>
				<div class="nav__brand">
					<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
					<a href="#" class="nav__logo">Weather Wear</a>
				</div>
				<div class="nav__list">
					<a href="main.jsp" class="nav__link active"> <ion-icon
							name="home-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">Home</span>
					</a> <a href="myPageControl" class="nav__link callapse"> <ion-icon
							name="person-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">My Page</span>
					</a> <a href="upload.jsp" class="nav__link"> <ion-icon
							name="arrow-up-circle-sharp" class="nav__icon"></ion-icon> <span
						class="nav_name">Upload</span>
					</a>


				</div>
				<a href="logoutControl" class="nav__link"> <ion-icon
						name="log-out-outline" class="nav__icon"></ion-icon> <span
					class="nav_name">Log out</span>
				</a>
			</div>
		</nav>
	</div>

	<!-- Section-->
	<section>
		<div class="container px-4 px-lg-5 mt-5">
		<div class="box">
								<div class="box1" style=" float: left; margin-left: 35px; ">
<img class="profile1 cate" src="/cate_img/민소매.jpeg" name="민소매" >
</div>

<div class="box1" style="background: #BDBDBD; float: left; margin-left: 35px;">
<img class="profile1 cate" src="/cate_img/반팔상의.jpeg" name="반팔상의" >
</div>
<div class="box1" style="background: #BDBDBD; float: left; margin-left: 35px;">
<img class="profile1 cate" src="/cate_img/긴팔상의.jpeg" name="긴팔상의" >
</div>
<div class="box1" style="background: #BDBDBD; float: left; margin-left: 35px;">
<img class="profile1 cate" src="/cate_img/긴바지.jpeg" name="긴바지" >
</div>
<div class="box1" style="background: #BDBDBD; float: left; margin-left: 35px;">
<img class="profile1 cate" src="/cate_img/짧은바지.jpeg" name="짧은바지" >
</div>
<div class="box1" style="background: #BDBDBD; float: left; margin-left: 35px;">
<img class="profile1 cate" src="/cate_img/긴치마.jpeg" name="긴치마" >
</div>
<div class="box1" style="background: #BDBDBD; float: left; margin-left: 35px;">
<img class="profile1 cate" src="/cate_img/짧은치마.jpeg" name="짧은치마" >
</div>
<div class="box1" style="background: #BDBDBD; float: left; margin-left: 35px;">
<img class="profile1 cate" src="/cate_img/긴원피스.jpeg" name="긴원피스" >
</div>
<div class="box1" style="background: #BDBDBD; float: left; margin-left: 35px;">
<img class="profile1 cate" src="/cate_img/짧은원피스.jpeg" name="짧은원피스" >
</div>
<div class="box1" style="background: #BDBDBD; float: left; margin-left: 35px;">
<img class="profile1 cate" src="/cate_img/아우터.jpeg" name="아우터" >
</div>
</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">

				<%
				// webapp/image 경로 전체 복사해서 넣어주세요
				File dir = new File("C:\\Users\\Administrator\\03.servlet_jsp\\workspace\\weather_wear\\src\\main\\webapp\\my_file");

				File files[] = dir.listFiles();

				for (int i = files.length - 1; i >= 0; i--) {

					String name = files[i].getPath();
					int idx = name.lastIndexOf("\\");
					String fName = name.substring(idx + 1, name.length());

					out.print("<div class=\"col mb-5\"><div><img class=\"card-img show1\" src=\"my_file/" + fName + "\""
					+ "alt=\"...\"  /></div></div>");
				}
				%>

			</div>
		</div>

		<div class="background">
			<div class="window">
				<div class="popup">
					<div class="text-left1">
						<img src="#" id="pop_img" style="width: 520px; height: 620px;" />
					</div>

					<div class="text-right1">
						<button id="close" style="float: right;"
							class="btn btn-outline-dark">돌아가기</button>
						<br />
						<div class="text-right1">
							<div style="float: left; padding-left: 20px;">
								<h2 id="imgId"></h2>
								<h2 id="imgDate"></h2>
							</div>
							<br />
							<br />
							<hr />
							<div id="aside" class="text-center1"
								style="padding-left: 20px; padding-right: 20px;">
								<h3>패션정보:</h3>
								<h6 id='imgText'></h6>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		var filename = "1234";
		$(".show1")
				.on(
						"click",
						function() {

							filename = this.src.substring(this.src
									.lastIndexOf('/') + 1);
							$("#pop_img").attr("src", this.src);
							document.querySelector(".background").className = "background show";
							$.ajax({

								url : '/uploadListControl',
								type : 'POST',
								data : {
									filename : filename
								},
								success : function(data) {

									// 컨트롤러로 보낸 값을 처리하는 로직
									$("#imgText").text(data);

								}
							});
						});

		$("#close").on("click", function() {

			$(".background").attr("class", "background");
		});
	</script>

	<script>
		var filename = "1234";
		$(".show1")
				.on(
						"click",
						function() {

							filename = this.src.substring(this.src
									.lastIndexOf('/') + 1);
							$("#pop_img").attr("src", this.src);
							document.querySelector(".background").className = "background show";
							$.ajax({

								url : '/uploadIdControl',
								type : 'POST',
								data : {
									filename : filename
								},
								success : function(data) {

									// 컨트롤러로 보낸 값을 처리하는 로직
									$("#imgId").text(data);

								}
							});
							$.ajax({

								url : '/uploadDayControl',
								type : 'POST',
								data : {
									filename : filename
								},
								success : function(data) {

									// 컨트롤러로 보낸 값을 처리하는 로직
									$("#imgDate").text(data);
								}
							});
						});
		$("#close").on("click", function() {

			$(".background").attr("class", "background");
		});
		$(".cate").on("click", function() {

			alert(this.name);
		});
	</script>

	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="js/main.js"></script>
	<script src="js/app.js"></script>
</body>

</html>