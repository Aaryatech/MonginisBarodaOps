
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>Monginis</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0" />
<meta name="keywords" content="Monginis" />
<meta name="description" content="Monginis" />
<meta name="author" content="Monginis">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/newpos/css/monginis.css"
	type="text/css" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/feviconicon.png"
	type="images/png" sizes="32x32">

<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700&display=swap"
	rel="stylesheet">
<!--font-family: 'Source Sans Pro', sans-serif;-->

<!--commanJS-->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/newpos/js/jquery-1.10.2.min.js"></script>

<!-- jQuery Popup Overlay -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/newpos/js/jquery.popupoverlay.js"></script>

<!--fancy scroll js-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/newpos/js/jquery.mousewheel.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/newpos/js/jquery.classyscroll.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/newpos/js/jquery.classyscroll.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/newpos/alertify/alertify.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/newpos/alertify/css/alertify.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/newpos/alertify/css/themes/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/newpos/alertify/css/themes/default.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">
<style>
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

.alertify-notifier {
	z-index: 999999 !important;
}

#preloader {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #fff;
	z-index: 99;
	height: 100%;
}

#status {
	width: 200px;
	height: 200px;
	position: absolute;
	left: 50%;
	top: 50%;
	background-image:
		url(${pageContext.request.contextPath}/resources/images/loader1.gif);
	background-repeat: no-repeat;
	background-position: center;
	margin: -100px 0 0 -100px;
}
</style>
<div id="preloader">
	<div id="status"></div>
</div>
<!-- custom scrollbar stylesheet -->
<style>
#multi_menu {
	width: 100%;
	height: auto /* 600px */;
	overflow: hidden;
}
/* @keyframes carousel {
from { transform: translate3d(0, 0, 0); }
to { transform: translate3d(-2900px, 0, 0); }
} */
#multi_ul {
	width: 100% /* 5800px */;
	height: auto /* 600px */;
	transform: translate3d(0, 0, 0);
	animation: carousel 90s linear infinite;
}

#multi_ul li {
	display: block;
	float: left;
}

.active_list {
	display: inline-block;
	margin: 13px 0 0 25px;
}

.marquee_select {
	display: inline-block;
	background: #fd54a0;
	color: #FFF;
	padding: 6px 10px;
	border-radius: 5px;
	margin: 0 0 0 5px;
}

.pending_row {
	
}

.switch {
	position: relative;
	display: inline-block;
	width: 50px /* 60px */;
	height: 24px /* 34px */;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 16px /* 26px */;
	width: 16px /* 26px */;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #343690;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

label:before {
	border: 0px solid #ccc;
}

.onoff_btn {
	display: inline-block;
	vertical-align: top;
	padding: 1px 7px 0 0;
	margin: 0;
}
</style>
</head>

<body>
	<input type="hidden" id="sellBillNo">
	<c:url value="/addItemInBillLIst" var="addItemInBillLIst"></c:url>
	<c:url value="/getBillItemList" var="getBillItemList"></c:url>
	<c:url value="/getCustomerList" var="getCustomerList"></c:url>
	<c:url value="/addCustomer" var="addCustomer"></c:url>
	<c:url value="/deleteItem" var="deleteItem"></c:url>
	<c:url value="/genrateSellBill" var="genrateSellBill"></c:url>
	<c:url value="/getItemList" var="getItemList"></c:url>
	<c:url value="/cancelBill" var="cancelBill"></c:url>
	<c:url var="cancelFromHoldBill" value="/cancelFromHoldBill" />
	<c:url var="billOnHold" value="/billOnHold" />
	<c:url var="revertHoldBillOnCurrent" value="/revertHoldBillOnCurrent" />
	<c:url var="getAllItemList" value="/getAllItemList" />
	<c:url var="getSubCatByCatIdAjax" value="/getSubCatByCatIdAjax" />
	<c:url var="submitBill" value="/submitBill" />
	<c:url var="getCustAmts" value="/getCustAmts" />
	<c:url var="getCustCreditBills" value="/getCustCreditBills" />
	<c:url var="getCustBills" value="/getCustBills" />
	<c:url var="getCustBillsTransaction" value="/getCustBillsTransaction" />
	<div style="display: none;">
		<a href="${pageContext.request.contextPath}/newPos" id="relod"></a>
	</div>
	<form action="" method="get">
		<input type="hidden" id="SubCatForSearch" name="SubCatForSearch"
			value="0">

		<!--wrapper-start-->
		<div class="wrapper">

			<header>
				<div class="logo">
					<a href="${pageContext.request.contextPath}/home"><img
						src="${pageContext.request.contextPath}/resources/images/minlogo.png"
						alt="mini_logo"></a>

					<%-- <c:forEach>
						
						</c:forEach> --%>

				</div>


				<!-- top menu -->
				<div class="scroll_center">

					<div id="demo1">
						<div class="snap-scrolling-example">
							<!-- id="examples" -->
							<div id="content-2" class="horizontal-images">

								<div class="multi_menu">
									<ul id="multi_cat_ul" class="multi_cat_ul">
										<li onclick="getSubCat(0);" class="active_cat" id="catLi${0}"
											value="All" id="1"><a href="javascript:void(0);"
											class="scroll_menu" onclick="SlectedCat(this.innerHTML)">All</a></li>

										<c:forEach items="${categoryList}" var="cat" varStatus="count">
											<li class="active_cat" value="${count.index+2}"
												id="catLi${cat.catId}"><a href="javascript:void(0);"
												class="scroll_menu" onclick="getSubCat(${cat.catId})">${cat.catName}</a></li>
										</c:forEach>
									</ul>
								</div>

							</div>
						</div>
					</div>







				</div>



				<div class="drop_menu">


					<span class="top_switch">
						<p class="onoff_btn">
							<i class="fa fa-envelope-o"
								style="color: #fd54a0; font-size: 18px; margin: 2px 0 0 0;">
							</i>
						</p> <label class="switch"> <input type="checkbox"
							name='isSMS' id='isSMS' onchange="SliderAlert()" /> <span
							class="slider round"></span>
					</label>

					</span> <select name="holdBillNo" id="holdBillNo"
						data-placeholder="Select Bill No" class="input_add chosen-select"
						onchange="revertHoldBillOnCurrent()">
						<option value="" disabled="disabled" selected>Select Bill
							No</option>
						<c:forEach items="${holdingList}" var="holdingList">
							<c:choose>
								<c:when test="${holdingList.key==key}">
									<option value="${holdingList.key}" style="text-align: left;"
										selected>${holdingList.value.tempCustomerName}</option>
								</c:when>
								<c:otherwise>
									<option value="${holdingList.key}" style="text-align: left;">${holdingList.value.tempCustomerName}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>

					</select>
				</div>
				<div class="clr"></div>
			</header>





			<section class="main_container">
				<!--right-side-box-->
				<div class="cat_l">

					<div class="left_menus">
						<div class="menu_left">

							<div id="demo">
								<div id="examples" class="snap-scrolling-example">
									<div id="content-1" class="horizontal-images">
										<div class="multi_menu">
											<ul id="multi_ul">

												<li onclick="selectBySubCatId(0);subCatForSrch(0);"
													value="All" class="active" id="subCat${0}"><a
													href="javascript:void(0);" class="scroll_menu"
													onclick="SlectedCat(this.innerHTML)">All</a></li>

												<c:forEach items="${subCatList}" var="subCat"
													varStatus="count">

													<li class="active" id="subCat${subCat.subCatId}"
														onclick="selectBySubCatId(${subCat.subCatId});subCatForSrch(${subCat.subCatId});"
														value="${count.index+2}"><a href="#"
														class="scroll_menu" onclick="SlectedCat(this.innerHTML)">${subCat.subCatName}</a></li>
												</c:forEach>



											</ul>
										</div>
									</div>
								</div>
							</div>





						</div>
						<div class="menu_search">
							<input name="myInput1" id="myInput1" type="text"
								class="input_cat" onkeyup="myFunction1()"
								placeholder="Search Item..." autocomplete="off" />
						</div>
						<div class="clr"></div>
					</div>
					<div class="row">



						<c:choose>
							<c:when test="${calStock==1}">
								<span
									style="padding-top: 0px; float: left; margin-top: 13px; margin-left: 13px; font-size: 16px; display: none;"><p
										class="onoff_btn">Check Stock</p> <i class="fa fa-envelope-o"
									style="color: yellow"> <label class="switch"> <input
											type="checkbox" name='checkStock' id='checkStock'
											onchange="cancelBill(0)" checked="checked" /> <span
											class="slider round"></span>
									</label></i> </span>
							</c:when>
							<c:otherwise>
								<span
									style="padding-top: 0px; float: left; margin-top: 13px; margin-left: 13px; font-size: 16px; display: none;"><p
										class="onoff_btn">Check Stock</p> <i class="fa fa-envelope-o"
									style="color: yellow"> <label class="switch"> <input
											type="checkbox" name='checkStock' id='checkStock'
											onchange="cancelBill(0)" /> <span class="slider round"></span>
									</label></i> </span>
							</c:otherwise>
						</c:choose>

						<div class="active_list" style="display: none;">
							<span class="marquee_select" id="selected_subcat">All</span> <input
								type="hidden" name="hiddenSelectedCatId"
								id="hiddenSelectedCatId" value="0">
						</div>
					</div>

					<!--listing box start here-->
					<div class="cat_list_bx">

						<div class="cat_list">
							<div class="carlist_scrollbars">

								<div class="new_bx">
									<ul id="itemUl">

									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="cat_r">

					<!--top-buttons row-->
					<div>
						<!-- class="pending_row" -->
						<!-- <a href="#" class="pending_btn initialism slide_open">Pending
							Amt : <span>550.00000</span>
						</a> -->

						<!--pending amount popup-->
						<div id="slide" class="pending_pop">
							<button class="slide_close">
								<i class="fa fa-times" aria-hidden="true"></i>
							</button>
							<div style="overflow-x: auto;">
								<table class="pending_tab">
									<tr>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Points</th>
										<th>Points</th>
										<th>Points</th>
									</tr>
									<tr>
										<td>Jill</td>
										<td>Smith</td>
										<td>50</td>
										<td>50</td>
										<td>50</td>
									</tr>
									<tr>
										<td>Jill</td>
										<td>Smith</td>
										<td>50</td>
										<td>50</td>
										<td>50</td>
									</tr>
									<tr>
										<td>Eve</td>
										<td>Jackson</td>
										<td>94</td>
										<td>94</td>
										<td>94</td>
									</tr>
									<tr>
										<td>Adam</td>
										<td>Johnson</td>
										<td>67</td>
										<td>67</td>
										<td>67</td>
									</tr>
									<tr>
										<td>Jill</td>
										<td>Smith</td>
										<td>50</td>
										<td>50</td>
										<td>50</td>
									</tr>
									<tr>
										<td>Jill</td>
										<td>Smith</td>
										<td>50</td>
										<td>50</td>
										<td>50</td>
									</tr>
									<tr>
										<td>Eve</td>
										<td>Jackson</td>
										<td>94</td>
										<td>94</td>
										<td>94</td>
									</tr>
									<tr>
										<td>Adam</td>
										<td>Johnson</td>
										<td>67</td>
										<td>67</td>
										<td>67</td>
									</tr>
									<tr>
										<td>Jill</td>
										<td>Smith</td>
										<td>50</td>
										<td>50</td>
										<td>50</td>
									</tr>
									<tr>
										<td>Jill</td>
										<td>Smith</td>
										<td>50</td>
										<td>50</td>
										<td>50</td>
									</tr>
									<tr>
										<td>Eve</td>
										<td>Jackson</td>
										<td>94</td>
										<td>94</td>
										<td>94</td>
									</tr>
									<tr>
										<td>Adam</td>
										<td>Johnson</td>
										<td>67</td>
										<td>67</td>
										<td>67</td>
									</tr>
									<tr>
										<td>Jill</td>
										<td>Smith</td>
										<td>50</td>
										<td>50</td>
										<td>50</td>
									</tr>


								</table>
							</div>
						</div>
						<script type="text/javascript">
							$(document).ready(function() {
								$('#slide').popup({
									focusdelay : 400,
									outline : true,
									vertical : 'top'
								});
							});
						</script>



						<!--<a href="#" class="pending_btn initialism addcust_open">Advance Amt : <span>550.00000</span></a>-->

						<!--pending amount popup-->
						<div id="addcust" class="add_customer">

							<button class="addcust_close close_popup">
								<i class="fa fa-times" aria-hidden="true"></i>
							</button>
							<h3 class="pop_head">Add Customer</h3>

							<!-- <div class="add_frm">
								<div class="add_frm_one">
									<div class="add_customer_one">Customer Name</div>
									<div class="add_input">
										<input name="custName" id="custName" type="text"
											class="input_add" />
									</div>
									<span id="name_error" style="display: none; color: red"
										class="text-danger">Please Enter Customer Name</span>
									<div class="clr"></div>
								</div>
								<div class="add_frm_one">
									<div class="add_customer_one">Mobile Number</div>
									<div class="add_input">
										<input name="custMob" id="custMob" type="text"
											class="input_add" maxlength="10" minlength="1"
											oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
									</div>
									<span id="mob_error" style="display: none; color: red"
										class="text-danger">Please Enter Mob No</span> <span
										id="mob_error2" style="display: none; color: red"
										class="text-danger">Enter10 Digits </span>
									<div class="clr"></div>
								</div>
								<div class="add_frm_one">
									<div class="add_customer_one">GST NO</div>
									<div class="add_input">
										<input name="custGst" id="custGst" type="text"
											class="input_add" />
									</div>
									<span id="gst_error" style="display: none; color: red"
										class="text-danger">Please Enter Gst No.</span>
									<div class="clr"></div>
								</div>

							</div> -->
							<div class="add_frm">
								<div class="add_frm_one">
									<div class="add_customer_one">Customer Name *</div>
									<div class="add_input">
										<input type="text" class="input_add"
											placeholder="Enter Customer Name" name="customerName"
											onchange="trim(this)" id="customerName" /> <input
											type="hidden" name="custId" id="custIdEdit" value="0" />
									</div>
									<div class="clr"></div>
								</div>



								<div class="add_frm_one" style="display: none;">
									<div class="add_customer_one">Pin Code</div>
									<div class="add_input">

										<input type="text" class="input_add"
											placeholder="Enter Pin Code" value="0" name="pincode"
											id="pincode" onchange="trim(this)" maxlength="6"
											pattern="[0-9]" />
									</div>
									<div class="clr"></div>
								</div>
								<div class="add_frm_one" style="display: none;">
									<div class="add_customer_one">Distance(In Kms)</div>
									<div class="add_input">
										<input placeholder="Enter distance in kms" name="kms" id="kms"
											value="0" onchange="trim(this)" type="text" class="input_add" />
									</div>
									<div class="clr"></div>
								</div>

								<div class="add_frm_one">
									<div class="add_customer_one">Mobile Number *</div>
									<div class="add_input">
										<input type="text" class="input_add"
											placeholder="Enter Mobile Number" name="mobileNo"
											id="mobileNo" onchange="trim(this)" maxlength="10"
											oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
									</div>
									<div class="clr"></div>
								</div>

								<div class="add_frm_one">
									<div class="add_customer_one">Gender *</div>
									<div class="add_input">
										<div class="radio_row popup_radio">
											<ul>
												<li><input type="radio" type="radio" name="gender"
													id="moption" checked value="1"> <label
													for="moption">M</label>
													<div class="check"></div></li>
												<li><input type="radio" id="foption" name="gender"
													value="2"> <label for="foption">F </label>
													<div class="check">
														<div class="inside"></div>
													</div></li>
											</ul>
										</div>
									</div>
									<div class="clr"></div>
								</div>
								<div class="add_frm_one" style="display: none;">
									<div class="add_customer_one">Type</div>
									<div class="add_input">
										<select name="custType" id="custType"
											data-placeholder="Customer Type" class="input_add"
											style="text-align: left; font-size: 16px;" required>
											<option value="0" style="text-align: left;">Select
												Customer Type</option>
											<option value="1">Owner</option>
											<option value="2">Employee</option>
											<option value="3" selected="selected">Customer</option>
										</select>
									</div>
								</div>
								<div class="add_frm_one">
									<div class="add_customer_one">Age-Group *</div>
									<div class="add_input">
										<select name="ageRange" id="ageRange"
											data-placeholder="Customer Age-Group" class="input_add"
											style="text-align: left; font-size: 16px;" required>
											<option value="0" style="text-align: left;">Customer
												Age-Group</option>
											<option value="14-21">14-21 Years</option>
											<option value="22-28">22-28 Years</option>
											<option value="29-35">29-35 Years</option>
											<option value="36-42">36-42 Years</option>
											<option value="43-49">43-49 Years</option>
											<option value="50-56">50-56 Years</option>
											<option value="57 & above">57 & above</option>

										</select>
									</div>
								</div>
								<div class="add_frm_one">
									<div class="add_customer_one">DOB</div>
									<div class="add_input">
										<input autocomplete="off" placeholder="Date Of Birth"
											name="dateOfBirth" id="dateOfBirth" type="date"
											class="input_add" />
									</div>
									<div class="clr"></div>
								</div>
								<div class="add_frm_one">
									<div class="add_customer_one">Business</div>
									<div class="add_input">
										<div class="radio_row popup_radio">
											<ul>
												<li><input type="radio" type="radio" name="selector"
													id="y-option" onclick="isBuissness(1)"> <label
													for="y-option">Yes</label>
													<div class="check"></div></li>
												<li><input type="radio" id="n-option" name="selector"
													onclick="isBuissness(0)" checked> <label
													for="n-option">No </label>
													<div class="check">
														<div class="inside"></div>
													</div></li>
											</ul>
										</div>
									</div>
									<div class="clr"></div>
								</div>
								<div style="display: none;" id="isbuissnessdiv">
									<div class="add_frm_one">
										<div class="add_customer_one">Company Name *</div>
										<div class="add_input">
											<input placeholder="Enter Company Name" name="companyName"
												onchange="trim(this)" id="companyName" type="text"
												class="input_add" />
										</div>
										<div class="clr"></div>
									</div>

									<div class="add_frm_one">
										<div class="add_customer_one">Address</div>
										<div class="add_input">
											<input placeholder="Enter Address" name="custAdd"
												id="custAdd" onchange="trim(this)" type="text"
												class="input_add" />
										</div>
										<div class="clr"></div>
									</div>

									<div class="add_frm_one">
										<div class="add_customer_one">GST Number *</div>
										<div class="add_input">
											<input placeholder="Enter GST Number" name="gstNo" id="gstNo"
												onchange="trim(this)" type="text" maxlength="15"
												class="input_add" />
										</div>
										<div class="clr"></div>
									</div>

								</div>

								<div class="add_frm_one">
									<div class="add_customer_one">Remark</div>
									<div class="add_input">

										<input type="text" class="input_add"
											placeholder="Enter Remark" name="remark" id="remark"
											onchange="trim(this)" />
									</div>
									<div class="clr"></div>
								</div>

							</div>
							<div class="pop_btns">
								<div class="close_l">
									<button class="addcust_close close_btn" id="clsAddCust">Close</button>
								</div>
								<div class="close_r" id="saveBtn">
									<a href="#" onclick="addCust()">Save</a>
								</div>
								<div class="clr"></div>
							</div>

							<!--<button class="slide_close"><i class="fa fa-times" aria-hidden="true"></i></button>-->
						</div>
						<script type="text/javascript">
							$(document).ready(function() {
								$('#addcust').popup({
									focusdelay : 400,
									outline : true,
									vertical : 'top'
								});
							});
						</script>


						<!-- <a href="#" class="pending_btn">Total Amt : <span>550.00000</span></a> -->
					</div>

					<!--customer drop down here-->
					<div class="add_customer_bx">
						<!--customer row 1-->
						<div class="pending_row">
							<a href="#" class="    pending_btn"
								onclick="openMyModal('myModalForCredit',0)">Pending Amt : <span
								id="credAmt">00.00</span>
							</a><a href="#" class="pending_btn"
								onclick="openMyModal('custBills',1)">Customer Bills </a> <a
								href="#" class="pending_btn"
								onclick="openMyModal('custBills',2)">Today's Bills <span
								id="credAmt1"></span>
							</a>

							<c:if test="${advanceAmt>0}">
								<label id="advBillLable">Advance Amt : <span
									id="advAmt1">${advanceAmt}</span>
								</label>
							</c:if>
							<input type="hidden" id="advAmt" name="advAmt"
								value="${advanceAmt}"> <input type="hidden"
								id="advOrderDate" name="advOrderDate" value="${advOrderDate}">
							<input type="hidden" id="isAdvanceOrder" name="isAdvanceOrder"
								value="${isAdvanceOrder}">
						</div>
						<div class="customer_row">
							<div class="customer_one">Customer</div>
							<div class="customer_two small_size">
								<%-- <input name="selectCust" list="templates" id="selectCust"
									type="text" class="input_add" placeholder="Add Customer"
									value="${holdBill.tempCustomerName}"
									onchange="getCustInfo(this.value)" /> <span
									id="error_customer" style="display: none; color: red">Please
									Select Customer</span>

								<datalist id="templates">

								</datalist> --%>

								<select name="custId" id="custId"
									data-placeholder="Select Bill No" style="width: 100%%;"
									class="input_add chosen-select" onchange="setCustAmt()">
									<option value="0">Select Customer</option>

									<c:choose>
										<c:when test="${key>0}">
											<c:forEach items="${customerList}" var="customerList">
												<c:choose>
													<c:when test="${customerList.custId==holdBill.custId}">
														<option value="${customerList.custId}"
															style="text-align: left;" selected>${customerList.custName}
															&nbsp;${customerList.phoneNumber}</option>
													</c:when>
													<c:otherwise>
														<option value="${customerList.custId}"
															style="text-align: left;">${customerList.custName}
															&nbsp;${customerList.phoneNumber}</option>
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</c:when>
										<c:when test="${tempCust>0}">
											<c:forEach items="${customerList}" var="customerList">
												<c:choose>
													<c:when test="${customerList.custId==tempCust}">
														<option value="${customerList.custId}"
															style="text-align: left;" selected>${customerList.custName}
															&nbsp;${customerList.phoneNumber}</option>
													</c:when>
													<c:otherwise>
														<option value="${customerList.custId}"
															style="text-align: left;">${customerList.custName}
															&nbsp;${customerList.phoneNumber}</option>
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach items="${customerList}" var="customerList">
												<c:choose>
													<c:when test="${customerList.custId==defaultCustomer}">
														<option value="${customerList.custId}"
															style="text-align: left;" selected>${customerList.custName}
															&nbsp;${customerList.phoneNumber}</option>
													</c:when>
													<c:otherwise>
														<option value="${customerList.custId}"
															style="text-align: left;">${customerList.custName}
															&nbsp;${customerList.phoneNumber}</option>
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</c:otherwise>
									</c:choose>


								</select>
							</div>
							<div class="customer_three increase_size">
								<button class="plus_btn addcust_open">
									<i class="fa fa-plus" aria-hidden="true"></i>
								</button>
							</div>
							<input id="key" name="key" value="${key}" type="hidden"><input
								name="popupType" id="popupType" type="hidden" value="0" />
							<div class="clr"></div>
						</div>

					</div>
					<c:set var="totalItemCount" value="0"></c:set>
					<c:set var="totalTaxableAmt" value="0"></c:set>
					<c:set var="totalTaxAmt" value="0"></c:set>
					<c:set var="totalAmt" value="0"></c:set>
					<!--product table-->
					<div class="total_table_one">
						<div class="scrollbars">

							<div>
								<table id="itemTable">
									<thead>
										<tr>
											<th style="text-align: center;" width="2%">Sr</th>
											<th style="text-align: center;">Product</th>
											<th style="text-align: center;" width="10%">Qty</th>
											<th style="text-align: center;" width="13%">Price</th>
											<th style="text-align: center;" width="13%">Total</th>
											<th style="text-align: center;" width="2%">Del</th>
										</tr>
									</thead>
									<tbody>


										<c:forEach items="${holdBill.itemBillList}" var="itemList"
											varStatus="count">
											<c:set var="totalItemCount" value="${totalItemCount+1}"></c:set>
											<tr>
												<td>${count.index+1}</td>
												<td style=""><div
														style="width: 100%; white-space: normal;">${itemList.itemName}</div></td>
												<td style="text-align: right;"
													onclick="opnItemPopup('${itemList.itemId}','${itemList.itemName}','${itemList.catId}','${itemList.aviableQty}','${itemList.itemTax}','${itemList.itemTax}','${itemList.itemMrp}','${itemList.itemUom}',0)">

													${itemList.itemQty}</td>
												<td style="text-align: right;"><fmt:formatNumber
														type="number" groupingUsed="false"
														value="${itemList.itemMrp}" maxFractionDigits="2"
														minFractionDigits="2" /></td>
												<td style="text-align: right;"><fmt:formatNumber
														type="number" groupingUsed="false"
														value="${itemList.calPrice}" maxFractionDigits="2"
														minFractionDigits="2" /></td>
												<td style="text-align: center;"><a href="#"
													title="Delete" onclick="deleteItem(${itemList.itemId})"><i
														class="fa fa-trash"></i></a></td>
											</tr>
											<c:set var="totalTaxableAmt"
												value="${totalTaxableAmt+itemList.payableAmt}"></c:set>
											<c:set var="totalTaxAmt"
												value="${totalTaxAmt+itemList.payableTax}"></c:set>
											<c:set var="totalAmt" value="${totalAmt+itemList.payableAmt}"></c:set>
										</c:forEach>

									</tbody>


								</table>
							</div>
							<div>
								<span style="display: none; color: red" id="empty_itemList">*Select
									Atleast One Item To Genrate Bill!!!!</span>
							</div>
						</div>
					</div>
					<script>
						$(document).ready(function() {
							$('.scrollbars').ClassyScroll();
						});
					</script>

					<!--total-table start here-->
					<div class="total_tab">
						<table width="100%">
							<tr bgcolor="#ffe5e6">
								<td>Total Items :</td>
								<td id="totalCnt">${totalItemCount}</td>
								<td>Total :</td>
								<td align="right" style="text-align: right;" id="totalAmt"><fmt:formatNumber
										type="number" groupingUsed="false" value="${totalTaxableAmt}"
										maxFractionDigits="2" minFractionDigits="2" /></td>
							</tr>
							<tr bgcolor="#ffe5e6" style="border-top: 1px solid #f4f4f4;">
								<td>Discount :</td>
								<td>(0.00) 0.00</td>
								<td>Order Tax :</td>
								<td align="right" style="text-align: right;" id="totalTax"><fmt:formatNumber
										type="number" groupingUsed="false" value="${totalTaxAmt}"
										maxFractionDigits="2" minFractionDigits="2" /></td>
							</tr>
							<tr bgcolor="#fefcd5" style="border-top: 1px solid #f4f4f4;">
								<td style="font-weight: 600;">Total Payable :</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td style="font-weight: 600; text-align: right;" align="right"
									id="finalAmount"><fmt:formatNumber type="number"
										groupingUsed="false" value="${totalAmt+totalTaxAmt}"
										maxFractionDigits="2" minFractionDigits="2" /></td>
							</tr>
						</table>
					</div>


					<!--five button here-->
					<div class="buttons_row">
						<div class="button_one">
							<a href="#" class="hold hold_btn" onclick="billOnHold()">Hold</a>
							<a href="#" class="hold can_btn"
								onclick="cancelFromHoldBill(${key})">Cancel Hold Bill</a>
							<!-- onclick="cancelBill(1)" -->
						</div>
						<div class="button_one">
							<button id="payment1"
								class="hold print_btn   initialism payment_open"
								style="display: none;">Payment</button>
							<a href="#" class="hold print_btn  initialism  "
								onclick="openPaymentPopup()">Payment Option</a>
							<!-- 	<a href="#" class="hold print_btn"  >Print Order</a>  -->
							<!-- <button  id="payment1" class="hold bill_btn   "  style="display: none;">Print Bill</button> -->
							<a href="#" class="hold bill_btn" onclick="submitBill(2)">Print
								GST Bill</a>
						</div>
						<div class="button_two">
							<!-- 	<button  id="payment1" class="hold pay_btn  initialism payment_open"  style="display: none;">Payment</button>
							<a href="#"   class="hold pay_btn  initialism " onclick="paymentClick()">Payment</a> -->
							<a href="#" class="hold pay_btn  initialism "
								onclick="submitBill(10)">Bill</a>
						</div>

					</div>

					<div class="text_count">
						Paid Amount :
						<p>0.00</p>
						<span>Return Amount :
							<p>0.00</p>
						</span>
					</div>


				</div>
				<div id="overlay2">
					<div id="text2">
						<img
							src="${pageContext.request.contextPath}/resources/newpos/images/loader.gif"
							alt="madhvi_logo">
					</div>
				</div>
				<script>
					$(document).ready(function() {
						$('.carlist_scrollbars').ClassyScroll();
					});
				</script>

			</section>

		</div>

		<div id="quantity" class="category_popup">
			<h3 class="pop_head">Quantity</h3>

			<div class="add_frm">

				<div class="add_row">
					<div class="add_row_l">
						<span class="add_txt">Kg wise</span> <input name="" type="text"
							class="input_add" />
					</div>
					<div class="add_row_r">
						<span class="add_txt">Rate wise</span> <input name="" type="text"
							class="input_add" />
					</div>
					<div class="clr"></div>
				</div>

				<div class="add_row add_row_marg">
					<div class="add_row_l">
						<span class="add_txt">Kg wise : 1</span>
					</div>
					<div class="add_row_r">
						<span class="add_txt">Rate wise : 100.00</span>
					</div>
					<div class="clr"></div>
				</div>

			</div>

			<div class="pop_btns">
				<div class="close_l">
					<button class="quantity_close close_btn">Close</button>
				</div>
				<div class="close_r">
					<a href="#">Save</a>
				</div>
				<div class="clr"></div>
			</div>

			<!--<button class="slide_close"><i class="fa fa-times" aria-hidden="true"></i></button>-->
		</div>
		<div id="payment" class="add_customer">
			<input type="hidden" id="hiddenCustName" name="hiddenCustName">
			<input type="hidden" id="hiddenCustMob" name="hiddenCustMob">


			<h3 class="pop_head">Payment</h3>

			<%-- <div class="add_frm">
				<div class="add_customer_one">Discount %</div>
				<div class="add_input" id="discountPopup">
					<input type="text" name="discPer" id="discPer" step="0.01"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
						onchange="itemDiscPerCalculation(1)"
						onkeyup="itemDiscPerCalculation(1)" class="form-control" value="0"
						placeholder="Disc %"
						style="text-align: center; width: 90px; border-radius: 20px;" />
					<label for="discAmtLabel"
						style="font-weight: 700; padding-left: 5px;">&nbsp;Disc
						Amt&nbsp;</label> <input type="text" name="discAmt" id="discAmt"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
						onchange="itemDiscPerCalculation(2)"
						onkeyup="itemDiscPerCalculation(2)" class="form-control"
						value="${discAmt}" placeholder="Disc Amt"
						style="text-align: center; width: 90px; border-radius: 20px;" />
				</div>


				<div class="clr"></div>
				<div class="add_frm_one">
					<div class="add_customer_one">Type</div>
					<div class="add_input">

						<div class="dropdown popup_drop">
							<div class="select">
								<span>Cash</span>
							</div>
							<input type="hidden" name="payMode" id="payMode" value="1">

							<ul class="dropdown-menu">
								<li id="1">Cash</li>
								<li id="2">Card</li>
								<li id="3">E-pay</li>
							</ul>
						</div>

					</div>
					<span id="payMode_error" style="display: none; color: red">Please
						Select Payment Mode</span>
					<div class="clr"></div>
				</div>
				<div class="add_frm_one">
					<div class="add_customer_one">Amount</div>
					<div class="add_input">
						<input
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
							name="pAmt" id="pAmt" type="text" class="input_add"
							disabled="disabled" />
					</div>
					<div class="clr"></div>
				</div>


				<label style="font-weight: 700; padding-left: 5px;">Paid&nbsp;</label>
				<input type="text" name="paidAmt" id="paidAmt"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
					onchange="amtReturnCal()" onkeyup="amtReturnCal()"
					class="form-control" value="" placeholder="Amount"
					style="text-align: center; width: 90px; border-radius: 20px;" />



				&nbsp;&nbsp; <label style="font-weight: 700; padding-left: 5px;">Return&nbsp;</label>
				<input type="text" name="rAmt" id="rAmt" readonly="readonly"
					class="form-control" value="" placeholder="Amount"
					style="text-align: center; width: 90px; border-radius: 20px;" /> <span
					id="paidAmt_error" style="display: none; color: red">Please
					Enter Paid Amount</span>

			</div>



			<div class="pop_btns">
				<div class="close_l">
					<button class="payment_close close_btn" id="closePay">Close</button>
					&nbsp;
					<button class="payment_close close_btn" onclick="printAndSubmit()"
						href="#">Print & Submit</button>
				</div>
				<div class="close_l"></div>
				<div class="close_r">
					<a onclick="submitPayment()" href="#">Submit</a>
				</div>
				<div class="clr"></div>
			</div> --%>

			<div class="add_frm">


				<div class="add_frm_one">
					<div class="add_customer_one">Total AMT</div>
					<div class="add_input" id="totalAmtPopup">
						<%-- <fmt:formatNumber type="number" groupingUsed="false"
							value="${totalAmt-advanceAmt}" maxFractionDigits="2"
							minFractionDigits="2" /> --%>
						<fmt:formatNumber type="number" groupingUsed="false"
							value="${totalAmt}" maxFractionDigits="2" minFractionDigits="2" />

					</div>
					<div class="clr"></div>
				</div>


				<%-- <div class="add_frm_one">
					<div class="add_customer_one">Advance AMT</div>
					<div class="add_input" id="advAmtPopup">
						<fmt:formatNumber type="number" groupingUsed="false"
							value="${advanceAmt}" maxFractionDigits="2" minFractionDigits="2" />
					</div>
					<div class="clr"></div>
				</div> --%>

				<div class="add_frm_one">
					<div class="add_customer_one">Discount %</div>
					<div class="add_input" id="discountPopup">
						<input type="text" name="discPer" id="discPer" step="0.01"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
							onchange="itemDiscPerCalculation(1)"
							onkeyup="itemDiscPerCalculation(1)" class="form-control"
							value="0" placeholder="Disc %"
							style="text-align: center; width: 90px; border-radius: 20px;" />
						<label for="discAmtLabel"
							style="font-weight: 700; padding-left: 5px;">&nbsp;Disc
							Amt&nbsp;</label> <input type="text" name="discAmt" id="discAmt"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
							onchange="itemDiscPerCalculation(2)"
							onkeyup="itemDiscPerCalculation(2)" class="form-control"
							value="0" placeholder="Disc Amt"
							style="text-align: center; width: 90px; border-radius: 20px;" />
					</div>
					<div class="clr"></div>
				</div>
				<div class="add_frm_one">
					<div class="add_customer_one">Total Payable</div>
					<div class="add_input" id="totalPayableAmt">
						<fmt:formatNumber type="number" groupingUsed="false"
							value="${totalAmt-advanceAmt}" maxFractionDigits="2"
							minFractionDigits="2" />
					</div>
					<div class="clr"></div>
				</div>
				<div class="add_frm_one">
					<div class="add_customer_one">Credit Bill</div>
					<div class="add_input">
						<div class="radio_row popup_radio">
							<ul>
								<li><input type="radio" id="creditBillyes"
									name="creditBill" onclick="modeOfPayDivHideShow(1)"> <label
									for="creditBillyes">Yes</label>
									<div class="check"></div></li>
								<li><input type="radio" id="creditBillno" name="creditBill"
									checked onclick="modeOfPayDivHideShow(2)"> <label
									for="creditBillno">No </label>
									<div class="check">
										<div class="inside"></div>
									</div></li>
							</ul>
						</div>
					</div>
					<div class="clr"></div>
				</div>
				<div id="modeOfPayDiv">

					<div class="add_frm_one">
						<div class="add_customer_one">Mode of Pay</div>
						<div class="add_input">
							<div class="radio_row popup_radio">
								<ul>
									<li><input type="radio" id="single" name="modePay"
										onclick="changeSplitSingle(1)" checked> <label
										for="single">Single</label>
										<div class="check"></div></li>
									<li style="display: none;"><input type="radio" id="split"
										name="modePay" onclick="changeSplitSingle(2)"> <label
										for="split">Split </label>
										<div class="check">
											<div class="inside"></div>
										</div></li>
								</ul>
							</div>
						</div>
						<div class="clr"></div>
					</div>
					<div id="splitDiv" style="display: none;">
						<div class="add_frm_one">
							<div class="add_customer_one">Cash</div>
							<div class="add_input">
								<div class="radio_row popup_radio">
									<ul>
										<li>
											<!-- <input type="checkbox" id="cashCheck"
											name="cashCheck" checked> &nbsp;  --> <input type="text"
											id="cashAmt" name="cashAmt" class=" input_add numberOnly"
											oninput="matchSplitAmt(1)" onchange="matchSplitAmt(1)"
											style="font-size: 16px;" placeholder="Cash Amount" value="0">
										</li>
									</ul>
								</div>
							</div>
							<div class="clr"></div>
						</div>

						<div class="add_frm_one">
							<div class="add_customer_one">Card</div>
							<div class="add_input">
								<div class="radio_row popup_radio">
									<ul style="padding-left: 5px;">
										<li>
											<!-- <input type="checkbox" id="cardCheck"
											name="cardCheck"> &nbsp;  --> <input type="text" id="cardAmt"
											name="cardAmt" class=" input_add numberOnly"
											placeholder="Card Amount" value="0" style="font-size: 16px;"
											oninput="matchSplitAmt(2)" onchange="matchSplitAmt(2)">
										</li>
										<li style="padding-left: 5px;"><select
											name="cardTypeSplit" id="cardTypeSplit"
											data-placeholder="Card Type" class="input_add "
											style="text-align: left; font-size: 16px;">
												<option value="" style="text-align: left;">Select
													Card</option>

												<option value="4" style="text-align: left;">Debit
													Card</option>
												<option value="5" style="text-align: left;">Credit
													Card</option>
										</select></li>
									</ul>
								</div>
							</div>
							<div class="clr"></div>
						</div>

						<div class="add_frm_one">
							<div class="add_customer_one">E-Pay</div>
							<div class="add_input">
								<div class="radio_row popup_radio">
									<ul>
										<li>
											<!-- <input type="checkbox" id="epayCheck"
											name="epayCheck"> &nbsp;  --> <input type="text" id="epayAmt"
											name="epayAmt" class="input_add numberOnly"
											placeholder="E-Pay Ammount" value="0"
											style="font-size: 16px;" oninput="matchSplitAmt(3)"
											onchange="matchSplitAmt(3)">
										</li>
										<li style="padding-left: 5px;"><select
											name="ePayTypeSplit" id="ePayTypeSplit"
											data-placeholder="E-Pay Type" class="input_add "
											style="text-align: left; font-size: 16px;">
												<option value="">E-Pay Type</option>

												<option value="7" style="text-align: left;">Paytm</option>

												<option value="8" style="text-align: left;">Google
													Pay</option>
												<option value="6" style="text-align: left;">Bank
													Transaction</option>
												<option value="9" style="text-align: left;">Amazon
													Pay</option>
										</select></li>

									</ul>
								</div>
							</div>

						</div>
						<div class="add_frm_one">
							<div class="add_customer_one" id="epayLabel"></div>
						</div>

						<div class="clr"></div>
					</div>

					<div id="singleDiv">
						<div class="add_frm_one">
							<div class="add_customer_one">Type</div>
							<div class="add_input">
								<select name="billType" id="billType" data-placeholder="Type"
									onchange="onPayTypeChange(this.value)" class="input_add "
									style="text-align: left; font-size: 16px;">
									<option value="1" style="text-align: left;" selected>Cash</option>
									<option value="2" style="text-align: left;">Card</option>
									<option value="3" style="text-align: left;">E-Pay</option>
								</select>
								<!-- <div class="dropdown popup_drop">
									<div class="select">
										<span>Payment Mode</span>
									</div>

									<ul class="dropdown-menu">
										<li id="male">Cash</li>
										<li id="female">Card</li>
										<li id="female">E-pay</li>
									</ul>
								</div> -->

							</div>
							<div class="clr"></div>
						</div>
						<div class="add_frm_one" id="cardTypeDiv" style="display: none;">
							<div class="add_customer_one">Card Type</div>
							<div class="add_input">
								<select name="cardType" id="cardType"
									data-placeholder="Card Type" class="input_add "
									style="text-align: left; font-size: 16px;">
									<option value="" style="text-align: left;">Select Card</option>

									<option value="4" style="text-align: left;">Debit Card</option>
									<option value="5" style="text-align: left;">Credit
										Card</option>
								</select>

							</div>
							<div class="clr"></div>
						</div>
						<div class="add_frm_one" id="epayTypeDiv" style="display: none;">
							<div class="add_customer_one">E-Pay Type</div>
							<div class="add_input">
								<select name="ePayType" id="ePayType"
									data-placeholder="E-Pay Type" class="input_add "
									style="text-align: left; font-size: 16px;">
									<option value="">Select E-Pay Type</option>
									<option value="7" style="text-align: left;">Paytm</option>
									<option value="8" style="text-align: left;">Google Pay</option>
									<option value="6" style="text-align: left;">Bank
										Transaction</option>

									<option value="9" style="text-align: left;">Amazon Pay</option>
								</select>
							</div>
							<div class="clr"></div>
						</div>

						<div class="add_frm_one">
							<div class="add_customer_one">Remark</div>
							<div class="add_input">
								<input name="payRemark" id="payRemark" type="text"
									class="input_add " style="font-size: 100%;"
									placeholder="Enter Remark" value="" />
							</div>
							<div class="clr"></div>
						</div>

						<div class="add_frm_one">
							<div class="add_customer_one">Amount</div>
							<div class="add_input">
								<input name="payAmt" id="payAmt" type="text"
									class="input_add numberOnly" placeholder="Enter Amount"
									readonly="readonly" value="${totalAmt-advanceAmt}"
									style="background-color: lightgrey; font-size: 16px;" />
							</div>
							<div class="clr"></div>
						</div>


						<div class="add_frm_one">
							<div class="add_customer_one"></div>
							<div class="add_input">

								<label style="font-weight: 700; padding-left: 5px;">Paid&nbsp;</label>
								<input type="text" name="pAmt" id="pAmt"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
									onchange="amtReturnCal()" onkeyup="amtReturnCal()"
									class="form-control" value="" placeholder="Amount"
									style="text-align: center; width: 90px; border-radius: 20px;" />


								&nbsp;&nbsp; <label style="font-weight: 700; padding-left: 5px;">Return&nbsp;</label>
								<input type="text" name="rAmt" id="rAmt" readonly="readonly"
									class="form-control" value="" placeholder="Amount"
									style="text-align: center; width: 90px; border-radius: 20px;" />



							</div>
							<div class="clr"></div>
						</div>

					</div>
					<!-- <div class="add_frm_one">
						<div class="add_customer_one">Amount</div>
						<div class="add_input">
							<input name="" type="text" class="input_add" />
						</div>
						<div class="clr"></div>
					</div> -->
				</div>
			</div>
			<div class="pop_btns">
				<div class="close_l">
					<button class="payment_close close_btn">Close</button>
				</div>

				<div class="close_r">
					<a href="#" onclick="submitBillByPaymentOption(2)">GST Bill</a>
					&nbsp;<a href="#" onclick="submitBillByPaymentOption(1)">KOT</a>
				</div>
				<div class="clr"></div>
			</div>

		</div>
		<div id="addcust1" class="add_customer calcy">
			<input type="hidden" name="itemNameHidden" id="itemNameHidden">
			<input type="hidden" name="itemUomHidden" id="itemUomHidden">
			<input type="hidden" name="itemIdHidden" id="itemIdHidden"> <input
				type="hidden" name="itemTaxHidden" id="itemTaxHidden"> <input
				type="hidden" name="itemMrp" id="itemMrp"> <input
				type="hidden" name="itemCatId" id="itemCatId"> <input
				type="hidden" name="itemTax1Hidden" id="itemTax1Hidden"> <input
				type="hidden" name="itemTax2Hidden" id="itemTax2Hidden"> <input
				type="hidden" name="aviableQty" id="aviableQty">






			<div class="calcy_bx">
				<div class="calcy_1">
					<div class="calculator_bx">
						<div class="cal_quan">
							<div class="qty_l">QTY</div>
							<div class="qty_m">
								<!-- onkeyup="checkAviableQty(1)" -->
								<input type="text" class="qty_one numberOnly" placeholder="QTY"
									value="1" name="enterQty" id="enterQty">
							</div>
							<div class="qty_r">
								<button type="submit" class="go_btn" onclick="calPad(1,10)"></button>
							</div>
							<div class="clr"></div>
						</div>

						<div class="calc_no">
							<div class="calc_no_l">
								<ul>
									<li><a href="#" onclick="calPad(1,7)">7</a></li>
									<li><a href="#" onclick="calPad(1,8)">8</a></li>
									<li><a href="#" onclick="calPad(1,9)">9</a></li>
									<li><a href="#" onclick="calPad(1,4)">4</a></li>
									<li><a href="#" onclick="calPad(1,5)">5</a></li>
									<li><a href="#" onclick="calPad(1,6)">6</a></li>
									<li><a href="#" onclick="calPad(1,1)">1</a></li>
									<li><a href="#" onclick="calPad(1,2)">2</a></li>
									<li><a href="#" onclick="calPad(1,3)">3</a></li>
									<li><a href="#" onclick="calPad(1,0)">0</a></li>
									<li style="visibility: hidden;"><a href="#">.</a></li>
									<li><a href="#" onclick="calPad(1,10)"><img
											src="${pageContext.request.contextPath}/resources/newpos/images/next_arrow_one.png"
											alt="next_arrow_one"> </a></li>
								</ul>
							</div>
							<div class="calc_no_r">
								<!-- <a href="#" onclick="addItem(1)" > -->
								<a href="#" onclick="checkAviableQty(1)"><img
									src="${pageContext.request.contextPath}/resources/newpos/images/right_arrow_one.png"
									alt="right_arrow_one"></a>
							</div>
							<div class="clr"></div>
						</div>

					</div>
				</div>
				<%-- <div class="calcy_2">
																<div class="calculator_bx">
																	<div class="cal_quan">
																		<div class="qty_l">AMT</div>
																		<div class="qty_m">
																			<input type="text" class="qty_one">
																		</div>
																		<div class="qty_r">
																			<button type="submit" class="go_btn"></button>
																		</div>
																		<div class="clr"></div>
																	</div>

																	<div class="calc_no">
																		<div class="calc_no_l">
																			<ul>
																				<li><a href="#">7</a></li>
																				<li><a href="#">8</a></li>
																				<li><a href="#">9</a></li>
																				<li><a href="#">4</a></li>
																				<li><a href="#">5</a></li>
																				<li><a href="#">6</a></li>
																				<li><a href="#">1</a></li>
																				<li><a href="#">2</a></li>
																				<li><a href="#">3</a></li>
																				<li><a href="#">0</a></li>
																				<li><a href="#">.</a></li>
																				<li><a href="#"><img
																						src="${pageContext.request.contextPath}/resources/newpos/images/next_arrow_one.png"
																						alt="next_arrow_one"> </a></li>
																			</ul>
																		</div>
																		<div class="calc_no_r">
																			<a href="#"><img
																				src="${pageContext.request.contextPath}/resources/newpos/images/right_arrow_one.png"
																				alt="right_arrow_one"></a>
																		</div>
																		<div class="clr"></div>
																	</div>

																</div>
															</div> --%>
				<div class="clr"></div>
			</div>


			<div class="pop_btns">
				<div class="close_l">
					<button class="addcust1_close close_btn" id="closeAddcust">Close</button>
				</div>
				<div class="close_r">
					<a href="#" onclick="checkAviableQty(1)">Submit</a>
				</div>
				<div class="clr"></div>
			</div>

		</div>

	</form>

	<div id="custBills" class="add_customer">
		<div id="overlay">
			<div class="clock"></div>
		</div>

		<div class="modal-content" style="width: 90%">
			<span class="close" onclick="closeMyModal('custBills')">&times;</span>

			<form name="modalfrm" id="modalfrm" method="post">
				<p>Bill List</p>
				<div class="clr"></div>
				<div>


					<div id="dateCust" style="display: none;">
						<div class="add_frm_one">
							<div class="add_customer_one"
								style="width: 40% ! important; float: left!importan!">
								Customer Name:<span style="color: red; width: 80%"
									id="custName1"></span>
							</div>
						</div>

					</div>
					<div id="dateDiv" style="display: none;">
						<div class="add_frm_one">
							<%-- <div class="add_customer_one"
								style="width: 40% ! important; float: left!importan!; display: none;">
								Date:<span style="color: red; width: 80%" id="date1">&nbsp;&nbsp;${date1}</span>
							</div> --%>

							<div class="add_customer_one"
								style="width: 40% ! important; float: left!importan!">
								Date:<span style="color: red; width: 80%">&nbsp;&nbsp;<input
									autocomplete="off" placeholder="Date" name="dt" id="dt"
									type="date" class="input_add" value="${date2}"
									onChange="fetchRecord()" style="width: 200px;" /></span><input
									type="hidden" id="todaysDate" value="${date2}"
									style="display: none;">
							</div>





						</div>
					</div>

				</div>
				<div id="modeOfPayDiv1">

					<div class="add_frm_one">

						<div class="add_input">
							<div class="radio_row popup_radio">
								<ul>
									<li><input type="radio" id="single12" name="modePay1"
										value="1" onclick="getCustBills(1)" checked="checked">
										<label for="single12">Bills</label>
										<div class="check"></div></li>
									<li><input type="radio" id="split12" name="modePay1"
										value="3" onclick="getCustBills(3)"> <label
										for="split12">Transaction </label>
										<div class="check">
											<div class="inside"></div>
										</div></li>

									<li><input type="radio" id="single22" name="modePay1"
										value="2" onclick="getCustBills(2)"> <label
										for="single22">Pending</label>
										<div class="check"></div></li>

									<li id="deletedBillsRadio" style="display: none;"><input
										type="radio" id="deleted12" name="modePay1" value="2"
										onclick="getCustBills(4)"> <label for="deleted12">Deleted
											Bills</label>
										<div class="check"></div></li>

									<li id="allDeletedBillsRadio" style="display: none;"><input
										type="radio" id="deleted13" name="modePay1" value="2"
										onclick="getCustBills(5)"> <label for="deleted13">Deleted
											Bills</label>
										<div class="check"></div></li>
								</ul>
							</div>
						</div>
						<div class="clr"></div>
					</div>
				</div>

				<div class="total_table_one" id="printDivid">
					<div class="scrollbars" id="scrollbarsmodaldiv">
						<table id="custTable">

							<thead>
								<tr>

									<th style="text-align: center;" width="2%">Sr</th>
									<th style="text-align: center;">Bill No</th>
									<th style="text-align: center;" id="billDateLabel">Bill
										Date</th>
									<th style="text-align: center;" width="10%">Bill Amt</th>
									<th style="text-align: center;" width="10%" id="discTh">Disc
										Amt</th>
									<th style="text-align: center;" width="10%" id="payableTh">Payable
										Amt</th>
									<th style="text-align: center;" width="13%">Paid Amt</th>
									<th style="text-align: center;" width="13%">Pending Amt</th>
									<th style="text-align: center;" width="2%" id="modeofpay">Mode
										of Payment</th>
									<th style="text-align: center;" width="2%" id="remarkTh">Remark</th>
									<th style="text-align: center;" width="2%" id="trAction">Action</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>

			</form>
		</div>


	</div>

	<div id="myModalForCredit" class="add_customer">
		<div id="overlay">
			<div class="clock"></div>
		</div>

		<div class="modal-content" style="width: 75%">
			<span class="close" onclick="closeMyModal('myModalForCredit')">&times;</span>

			<form name="modalfrm1" id="modalfrm1" method="post">
				<p>Customer Credit Bills</p>
				<div class="clr"></div>
				<div>


					<div class="add_frm_one">
						<div class="add_customer_one"
							style="width: 40% ! important; float: left!importan!">
							Customer Name:<span
								style="color: red; width: 80%; padding-left: 7px;" id="credCust"
								name="credCust"> NA</span>
						</div>
						<input type="hidden" id="credCust1" name="credCust1"> <input
							type="hidden" id="creditCustId" name="creditCustId">
						<div class="add_customer_one">
							Pending Amount:<span
								style="color: red; width: 20%; padding-left: 7px;" id="penAmt">
								0.0</span>
						</div>

					</div>

				</div>
				<div class="total_table_one" id="printDivid">
					<div class="scrollbars" id="scrollbarsmodaldiv">
						<table id="custCreditTable">

							<thead>
								<tr>
									<th style="text-align: center;" width="2%"></th>
									<th style="text-align: center;" width="2%">Sr</th>
									<th style="text-align: center;">Bill No</th>
									<th style="text-align: center;">Bill Date</th>
									<th style="text-align: center;" width="10%">Bill Amt</th>
									<th style="text-align: center;" width="10%">Disc Amt</th>
									<th style="text-align: center;" width="13%">Paid Amt</th>
									<th style="text-align: center;" width="13%">Pending Amt</th>
									<th style="text-align: center;" width="2%">Paying Amt</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>

				<div class="frm_row_one">

					<div class="four_one three" style="width: 33%">
						<div class="add_customer_one">Type</div>
						<div class="add_input">
							<select name="modType1" id="modType1" data-placeholder="Type"
								onchange="onPayTypeChange1(this.value)" class="input_add "
								style="text-align: left; font-size: 16px;">
								<option value="1" style="text-align: left;" selected>Cash</option>
								<option value="2" style="text-align: left;">Card</option>
								<option value="3" style="text-align: left;">E-Pay</option>
							</select>

						</div>
					</div>

					<div class="four_one three" style="width: 33%">
						<div class="add_frm_one" id="cardTypeDiv1"
							style="display: none; margin: 0px;">
							<div class="add_customer_one">Card Type</div>
							<div class="add_input">
								<select name="cardType1" id="cardType1"
									data-placeholder="Card Type" class="input_add "
									style="text-align: left; font-size: 16px;">
									<option value="" style="text-align: left;">Select Card</option>

									<option value="4" style="text-align: left;">Debit Card</option>
									<option value="5" style="text-align: left;">Credit
										Card</option>
								</select>

							</div>
							<div class="clr"></div>
						</div>
						<div class="add_frm_one" id="epayTypeDiv1"
							style="display: none; margin: 0px;">
							<div class="add_customer_one">E-Pay Type</div>
							<div class="add_input">
								<select name="ePayType1" id="ePayType1"
									data-placeholder="E-Pay Type" class="input_add"
									style="text-align: left; font-size: 16px;">
									<option value="">Select E-Pay Type</option>
									<option value="7" style="text-align: left;">Paytm</option>
									<option value="8" style="text-align: left;">Google Pay</option>
									<option value="6" style="text-align: left;">Bank
										Transaction</option>
									<option value="9" style="text-align: left;">Amazon Pay</option>
								</select>
							</div>
							<div class="clr"></div>
						</div>
					</div>

					<div class="four_one three" style="width: 33%">
						<div class="add_frm_one" style="margin: 0px;">
							<div class="add_customer_one">Received Amt</div>
							<div class="add_input">
								<input placeholder="Received Amt" name="receivedAmt"
									onchange="settleCustBill()" id="receivedAmt" type="text"
									value="0" class="input_add" style="font-size: 16px;"
									onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
							</div>
							<div class="clr"></div>
						</div>
						<input type="hidden" name="finTotal" id="total" value="0">
					</div>
				</div>


				<div class="pop_btns">
					<div class="clr"></div>
					<div class="close_r">

						<button type="button" class="buttonsaveorderpos" id="sbtbtn"
							disabled="disabled">Submit</button>
					</div>



				</div>
			</form>
		</div>


	</div>

	<script type="text/javascript">
									$(document).ready(function() {
										$('#quantity').popup({
											focusdelay : 400,
											outline : true,
											vertical : 'top'
										});
									});
									$(document).ready(function() {
										$('#custBills').popup({
											focusdelay : 400,
											outline : true,
											vertical : 'top'
										});
									});
									$(document).ready(function() {
										$('#myModalForCredit').popup({
											focusdelay : 400,
											outline : true,
											vertical : 'top'
										});
									});
									$(document).ready(function() {
										$('#payment').popup({
											focusdelay : 400,
											outline : true,
											vertical : 'top'
										});
									});
								</script>
	<script type="text/javascript">
		/*Dropdown Menu*/
		$('.dropdown').click(function() {
			$(this).attr('tabindex', 1).focus();
			$(this).toggleClass('active');
			$(this).find('.dropdown-menu').slideToggle(300);
		});
		$('.dropdown').focusout(function() {
			$(this).removeClass('active');
			$(this).find('.dropdown-menu').slideUp(300);
		});
		$('.dropdown .dropdown-menu li').click(
				function() {
					$(this).parents('.dropdown').find('span').text(
							$(this).text());
					$(this).parents('.dropdown').find('input').attr('value',
							$(this).attr('id'));
				});
		/*End Dropdown Menu*/
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/chosen.jquery.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/init.js"
		type="text/javascript" charset="utf-8"></script>
	<!-- custom scrollbar plugin -->
	<script
		src="${pageContext.request.contextPath}/resources/newpos/js/jquery.mCustomScrollbar.concat.min.js"></script>

	<script>
		(function($) {
			$(window).on(
					"load",
					function() {
						$("li").removeClass( "active" );
						$("li").removeClass( "active_cat" );
						/*
						get snap amount programmatically or just set it directly (e.g. "273")
						in this example, the snap amount is list item's (li) outer-width (width+margins)
						 */
						var amount = Math.max.apply(Math, $("#content-1 li")
								.map(function() {
									return $(this).outerWidth(true);
								}).get());

						$("#content-1").mCustomScrollbar({
							axis : "x",
							theme : "inset",
							advanced : {
								autoExpandHorizontalScroll : true
							},
							scrollButtons : {
								enable : true,
								scrollType : "stepped"
							},
							keyboard : {
								scrollType : "stepped"
							},
							snapAmount : amount,
							mouseWheel : {
								scrollAmount : amount
							}
						});

					});
		})(jQuery);
	</script>

	<script>
		(function($) {
			$(window).on(
					"load",
					function() {

						/*
						get snap amount programmatically or just set it directly (e.g. "273")
						in this example, the snap amount is list item's (li) outer-width (width+margins)
						 */
						var amount = Math.max.apply(Math, $("#content-2 li")
								.map(function() {
									return $(this).outerWidth(true);
								}).get());

						$("#content-2").mCustomScrollbar({
							axis : "x",
							theme : "inset",
							advanced : {
								autoExpandHorizontalScroll : true
							},
							scrollButtons : {
								enable : true,
								scrollType : "stepped"
							},
							keyboard : {
								scrollType : "stepped"
							},
							snapAmount : amount,
							mouseWheel : {
								scrollAmount : amount
							}
						});

					});
		})(jQuery);
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		 $('#addcust1').popup({
		        focusdelay: 400,
		        outline: true,
		        vertical: 'top'
		    }); 
		 var custId  = '${holdBill.custId}';
		 //alert(custId)
		getAllItemList();
		getCustomerList(custId);
		 alertify.set('notifier','position', 'top-right'); 
	});
	
	function getAllItemList(){
		 
		 		$.getJSON('${getAllItemList}',{ajax:true},function(data){
		 			var jsonStr= data;
		 			
		 			var divStr =" ";
		 			document.getElementById("itemUl").innerHTML="";
		 			for(var i=0 ; i <  jsonStr.length ; i++){
		 				 
		 			 divStr=divStr+'<li class="itemDummyClass" onclick="opnItemPopup('+jsonStr[i].itemId+',\'' + jsonStr[i].itemName + '\',' + jsonStr[i].catId + ',' + jsonStr[i].totalRegStock + ',' + jsonStr[i].itemTax1 + ',' + jsonStr[i].itemTax2 + ',' + jsonStr[i].mrp + ',\'' + jsonStr[i].uom + '\','+1+')"><div id="itemDiv">'+
		 							'<div class="new_cake_bx" >'+
		 								'<a href="#" class="initialism  addcust1_open  " title="'+jsonStr[i].itemName+'">'+
		 									'<div class="cake_picture">'+
		 										'<p>'+jsonStr[i].mrp+'</p>'+
		 										'<img src="${pageContext.request.contextPath}/resources/newpos/images/chocolate_cake.jpg" alt="">'+
		 										'<span>'+jsonStr[i].totalRegStock+'</span>'+
		 									'</div>'+
		 								'<div class="cake_name">'+jsonStr[i].itemName+'</div>'+
		 							'</a> </div> </div> <div class="hiddenSubCatId" style="display: none;">'+jsonStr[i].subCatId+'</div></li>';
		 									
		 									
		 					//	alert(iList[i].itemName);	
		 				}
		 			document.getElementById("itemUl").innerHTML=divStr;
		 			 myFunction1();
		 		});
		 		 
	 }
	function myFunction1() {
		
		var hiddenSelectedCatId = $("#hiddenSelectedCatId").val();
		
		$(".scrollbar-content").css("top", "0");
		 $(".scrollbar-handle").css("top", "0");
	    $('.itemDummyClass').hide();
	    var txt = $('#myInput1').val();
	    
	    if(hiddenSelectedCatId==0){
	    	$('.itemDummyClass').each(function(){
	 	       if($(this).text().toUpperCase().indexOf(txt.toUpperCase()) != -1){
	 	           $(this).show();
	 	       }
	 	    });
	    }else{
	    	$('.itemDummyClass').each(function(index){
	    		
	    		var catId = parseFloat(document
 						.getElementsByClassName("hiddenSubCatId")[index].innerHTML);
	    		
	 	       if($(this).text().toUpperCase().indexOf(txt.toUpperCase()) != -1 && catId==parseInt(hiddenSelectedCatId)){ 
	 	           
	 		           $(this).show();
	 		       
	 	       }
	 	    });
	    }
	    
	     
	} 
	 
	function selectBySubCatId(id){
		$("li").removeClass( "active" );
		$( "#subCat"+id ).addClass( "active" );
		$("#hiddenSelectedCatId").val(parseInt(id));
		  
		$(".scrollbar-content").css("top", "0");
		 $(".scrollbar-handle").css("top", "0");
	    $('.itemDummyClass').hide(); 
	    
	    var txt = $('#myInput1').val();
	    
	    $('.itemDummyClass').each(function(index){
	    	
	    	
	    	if(parseInt(id)==0){ 
	 	 	       if($(this).text().toUpperCase().indexOf(txt.toUpperCase()) != -1){
	 	 	           $(this).show();
	 	 	       } 
	    	}else{
	    		var catId = parseFloat(document
						.getElementsByClassName("hiddenSubCatId")[index].innerHTML);
	    		if($(this).text().toUpperCase().indexOf(txt.toUpperCase()) != -1 && catId==parseInt(id)){
	 	           $(this).show();
	 	       }
	    	}
	    	
	       
	    });
	    
	}
	
	function getSubCat(catId){
		$("li").removeClass( "active_cat" );
		$( "#catLi"+catId ).addClass( "active_cat" );
		$.getJSON('${getSubCatByCatIdAjax}', {
							catId : catId,
		                    ajax : 'true'
		                }, function(data) {  
		                	
		                	document.getElementById("multi_ul").innerHTML= "";
							 var divSubCatStr = '<li onclick="selectBySubCatId(0);subCatForSrch(0);"'+
     						'value="All" id="0"><a href="javascript:void(0);" class="scroll_menu"'+
    						'onclick="SlectedCat(this.innerHTML)">All</a></li>';
		                    for ( var i = 0; i < data.length; i++) {		 
		                    	console.log(data[i])
		        				var subDiv = '<li id="subCat'+data[i].subCatId+'" onclick="selectBySubCatId('+data[i].subCatId+');subCatForSrch('+data[i].subCatId+');"'+
		        						'value="'+data[i]+'"><a href="#" class="scroll_menu" onclick="SlectedCat(this.innerHTML)">'+data[i].subCatName+'</a></li>';
		                    	
		        						divSubCatStr = divSubCatStr+subDiv
		                    	 
		                    }	 		                    	                   
			                document.getElementById("multi_ul").innerHTML= divSubCatStr;
		                });
		
		
		$.getJSON('${getAllItemList}',{ajax:true},function(data){
 			var jsonStr= data;
 			
 			var divStr =" ";
 			document.getElementById("itemUl").innerHTML="";
 			for(var i=0 ; i <  jsonStr.length ; i++){
 				 if(jsonStr[i].catId==catId){ 					 
 			 divStr=divStr+'<li class="itemDummyClass" onclick="opnItemPopup('+jsonStr[i].itemId+',\'' + jsonStr[i].itemName + '\',' + jsonStr[i].catId + ',' + jsonStr[i].totalRegStock + ',' + jsonStr[i].itemTax1 + ',' + jsonStr[i].itemTax2 + ',' + jsonStr[i].mrp + ',\'' + jsonStr[i].uom + '\','+1+')"><div id="itemDiv">'+
 							'<div class="new_cake_bx" >'+
 								'<a href="#" class="initialism  addcust1_open  " title="'+jsonStr[i].itemName+'">'+
 									'<div class="cake_picture">'+
 										'<p>'+jsonStr[i].mrp+'</p>'+
 										'<img src="${pageContext.request.contextPath}/resources/newpos/images/chocolate_cake.jpg" alt="">'+
 										'<span>'+jsonStr[i].totalRegStock+'</span>'+
 									'</div>'+
 								'<div class="cake_name">'+jsonStr[i].itemName+'</div>'+
 							'</a> </div> </div> <div class="hiddenSubCatId" style="display: none;">'+jsonStr[i].subCatId+'</div></li>';
 									
 									
 					//	alert(iList[i].itemName);	
 				 }else if(catId==0){
 					divStr=divStr+'<li class="itemDummyClass" onclick="opnItemPopup('+jsonStr[i].itemId+',\'' + jsonStr[i].itemName + '\',' + jsonStr[i].catId + ',' + jsonStr[i].totalRegStock + ',' + jsonStr[i].itemTax1 + ',' + jsonStr[i].itemTax2 + ',' + jsonStr[i].mrp + ',\'' + jsonStr[i].uom + '\','+1+')"><div id="itemDiv">'+
						'<div class="new_cake_bx" >'+
							'<a href="#" class="initialism  addcust1_open  " title="'+jsonStr[i].itemName+'">'+
								'<div class="cake_picture">'+
									'<p>'+jsonStr[i].mrp+'</p>'+
									'<img src="${pageContext.request.contextPath}/resources/newpos/images/chocolate_cake.jpg" alt="">'+
									'<span>'+jsonStr[i].totalRegStock+'</span>'+
								'</div>'+
							'<div class="cake_name">'+jsonStr[i].itemName+'</div>'+
						'</a> </div> </div> <div class="hiddenSubCatId" style="display: none;">'+jsonStr[i].subCatId+'</div></li>';
 				 }
 				}
 			document.getElementById("itemUl").innerHTML=divStr;
 			 
		});
	 }  
	
	 
	function subCatForSrch(val){
		//alert("FUNC"+val);
		document.getElementById("SubCatForSearch").value=val;
		//var s=document.getElementById("SubCatForSearch").value;
		//alert(s);
	}
	
	function SlectedCat(val){
		document.getElementById("selected_subcat").innerHTML=val;
	}
	
	
	
	
	
	function calPad(side,value) {
		var qty =  $('#enterQty').val() ;
		var rate =  $('#enterRate').val() ;
	

		 if(side==1){
			 
			 if(qty=="NaN"){
				 qty="";
			 }
			 
			  if(value=="."){
				 qty += value
				 qty = qty.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'); 
				 
			 }else if(value==10){
				  
				 if(qty.length!=0){
					 
					 qty  = qty.substring(0, qty.length - 1);
				 }
				  
			 }else{
				 qty += value
			 }
			 document.getElementById("enterQty").value = qty;
			 itemRateCalculation(1);
			 $("#enterQty").focus(); 
			 
		 }else if(side==2){
			 
			  
			 if(rate=="NaN"){ 
				 rate="";
			 } 
			 if(value=="."){ 
				  rate += value
				  rate = rate.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'); 
				 
			 }else if(value==10){
				  
				 if(rate.length!=0){
					 
					 rate  = rate.substring(0, rate.length - 1);
				 }
				  
			 }else{
				 rate += value
			 }
			 document.getElementById("enterRate").value = rate;
			 itemRateCalculation(2);
			 $("#enterRate").focus(); 
		 }
		 
		 if(value==11){
			 document.getElementById("enterQty").value = 1;
			 document.getElementById("enterRate").value = "";
		 }
		 
	}
	
	
function opnItemPopup(itemId,itemName,catId,aviableQty,itemTax1,itemTax2,itemMrp,uom,flag){
	 
	if(flag>0){
		document.getElementById("itemTaxHidden").value = itemTax1+itemTax2;
	}else{
		document.getElementById("itemTaxHidden").value = itemTax1;
	}

	 document.getElementById("itemNameHidden").value = itemName;
	document.getElementById("itemUomHidden").value = uom;
	document.getElementById("itemIdHidden").value = itemId;
	
	document.getElementById("itemMrp").value = itemMrp; 
	document.getElementById("itemTax1Hidden").value = itemTax1;
	document.getElementById("itemTax2Hidden").value = itemTax2;
	document.getElementById("itemCatId").value = catId;
	document.getElementById("aviableQty").value=aviableQty;
	
	
}
 
	
	
	function addItem(flag){
		 
		if(flag>0){
			var qty= document.getElementById("enterQty").value;
		}else{
			var qty= document.getElementById("tblQty").value;
			
		}
		
		
		jQuery("#status").fadeOut();
		 
		var itemName =document.getElementById("itemNameHidden").value;
		var itemId = document.getElementById("itemIdHidden").value;
		var itemMrp=document.getElementById("itemMrp").value;
		var itemTax =document.getElementById("itemTaxHidden").value;
		var itemUom= document.getElementById("itemUomHidden").value;
		//var catId = document.getElementById("itemUomHidden").value;
		var tax1 = document.getElementById("itemTax1Hidden").value;
		var tax2= document.getElementById("itemTax1Hidden").value;
		var catId= document.getElementById("itemCatId").value;
	var aviableQty=	document.getElementById("aviableQty").value;
		var price= (qty*itemMrp).toFixed(2);
		var paybeleTax=((price*100)/(100+itemTax)).toFixed(2);
		var paybeleAmt=(price-paybeleTax).toFixed(2);
		
		 //alert(itemId);
		//alert(itemTax);
		//alert(paybeleTax);
		//alert(paybeleAmt);
		var fd=new FormData();
		fd.append('itemName',itemName);
		fd.append('itemId',itemId);
				fd.append('itemMrp',itemMrp);
				fd.append('itemTax',itemTax);
			fd.append('tax1',tax1);
					fd.append('tax2',tax2);
				fd.append('catId',catId);
								fd.append('aviableQty',aviableQty);
					fd.append('itemUom',itemUom);
									fd.append('qty',qty);
								fd.append('price',price);
								fd.append('paybeleTax',paybeleTax);
									fd.append('paybeleAmt',paybeleAmt);
		
		  $.ajax({
		       url: '${pageContext.request.contextPath}/addItemInBillLIst',
		       type: 'POST',
		       data: fd,
		       dataType: 'json',
		       processData: false,
		       contentType: false,
		       async:false,
		       success: function(data, textStatus, jqXHR)
		       {
		    	   var itemCnt = data.itemList.length;
					var total = 0;
					var tax = 0;
					var finalAmt =0;
					var payableAmt=0;
					
					//alert(data.length);
					
					if(data.error==false){
						alertify.success(data.msg);
					}else{
						alertify.error(data.msg);
					}
						document.getElementById("enterQty").value=1;
						document.getElementById("closeAddcust").click();
						$('#itemTable tr').remove();
						
						var mainTrStr = '<tr>'
							+'<th style="text-align: center;" width="2%">Sr</th>'
							+'<th style="text-align: center;">Product</th>'
							+'<th style="text-align: center;" width="10%">QTY</th>' 
							+'<th style="text-align: center;" width="13%">Price</th>' 
							+'<th style="text-align: center;" width="13%">Total</th>'
							+'<th style="text-align: center;" width="2%">Del</th>'
							+'</tr>';
						var mainTr = $(mainTrStr);
						$('#itemTable tbody').append(
								mainTr);
						
						$
						.each(
								data.itemList,
								function(key, item) {
						
									 
							
							//alert(JSON.stringify(item))
							finalAmt += parseFloat(item.payableAmt);
							total += parseFloat(item.calPrice);
							tax += parseFloat(item.payableTax);
							payableAmt += parseFloat(item.payableAmt);
							var tr=$('<tr></tr>');
							tr
							.append($(
									'<td ></td>')
									.html(key+1));
								tr.append($('<td  ></td>').html('<div style="width: 100%; white-space: normal;">'+item.itemName+'</div>'));
								tr.append($('<td   style="text-align: right;"  class="initialism addcust1_open"  onclick="opnItemPopup('+item.itemId+',\'' + item.itemName + '\','+item.catId+','+item.aviableQty+',' + item.itemTax + ',' + item.itemTax + ',' + item.itemMrp + ',\'' + item.itemUom + '\','+0+')" > </td>').html(item.itemQty));
								tr.append($('<td style="text-align: right;"></td>').html(item.itemMrp.toFixed(2)));
								tr.append($('<td style="text-align: right;" ></td>').html(item.calPrice.toFixed(2)));
								tr.append($('<td style="text-align: center;"></td>').html('<a href="#" class="trash_icon" onclick="deleteItem('+item.itemId+')" ><i class="fa fa-trash-o" aria-hidden="true"></i></a>'));
								
								
								$('#itemTable tbody').append(tr);
								
								
						});
						getAllItemList();
						
						 //alert(itemCnt);
						document.getElementById("totalCnt").innerHTML=itemCnt;
						//alert(total);
						document.getElementById("totalAmt").innerHTML=payableAmt.toFixed(2);
						//alert(tax);
						document.getElementById("totalTax").innerHTML=tax.toFixed(2);
						//alert(finalAmt);
						document.getElementById("finalAmount").innerHTML=total.toFixed(2);
						document.getElementById("totalAmtPopup").innerHTML = total.toFixed(2); 
						document.getElementById("totalPayableAmt").innerHTML = total.toFixed(2);
						
						
						document.getElementById("tblQty").value="";
						//jQuery("#preloader").delay(0).fadeOut("slow");
						
						
						
						 },
		       error: function(jqXHR, textStatus, errorThrown)
		       {
		           console.log('ERRORS: ' + textStatus);
		       }
		   });
		  
	}
	
	function getCustomerList(val) {
		 //alert(val);
			$.getJSON('${getCustomerList}', {
			}, function(data) {

			//alert(data.length);
			var html = '';
			var len = data.length;
										//alert(data.addCustomerId);
										for (var i = 0; i < len; i++) {

											if (data[i].custId == val) {
												html += '<option value="' + data[i].custId + '" selected>'
														+ data[i].custName
														+ '&nbsp;'
														+ data[i].phoneNumber
														+ '</option>';
											} else {
												html += '<option value="' + data[i].custId + '">'
														+ data[i].custName
														+ '&nbsp;'
														+ data[i].phoneNumber
														+ '</option>';
											}

										}
										$('#custId').html(html);

										$("#custId").trigger("chosen:updated");
										$('.chosen-select').trigger(
												'chosen:updated');
			/* $('#custId').find('option').remove().end()

			for (var i = 0; i < data.length; i++) {
 
				var dataValue=data[i].userName+"~"+data[i].phoneNo+"~"+data[i].gstNo;
				
				if(val==data[i].phoneNo){
					$("#custId").append($("<option selected></option>").attr("value",data[i].phoneNo).text(dataValue));
				}else{
					$("#custId").append($("<option ></option>").attr("value",data[i].phoneNo).text(dataValue));
				}
				
			}
			$("#custId").trigger("chosen:updated"); */

		});

	}

 function getCustInfo(val){
	 
	var phoneno = /^\d{10}$/;
	if(val.match(phoneno)){
		document.getElementById("custMob").value=val;
	}
 }
 
 function addCust() {
	/* var name=document.getElementById("custName").value;
	var mob =document.getElementById("custMob").value;
	 
	var isError=false;
	
	if(!name){
		isError=true;
		$('#name_error').show()
		
	}else {
	 
		$('#name_error').hide();
	}
	if(!mob){
		isError=true;
		$('#mob_error').show()
		
	}else{
		 
		$('#mob_error').hide();
		var phoneno = /^\d{10}$/;
		if(!mob.match(phoneno)){
			isError=true;
			$('#mob_error2').show()
		}else{
			isError=false;
			$('#mob_error2').hide();
		}
	} */
	
	var phNo=""; 
	var custId = document.getElementById("custIdEdit").value;
	var customerName = document.getElementById("customerName").value;
	var mobileNo = document.getElementById("mobileNo").value;
	var  kms= document.getElementById("kms").value;
	phNo=mobileNo;
	var dateOfBirth = document.getElementById("dateOfBirth").value;
	var custType = document.getElementById("custType").value;
	custType=3;
	var ageRange = document.getElementById("ageRange").value;
	
	var gender = 2;
	if (document.getElementById('moption').checked) {
		gender = 1;
	}
	//var isBuissness = document.getElementById("isBuissness").value;
	var buisness = 0;
	if (document.getElementById('y-option').checked) {
		buisness = 1;
	}
	var companyName = document.getElementById("companyName").value;
	var gstNo = document.getElementById("gstNo").value;
	var custAdd = document.getElementById("custAdd").value;
	var pincode = document.getElementById("pincode").value;
	var remark = document.getElementById("remark").value;

	var flag = 0;

	if (customerName == "") {
		//alert("Enter Customer Name");
		alertify.error("Enter Customer Name"); 
		flag = 1;
	} 
	 
	else if (mobileNo == "" || !validateMobile(mobileNo)) {
		alertify.error("Enter Valid Mobile No"); 
		//alert("Enter Valid Mobile No");
		flag = 1;
	}  else if (ageRange == 0) {
		
		alertify.error("Please Select Age Group"); 
		//alert("Please Select Age Group");
		flag = 1;
	} else if (buisness == 1) {

		if (companyName == "") {
			//alert("Enter Company Name");
			alertify.error("Enter Company Name"); 
			flag = 1;
		} else if (gstNo == "") {
			alertify.error("Enter GST No"); 
			//alert("Enter GST No");
			flag = 1;
		}else if(checkGST(gstNo)==false){
			//alert("Invalid GST No");
			alertify.error("Invalid GST No"); 
			flag = 1;
		}
	}
	
	if (kms == "") {
		kms=0;
	}
	 
	
	if(flag == 0){
		 
		  
		var fd=new FormData();
		fd.append('customerName',customerName);
		fd.append('mobileNo',mobileNo);
		fd.append('dateOfBirth',dateOfBirth);
		fd.append('buisness',buisness);
		fd.append('companyName',companyName);
		fd.append('gstNo',gstNo);
		fd.append('custAdd',custAdd);
		fd.append('custId',custId);
		fd.append('custType',custType);
		fd.append('ageRange',ageRange);
		fd.append('kms',kms);
		fd.append('gender',gender);
		fd.append('pincode',pincode);
		fd.append('remark',remark); 
		
		 $.ajax({
		       url: '${pageContext.request.contextPath}/addCustomer',
		       type: 'POST',
		       data: fd,
		       dataType: 'json',
		       processData: false,
		       contentType: false,
		       async:false,
		       success: function(data, textStatus, jqXHR)
		       {
		    	   if(data.error==false){
		    		   
		    		   document.getElementById("pincode").value = "";
						document.getElementById("remark").value = "";
						document.getElementById("customerName").value = "";
						document.getElementById("mobileNo").value = "";
						document.getElementById("kms").value = "0";
						document.getElementById("dateOfBirth").value = "";

						document.getElementById("n-option").checked = true;
						document.getElementById("companyName").value = "";
						document.getElementById("gstNo").value = "";
						document.getElementById("custAdd").value = "";
						document.getElementById("custId").value = 0;
						document.getElementById("moption").checked = true;
						document.getElementById("custType").value ="0";
						$("#custType").trigger("chosen:updated");
						document.getElementById("ageRange").value ="0";
						$("#ageRange").trigger("chosen:updated");
						$('.chosen-select').trigger('chosen:updated');
						/* document
								.getElementById("add_cust_head_name").innerHTML = "Add Customer"; */
						$("#isbuissnessdiv").hide();

						if (custId != 0) {
							alertify.success("Update Successfully"); 
						} else {
							alertify.success("Customer addeed"); 
						}
						
						
							
							 document.getElementById("clsAddCust").click();
							//document.getElementById("selectCust").value=name+"~"+mob+"~"+gst;
							/*document.getElementById("custName").value="";
							document.getElementById("custMob").value="";
							document.getElementById("custGst").value=""; */
							getCustomerList((data.addCustomerId));
						}else{
							alertify.error("Unable To Add Customer");
						}
				
		       },
		       error: function(jqXHR, textStatus, errorThrown)
		       {
		           console.log('ERRORS: ' + textStatus);
		           alertify.error("Unable To Add Customer");
		       }
		   });
		
		
		
		 
		
		
		
	}
		
}
 
 
 

 
 function deleteItem(id){
	 
	 
	 var fd=new FormData();
		fd.append('id',id);
	
		 $.ajax({
		       url: '${pageContext.request.contextPath}/deleteItem',
		       type: 'POST',
		       data: fd,
		       dataType: 'json',
		       processData: false,
		       contentType: false,
		       async:false,
		       success: function(data, textStatus, jqXHR)
		       {//alert(JSON.stringify(data));
					var itemCnt = data.length;
					var total = 0;
					var tax = 0;
					var finalAmt =0;
					var payableAmt=0;
					//alert(data.length);
					$(".scrollbar-content").css("top", "0");
						 $(".scrollbar-handle").css("top", "0");
						 getAllItemList();
							
						document.getElementById("enterQty").value=1;
						document.getElementById("closeAddcust").click();
						$('#itemTable tr').remove();
						
						var mainTrStr = '<tr>'
							+'<th style="text-align: center;" width="2%">Sr</th>'
							+'<th style="text-align: center;">Product</th>'
							+'<th style="text-align: center;" width="10%">QTY</th>' 
							+'<th style="text-align: center;" width="13%">Price</th>' 
							+'<th style="text-align: center;" width="13%">Total</th>'
							+'<th style="text-align: center;" width="2%">Del</th>'
							+'</tr>';
						var mainTr = $(mainTrStr);
						$('#itemTable tbody').append(
								mainTr);
						
						$
						.each(
								data,
								function(key, item) {
						
									 
							
							//alert(JSON.stringify(item))
							finalAmt += parseFloat(item.payableAmt);
							total += parseFloat(item.calPrice);
							tax += parseFloat(item.payableTax);
							payableAmt += parseFloat(item.payableAmt);
							
							var tr=$('<tr></tr>');
							tr
							.append($(
									'<td ></td>')
									.html(key+1));
								tr.append($('<td></td>').html('<div style="width: 100%; white-space: normal;">'+item.itemName+'</div>'));
								tr.append($('<td style="text-align: right;" class="initialism addcust1_open"  onclick="opnItemPopup('+item.itemId+',\'' + item.itemName + '\','+item.catId+','+item.aviableQty+',' + item.itemTax + ',' + item.itemTax + ',' + item.itemMrp + ',\'' + item.itemUom + '\','+0+')" > </td>').html(item.itemQty));
								tr.append($('<td style="text-align: right;"></td>').html(item.itemMrp.toFixed(2)));
								tr.append($('<td style="text-align: right;"></td>').html(item.calPrice.toFixed(2)));
								tr.append($('<td style="text-align: center;"></td>').html('<a href="#" class="trash_icon" onclick="deleteItem('+item.itemId+')" ><i class="fa fa-trash-o" aria-hidden="true"></i></a>'));
								
								
								$('#itemTable tbody').append(tr);
								
								
						});
						//alert(itemCnt);
						document.getElementById("totalCnt").innerHTML=itemCnt;
						//alert(total);
						document.getElementById("totalAmt").innerHTML=payableAmt.toFixed(2);
						//alert(tax);
						document.getElementById("totalTax").innerHTML=tax.toFixed(2);
						//alert(finalAmt);
						document.getElementById("finalAmount").innerHTML=total.toFixed(2);
						document.getElementById("totalAmtPopup").innerHTML = total.toFixed(2); 
						document.getElementById("totalPayableAmt").innerHTML = total.toFixed(2);
						document.getElementById("tblQty").value="";
						
						
						
		       },
		       error: function(jqXHR, textStatus, errorThrown)
		       {
		           console.log('ERRORS: ' + textStatus);
		       }
		   });
		  
	 
 }
 
 function amtReturnCal() {
		
		var amt=document.getElementById("payAmt").value;
		var pay=document.getElementById("pAmt").value;
		 
		var ret=amt-pay;
		document.getElementById("rAmt").value=ret;
		
	}
 function paymentClick(){
	
	 var pAmt=document.getElementById("finalAmount").innerHTML;
	 //alert(pAmt);
	 document.getElementById("pAmt").value=pAmt;
	 var detail =document.getElementById("custId").value;
	 
	 		
	 		$('#error_customer').hide()
	 		$.getJSON('${getItemList}',{ajax:true},function(data){
	 			if(data.length<1){
	 				//$('#empty_itemList').show()
	 				alertify.error("Please Select Atleast One Item To Genrate Bill!!!!!");
	 			}else{
	 				$('#empty_itemList').hide()
	 				document.getElementById("payment1").click();
	 			}
	 		});
	 		
	 	 
	 	
 }
 
 function billClick(){
	 var pAmt=document.getElementById("finalAmount").innerHTML;
	 document.getElementById("pAmt").value=pAmt;
	 var detail =document.getElementById("custId").value;
	 document.getElementById("paidAmt").value=pAmt;
	 
	 
	 
	 
	 		$('#error_customer').hide()
	 		$.getJSON('${getItemList}',{ajax:true},function(data){
	 			if(data.length<1){
	 				//$('#empty_itemList').show()
	 				alertify.error("Please Select Atleast One Item To Genrate Bill!!!!!");
	 				
	 			}else{
	 				$('#empty_itemList').hide()
	 				submitPayment();
	 			}
	 		});
	 			//document.getElementById("payment1").click();
 
	 
 }
 
 
 
/*  function itemDiscPerCalculation(val){
	 var pAmt=document.getElementById("finalAmount").innerHTML;
	 //alert(pAmt);
	 if(val==1){
		 document.getElementById("discAmt").value="";
	 var per = document.getElementById("discPer").value;
	 var perAmt= (pAmt/100)*per;
	
	 var newpAmt=pAmt-perAmt;  
	 document.getElementById("pAmt").value=newpAmt;
	// alert(per);
	 }else {
		 document.getElementById("discPer").value="";
		 var amount = document.getElementById("discAmt").value;
		 //alert(amount);
		 document.getElementById("pAmt").value=pAmt-amount;
	}
	 
 } */
 
 function itemDiscPerCalculation(flag) {
		
		document.getElementById("cashAmt").value =0;
		document.getElementById("cardAmt").value =0;
		document.getElementById("epayAmt").value =0;
		document.getElementById("epayLabel").innerHTML =" Total: &nbsp;&nbsp;"+0;
 	document.getElementById("epayLabel").style.color="black";

		var discPer = parseFloat($('#discPer').val());
		var discAmt = parseFloat($('#discAmt').val());
		var totalAmtPopup;
		
		var grandTot=parseFloat($('#totalAmtPopup').text());
		
		//var advAmt = document.getElementById("advAmt").value;
		var advAmt = 0;
		totalAmtPopup= parseFloat($('#totalAmtPopup').text())-advAmt;
		
		//alert("TOT - "+totalAmtPopup);
		
		//alert(discAmt+"------- "+totalAmtPopup);
		
		 /*  if(parseFloat(advAmt)>0){
			totalAmtPopup= parseFloat($('#totalAmtPopup').text())-parseFloat(advAmt);
		}else{
			totalAmtPopup= parseFloat($('#totalAmtPopup').text());
		}   */
		
		if(flag==1){
			
			var calDiscAmt = parseFloat(grandTot*discPer/100);
			
			if(discPer>100){
				alert("Discount percent is invalid");
				document.getElementById("discAmt").value=0;
				document.getElementById("discPer").value=0;
				//document.getElementById("payAmt").value =totalAmtPopup;
				
				var totalAmt=totalAmtPopup-0;
				document.getElementById("totalPayableAmt").innerHTML = totalAmt.toFixed(2);
				document.getElementById("payAmt").value = totalAmt.toFixed(0);
				
			}else{
			
			var totalAmt=totalAmtPopup-calDiscAmt;
			document.getElementById("discAmt").value = calDiscAmt.toFixed(2);
			document.getElementById("totalPayableAmt").innerHTML = totalAmt.toFixed(2);
			document.getElementById("payAmt").value = totalAmt.toFixed(0);
			}
			
			
			
			
			
			/* var totalAmt=totalAmtPopup-calDiscAmt;
			
			if(isNaN(calDiscAmt)){
				calDiscAmt=0;
				totalAmt=totalAmtPopup;
			}
			
			document.getElementById("discAmt").value = calDiscAmt.toFixed(2);
			document.getElementById("totalPayableAmt").innerHTML = totalAmt.toFixed(2);
			document.getElementById("payAmt").value = totalAmt.toFixed(2); */
			 
		}else{
			
			 if(discAmt>grandTot){
				 if(discAmt!=0){
					alert("Discount amount should be smaller than total amount");
				 }
				document.getElementById("discPer").value=0;
				document.getElementById("discAmt").value=0;
				//document.getElementById("payAmt").value=payableAmount;
				
				var totalAmt=payableAmount-0;
				document.getElementById("totalPayableAmt").innerHTML = totalAmt.toFixed(2);
				document.getElementById("payAmt").value = totalAmt.toFixed(0);
				
			}else{
				/* alert(discAmt)
				alert(grandTot) */
			var calDiscPer = parseFloat((discAmt/(grandTot/100)));

			
			var totalAmt=totalAmtPopup-discAmt;
			document.getElementById("discPer").value = calDiscPer.toFixed(2);;
			document.getElementById("totalPayableAmt").innerHTML = totalAmt.toFixed(2);
			document.getElementById("payAmt").value = totalAmt.toFixed(0);
			} 
			
			/* var calDiscPer = parseFloat((discAmt/(grandTot/100)));
			var totalAmt=totalAmtPopup-discAmt;
			
			if(isNaN(calDiscPer)){
				calDiscPer=0;
				totalAmt=totalAmtPopup;
			}
			
			document.getElementById("discPer").value = calDiscPer;
			document.getElementById("totalPayableAmt").innerHTML = totalAmt;
			document.getElementById("payAmt").value = totalAmt; */

		}
	}
 
 
 function openPaymentPopup() {
		
	 $.getJSON('${getItemList}',{ajax:true},function(data){
			if(data.length<1){
				//$('#empty_itemList').show()
				alertify.error("Please Select Atleast One Item To Genrate Bill!!!!!");
			}else{
				document.getElementById("pAmt").value=0;
				document.getElementById("rAmt").value=0;
				
				
				var advAmt = 0;
				var custId =  $('#custId').val() ;
				
				//var dfCust=${defaultCustomer};
		 
				var key =  $('#key').val() ;
			
				 
				document.getElementById("cashAmt").value =0;
				document.getElementById("cardAmt").value =0;
				document.getElementById("epayAmt").value =0;
				document.getElementById("epayLabel").innerHTML =" Total: &nbsp;&nbsp;"+0;
		 		document.getElementById("epayLabel").style.color="black";

		 	
		 		var advAmt = 0;
		 	 
		 	 
				
				var amt=parseFloat($('#totalAmtPopup').text())-advAmt;
				 
				
				document.getElementById("totalPayableAmt").innerHTML = amt;
				 //alert(custId)
				document.getElementById("payAmt").value = amt;

				itemDiscPerCalculation(2);
				/* document.getElementById("discAmt").value=0;
				document.getElementById("discPer").value=0; */
				$("#modeOfPayDiv").show();
				document.getElementById("creditBillno").checked = true;
				 
				var rowcount = $('#itemTable tr').length;
				var flag = 0;
				  
				 if(rowcount<=1){
					 alert("Select Minimum Product");
					 flag=1;
				 }else if(custId==0 || custId==null || custId==""){
					 flag=1;
					 //alert("Select Customer");
					 alertify.error("Select customer.");
				 }
				 
				 if(flag==0){
					 $('#payment').popup('show');
				 }
			}
		});
	  
	}
	/* function amtReturnCal() {
		
		var amt=document.getElementById("paidAmt").value;
		var pay=document.getElementById("pAmt").value;
		
		var ret=amt-pay;
		document.getElementById("rAmt").value=ret;
		
	} */
 
 
 
 function submitPayment(){
	 //alert("payment");
	 var custName=document.getElementById("custId").value;
	var paidAmt=document.getElementById("paidAmt").value;
	 var payMode=document.getElementById("payMode").value;  
	 var discPer=document.getElementById("discPer").value;  
	 var payableAmt=document.getElementById("pAmt").value;
	 var isSMS=0; //new added by Sachin 18-08-2020 to send sms or not.
		if(document.getElementById('isSMS').checked){
			isSMS=1;
		}
	
	 
	
	  var isError=false;
	 
	
	 if(!payMode){
		 isError=true; 
		 $('#payMode_error').show()
	 }else {
		// isError=false;
		 $('#payMode_error').hide()
	} 
	 
	 
	  if(isError==false){
		  var key=document.getElementById("key").value;
		  document.getElementById("closePay").click();
			// will fade out the whole DIV that covers the website.
			 
	 		   var fd=new FormData();
			fd.append('custName',custName);
			fd.append('paidAmt',payableAmt);
			fd.append('payMode',payMode);
			fd.append('payableAmt',payableAmt);
			fd.append('discPer',discPer);
			fd.append('isSMS',isSMS);
			fd.append('key',key);
			// alert(key)
			$("#preloader").show();
			  $("#status").show();
			$
			.ajax({
				url : '${pageContext.request.contextPath}/genrateSellBill',
				type : 'post',
				data: fd,
				dataType : 'json', 
				contentType : false,
				processData : false, 
				success : function(response) {
  
						 $("#preloader").hide();
						  $("#status").hide();
						 cancelBill();
							//alert("Bill Genrated Successfully!!!");
							 
							if(response.error==false){
								   
									alertify.success("Bill genrated successfully !!!");
								}else{
									alertify.error(response.message);
								}
							if(key>0){
								window.location = "${pageContext.request.contextPath}/newPos/0";
							}
							 //document.getElementById("relod").click();
							 
						  
				},
			});
		   
		 
	  } 
 
 }
 
 
 function  checkAviableQty(flag){
	//alert("Ok");

	  var avQty = parseFloat(document.getElementById("aviableQty").value);
		if(flag>0){
			var qty= parseFloat(document.getElementById("enterQty").value);
		}else{
			var qty= parseFloat(document.getElementById("tblQty").value);
			}
		 
		if(!isNaN(qty) && qty>0){
			 
			addItem(flag);
		 
		}else{
			alertify.error("Enter Valid QTY ");
			document.getElementById("enterQty").value=1;
		}
 }
 
	
	function printAndSubmit(){
		//alert("Ok");
		 var custName=document.getElementById("custId").value;
		 var paidAmt=document.getElementById("paidAmt").value;
		 var payMode=document.getElementById("payMode").value;  
		 var discPer=document.getElementById("discPer").value;  
		 var payableAmt=document.getElementById("pAmt").value;
		 var isSMS=0; //new added by Sachin 18-08-2020 to send sms or not.
			if(document.getElementById('isSMS').checked){
				isSMS=1;
			}
		
		 var isError=false;
		 
	
		 if(!payMode){
			 isError=true; 
			 $('#payMode_error').show()
		 }else {
			 isError=false;
			 $('#payMode_error').hide()
		}
		 
		 
		 if(isError==false){
			 var key =  $("#key").val();
			 $("#preloader").show();
			  $("#status").show();
			  document.getElementById("closePay").click();
			 var fd=new FormData();
				fd.append('custName',custName);
				fd.append('paidAmt',payableAmt);
				fd.append('payMode',payMode);
				fd.append('payableAmt',payableAmt);
				fd.append('discPer',discPer);
				fd.append('isSMS',isSMS);
				fd.append('key',key);
			  $.ajax({
		       url: '${pageContext.request.contextPath}/genrateSellBill',
		       type: 'POST',
		       data: fd,
		       dataType: 'json',
		       processData: false,
		       contentType: false, 
		       success: function(data, textStatus, jqXHR)
		       {
		    	   
		    	   $("#preloader").hide();
					  $("#status").hide();
		    	  
					// alert("printing else"+JSON.stringify(data));
					  //var loginWindow = window.open('', 'UserLogin');
					 
					 cancelBill();
						//document.getElementById("li"+token).style.backgroundColor = "white";
					  
					  //  alert("opened");
					   if(data.error==false){
						   window.open('${pageContext.request.contextPath}/pdfSellBillNewPos?billNo='+ data.message+'&type=R');
							alertify.success("Bill genrated successfully !!!");
						}else{
							alertify.error(data.message);
						}
						
						if(key>0){
							window.location = "${pageContext.request.contextPath}/newPos/0";
						}
						 //	
	                
					 
					 },
		       error: function(jqXHR, textStatus, errorThrown)
		       {
		           console.log('ERRORS: ' + textStatus);
		       }
		   });
			 
		 }
		
	}
	
	
	
	function printBillClick(){
		//alert("PrintBill");
		 var pAmt=document.getElementById("finalAmount").innerHTML;
		 document.getElementById("pAmt").value=pAmt;
		 var detail =document.getElementById("custId").value;
		 document.getElementById("paidAmt").value=pAmt;
		 
		  
		 		$.getJSON('${getItemList}',{ajax:true},function(data){
		 			if(data.length<1){
		 				//$('#empty_itemList').show()
		 				alertify.error("Please Select Atleast One Item To Genrate Bill!!!!!");
		 			}else{
		 				$('#empty_itemList').hide()
		 				printAndSubmit();
		 			}
		 		});
		 		
		 		 
	}
	
	
	function cancelBill(val){
		//alert(val)
		$.getJSON('${cancelBill}',
		{
			ajax:true
		},function(data){
		//	alert(data.length);
			if(data.length==0){
				//alert("0");
				 
				$('#itemTable tr').remove();
				
				var mainTrStr = '<tr>'
				+'<th style="text-align: center;" width="2%">Sr</th>'
				+'<th style="text-align: center;">Product</th>'
				+'<th style="text-align: center;" width="10%">QTY</th>' 
				+'<th style="text-align: center;" width="13%">Price</th>' 
				+'<th style="text-align: center;" width="13%">Total</th>'
				+'<th style="text-align: center;" width="2%">Del</th>'
				+'</tr>';
			var mainTr = $(mainTrStr);
			$('#itemTable tbody').append(
					mainTr);
			
				if(val>0){
					document.getElementById("custId").value=0;
					$("#custId").trigger("chosen:updated");
				}
			 	
				document.getElementById("totalCnt").innerHTML="";
				document.getElementById("totalAmt").innerHTML="";
				document.getElementById("totalTax").innerHTML="";
				document.getElementById("finalAmount").innerHTML="";
			}
			
			//document.getElementById().value="";
		});
	}

	
	</script>

	<script>
	//makes sure the whole site is loaded
	jQuery(window).load(function() {
		// will first fade out the loading animation
		jQuery("#status").fadeOut();
		// will fade out the whole DIV that covers the website.
		jQuery("#preloader").delay(0).fadeOut("slow");

	})
	  
 function billOnHold() {
		   
		var key =  $('#key').val() ;
		//var custId =  $('#cust').val() ;
		var custId =document.getElementById("custId").value;
		var rowcount = $('#itemTable tr').length;
		 
		//alert(rowcount)
	 if(rowcount>1){
		 
		  
		 if(custId!=""){
			 submitBillOnHold();
		 }else{
			 alertify.error("Select Customer");
		 }
		  
	 }else{
		 alertify.error("Add Minimum One Product");
	 }
		    
	}
	
	function revertHoldBillOnCurrent() {
		   
		var index =  $('#holdBillNo').val() ;
		  $
		.post(
				'${revertHoldBillOnCurrent}',
				{
					key : index,  
					ajax : 'true'
				},
				function(data) {
					  
					window.location = "${pageContext.request.contextPath}/newPos/1";
							 
				});   
	}
	
	function submitBillOnHold() {
		   
		var key =  $('#key').val() ;
		var custId =document.getElementById("custId").value;
		var holdCustName= $("#custId option:selected").text();

		//alert(custId);
				if(custId!="" || key>0 ){
					  
					  $.post(
							'${billOnHold}',
							{
								key : key, 
								custId : custId,
								holdCustName : holdCustName,
								ajax : 'true'
							},
							function(data) {
								
								window.location = "${pageContext.request.contextPath}/newPos/0";
										 
							});  
				}else{
					alertify.error("Select Customer");
					 
				}
			 
	}
	function cancelFromHoldBill(index) {
		   
		 
		  $
		.post(
				'${cancelFromHoldBill}',
				{
					key : index,  
					ajax : 'true'
				},
				function(data) {
					  
					window.location = "${pageContext.request.contextPath}/newPos/0";
							 
				});   
	}
	function isBuissness(value) {

		if (value == 1) {
			$("#isbuissnessdiv").show();
		} else {
			$("#isbuissnessdiv").hide();
		}

	}
	function validateMobile(mobile) {
		//alert(mobile);
		var mob = /^[1-9]{1}[0-9]{9}$/;

		if (mob.test($.trim(mobile)) == false) {

			//alert("Please enter a valid email address .");
			return false;

		}
		return true;

	}
	function trim(el) {
		el.value = el.value.replace(/(^\s*)|(\s*$)/gi, ""). // removes leading and trailing spaces
		replace(/[ ]{2,}/gi, " "). // replaces multiple spaces with one space 
		replace(/\n +/, "\n"); // Removes spaces after newlines
		return;
	}
	function modeOfPayDivHideShow(value) {

		if (value == 2) {
			$("#modeOfPayDiv").show();
		} else {
			 document.getElementById('single').checked = true;
			 changeSplitSingle(1);
			$("#modeOfPayDiv").hide();
			
			 let element = document.getElementById('billType');
			    element.value = 1;
			    
		}

	}
	function changeSplitSingle(value) {

		if (value == 2) {
			$("#splitDiv").show();
			$("#singleDiv").hide();
		} else {
			$("#singleDiv").show();
			$("#splitDiv").hide();
		}

	}
	function onPayTypeChange(type){
		if(type==1){
			$('#cardTypeDiv').hide();
			$('#epayTypeDiv').hide();
		}else
		if(type==2){
			$('#cardTypeDiv').show();
			$('#epayTypeDiv').hide();
			document.getElementById("cardType").value=4;
		}else if(type==3){
			$('#epayTypeDiv').show();
			$('#cardTypeDiv').hide();
			
			document.getElementById("ePayType").value=7;
		}
	}
	function submitBillByPaymentOption(printbilltype) {
		 
								var advAmt = 0;  
								var flagPayable=0;
								
								document.getElementById("credAmt").innerHTML="0.0";

								if (document.getElementById('split').checked) {
											
									var totalPayableAmt=parseFloat($('#totalPayableAmt').text());
									
									var cashAmt =  $('#cashAmt').val() ;
									var cardAmt =  $('#cardAmt').val() ;
									var epayAmt =  $('#epayAmt').val() ;
								 
									
									var epayLabel=parseFloat(cashAmt)+parseFloat(cardAmt)+parseFloat(epayAmt)
						 			 
								 if(totalPayableAmt==epayLabel){
									 
									 flagPayable=1;
								 }else{
									 
									 flagPayable=2;
								 }
								}
						 
								if(parseInt(flagPayable)==2 && document.getElementById('creditBillno').checked){
									alert("Please Enter the valid Bill Amount!!");
									
								}else{
								   
								var key =  $('#key').val() ;
								var custId =  $('#custId').val() ;
								var cashAmt =  $('#cashAmt').val() ;
								var cardAmt =  $('#cardAmt').val() ;
								var epayAmt =  $('#epayAmt').val() ;
								var billType =  $('#billType').val() ;
								var payType=0;var payTypeFlag=0; var payTypeSplit="0";var msg="";
								
								
								if(billType==1){
									payTypeFlag=0;
									payType=1;
								}else if(billType==2) {
									var cardType = $('#cardType option:selected').val();
									if(cardType=="")
										{
										payTypeFlag=1;
										msg="Please Select Pay Type( Card Type Or E-Pay type)";
										}
									payType=cardType;
									}else if(billType==3)
										{
										var ePayType =  $('#ePayType option:selected').val();
										if(ePayType=="")
										{
										payTypeFlag=1;
										msg="Please Select Pay Type( Card Type Or E-Pay type)";
										}
										payType=ePayType;
										} 
								var payAmt =  $('#payAmt').val() ;
								var frtype =  $('#frtype').val() ;
								var discPer =  $('#discPer').val() ;
								var discAmt =  $('#discAmt').val() ;
								
								var billAmtWtDisc;
								
								if(parseFloat(advAmt)>0){
								 
									billAmtWtDisc=parseFloat($('#totalAmtPopup').text())-parseFloat(advAmt);
								}else{
									billAmtWtDisc=parseFloat($('#totalAmtPopup').text())
								}
								
								
								var creditBill = 1;
								var single = 1;
								var selectedText = $("#cust option:selected").text(); 
								var flag=0;
								
								if (document.getElementById('creditBillno').checked) {
									creditBill = 2;
								}
								if (document.getElementById('split').checked) {
									single = 2;
									if(cashAmt>0){
										payTypeSplit=",1";
									}
									var cardTypeSplit = $('#cardTypeSplit option:selected').val();
									if(cardTypeSplit=="" && cardAmt>0)
										{
										msg="Please Select Card Type";
										payTypeFlag=1;
										}else if(cardAmt>0)
											{
											payTypeSplit=payTypeSplit+","+cardTypeSplit;
											}
									var ePayTypeSplit =  $('#ePayTypeSplit option:selected').val();
									if(ePayTypeSplit=="" && epayAmt>0)
									{
										msg="Please Select Card & E-pay Type";payTypeFlag=1;
									}else if(epayAmt>0)
									{
										payTypeSplit=payTypeSplit+","+ePayTypeSplit;
									}
								}
								
								if (cashAmt=="") {
									cashAmt=0;
								}
								if (cardAmt=="") {
									cardAmt=0;
								}
								if (epayAmt=="") {
									epayAmt=0;
								}
								if (discPer=="") {
									discPer=0;
								}
								if (discAmt=="") {
									discAmt=0;
								}
								
								if(creditBill==2 && single==1 && payAmt==""){
									alert("Please Enter Amount");
								}else
									if(payTypeFlag==1){
										alert(msg);
									}else{
									 $('#payment').popup('hide');
									  document.getElementById("overlay2").style.display = "block";
									  
									  var fd=new FormData();
										fd.append('key',key);
										fd.append('custId',custId);
												fd.append('creditBill',creditBill);
												fd.append('paymentMode',single);
											fd.append('billType',billType);
													fd.append('payType',payType);
												fd.append('payTypeSplit',payTypeSplit);
																fd.append('cashAmt',cashAmt);
													fd.append('cardAmt',cardAmt);
																	fd.append('epayAmt',epayAmt);
																fd.append('selectedText',selectedText);
																fd.append('payAmt',payAmt);
																	fd.append('discPer',discPer);
																	fd.append('discAmt',discAmt);
																	fd.append('billAmtWtDisc',billAmtWtDisc);
																	fd.append('advAmt',advAmt);
																	fd.append('remark',remark);
													
										
										  $.ajax({
										       url: '${pageContext.request.contextPath}/submitBillByPaymentOption',
										       type: 'POST',
										       data: fd,
										       dataType: 'json',
										       processData: false,
										       contentType: false, 
										       success: function(data, textStatus, jqXHR)
										       { 

													document.getElementById("discAmt").value=0;
													document.getElementById("discPer").value=0;
													 
													 if(key==0){
														 if(printbilltype==1){
																
															 //window.open('${pageContext.request.contextPath}/printKotBill/'+data.message,'_blank');
															 
															 var url="${pageContext.request.contextPath}/printKotBill/"+data.message;
																
															 $("<iframe>")                             
													        .hide()                               
													        .attr("src",url) 
													        .appendTo("body"); 
															 
															 
														}else if(printbilltype==2){
															 
															if(frtype<10000000){
																//window.open('${pageContext.request.contextPath}/printBillOfSupply/'+data.message,'_blank');
																
																 var url="${pageContext.request.contextPath}/printBillOfSupply/"+data.message;
																	
																 $("<iframe>")                             
														        .hide()                               
														        .attr("src",url) 
														        .appendTo("body"); 
																
															}else{
																//window.open('${pageContext.request.contextPath}/printBillOfInvoice/'+data.message,'_blank');
																
																 var url="${pageContext.request.contextPath}/printBillOfInvoice/"+data.message;
																	
																 $("<iframe>")                             
														        .hide()                               
														        .attr("src",url) 
														        .appendTo("body"); 
																
															}
														}
														 var defaultCustomer =  1;
															document.getElementById("custId").value = defaultCustomer;
															cancelBill(0); 
															$('.chosen-select').trigger(
															'chosen:updated');
															document.getElementById("overlay2").style.display = "none";	
															
															 
															 document.getElementById('creditBillno').checked = true;
															 document.getElementById('single').checked = true;
															 document.getElementById("cashAmt").value = 0; 
															 document.getElementById("cardAmt").value = 0; 
															 document.getElementById("epayAmt").value = 0; 
															 document.getElementById("payAmt").value = 0; 
															 $("#splitDiv").hide();
															 $("#singleDiv").show();
													 }else{
														 if(printbilltype==1){
																
															 //window.open('${pageContext.request.contextPath}/printKotBill/'+data.message,'_blank');
															 
															 var url="${pageContext.request.contextPath}/printKotBill/"+data.message;
																
															 $("<iframe>")                             
													        .hide()                               
													        .attr("src",url) 
													        .appendTo("body"); 
															 
														}else if(printbilltype==2){
															 
															if(frtype<10000000){
																//window.open('${pageContext.request.contextPath}/printBillOfSupply/'+data.message,'_blank');
																
																 var url="${pageContext.request.contextPath}/printBillOfSupply/"+data.message;
																	
																 $("<iframe>")                             
														        .hide()                               
														        .attr("src",url) 
														        .appendTo("body"); 
																
															}else{
																//window.open('${pageContext.request.contextPath}/printBillOfInvoice/'+data.message,'_blank');
																
																 var url="${pageContext.request.contextPath}/printBillOfInvoice/"+data.message;
																	
																 $("<iframe>")                             
														        .hide()                               
														        .attr("src",url) 
														        .appendTo("body"); 
																 
															}
														}
														 window.location = "${pageContext.request.contextPath}/newPos/0";
													 }
										    	   
										       },
										       error: function(jqXHR, textStatus, errorThrown)
										       {
										           console.log('ERRORS: ' + textStatus);
										       }
										   });
										  
									  
								} 
								}
								 
		 
	}
	
	function submitBill(printbilltype) {
		
		 
	   
							
							var advAmt = 0
							/* var advOrderDate = document.getElementById("advOrderDate").value;
							var isAdvanceOrder= document.getElementById("isAdvanceOrder").value; */
							var key =  $('#key').val() ;
							/* var key =  $('#advKey').val() ; */
							var custId =  $('#custId').val() ;
							var selectedText = $("#custId option:selected").text(); 
							document.getElementById("credAmt").innerHTML="0.0";

							var frtype =  $('#frtype').val() ;
							var rowcount = $('#itemTable tr').length;
							var flag = 0;
							   
							 if(rowcount<=1){
								 alertify.error("Add Minimum One Product");
								 flag=1;
							 }else if(custId==0 || custId==null){
								 flag=1;
								 alertify.error("Select customer.");
								 //alert("Select Customer");
							 }
							 
							 if(flag==0){
							 document.getElementById("overlay2").style.display = "block";
							   $
								.post(
										'${submitBill}',
										{
											key : key,  
											custId : custId,
					 						selectedText : selectedText,
					 						advAmt:advAmt,
					 						advOrderDate : '',
					 						isAdvanceOrder : 0,
											ajax : 'true'
										},
										function(data) {
											document.getElementById("discAmt").value=0;
											document.getElementById("discPer").value=0;
											  if(advAmt>0){
											 document.getElementById("advAmt").value = 0; 
											 document.getElementById("advBillLable").style.display = 'none';
											 document.getElementById("actionName").innerHTML= 'ADD BILL';
											  }
											  
											 // alert(key);
											  
												if(key==0){
													
													if(printbilltype==1){
														
														//alert("hiii");
														 
														//window.open('${pageContext.request.contextPath}/printKotBill/'+data.message,'_blank');
														 
														//alert("hi");
														//var url="${pageContext.request.contextPath}/printKotBill/"+data.message;
														//alert(url);
														
														 var url="${pageContext.request.contextPath}/printKotBill/"+data.message;
														
														 $("<iframe>")                             
												        .hide()                               
												        .attr("src",url) 
												        .appendTo("body");    
												        
												         
														
													}else if(printbilltype==2){
														 
														if(frtype<10000000){
															//window.open('${pageContext.request.contextPath}/printBillOfSupply/'+data.message,'_blank');
														
															var url="${pageContext.request.contextPath}/printBillOfSupply/"+data.message;
															
															 $("<iframe>")                             
													        .hide()                               
													        .attr("src",url) 
													        .appendTo("body");   
													        
														
														}else{
															//window.open('${pageContext.request.contextPath}/printBillOfInvoice/'+data.message,'_blank');
														
															var url="${pageContext.request.contextPath}/printBillOfInvoice/"+data.message;
															
															 $("<iframe>")                             
													        .hide()                               
													        .attr("src",url) 
													        .appendTo("body");   
														
														}
													}
													
													 	var defaultCustomer =  1;
													 	//alert(defaultCustomer)
													 	document.getElementById("custId").value = defaultCustomer;
													 	cancelBill(0); 
														$('.chosen-select').trigger(
														'chosen:updated');
														document.getElementById("overlay2").style.display = "none";	 
												 }else{
													 if(printbilltype==1){
															
														 //window.open('${pageContext.request.contextPath}/printKotBill/'+data.message,'_blank');
														 
														 var url="${pageContext.request.contextPath}/printKotBill/"+data.message;
															
														 $("<iframe>")                             
												        .hide()                               
												        .attr("src",url) 
												        .appendTo("body");   
														 
														 
													}else if(printbilltype==2){
														 
														if(frtype<10000000){
															//window.open('${pageContext.request.contextPath}/printBillOfSupply/'+data.message,'_blank');
															
															
															var url="${pageContext.request.contextPath}/printBillOfSupply/"+data.message;
															
															 $("<iframe>")                             
													        .hide()                               
													        .attr("src",url) 
													        .appendTo("body");  
															
														}else{
															//window.open('${pageContext.request.contextPath}/printBillOfInvoice/'+data.message,'_blank');
														
															var url="${pageContext.request.contextPath}/printBillOfInvoice/"+data.message;
															
															 $("<iframe>")                             
													        .hide()                               
													        .attr("src",url) 
													        .appendTo("body");  
														
														
														}
													}
													 
														// var defaultCustomer =  $('#defaultCustomer').val() ;
													 	//alert(defaultCustomer)
													 	document.getElementById("custId").value = 1;
													 	cancelBill(0); 
														$('.chosen-select').trigger(
														'chosen:updated');
														document.getElementById("overlay2").style.display = "none";	 
														document.getElementById("key").value = 0; 
														
														//alert();
														
													 
													 //window.location = "${pageContext.request.contextPath}/newcustomerbill/0";
												 }
											 
											 
											
										});    
							 }
								
								
							 
		
		
		
		
		  
	}
</script>
	<script type="text/javascript">
	
	function setCustAmt() {
		var cust =  $('#custId').val() ;
		//validateDefCustomer(cust);
		document.getElementById("credAmt").innerHTML = 0; 
		//document.getElementById("advCustAmt").innerHTML = 0;
		  $
		.get(
				'${getCustAmts}',
				{
					cust : cust,  
					ajax : 'true'
				},
				function(data) {
					//alert(data.creaditAmt);
					
					  
					document.getElementById("credAmt").innerHTML = parseFloat(data.creaditAmt).toFixed(2); 
					//document.getElementById("advCustAmt").innerHTML = data.advanceAmt; 
						 
				});   
	}
	
	
	function openMyModal(modalId,type) {
		var radiobtn ;
		
		document.getElementById("modType1").selectedIndex = "0"; 
		
		if(type==1){
			  radiobtn = document.getElementById("single12");
			radiobtn.checked = true;
			document.getElementById("popupType").value=1;//cust bills
			
			document.getElementById("deletedBillsRadio").style.display = "block";
			document.getElementById("allDeletedBillsRadio").style.display = "none";
			
			//alert("hi");
			getCustBills(1);
			//alert("Bye");

			
		}else if(type==2){
			
			document.getElementById("allDeletedBillsRadio").style.display = "block";
			
			radiobtn = document.getElementById("single12");
			radiobtn.checked = true;
			document.getElementById("popupType").value=2;//todays bills
			getCustBills(1);
			
			document.getElementById("deletedBillsRadio").style.display = "none";
			
		}else{
			
			document.getElementById("popupType").value=0;//otherwise
			document.getElementById("receivedAmt").value=0;
			
			document.getElementById("deletedBillsRadio").style.display = "none";
			document.getElementById("allDeletedBillsRadio").style.display = "none";
			$('#cardTypeDiv1').hide();
			$('#epayTypeDiv1').hide();
			document.getElementById("ePayType1").value="";
			document.getElementById("cardType1").value="";
		}
	
		//alert(type);
		 $('#'+modalId).popup('show');
	/*  var modal1 = document.getElementById(modalId);
	 modal1.style.display = "block";  */
	 showDetailsForCp();
	}
	function closeMyModal(modalId) {
		 
		 /* var modal1 = document.getElementById(modalId);
		 modal1.style.display = "none"; */
		 $('#'+modalId).popup('hide');
		 var date=document.getElementById('todaysDate').value;
		 //alert(date);
		 document.getElementById('dt').value=date;
		 
		 
		}
	function showDetailsForCp()  {
		var tr_count=0; 
		 // alert("in recv 0");
		 $("#scrollbarsmodaldiv").css("height", "30");
		  document.getElementById("total").value=0;

		var finTot = 0;
		   
		var custId = document.getElementById("custId").value;

		//var custtext = custId.options[custId.selectedIndex].innerHTML;
	 

		var creditAmt=document.getElementById("credAmt").innerHTML; 
		
		//document.getElementById('credCust').value=custtext;
			document.getElementById("penAmt").innerHTML = creditAmt; 

		//alert(custId);
	
		 
				 $.post('${getCustCreditBills}',
							{
								cust: custId,
								ajax: 'true'
							},
							function(data) {
								//alert(JSON.stringify(data));
								
								tr_count = data.length;

								$('#custCreditTable td').remove();
								
								$
								.each(
										data,
										function(key, data) {
											
											document.getElementById("credCust").innerHTML = data.userName; 
											document.getElementById("credCust1").value = data.userName; 
													var tr = $('<tr></tr>');

													 

														tr
																.append($(
																		'<td></td>')
																		.html(
																				"<input type=checkbox   name='chkItem'   value="+data.sellBillNo+"   id="+ data.sellBillNo+" >  <label for="+ data.sellBillNo+" ></label>"));

												 

													tr.append($('<td></td>')
															.html(key + 1));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			data.invoiceNo
																					+ ""
																					+ "<input type=hidden value='"+data.invoiceNo+"'  id=invoiceNo"+data.sellBillNo+"  name=invoiceNo"+data.sellBillNo+"  >"));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			data.billDate
																					+ ""
																					+ "<input type=hidden value='"+data.billDate+"'  id=billDate"+data.sellBillNo+"  name=billDate"+data.sellBillNo+"  >"));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			data.grandTotal
																					+ ""
																					+ "<input type=hidden value='"+data.grandTotal+"'  id=grandTotal"+data.sellBillNo+"  name=grandTotal"+data.sellBillNo+"  >"));
													
													
													tr
													.append($(
															'<td></td>')
															.html(
																	data.discountAmt
																			+ ""
																			+ "<input type=hidden value='"+data.discountAmt+"'  id=discAmt"+data.sellBillNo+"  name=discAmt"+data.sellBillNo+"  >"));
											
													
													tr
															.append($(
																	'<td></td>')
																	.html(
																			data.paidAmt
																					+ ""
																					+ "<input type=hidden value='"+data.paidAmt+"'  id=paidAmt"+data.sellBillNo+"  name=paidAmt"+data.sellBillNo+"  >"));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			data.remainingAmt
																					+ ""
																					+ "<input type=hidden value='"+data.remainingAmt+"'  id=remainingAmt"+data.sellBillNo+"  name=remainingAmt"+data.sellBillNo+"  >"));
 
													
													tr
													.append($(
															'<td></td>')
															.html(
																	"<input type=text onkeypress='return IsNumeric(event);'   style='width:100px;border-radius:25px; font-weight:bold;text-align:center;'  readonly ondrop='return false;' min='0'  onpaste='return false;' style='text-align: center;' class='form-control' name='settleAmt"
																			+ data.sellBillNo
																			+ "'  id=settleAmt"
																			+ data.sellBillNo
																			+ " value=0  /> &nbsp;  "));

													$('#custCreditTable tbody')
															.append(tr); 
													
														
										}); 
								//alert(tr_count);
				 				if(tr_count>0){
									 $("#scrollbarsmodaldiv").css("height", "240");
									 
									} 
							}); 
			
			 
	}
	
	function  getCustBills(tempType) {
		
		
		//alert(tempType);
		
		document.getElementById("overlay2").style.display = "block";
		
		var date = document.getElementById("dt").value;
		//alert(date);

		var custId = document.getElementById("custId").value;
		var tabType = document.getElementById("popupType").value;
			  var tr_count=0; 
			  
			 //alert("tabType= "+tabType);
			
		var ell = document.getElementById('custId');
		var text = ell.options[ell.selectedIndex].innerHTML;
		//alert(text);
					document.getElementById("custName1").innerHTML  ="&nbsp;&nbsp;"+ text;

		if(tabType!=2){
			document.getElementById("custName1").innerHTML  = "&nbsp;&nbsp;"+ text;
			
			$("#dateCust").show();
			$("#dateDiv").hide();

		}else{
			document.getElementById("custName1").innerHTML  ="&nbsp;nbsp;"+ text;
			$("#dateDiv").show();
			$("#dateCust").hide();
		}	
	if(tempType!=3)  {
		$("#modeofpay").hide();
		$("#remarkTh").hide();
		$("#trAction").show();
		$("#discTh").show();
		$("#payableTh").show();
		$("#payableTh")
		document.getElementById("billDateLabel").innerHTML = "Bill DATE";
		
				 $.post('${getCustBills}',
							{
								cust: custId,
								tempType: tempType,
								tabType: tabType,
								date:date,
								ajax: 'true'
							},
							function(data) {
								tr_count = data.length+1;

								//alert(JSON.stringify(data));
			                        document.getElementById("overlay2").style.display = "";

								$('#custTable td').remove();
								$
								.each(
										data,
										function(key, data) {
											
											var invNo=data.invoiceNo+"--"+data.billType;
											if(tabType==2){
												invNo=invNo+" ("+data.userName+")";
											}
										/* 	var payType="";
											
											if(data.paymentMode==1){
												payType="Cash";
											}else if(data.paymentMode==2){
												payType="Card";
											}else{
												payType="Other";
											} */
											
										//	document.getElementById("credCust").innerHTML = data.userName; 

														var tr = $('<tr id="bill'+data.sellBillNo+'"></tr>');
														//tr.append($('<td ></td>').html(key + 1));
														
														tr_count=tr_count-1;
														tr.append($('<td ></td>').html(tr_count));
														
														
														tr.append($('<td ></td>').html(invNo));
														tr.append($('<td ></td>').html(data.billDate));
														tr.append($('<td ></td>').html(data.grandTotal));
														tr.append($('<td ></td>').html(data.discountAmt));
														tr.append($('<td ></td>').html(data.grandTotal-data.discountAmt));
														tr.append($('<td ></td>').html(data.paidAmt));
														tr.append($('<td ></td>').html(data.remainingAmt));
													/* 	tr.append($('<td ></td>').html("NA")); */
													var arrStartDate = data.billDate.split("-"); 
                                                     var billDateJs = new Date(arrStartDate[2], (arrStartDate[1]-1), arrStartDate[0]).setHours(0,0,0,0);
                                                     var currentDateJs = new Date().setHours(0,0,0,0);

													if(tempType==1 && tabType==2){
														
														var adminDesg=${sessionScope.frEmpDetails.designation};
														adminDesg=0;
														var sessionEmpId=${sessionScope.frEmpDetails.frEmpId};
														/* 
														if(adminDesg==1){
															tr.append($('<td ></td>').html('<a href="#" onclick="showCustBillForEdit('+data.sellBillNo+','+data.custId+',0)"  ><abbr title="Edit"><i class="fa fa-pencil"></i></abbr></span></a> &nbsp;&nbsp;  <a href="#" onclick="custBillPdf('+data.sellBillNo+')" ><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></span></a> &nbsp;&nbsp;<a href="#" onclick="deleteSellBill('+data.sellBillNo+')"><abbr title="Delete"><i class="fa fa-trash"></i></abbr></a>'));
														}else  */
														if(sessionEmpId==data.extInt1 && billDateJs.valueOf() == currentDateJs.valueOf()){
															tr.append($('<td ></td>').html('<a href="#" onclick="showCustBillForEdit('+data.sellBillNo+','+data.custId+',0)"  ><abbr title="Edit"><i class="fa fa-pencil"></i></abbr></span></a> &nbsp;&nbsp;  <a href="#" onclick="custBillPdf('+data.sellBillNo+')" ><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></span></a> &nbsp;&nbsp;<a href="#" onclick="deleteSellBill('+data.sellBillNo+')"><abbr title="Delete"><i class="fa fa-trash"></i></abbr></a>'));
														}else{
															tr.append($('<td ></td>').html('<a href="#" onclick="custBillPdf('+data.sellBillNo+')" ><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></span></a> '));
														}
														
														
														//tr.append($('<td ></td>').html('<a href="#" onclick="showCustBillForEdit('+data.sellBillNo+','+data.custId+',0)"  ><abbr title="Edit"><i class="fa fa-pencil"></i></abbr></span></a> &nbsp;&nbsp;  <a href="#" onclick="custBillPdf('+data.sellBillNo+')" ><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></span></a> &nbsp;&nbsp;<a href="#" onclick="deleteSellBill('+data.sellBillNo+')"><abbr title="Delete"><i class="fa fa-trash"></i></abbr></a>'));
													}
													else if(tempType==1 && tabType==1){
														
														var adminDesg=${sessionScope.frEmpDetails.designation};
														adminDesg=0;
														var sessionEmpId=${sessionScope.frEmpDetails.frEmpId};
														 if(sessionEmpId==data.extInt1 && billDateJs.valueOf() == currentDateJs.valueOf()){
															tr.append($('<td ></td>').html('<a href="#" onclick="custBillPdf('+data.sellBillNo+')" ><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></span></a>&nbsp;&nbsp;<a href="#" onclick="deleteSellBill('+data.sellBillNo+')"><abbr title="Delete"><i class="fa fa-trash"></i></abbr></a>'));
														}else{
															tr.append($('<td ></td>').html('<a href="#" onclick="custBillPdf('+data.sellBillNo+')" ><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></span></a> '));
														}
														
														
														//tr.append($('<td ></td>').html('<a href="#" onclick="showCustBillForEdit('+data.sellBillNo+','+data.custId+',0)"  ><abbr title="Edit"><i class="fa fa-pencil"></i></abbr></span></a> &nbsp;&nbsp; <a href="#" onclick="custBillPdf('+data.sellBillNo+')" ><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></span></a> &nbsp;&nbsp;<a href="#" onclick="deleteSellBill('+data.sellBillNo+')"><abbr title="Delete"><i class="fa fa-trash"></i></abbr></a>'));
													}
													else if(tempType==4 || tempType==5){
														tr.append($('<td ></td>').html(' '));
													}else{
														
														var adminDesg=${sessionScope.frEmpDetails.designation};
														adminDesg=0;
														var sessionEmpId=${sessionScope.frEmpDetails.frEmpId};
														
														/* if(adminDesg==1){
															tr.append($('<td ></td>').html('<a href="#" onclick="custBillPdf('+data.sellBillNo+')" ><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></span></a> &nbsp;&nbsp;'));
														}else */
														if(sessionEmpId==data.extInt1 && billDateJs.valueOf() == currentDateJs.valueOf()){
															tr.append($('<td ></td>').html('<a href="#" onclick="custBillPdf('+data.sellBillNo+')" ><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></span></a>&nbsp;&nbsp;<a href="#" onclick="deleteSellBill('+data.sellBillNo+')"><abbr title="Delete"><i class="fa fa-trash"></i></abbr></a>'));
														}else{
															tr.append($('<td ></td>').html('<a href="#" onclick="custBillPdf('+data.sellBillNo+')" ><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></span></a> '));
														}
														
														
														//tr.append($('<td ></td>').html('<a href="#" onclick="custBillPdf('+data.sellBillNo+')" ><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></span></a> &nbsp;&nbsp;<a href="#" onclick="deleteSellBill('+data.sellBillNo+')"><abbr title="Delete"><i class="fa fa-trash"></i></abbr></a>'));
													}
														
														$('#custTable tbody').append(tr);
													 
										}); 
								
								 
								
								if(tr_count>0){
									 $("#scrollbarsmodaldiv").css("height", "240");
									 
									} 

							}); 
	  }else{
		  
			$("#modeofpay").show();
			$("#remarkTh").show();
			$("#trAction").hide();
			$("#discTh").show();
			$("#payableTh").hide();
			document.getElementById("billDateLabel").innerHTML = "TRANSACTION DATE";
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth() + 1; //January is 0!

			var yyyy = today.getFullYear();
			if (dd < 10) {
			  dd = '0' + dd;
			} 
			if (mm < 10) {
			  mm = '0' + mm;
			} 
			var today = dd + '-' + mm + '-' + yyyy;
			 $.post('${getCustBillsTransaction}',
						{
							cust: custId,
							tempType: tempType,
							tabType: tabType,
							date:date,
							ajax: 'true'
						},
						function(data) {
							
							//alert(tabType+" ----------- "+tempType)
							
							tr_count = data.length+1;
							document.getElementById("overlay2").style.display = "";

							//alert(JSON.stringify(data));

							$('#custTable td').remove();
							$
							.each(
									data,
									function(key, data) {
										
									   var payType="";
										var paidAmount=parseFloat(data.cashAmt)+parseFloat(data.cardAmt)+parseFloat(data.ePayAmt);
										//alert(data.exVar1);
										/* if(data.exVar1=="0,1,2,3"){
											payType="Cash,Card,e-Pay";
												
										}else if(data.exVar1=="0,1,2"){
											payType="Cash,Card";
											}else if(data.exVar1=="0,1,3"){
												payType="Cash,e-Pay";
											}else if(data.exVar1=="0,2,3"){
												payType="Card,e-Pay";
											}
											else if(data.exVar1=="0,2"){
												payType="Card";
											}
											else if(data.exVar1=="0,3"){
												payType="e-Pay";
											}
											else if(data.exVar1=="0,1"){
												payType="Cash";
											}else{   payType="Credit";} */
										if(data.exVar1=="0" || data.exVar1=="0," ){
											payType="Credit Bill";
												
										}else{
										var str_arr = data.exVar1.split(',');
										//alert(str_arr);

										for (i = 0; i < str_arr.length; i++) { 
											
											/*  if(str_arr[i] === "0"){
												   //payType=payType+",Credit";  
												   payType="Credit";
												   alert("0");
												} */
											 
											
										   if(str_arr[i] === "1"){
												payType="Cash("+data.cashAmt+")";
												//payType=payType+",Cash("+data.cashAmt+")";  
										   }
										   if(str_arr[i] === "2"){
											   payType=payType+",Card("+data.cardAmt+")";
										   }
										   if(str_arr[i] === "3"){
											   payType=payType+",Epay("+data.ePayAmt+")";
										   }
										   if(str_arr[i] === "4"){
											   payType=payType+",Debit Card("+data.cardAmt+")";
										   }
										   if(str_arr[i] === "5"){
											   payType=payType+",Credit Card("+data.cardAmt+")"; 
										   }
										   if(str_arr[i] === "6"){
											   payType=payType+",Bank Transaction("+data.ePayAmt+")";  
										   }
										   if(str_arr[i] === "7"){
											   payType=payType+",Paytm("+data.ePayAmt+")"; 
										   }
										   if(str_arr[i] === "8"){
											   payType=payType+",Google Pay("+data.ePayAmt+")"; 
										   }
										   if(str_arr[i] === "9"){
											   payType=payType+",Amazon Pay("+data.ePayAmt+")";  
										   }
										  
										   
										  
										}
										var resultPayType = (payType[0] == ',') ? payType.substr(1) : payType;

										}
													var tr = $('<tr></tr>');
													//tr.append($('<td ></td>').html(key + 1));
													tr_count=tr_count-1;
														tr.append($('<td ></td>').html(tr_count));
													
													tr.append($('<td ></td>').html(data.exVar2));
													tr.append($('<td ></td>').html(data.transactionDate));
													tr.append($('<td ></td>').html(data.exFloat1));
													tr.append($('<td ></td>').html(Math.round(data.discAmt)));
													tr.append($('<td ></td>').html(paidAmount));
													tr.append($('<td ></td>').html(data.exFloat2));
													tr.append($('<td class="gradient-multiline"></td>').html(resultPayType));
													tr.append($('<td ></td>').html(data.remark));
													
													$('#custTable tbody').append(tr);
									}); 
							
							 
							
							if(tr_count>0){
								 $("#scrollbarsmodaldiv").css("height", "240");
								 
								} 

						}); 
	  }

	}
	
	function fetchRecord(){
		
		//alert("hi");

	 var bills=document.getElementById("single12");
	var tr=document.getElementById("split12");
	var pending=document.getElementById("single22");
	var deleted=document.getElementById("deleted13");

	if(bills.checked==true){
		getCustBills(1);
	}else if(tr.checked==true){
		getCustBills(3);
	}else if(pending.checked==true){
		getCustBills(2);
	}else if(deleted.checked==true){
		getCustBills(5);
	} 
	 
	}
	
	function onPayTypeChange1(type){
		if(type==1){
			$('#cardTypeDiv1').hide();
			$('#epayTypeDiv1').hide();
		}else
		if(type==2){
			$('#cardTypeDiv1').show();
			$('#epayTypeDiv1').hide();
			document.getElementById("cardType1").value=4;
		}else if(type==3){
			$('#epayTypeDiv1').show();
			$('#cardTypeDiv1').hide();
			document.getElementById("ePayType1").value=7;
		}
	}
	function  settleCustBill() {
		
		
		var tr_count=0; 
		var finTot = 0;
		var custId = document.getElementById("custId").value;
		//var custtext = custId.options[custId.selectedIndex].innerHTML;
		var creditAmt=document.getElementById("credAmt").innerHTML; 
		
		//document.getElementById('credCust').value=custtext;				

			document.getElementById("penAmt").innerHTML = creditAmt; 
			var x = document.getElementById("receivedAmt").value;
		var pendingAmtInt=(parseInt(creditAmt));
		var receivedAmtInt=(parseInt(x));
	if(x=="" || x==null)
		{
		 alert("Please Enter Valid Recieved Amount!!")
		 var total=document.getElementById("total").value;
		 document.getElementById("receivedAmt").value=total;
		}
	else if(receivedAmtInt>pendingAmtInt){
		document.getElementById("receivedAmt").value=0;
		 alert("Entered Amount is greater than Pending Bill Amount!!");
		 settleCustBill();
	}else{
			document.getElementById("total").value=0;
			
			//alert("hi");
			
				 $.post('${getCustCreditBills}',
							{
								cust: custId,
								ajax: 'true'
							},
							function(data) {

								//alert(JSON.stringify(data));
								tr_count = data.length;

								$('#custCreditTable td').remove();
					$.each(data,
										function(key, data) {
						
						//alert(data);
											
											document.getElementById("credCust").innerHTML = data.userName;
											document.getElementById("credCust1").value = data.userName;
											document.getElementById("creditCustId").value = data.custId; 
											

											var flag = 0;
											var y = 0;
											var tot = document.getElementById("total").value;
										
											
											var rcvAmt = document.getElementById("receivedAmt").value;
											//alert("tot" + tot);
											//alert("expAmt"+expAmt);
											 
												if ((parseFloat(tot) + parseFloat(data.remainingAmt)) > parseFloat(rcvAmt)) {
													//alert("ist gret");

													y = (parseFloat(tot) + parseFloat(data.remainingAmt))
															- parseFloat(rcvAmt);
													//alert("ist gret"+ y);
													flag = 1;
												}
										 
													var tr = $('<tr></tr>');

													if ((parseFloat(data.remainingAmt) <= parseFloat(rcvAmt) || flag == 1 ) && (parseFloat(rcvAmt) > parseFloat(tot))  ) {

														tr
																.append($(
																		'<td></td>')
																		.html(
																				"<input type=checkbox   name='chkItem'  checked  value="+data.sellBillNo+"   id="+ data.sellBillNo+" >  <label for="+ data.sellBillNo+" ></label>"));

													}else{
														tr
														.append($(
																'<td></td>')
																.html(
																		"<input type=checkbox   name='chkItem'   value="+data.sellBillNo+"   id="+ data.sellBillNo+" >  <label for="+ data.sellBillNo+" ></label>"));
													}

													
													
													tr.append($('<td></td>')
															.html(key + 1));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			data.invoiceNo
																					+ ""
																					+ "<input type=hidden value='"+data.invoiceNo+"'  id=invoiceNo"+data.sellBillNo+"  name=invoiceNo"+data.sellBillNo+"  >"));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			data.billDate
																					+ ""
																					+ "<input type=hidden value='"+data.billDate+"'  id=billDate"+data.sellBillNo+"  name=billDate"+data.sellBillNo+"  >"));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			data.grandTotal
																					+ ""
																					+ "<input type=hidden value='"+data.grandTotal+"'  id=grandTotal"+data.sellBillNo+"  name=grandTotal"+data.sellBillNo+"  >"));
													
													
													tr
													.append($(
															'<td></td>')
															.html(
																	data.discountAmt
																			+ ""
																			+ "<input type=hidden value='"+data.discountAmt+"'  id=discAmt"+data.sellBillNo+"  name=discAmt"+data.sellBillNo+"  >"));
											
											
													
												
													tr
															.append($(
																	'<td></td>')
																	.html(
																			data.paidAmt
																					+ ""
																					+ "<input type=hidden value='"+data.paidAmt+"'  id=paidAmt"+data.sellBillNo+"  name=paidAmt"+data.sellBillNo+"  >"));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			data.remainingAmt
																					+ ""
																					+ "<input type=hidden value='"+data.remainingAmt+"'  id=remainingAmt"+data.sellBillNo+"  name=remainingAmt"+data.sellBillNo+"  >"));

													if (flag == 0) {
														
														//alert("in if");

														tr
																.append($(
																		'<td></td>')
																		.html(
																				"<input type=text onkeypress='return IsNumeric(event);'   style='width:100px;border-radius:25px; font-weight:bold;text-align:center;'  readonly ondrop='return false;' min='0'  onpaste='return false;' style='text-align: center;' class='form-control' name='settleAmt"
																						+ data.sellBillNo
																						+ "'  id=settleAmt"
																						+ data.sellBillNo
																						+ " value="
																						+ data.remainingAmt
																						+ "  /> &nbsp;  "));

													 
															finTot = parseFloat(data.remainingAmt)
																	+ (parseFloat(finTot));
															document
																	.getElementById("total").value = finTot
																	.toFixed(3);
														 
														$("#chkItem").prop(
																"disabled",
																true);
													}

													else {
														
														//alert("in else");
														var fin = parseFloat(data.remainingAmt)
														- (parseFloat(y));
														
														//alert("fin"+fin);
											
														tr
																.append($(
																		'<td></td>')
																		.html(
																				"<input type=text onkeypress='return IsNumeric(event);'   style='width:100px;border-radius:25px; font-weight:bold;text-align:center;'  readonly ondrop='return false;' min='0'  onpaste='return false;' style='text-align: center;' class='form-control' name='settleAmt"
																						+ data.sellBillNo
																						+ "'  id=settleAmt"
																						+ data.sellBillNo
																						+ " value="
																						+ fin
																						+ "  /> &nbsp;  "));

													
													 
															finTot = fin
																	+ (parseFloat(finTot));
															//alert("finTot"+finTot);
															document.getElementById("total").value = finTot
																	.toFixed(3);
															
														
													 
														$("#chkItem").prop(
																"disabled",
																true);
													}
													
													
													$('#custCreditTable tbody')
															.append(tr); 
													
													
										}); 
								
								if (parseFloat(	document.getElementById("total").value) <= parseFloat(document
										.getElementById("receivedAmt").value)) {
									$("#sbtbtn").prop("disabled", false);

								}  
								
								if(tr_count>0){
									 $("#scrollbarsmodaldiv").css("height", "240");
									 
									} 

							}); 
		}
	 
	}
	
	$('#sbtbtn').click(function() {
		
		var billType =  $('#modType1').val() ;
		//alert(billType);
		
		var isValid=0;
		
		if(billType==2) {
			var cardType = $('#cardType1 option:selected').val();
			if(cardType=="") {
				alert("Please Select Card Type");
			}else{
				isValid=1;
			}
		}else if(billType==3) {
			var ePayType =  $('#ePayType1 option:selected').val();
			if(ePayType=="") {
				alert("Please Select E-Pay Type");
			}else{
				isValid=1;
			}
		}else if(billType==1) {
			isValid=1;
		}
		
		
		if(isValid==1){
		
		
		
		if(document.getElementById("receivedAmt").value>0){
			//alert("hi");
			document.getElementById("overlay2").style.display = "block";
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/submitResposeCredit",
			data : $("#modalfrm1").serialize(),
			dataType : 'json',
			success : function(data) {
				if (data == 2) {
					$('#custCreditTable td').remove();
					document.getElementById("overlay2").style.display = "";
					alert("Updated Successfully")
					$("#overlay").fadeOut(300);
					setCustAmt();
					document.getElementById("sbtbtn").disabled="disabled";
					document.getElementById("receivedAmt").value="0";
					closeMyModal('myModalForCredit');
					document.getElementById("credAmt").innerHTML="0.0";
					
					
					var url="${pageContext.request.contextPath}/printCreditBill";
					
					 $("<iframe>")                             
			        .hide()                               
			        .attr("src",url) 
			        .appendTo("body"); 
					
					
				}
			}
		}).done(function() {
			setTimeout(function() {
				$("#overlay").fadeOut(300);
			}, 500);
		});
		}else {
			alert("Please Enter Valid Received Amount!!")
		}
		
	}
	});
	</script>
</body>

</html>