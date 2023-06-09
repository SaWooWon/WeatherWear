<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="ww.member.vo.*" %> 
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<!DOCTYPE html>


<html>
<head>
<%
	Member login_member=(Member)session.getAttribute("login_member");
	if(login_member == null){
	%>
		<script type="text/javascript">	
			alert("로그인 후 이용해주세요");
			location.href="login.jsp";
		</script>
	<%
	}
	%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="css/styles.css">
<title>사진 업로드</title>


</head>
<body id="body-pd" class="upload">
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

	<div class="container">
		<h1 style="align-items: center;">Upload</h1>
		<br />
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">

				<form name="frmName"  method="post" action="uploadControl" onsubmit="return Validation1()"
					encType="multipart/form-data">

					<div class="form-group">

						<h5>지역</h5>
						<select name="i_local" id="i_local" onChange="cat1_change(this.value)"
							class="form-control2">
							<option value="">-선택-</option>
							<option value='1'>서울</option>
							<option value='2'>부산</option>
							<option value='3'>대구</option>
							<option value='4'>인천</option>
							<option value='5'>광주</option>
							<option value='6'>대전</option>
							<option value='7'>울산</option>
							<option value='8'>강원</option>
							<option value='9'>경기</option>
							<option value='10'>경남</option>
							<option value='11'>경북</option>
							<option value='12'>전남</option>
							<option value='13'>전북</option>
							<option value='14'>제주</option>
							<option value='15'>충남</option>
							<option value='16'>충북</option>
						</select> <br />
						<h5>날짜</h5>
						<input type="text" name="i_day" id="date" class="form-control3" autocomplete="off"><br />
						<h5>성별</h5>
						<p>
							<select name="gender" id="gender" class="form-control2">
								<option value="">-선택-</option>
								<option value='남자'>남자</option>
								<option value='여자'>여자</option>
							</select>
						</p>
						<br />
						<h5>텍스트 입력</h5>
						<input type="text" class="form-control1" placeholder="텍스트 입력"
							name="i_text" id="i_text" autocomplete="off"><br />
					</div>
					<div class="form-group">
						<input class="form-control1 form-control-user" type="file"
							name="product_image" id="product_image"
							onchange="setThumbnail(event);">
					</div>
					<div id="image_container"></div>
				<br /> <input type="button" class="btn btn-primary form-control1"
						value="UPLOAD" onclick="Validation1();" />

					</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>

	<script src="js/upload.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
</body>
<script type="text/javascript">
function Validation1(){
		var frmName = document.frmName;
		var i_local = document.getElementById("i_local")
		var date = document.getElementById("date")
		var sex = document.getElementById("sex")
		var product_image = document.getElementById("product_image")
		
		if(i_local.value==""){
			alert("지역을 선택해주세요")
			local1.focus();
			return false;
		}
		if(date.value==""){
			alert("날짜를 입력해주세요");
			date.focus();
			return false;
		}
		if(gender.value==""){
			alert("성별을 선택해주세요")
			return false;
		}
		if(product_image.value==""){
			alert("사진을 넣어 주세요")
			image.focus();
			return false;
		}
		document.frmName.submit();
		alert("업로드 되었습니다");
		return true;
	}
</script>
</html>