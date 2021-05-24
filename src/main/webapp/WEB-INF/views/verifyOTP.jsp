<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Monginis</title>
<link
	href="${pageContext.request.contextPath}/resources/css/monginis.css"
	rel="stylesheet" type="text/css" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/feviconicon.png"
	type="image/x-icon" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/common.js"></script>


<!--rightNav-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/menuzord.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery("#menuzord").menuzord({
			align : "left"
		});
	});
</script>



<!--rightNav-->


</head>
<body style="background: url(resources/images/lgn_bg.jpg) no-repeat left top;">
	<div class="wrapper">
	

		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">
				<c:if test="${not empty message}">
					<!-- here would be a message with a result of processing -->
					<div class="messages messagesErr">${message}</div>

				</c:if>
				

				<c:url value="reGenOPSOtp" var="reGenOPSOtp"></c:url>
				
				<div class="loginInner">
				
					<div class="login_l light_height"><a href="${pageContext.request.contextPath}/"><img
						src="${pageContext.request.contextPath}/resources/images/monginis1.png"
						alt="monginis"></a>
						<p class="login_txt">Delivering with Professional Excellence To be preferred Chartered Accountant, Advisor or Consultant to Business across India; and provide utility oriented legal compliance. </p>	
					</div>
						
					<div class="login_r frget_pass">
				
					<h2 class="login_head_one">
						OTP Verification
					</h2>
					<div class="loginBox">
						<form action="OpsOTPVerification" class="form-horizontal"
							id="validation-form" method="post">

							<div class="loginfildset">
								<input class="texboxlogin" placeholder="OTP Verification" name="otp" id="otp"
									type="text" data-rule-required="true" required="required">
							

							<input class="texboxlogin" name="username" id="username"
								type="hidden" value="${frCode}" readonly="readonly"
								data-rule-required="true">
							</div>

							<div class="loginfildset">
								<div class="left_button">
									<input name="" class="buttonlogin one" value="Verify OTP" type="submit">
								</div>	
								<div class="right_button">	
									<input type="button" class="buttonlogin one" onclick="reGenOPSOtp()" value="Re Generate OTP" />	
								</div>	
							</div>
							<div class="loginfildset">
								<div class="logintexboxleft">
									<a href="${pageContext.request.contextPath}/">
									<i class="fa fa-lock"></i> Back To Login Page</a>
								</div>

							</div>
						</form>
					</div>
	</div>	
	<div class="clr"></div>
</div>
				</form>
			</div>
			<!--fullGrid-->
		</div>
		<!--rightContainer-->

	</div>
	






	
	

	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="resources/assets/jquery/jquery-2.0.3.min.js"><\/script>')
	</script>

	<script>
		$("#login").validate();
	</script>
	<script type="text/javascript">
		function reGenOPSOtp() {
			//alert("Hi");

			var form = document.getElementById("validation-form");

			form.setAttribute("method", "post");

			form.action = ("reGenOPSOtp");

			form.submit();

			var username = document.getElementById("username").value;
			//alert(username);

			$.getJSON('${reGenOPSOtp}', {
				username : username,

				ajax : 'true',

			}, function(data) {

				//alert("Data  " +JSON.stringify(data));
				location.reload(true);

			});

		}
	</script>

	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "100%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
		function openNav1() {
			document.getElementById("mySidenav1").style.width = "100%";
		}

		function closeNav1() {
			document.getElementById("mySidenav1").style.width = "0";
		}
		function openNav3() {
			document.getElementById("mySidenav3").style.width = "100%";
		}

		function closeNav3() {
			document.getElementById("mySidenav3").style.width = "0";
		}
	</script>


</body>
</html>