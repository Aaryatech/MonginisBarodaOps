<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<!--rightNav-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/menuzord.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery("#menuzord").menuzord({
			align : "left"
		});
	});
	$(".toggle").on("click", function() {
		$(".marquee").toggleClass("microsoft");
	});
</script> --%>
<style>
.fileUpload1 input.upload1 {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
	width: 100%;
	height: 33px;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 555; /* Sit on top */
	padding-top: 60px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 8px 20px 20px 20px;
	border: 1px solid #888;
	width: 30%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

#overlay2 {
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(239, 219, 219, 0.5);
	z-index: 9992;
	cursor: pointer;
}

#text2 {
	position: absolute;
	top: 50%;
	left: 50%;
	font-size: 25px;
	color: white;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

.itemDummyClass {
	cursor: pointer;
}

.def_customer {
	display: none;
}
</style>
<!--rightNav-->
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />



</head>
<body>
	<c:url var="getAllFrEmp" value="/getAllFrEmp" />
<c:url var="getFrEmpById" value="/getFrEmpById" />
	<c:url var="checkUserAuthority" value="/checkUserAuthority" />
	<c:url var="updateUserPasswords" value="/updateUserPasswords" />
	<c:url var="updateAdminPassword" value="/updateAdminPassword" />
	<c:url var="getCurrentEmpCodeValue" value="/getCurrentEmpCodeValue" />
	<c:url var="verifyUniqueContactNo" value="/verifyUniqueContactNo" />
	<!--topLeft-nav-->
	<div class="sidebarOuter"></div>
	<!--topLeft-nav-->

	<!--wrapper-start-->
	<div class="wrapper">

		<!--topHeader-->
		<%-- <jsp:include page="/WEB-INF/views/include/header.jsp">
		
			<jsp:param name="fr" value="${frDetails}"/>
		</jsp:include> --%>

		<jsp:include page="/WEB-INF/views/include/logo.jsp"></jsp:include>



		<!--topHeader-->

		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">

				<jsp:include page="/WEB-INF/views/include/left.jsp">
					<jsp:param name="myMenu" value="${menuList}" />

				</jsp:include>

				<!--rightSidebar-->
				<div class="sidebarright">

					<h2 class="pageTitle">
						<i class="fa fa-pencil" aria-hidden="true"></i> Edit Profile
					</h2>


					<!--slider-->
					<!--slider thum size : width:850px height:350px-->
					<div id="owl-example" class="owl-carousel">




						<%-- <c:forEach items="${msgList}" var="msgList">

							<div class="item">
								<div class="screen4plan">
									<div class="homesliderImg">
									 <img src="${url}${msgList.msgImage}" height="300" width="300" />
									

									</div>
									<h3 class="homesliderTitle" ><center>${msgList.msgHeader}</center></h3>


								</div>
							</div>
						</c:forEach> --%>


					</div>
					<!--slider-->



					<div class="topSlide">
						<div class="textcen">

							<div class="order-right"
								style="padding-top: 10px; padding-bottom: 5px; float: right;">
								<a href="#" class="btn additem_btn addcust_open"
									onclick="openAddEmpPopup()">Add Employee</a> <a href="#"
									class="btn additem_btn slide_open" onclick="getData()">Employee
									List</a>
							</div>


							<div class="profileinsite">
								<form name="updateprofile" id="updateprofile" method="post"
									action="${pageContext.request.contextPath}/updateprofile"
									enctype="multipart/form-data">
									<div class="profileinsiteLeft">

										<div class="profile">
											<div class="profilefildset">Franchisee Name</div>
											<div class="profileinput">
												<input class="texboxitemcode" placeholder="franchisee Name"
													name="fr_name" type="text" value="${frDetails.frName}">
											</div>
										</div>

										<div class="profile">
											<div class="profilefildset">Franchisee Profile Pic</div>
											<div class="profileinput">
												<div class="editimg">
													<div class="editpics">
														<div class="fileUpload1">
															<span><i class="fa fa-pencil"></i></span> <input
																type="file" class="upload1" name="fr_image"
																id="fr_image" />
														</div>
													</div>
													<img src="${URL}${frImageName}" alt="img" id="img"
														srcset="${pageContext.request.contextPath}/resources/images/user.png">
												</div>
											</div>
										</div>
										<input type="hidden" name="prevImage" value="${frImageName}">
										<div class="profile">
											<div class="profilefildset">City</div>
											<div class="profileinput">

												<input class="texboxitemcode" placeholder="City Name"
													name="fr_city" type="text" value="${frDetails.frCity}">

											</div>
										</div>
										<div class="profile">
											<div class="profilefildset">Route</div>
											<div class="profileinput mardis">${frDetails.routeName}</div>

										</div>
										<div class="profile">
											<div class="profilefildset">Tax Type</div>
											<div class="profileinput mardis">
												<c:choose>
													<c:when test="${frDetails.frGstType==0}">
							Non-Registered
							</c:when>
													<c:when test="${frDetails.frGstType==2000000}">
							Composite
							</c:when>
													<c:when test="${frDetails.frGstType==10000000}">
							Regular
							</c:when>
													<c:otherwise>
							Composite
							</c:otherwise>
												</c:choose>

											</div>

										</div>
										<div class="profile">
											<div class="profilefildset">1/2 KG Limit</div>
											<div class="profileinput mardis">${frDetails.frKg2}</div>

										</div>

										<div class="profile">
											<div class="profilefildset">Owner's Birthdate</div>
											<div class="profileinput mardis">${frDetails.ownerBirthDate}</div>

										</div>
										<div class="profile">
											<div class="profilefildset">FDA License Date</div>
											<c:set var="style" value="" />
											<c:if test="${fbaFlag==1}">
												<c:set var="style" value="color:red;" />
											</c:if>
											<div class="profileinput mardis" style="${style}">${frDetails.fbaLicenseDate}</div>

										</div>

										<div class="profile">
											<div class="profilefildset">Edit Admin Password</div>
											<div class="col2">
												<input class="texboxitemcode"
													placeholder="Enter new Password" name="fr_password"
													type="password" oninput="checkPasswordMatch();"
													value="${frDetails.frPassword}" id="txtNewPassword"
													disabled="disabled"
													style="font-size: 16pt; height: 33px; width: 130px; background-color: LightGrey;">
											</div>
										</div>
										<%-- <div class="profile">
							<div class="profilefildset">Owner Password</div>
							<div class="col2">
								<input class="texboxitemcode" placeholder="Owner Password"
									name="user1_password" type="password"  value="${frSup.pass1}" id="user1_password" 
									style="font-size: 10pt; height: 33px; width:130px; background-color:LightGrey;" disabled="disabled">
								
							</div>
						</div> --%>
										<div class="profile">
											<div class="profilefildset">Captain Password</div>
											<div class="col2">
												<input class="texboxitemcode" placeholder="Captain Password"
													name="user2_password" type="password"
													value="${frSup.pass2}" id="user2_password"
													style="font-size: 16px; height: 33px; width: 130px; background-color: LightGrey;"
													disabled="disabled">

											</div>
										</div>



									</div>


									<div class="profileinsiteRight">
										<div class="profile">
											<div class="profilefildset">Email id</div>
											<div class="profileinput">
												<input class="texboxitemcode" name="fr_email"
													placeholder="example@gmail.com" type="text"
													value="${frDetails.frEmail}">
											</div>
										</div>
										&nbsp;

										<div class="profile">
											<div class="profilefildset">Mobile No.</div>
											<div class="profileinput">
												<input class="texboxitemcode" placeholder="Mobile No."
													maxlength="10" name="fr_mobile" id="fr_mobile" type="text"
													value="${frDetails.frMob}">
											</div>
										</div>

										<div class="profile">
											<div class="profilefildset">Owner Name</div>
											<div class="profileinput">
												<input class="texboxitemcode" placeholder="Owner Name"
													name="fr_owner" type="text" value="${frDetails.frOwner}">
											</div>
										</div>
										<div class="profile">
											<div class="profilefildset">Rate Type</div>
											<div class="profileinput mardis">
												<c:choose>
													<c:when test="${frDetails.frRateCat==1}">
							Local Rate
							</c:when>
													<c:when test="${frDetails.frRateCat==2}">
							Out-Station Rate
							</c:when>
													<c:when test="${frDetails.frRateCat==3}">
							Special Rate
							</c:when>
												</c:choose>
											</div>

										</div>
										<div class="profile">
											<div class="profilefildset">1 KG Limit</div>
											<div class="profileinput mardis">${frDetails.frKg3}</div>

										</div>
										<div class="profile">
											<div class="profilefildset">Pastries Limit</div>
											<div class="profileinput mardis">${frDetails.frKg1}</div>

										</div>
										<div class="profile">
											<div class="profilefildset">Shop Opening Date</div>
											<div class="profileinput mardis">${frDetails.frOpeningDate}</div>
										</div>
										<div class="profile">
											<div class="profilefildset">Agreement Date</div>
											<c:set var="style" value="" />
											<c:if test="${aggrementFlag==1}">
												<c:set var="style" value="color:red;" />
											</c:if>
											<div class="profileinput mardis" style="${style}">${frDetails.frAgreementDate}</div>

										</div>
										<div class="profile">
											<div class="profilefildset">Pest Control Date</div>
											<c:set var="style" value="" />
											<c:if test="${pestControlFlag==1}">
												<c:set var="style" value="color:red;" />
											</c:if>
											<div class="profileinput mardis" style="${style}">
												${frSup.pestControlDate}</div>

										</div>
										<!--  <div class="profile">
							<div class="profilefildset"></div>
							<div class="profileinput mardis"></div>
							
						</div> -->


										<div class="profile">
											<div class="profilefildset">Confirm Admin Password</div>
											<div class="col2">
												<input class="texboxitemcode"
													placeholder="Confirm new Password" name="fr_password"
													type="password" value="${frDetails.frPassword}"
													id="txtConfirmPassword" oninput="checkPasswordMatch();"
													disabled="disabled"
													style="font-size: 16pt; height: 33px; width: 130px; background-color: LightGrey;">

											</div>

											<div class="form-group">

												<input name="" class="btn additem_btn"
													value="Change Admin Password" type="button" id="changePwd1"
													onclick="showDiv()" style="margin: 0; padding: 6px 7px">

											</div>
											<div class="update FormAlert" id="divCheckPasswordMatch">
											</div>

										</div>

										<div class="profile">
											<div class="profilefildset">CSP Password</div>
											<div class="col2">
												<input class="texboxitemcode" class="btn additem_btn"
													placeholder="CSP Password" name="user3_password"
													type="password" value="${frSup.pass3}" id="user3_password"
													style="font-size: 16px; height: 33px; width: 130px; background-color: LightGrey;"
													disabled="disabled">

											</div>
											<div class="form-group">
												<input name="" class="btn additem_btn"
													value="Change Password" type="button" id="changePwd2"
													onclick="showDiv1()" style="margin: 0;'">
											</div>

										</div>
										<div class="profile" style="display: none;" id="adminDiv">
											<div class="profilefildset">Admin Password</div>
											<div class="col2">
												<input class="texboxitemcode"
													placeholder="Enter Admin Password" name="admin_password"
													type="password" value="" id="admin_password"
													style="font-size: 8pt; height: 30px; width: 130px;">
											</div>

											<div class="form-group">

												<input name="" class="btn btn-info" value="Submit"
													style="background-color: #ed568f; border-color: #ed568f;"
													type="button" id="btnupdate_profile1"
													style="font-size: 13pt; height: 33px; width:75px; "
													onclick="return checkAuthority()">

											</div>

										</div>
										<div id="updateDiv" style="display: none;">

											<input name="updateAdminPwd" class="btn btn-primary"
												value="Update Password" onclick="updateAdminPassword()"
												type="button" id="btnupdate1">

										</div>



										<div class="profile" style="display: none;" id="adminDiv1">
											<div class="profilefildset">Admin Password</div>
											<div class="col2">
												<input class="texboxitemcode"
													placeholder="Enter Admin Password" name="admin_password1"
													type="password" value="" id="admin_password1"
													style="font-size: 8pt; height: 30px; width: 130px;">
											</div>

											<div class="form-group">

												<input name="" class="btn btn-info" value="Submit"
													style="background-color: #ed568f; border-color: #ed568f;"
													type="button" id="btnupdate_profile2"
													style="font-size: 13pt; height: 33px; width:75px; "
													onclick="return checkAuthForPassChange()">

											</div>

										</div>
										<div id="updateDiv1" class="colOuter" style="display: none;">
											<div class="col3full">
												<input name="updateUserPwd" class="btn btn-primary"
													value="Update Password" type="button" id="btnupdate2"
													onclick="return updateUserPasswords()">
											</div>
										</div>

									</div>

									<div class="profile">
										<div class="" style="text-align: center;">
											<input name="" class="btn additem_btn" value="Save"
												type="submit" id="btnupdate_profile"> <input name=""
												class="btn additem_btn" value="Cancel" type="button"
												id="btnupdate_profile" onClick="window.location.reload();">
										</div>
									</div>

								</form>

							</div>
						</div>
					</div>

					<!--latestNews-->

				</div>
				<!--rightSidebar-->

			</div>
			<!--fullGrid-->
		</div>
		<!--rightContainer-->

	</div>
	<!--wrapper-end-->


	<!-- MODAL----------------------------- --->

	<div id="addEmpModal" class="modal">
		<div id="overlay">
			<div class="clock"></div>
		</div>

		<div class="modal-content" style="width: 75%">
			<span class="close" onclick="closeAddEmpPopup()" style="opacity: 2;">&times;</span>

			<h3 class="pop_head">Add Employee</h3>
			<div>
				<div class="row">
					<form action="saveFranchiseeEmp" id="fr_emp_form" method="post" autocomplete="off">
						<div class="col-lg-6">

							<input type="hidden"  name="fr_emp_id"
								id="fr_emp_id">

							<div class="profile">
								<div class="profilefildset">Employee Code</div>
								<div class="profileinput">
									<c:choose>
										<c:when test="${empCode>0}">
											<input name="emp_code" type="text" class="texboxitemcode"
												readonly="readonly" id="emp_code" value="${empCode}"
												required="required" />
										</c:when>
										<c:otherwise>
											<input name="emp_code" type="text" class="texboxitemcode"
												readonly="readonly" id="emp_code" value="${empCode}"
												required="required" />
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							
							<div class="profile">
								<div class="profilefildset">Mobile Number</div>
								<div class="profileinput">
									<input name="emp_contact" type="text" class="texboxitemcode"
										id="emp_contact" onchange="checkContactNo()"
										 maxlength="10" autocomplete="off"
										oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
										required />
								</div>
							</div>
							
							<input name="ttl_limit" type="hidden" class="texboxitemcode"
								id="ttl_limit" value="1"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
								required />

							<div class="add_frm_one" style="z-index: 9999; display: none;">
								<div class="add_customer_one">From Date</div>
								<div class="add_input">
									<input name="from_date" type="date" class="texboxitemcode"
										id="from_date"  required
										autocomplete="off" />

								</div>
								<div class="clr"></div>
							</div>

							<div class="profile">
								<div class="profilefildset">Designation</div>
								<div class="profileinput">
									<select name="designation" id="designation"
										data-placeholder="Designation" class="texboxitemcode"
										class="input_add " style="text-align: left;">
										<option value="1" style="text-align: left;" selected>Admin</option>
										<option value="2" style="text-align: left;">Manager</option>
										<option value="3" style="text-align: left;">Cashier</option>
									</select>
								</div>
							</div>
							
							<div class="profile">
								<div class="profilefildset">Password</div>
								<div class="profileinput">
									<input name="pass" type="password" class="texboxitemcode" id="pass"
										required />
								</div>
							</div>


						</div>

						<div class="col-lg-6">
							
							<div class="profile">
								<div class="profilefildset">Employee Name</div>
								<div class="profileinput">
									<input name="emp_name" type="text" class="texboxitemcode"
										id="emp_name" required />
								</div>
							</div>

							<div class="profile">
								<div class="profilefildset">Address</div>
								<div class="profileinput">
									<input name="emp_address" type="text" class="texboxitemcode"
										id="emp_address" required />
								</div>
							</div>

							<input name="curr_bill_amt" type="hidden" class="texboxitemcode"
								id="curr_bill_amt" value="1"
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
								required />

							<div class="add_frm_one" style="display: none;">
								<div class="add_customer_one">To Date</div>
								<div class="add_input">
									<input name="to_date" type="date" class="texboxitemcode"
										id="to_date"/>
								</div>
								<div class="clr"></div>
							</div>

							<div class="profile">
								<div class="profilefildset">Joining Date</div>
								<div class="profileinput">
									<input name="join_date" type="date" class="texboxitemcode"
										id="join_date" required />
								</div>
							</div>

							<div class="profile">
								<div class="profilefildset">Is Active</div>
								<div class="profileinput">
									<input type="radio" id="emp_status_yes"
										${emp.delStatus==0 ? 'checked' : ''} name="emp_status"
										value="0" checked> Yes  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
										id="emp_status_no" ${emp.delStatus==1 ? 'checked' : ''}
										name="emp_status" value="1"> NO
								</div>
							</div>

						</div>
					</form>
				</div>
			</div>

			<div class="pop_btns">
				<div class="close_l" style="text-align: center;">
					<input type="submit" class="btn additem_btn" id="sbtbtn4" value="Save">
					<button class="btn additem_btn" onclick="clearForm()" id="cls_btn">Close</button>
				</div>				
				<div class="clr"></div>
			</div>

		</div>


	</div>

	<!-- -*********************------------- -->
	<!--Emp List popup-->
	<div id="empListModal" class="modal">
		<div id="overlay">
			<div class="clock"></div>
		</div>

		<div class="modal-content" style="width: 75%">
			<span class="close" onclick="closeEmpListPopUp()" style="opacity: 2;">&times;</span>

			<h3 class="pop_head">Employee List</h3>
			<div>
				<div class="row">
					<table class="responsive-table" id="table_grid">
				<thead>
					<tr class="bgpink">
						<th>Sr.No.</th>
						<th>Employee Name</th>
						<th>Contact No</th>
						<th>Address</th>
						<th>Joining Date</th>
						<!-- <th>Code</th> -->
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
				</div>
			</div>
			<div class="pop_btns">
				<div class="close_l" style="text-align: center;">					
					<button class="btn additem_btn" onclick="closeEmpListPopUp()">Close</button>
				</div>				
				<div class="clr"></div>
			</div>
		</div>
	</div>
</body>


<script>
	function openAddEmpPopup() {

		var modal = document.getElementById("addEmpModal");
		modal.style.display = "block";

	}

	function closeAddEmpPopup(modalId) {

		var modal = document.getElementById("addEmpModal");
		modal.style.display = "none";

		//var date=document.getElementById('todaysDate').value;
		//alert(date);
		// document.getElementById('dt').value=date;

	}
	function openEmpListPopUp() {
		var modal = document.getElementById("empListModal");
		modal.style.display = "block";
	}
	
	function closeEmpListPopUp() {
		var modal = document.getElementById("empListModal");
		modal.style.display = "none";
	}
</script>

<script type="text/javascript">
		function clearForm() {
			closeAddEmpPopup();
			$("#fr_emp_form").trigger("reset");			
		}

		$('#sbtbtn4').click(function() {
			var mobNo = $('#emp_contact').val();
			var empId = $('#fr_emp_id').val();

			var valid = 0;
			if ($('#emp_name').val() == "") {
				valid = 1;
				alert("Enter Employee Name");
			} else if ($('#emp_contact').val() == "") {
				valid = 1;
				alert("Enter Contact No.");
			} else if ($('#join_date').val() == "") {
				valid = 1;
				alert("Enter Joining Date");
			} else if ($('#emp_address').val() == "") {
				valid = 1;
				alert("Enter Employee Address");
			} 
			
			/* else if ($('#ttl_limit').val() == 0) {
				valid = 1;
				alert("Enter Total Limit");
			} */
			/* else if ($('#curr_bill_amt').val() == 0) {
				valid = 1;
				alert("Enter Current Bill Amount");
			} */
			/*  else if ($('#from_date').val() == "") {
				 valid = 1;
				alert("Enter From Date"); 				
			}  */
			
			/*  else if ($('#to_date').val() == "") {
				 valid = 1;
				alert("Enter To Date"); 

			 }  */
			else if ($('#pass').val() == "") {
				valid = 1;
				alert("Enter Password");
			}
			/* else if ($('#pass').val().length != 4) {
				valid = 1;
				alert("Enter 4 digit Password");
			} */
			else if ($('#emp_code').val() == "") {
				valid = 1;
				alert("Enter Employee Code");
			}

			if (valid == 0) {
				save();
			}

		});
		function save() {

			document.getElementById('sbtbtn4').disabled = true;
			document.getElementById('cls_btn').disabled = true;		

			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/saveFranchiseeEmp",
				data : $("#fr_emp_form").serialize(),
				dataType : 'json',
				success : function(data) {
					if (data.frEmpName != null) {

						document.getElementById('sbtbtn4').disabled = false;
						document.getElementById('cls_btn').disabled = false;		

						$("#fr_emp_form").trigger("reset");
						getCurrentEmpCode();
						closeAddEmpPopup();
						alert("Employee Saved Successfylly");
					}
				}
			}).done(function() {
				setTimeout(function() {
				}, 500);
			});
		}

		 function getData() {
			 
			 openEmpListPopUp();
			 
			$
					.getJSON(
							'${getAllFrEmp}',

							{
								ajax : 'true'
							},
							function(data) {
								$('#table_grid td').remove();
								$
										.each(
												data,
												function(key, emp) {
													//alert(JSON.stringify(cashHndOvr));
													$('#loader').hide();

													

													var tr = $('<tr></tr>');
													tr.append($('<td></td>')
															.html(key + 1));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			emp.frEmpName));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			emp.frEmpContact));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			emp.frEmpAddress));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			emp.frEmpJoiningDate));
													var stat = '';
													if(emp.delStatus==0){
														stat='Active'
													}else{
														stat='In-Active'
													}
													tr.append($('<td ></td>')
															.html(stat));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			"<a href='#' onclick=editFrEmp("
																					+ emp.frEmpId
																					+ ") title='Edit' class='addcust_open'><i class='fa fa-edit'></i></a>"));
													$('#table_grid tbody')
															.append(tr);

												})

							});
		} 
		/* "<a href='#' onclick=deletFrEmp("+ emp.frEmpId+") title='Delete'><i class='fa fa-trash'></i></a>" */

		/* function deletFrEmp(empId) {
			//alert("Id----------"+empId)

			if (empId != null) {

				$
						.getJSON(
								'${delFrEmpById}',

								{
									empId : empId,
									ajax : 'true'
								},
								function(data) {
									$('#table_grid td').remove();
									$
											.each(
													data,
													function(key, emp) {
														//alert(JSON.stringify(cashHndOvr));
														$('#loader').hide();

														var tr = $('<tr  ></tr>');
														tr
																.append($(
																		'<td></td>')
																		.html(
																				key + 1));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				emp.frEmpName));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				emp.frEmpContact));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				emp.frEmpAddress));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				emp.frEmpJoiningDate));
														tr
																.append($(
																		'<td  ></td>')
																		.html(
																				emp.empCode));
														tr
																.append($(
																		'<td></td>')
																		.html(
																				"<a href='#' onclick=editFrEmp("
																						+ emp.frEmpId
																						+ ") title='Edit' class='addcust_open'><i class='fa fa-edit'></i></a>&nbsp&nbsp<a href='#' onclick=deletFrEmp("
																						+ emp.frEmpId
																						+ ") title='Delete'><i class='fa fa-trash'></i></a>"));
														$('#table_grid tbody')
																.append(tr);

													})
								});
			}
		} */

		 function editFrEmp(empId) {

			if (empId != null) {

				$
						.getJSON(
								'${getFrEmpById}',

								{
									empId : empId,
									ajax : 'true'
								},
								function(data) {

									//alert(JSON.stringify(data.delStatus)); 

									//$('#addcust').show();
									if(data!=null){
										var modal = document.getElementById("addEmpModal");
										modal.style.display = "block";
									}
									$('#fr_emp_id').val(data.frEmpId);
									$('#emp_name').val(data.frEmpName);
									$('#curr_bill_amt')
											.val(data.currentBillAmt);
									$('#emp_code').val(data.empCode);
									$('#emp_address').val(data.frEmpAddress);
									$('#emp_contact').val(data.frEmpContact);
									$('#join_date').val(data.exVar1);
									$('#from_date').val(data.exVar2);
									$('#to_date').val(data.exVar3);
									$('#pass').val(data.password);
									$('#ttl_limit').val(data.totalLimit);
									if (data.designation == 1) {
										document.getElementById("designation").value = data.designation;
									} else if (data.designation == 2) {
										document.getElementById("designation").value = data.designation;
									} else if (data.designation == 3) {
										document.getElementById("designation").value = data.designation;
									}
									if(data.delStatus==0){
										document.getElementById("emp_status_yes").checked = true;
										
									}else{
										document.getElementById("emp_status_no").checked = true;
									}
									
									closeEmpListPopUp();
								});
			}
		}

		
		function getCurrentEmpCode() {

			$.getJSON('${getCurrentEmpCodeValue}', {
				ajax : 'true'
			}, function(data) {

				//alert(JSON.stringify(data)); 
				document.getElementById("emp_code").value = data;

			});

		}
	</script>
<script type="text/javascript">
		function checkContactNo() {

			var empId = $('#fr_emp_id').val();
		
			var mobNo = $('#emp_contact').val();
		
			if (mobNo != "" || mobNo != null && empId!=" ") {

				$.getJSON('${verifyUniqueContactNo}', {
					mobNo : mobNo,
					ajax : 'true'
				}, function(data) {

					//alert("Info : "+JSON.stringify(data)); 
					if (data.error == false) {

						if (data.message != empId) {

							document.getElementById("emp_contact").value = "";
							alert("Contact No. Already Exist.");
							$('#emp_contact').focus();
							return true;
						}
					}

				});

			}
		}
	</script>


<script type="text/javascript">
	function checkPasswordMatch() {
		var password = $("#txtNewPassword").val();
		var confirmPassword = $("#txtConfirmPassword").val();

		if (password != confirmPassword) {
			document.getElementById("divCheckPasswordMatch").style.color = "#ff0000";
			$("#divCheckPasswordMatch").html("Passwords do not match!");
			document.getElementById('updateDiv').style.display = "none";

			document.getElementById("btnupdate_profile").disabled = true;
		} else {
			document.getElementById("divCheckPasswordMatch").style.color = "green";
			$("#divCheckPasswordMatch").html("Passwords match.");
			document.getElementById('updateDiv').style.display = "block";

			document.getElementById("btnupdate_profile").disabled = false;
		}
	}

	$(document).ready(function() {
		$("#txtConfirmPassword").keydown(checkPasswordMatch);
	});
</script>
<script type="text/javascript">
	function showDiv() {
		document.getElementById('adminDiv').style.display = "block";
		document.getElementById('adminDiv1').style.display = "none";
		document.getElementById('admin_password').value = "";
		document.getElementById('admin_password').focus();
		document.getElementById("btnupdate_profile").disabled = true;
		document.getElementById('changePwd1').style.display = "block";
		document.getElementById('changePwd2').style.display = "none";
	}
	function showDiv1() {
		document.getElementById('adminDiv1').style.display = "block";
		document.getElementById('adminDiv').style.display = "none";
		document.getElementById('admin_password1').value = "";
		document.getElementById('admin_password1').focus();
		document.getElementById("btnupdate_profile").disabled = true;
		document.getElementById('changePwd2').style.display = "block";
		document.getElementById('changePwd1').style.display = "none";

	}
</script>
<script type="text/javascript">
	function checkAuthority() {

		var adminPwd = document.getElementById("admin_password").value;

		$.getJSON('${checkUserAuthority}', {

			adminPwd : adminPwd,
			ajax : 'true'
		}, function(data) {

			if (data.accessRight == 1) {
				document.getElementById("changePwd1").disabled = true;
				document.getElementById('txtNewPassword').removeAttribute(
						'disabled');
				document.getElementById('txtConfirmPassword').removeAttribute(
						'disabled');

				$('#txtNewPassword').css('background-color', 'white'); // change the background color
				$('#txtConfirmPassword').css('background-color', 'white'); // change the background color
				document.getElementById('adminDiv').style.display = "none";
				document.getElementById('updateDiv').style.display = "block";

			} else {
				document.getElementById("admin_password").value = "";
				document.getElementById("admin_password").focus();
				alert("Invalid Credentials");

			}
		}

		);
	}
	function checkAuthForPassChange() {

		var adminPwd = document.getElementById("admin_password1").value;
		$.getJSON('${checkUserAuthority}', {

			adminPwd : adminPwd,
			ajax : 'true'
		}, function(data) {

			if (data.accessRight == 1) {
				document.getElementById("changePwd2").disabled = true;
				//	document.getElementById('user1_password').removeAttribute('disabled');
				document.getElementById('user2_password').removeAttribute(
						'disabled');
				document.getElementById('user3_password').removeAttribute(
						'disabled');

				//  $('#user1_password').css('background-color' , 'white'); // change the background color
				$('#user2_password').css('background-color', 'white'); // change the background color
				$('#user3_password').css('background-color', 'white'); // change the background color

				document.getElementById('adminDiv1').style.display = "none";
				document.getElementById('updateDiv1').style.display = "block";

			} else {
				document.getElementById("admin_password1").value = "";
				document.getElementById("admin_password1").focus();
				alert("Invalid Credentials");

			}
		}

		);
	}
	function updateUserPasswords() {

		//var pass1=document.getElementById('user1_password').value;
		var pass2 = document.getElementById('user2_password').value;

		var pass3 = document.getElementById('user3_password').value;
		$.getJSON('${updateUserPasswords}', {

			//pass1:pass1,
			pass2 : pass2,
			pass3 : pass3,

			ajax : 'true'
		}, function(data) {
			if (data.error == false) {
				document.getElementById("btnupdate_profile").disabled = false;

				document.getElementById("changePwd2").removeAttribute(
						'disabled');
				//	document.getElementById('user1_password').disabled = true;
				document.getElementById('user2_password').disabled = true;
				document.getElementById('user3_password').disabled = true;

				//  $('#user1_password').css('background-color' , 'LightGrey'); // change the background color
				$('#user2_password').css('background-color', 'LightGrey'); // change the background color
				$('#user3_password').css('background-color', 'LightGrey');
				document.getElementById('updateDiv1').style.display = "none";
				document.getElementById('changePwd1').style.display = "block";
				document.getElementById('changePwd2').style.display = "block";
				alert("User Passwords Updated Successfully");
			}

		});
	}

	function updateAdminPassword() {

		var adminPwd = document.getElementById('txtNewPassword').value;
		$.getJSON('${updateAdminPassword}', {

			adminPwd : adminPwd,

			ajax : 'true'
		}, function(data) {

			if (data.error == false) {
				document.getElementById('changePwd1').removeAttribute(
						'disabled');
				document.getElementById('txtNewPassword').disabled = true;
				document.getElementById('txtConfirmPassword').disabled = true;
				document.getElementById("btnupdate_profile").disabled = false;

				$('#txtNewPassword').css('background-color', 'LightGrey'); // change the background color
				$('#txtConfirmPassword').css('background-color', 'LightGrey'); // 
				document.getElementById('updateDiv').style.display = "none";
				document.getElementById('changePwd1').style.display = "block";
				document.getElementById('changePwd2').style.display = "block";
				alert("Admin Password Updated Successfully");
				$("#divCheckPasswordMatch").html("");
			}

		});
	}
</script>
<script>
	$('#fr_mobile').on(
			'input',
			function() {
				this.value = this.value.replace(/[^0-9]/g, '').replace(
						/(\..*)\./g, '$1');
			});

	document.getElementById("fr_image").onchange = function() {
		var reader = new FileReader();

		reader.onload = function(e) {
			// get loaded data and render thumbnail.
			document.getElementById("img").src = e.target.result;
		};

		// read the image file as a data URL.
		reader.readAsDataURL(this.files[0]);
	};
</script>
</html>