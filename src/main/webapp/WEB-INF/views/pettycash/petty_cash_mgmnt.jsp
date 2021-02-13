<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">

<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/feviconicon.png"
	type="image/x-icon" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loader.css">


<style>
table, th, td {
	border: 1px solid #9da88d;
}
</style>
<style>
.alert1 {
	padding: 10px;
	background-color: #f44336;
	color: white;
}

.closebtn {
	margin-left: 25px;
	color: white;
	font-weight: bold;
	float: right;
	font-size: 18px;
	line-height: 10px;
	cursor: pointer;
	transition: 0.3s;
}

.closebtn:hover {
	color: black;
}

.form-control {
	text-align: left !important;
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

.ui-widget.ui-widget-content {
	position: relative;
	z-index: 10000 !important;
}
</style>

<body onload="calClosingAmt()">

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<!--datepicker-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<script>
		/* 	$(function() {
				$("#fromdatepicker").datepicker({
					dateFormat : 'dd-mm-yy'
				});
			}); */
		$(function() {
			$("#todatepicker").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});

		$(function() {
			$("#fromDate").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});

		$(function() {
			$("#toDate").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>
	<!--datepicker-->


	<c:url var="getPettyCashData" value="/getPettyCashData"></c:url>
	<c:url var="getPettyCashHandOverData" value="/getPettyCashHandOverData"></c:url>

	<!--topLeft-nav-->
	<div class="sidebarOuter"></div>
	<!--topLeft-nav-->

	<!--wrapper-start-->
	<div class="wrapper">

		<!--topHeader-->


		<jsp:include page="/WEB-INF/views/include/logo.jsp"></jsp:include>


		<!--topHeader-->





		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2 single">

				<!--leftNav-->

				<jsp:include page="/WEB-INF/views/include/left.jsp">
					<jsp:param name="myMenu" value="${menuList}" />
				</jsp:include>


				<!--leftNav-->
				<div class="colOuter">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<c:if test="${not empty message}">
							<div class="alert1">
								<span class="closebtn"
									onclick="this.parentElement.style.display='none';">&times;</span>
								${message}
							</div>
						</c:if>
					</div>
				</div>

				<!--rightSidebar-->
				<div class="sidebarright">

					<div class="row" style="margin: 0 0 20px 0;">
						<div class="col-md-6">

							<h2 class="pageTitle">
								<i class="fa fa-suitcase" aria-hidden="true"></i> Petty Cash
								Management
							</h2>
							<!--<h3 class="pageTitle2">Order Date : 22-02-2017 </h3>-->

						</div>
						<div class="col-md-6">
							<div align="right">

								<a
									href="${pageContext.request.contextPath}/getPettyCashTransactions"><input
									type="button" value="Petty Cash Details"
									class="btn additem_btn" style="margin: 0;"> </a>
							</div>
						</div>
					</div>



					<form action="${pageContext.request.contextPath}/addPettyCash"
						method="post"
						onsubmit="return confirm('Do you want to Day End ?');">
						<input type="hidden" value="${pettycash.pettycashId}"
							name="petty_id"> <input type="hidden"
							value="${pettycash.cashAmt}" name="cash_edit_amt">

						<div class="row">
							<div class="col-md-2" style="margin: 10px 0 0 0;">Date</div>
							<div class="col-md-2">
								<input id="fromdatepicker" class="texboxitemcode texboxcal"
									autocomplete="off" placeholder="Date" name="cash_date"
									type="text" value="${pettycash.date}" readonly="readonly">
							</div>

							<div class="col-md-2" style="margin: 10px 0 0 0;">Opening
								Amt</div>
							<div class="col-md-2">

								<fmt:formatNumber type="number" maxFractionDigits="0"
									minFractionDigits="0" value="${pettycash.openingAmt}"
									groupingUsed="false" var="openingAmt" />

								<input id="opening_amt" class="form-control" readonly="readonly"
									value="${openingAmt}" autocomplete="off"
									placeholder="Opening Amt" name="opening_amt" type="text">
							</div>

							<div class="col-md-2" style="margin: 10px 0 0 0;">Today's
								Amt</div>
							<div class="col-md-2">

								<fmt:formatNumber type="number" maxFractionDigits="0"
									minFractionDigits="0"
									value="${trCashAmt+advAmt-expAmt-creditNote}"
									groupingUsed="false" var="todaysBillTotal" />

								<input id="cash_amt" class="form-control"
									value="${todaysBillTotal}" autocomplete="off"
									placeholder="Cash Amt" name="cash_amt"
									onchange="calClosingAmt()" type="text" readonly="readonly">
							</div>

							<div style="clear: both;"></div>

							<div class="col-md-2" style="margin: 30px 0 0 0;">Withdrawal
								Amt</div>
							<div class="col-md-2" style="margin: 30px 0 0 0;">
								<input id="withdrawal_amt" class="form-control"
									value="${pettycash.withdrawalAmt}" autocomplete="off"
									placeholder="Withdrawal Amt" name="withdrawal_amt" type="text"
									onblur="calClosingAmt()"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							</div>


							<div class="col-md-2" style="margin: 30px 0 0 0;">Closing
								Amt</div>
							<div class="col-md-2" style="margin: 30px 0 0 0;">
								<input id="closing_amt" class="form-control" readonly="readonly"
									autocomplete="off" placeholder="Closing Amt" name="closing_amt"
									type="text">
							</div>


							<div class="col-md-4"
								style="margin: 30px 0 0 0; text-align: right;">
								<c:if test="${isDayEnd==1}">
									<input class="buttonsaveorder" value="Day End" type="submit"
										id="btnsub">
								</c:if>

								<c:if test="${isDayEnd==0}">
									<input class="buttonsaveorder" value="Day End" type="submit"
										id="btnsub" style="display: none;">
								</c:if>


								<input class="btn additem_btn" value="Cash Hand Over"
									style="margin-top: 0%" type="button" id="show">
							</div>

						</div>

					</form>


					<div class="second_titlerow" id="pc_div" style="display: none;">
						<br>
						<hr>
						<div class="row" style="margin: 0 0 20px 0;">
							<div class="col-md-6">

								<h2 class="pageTitle" style="margin-top: 20px;">
									<i class="fa fa-suitcase" aria-hidden="true"></i> Petty Cash
									Hand Over
								</h2>
								<!--<h3 class="pageTitle2">Order Date : 22-02-2017 </h3>-->

							</div>
							<div class="col-md-6" style="text-align: right;">

								<a href="#"><input type="button"
									value="Cash Hand Over Details" id="popbtn"
									class="btn additem_btn" style="display: none;"
									onclick="openPopup()"> </a>
							</div>
						</div>



						<form action="insertPettyCashHandOver" method="POST"
							id="petty_cash_hand" name="petty_cash_hand">
							<fmt:formatNumber type="number" maxFractionDigits="0"
								minFractionDigits="0" value="${pettycash.openingAmt}"
								groupingUsed="false" var="handoverOpeningAmt" />

							<fmt:formatNumber type="number" maxFractionDigits="0"
								minFractionDigits="0"
								value="${trCashAmt+advAmt-expAmt-creditNote}"
								groupingUsed="false" var="sellingTotal" />

							<fmt:formatNumber type="number" maxFractionDigits="0"
								minFractionDigits="0"
								value="${pettycash.openingAmt+trCashAmt+advAmt-expAmt-creditNote}"
								groupingUsed="false" var="handOverTotal" />

							<fmt:formatNumber type="number" maxFractionDigits="0"
								minFractionDigits="0"
								value="${pettycash.openingAmt+trCashAmt+advAmt-expAmt-creditNote}"
								groupingUsed="false" var="actHandOverTotal" />

							<div class="row">

								<div class="col-md-2" style="margin: 10px 0 0 0;">Opening
									Amt</div>
								<div class="col-md-2">
									<input id="open_amt" class="form-control"
										value="${handoverOpeningAmt}" autocomplete="off"
										placeholder="Opening Amt" name="open_amt" readonly="readonly"
										type="text">
								</div>

								<div class="col-md-2" style="margin: 10px 0 0 0;">Selling
									Amt</div>
								<div class="col-md-2">
									<input id="sell_amt" class="form-control"
										value="${sellingTotal}" autocomplete="off"
										placeholder="Selling Amt" name="sell_amt" readonly="readonly"
										type="text">
								</div>


								<div class="col-md-2" style="margin: 10px 0 0 0;">Total
									Cash Hand Over Amt</div>
								<div class="col-md-2">
									<input id="total_cash_amt" class="form-control"
										value="${handOverTotal}" autocomplete="off"
										placeholder="Total Cash Amt" name="total_cash_amt"
										readonly="readonly" type="text">
								</div>


							</div>

							<div class="row">

								<div class="col-md-2" style="margin: 30px 0 0 0;">Actual
									Cash Hand Over Amt</div>
								<div class="col-md-2" style="margin: 30px 0 0 0;">
									<input id="actual_cash_amt" class="form-control"
										value="${actHandOverTotal}" autocomplete="off"
										placeholder="Actual Cash Amt" name="actual_cash_amt"
										type="text">
								</div>

								<div class="col-md-2" style="margin: 30px 0 0 0; display: none;">From
									Employee</div>
								<div class="col-md-2" style="margin: 30px 0 0 0; display: none;">
									<select name="from_emp" id="from_emp" class="form-control"
										required>
										<option style="text-align: left;" value="0">Select
											Employee</option>
										<c:forEach items="${empList}" var="empList">
											<c:if test="${frId == empList.frEmpId}"></c:if>
											<option selected="selected"
												value="${empList.frEmpId}-${empList.frEmpName}"
												style="text-align: left;">${empList.frEmpName}</option>
										</c:forEach>
									</select>
								</div>

								<div class="col-md-2" style="margin: 30px 0 0 0;">To
									Employee</div>
								<div class="col-md-2" style="margin: 30px 0 0 0;">
									<select name="to_emp" id="to_emp" class="chosen-select"
										data-live-search="true" required>
										<option style="text-align: left;" value="0">Select
											Employee</option>
										<c:forEach items="${empList}" var="empList">
											<c:if test="${empList.frEmpId != loginEmpId}">
												<option value="${empList.frEmpId}-${empList.frEmpName}"
													style="text-align: left;">${empList.frEmpName}</option>
											</c:if>
										</c:forEach>

									</select>

								</div>

								<div class="col-md-4"
									style="margin: 30px 0 0 0; text-align: right;">

									<input class="buttonsaveorder" value="Submit" type="submit"
										id="btnsub2"> <input class="buttonsaveorder redbtn"
										value="Close" type="button" id="hide">

								</div>


							</div>


						</form>
					</div>


				</div>

			</div>
		</div>

		<!--rightSidebar-->

	</div>
	<!--fullGrid-->
	</div>
	<!--rightContainer-->

	</div>
	<!--wrapper-end-->




	<!-- MODAL----------------------------- --->

	<div id="handoverModal" class="modal">
		<div id="overlay">
			<div class="clock"></div>
		</div>

		<div class="modal-content" style="width: 75%; padding: 2%;">
			<span class="close" onclick="closePopup()" style="opacity: 2;">&times;</span>
			<br>

			<div class="row">

				<div class="col-md-12">
					<h3 class="pop_head">Petty Cash Hand Over Transaction</h3>
				</div>

			</div>
			<hr>
			<br>
			<div class="row" style="margin-left: 0%">

				<div class="row">

					<div class="col-md-2" style="text-align: center;">From Date</div>

					<div class="col-md-3">


						<input id="fromDate" class="texboxitemcode texboxcal"
							autocomplete="off" placeholder="Date" name="fromDate" type="text"
							value="${dateForSearch}">
					</div>

					<div class="col-md-2" style="text-align: center;">To Date</div>

					<div class="col-md-3">
						<input id="toDate" class="texboxitemcode texboxcal"
							autocomplete="off" placeholder="Date" name="toDate" type="text"
							value="${dateForSearch}">

					</div>

					<div class="col-md-2">
						<input class="buttonsaveorder" value="Search" type="button"
							onclick="getData()" id="search">
					</div>

				</div>

				<div class="row" style="text-align: center;">
					<div align="center" id="loader" style="display: none">

						<span>
							<h4>
								<font color="#343690">Loading</font>
							</h4>
						</span> <span class="l-1"></span> <span class="l-2"></span> <span
							class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
						<span class="l-6"></span>
					</div>
				</div>

				<br>

				<div class="row" style="margin-right: 0px; margin-left: 0px;">

					<div id="table-scroll" class="table-scroll responsive-table-one">
						<!-- class="table-scroll" -->
						<div>
							<!--  class="table-wrap" -->
							<table id="table_grid" class="responsive-table">
								<!-- class="main-table" -->
								<thead>
									<tr class="bgpink">
										<th style="text-align: center;">Sr. No</th>
										<th style="text-align: center;">Transaction Date</th>
										<th style="text-align: center;">From Employee</th>
										<th style="text-align: center;">To Employee</th>
										<th style="text-align: center;">Opening Amt</th>
										<th style="text-align: center;">Selling Amt</th>
										<th style="text-align: center;">Total Cash Amt</th>
										<th style="text-align: center;">Actual Cash Hand Over</th>
										<th style="text-align: center;">Difference</th>
										<th style="text-align: center;">Emp Sell</th>


									</tr>

								</thead>
								<tbody>


								</tbody>

							</table>
						</div>

					</div>


				</div>



			</div>

		</div>

	</div>

	<!-- -*********************------------- -->



	<script type="text/javascript">
		function openPopup() {

			var modal = document.getElementById("handoverModal");
			modal.style.display = "block";

		}

		function closePopup() {

			var modal = document.getElementById("handoverModal");
			modal.style.display = "none";

		}
	</script>





	<!--easyTabs-->
	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->

	<script
		src="${pageContext.request.contextPath}/resources/customerBill/chosen.jquery.js"
		type="text/javascript"></script>


	<script>
		function compareDate() {
			var selDate = $("#fromdatepicker").val();

			var today = new Date();
			var dd = String(today.getDate()).padStart(2, '0');
			var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
			var yyyy = today.getFullYear();
			today = dd + '-' + mm + '-' + yyyy;

			var from_date = selDate;
			var to_date = today;
			var x = 0;
			//alert("Date---"+to_date+"*******++**** "+from_date);

			var fromdate = from_date.split('-');
			from_date = new Date();
			from_date.setFullYear(fromdate[2], fromdate[1] - 1, fromdate[0]);
			var todate = to_date.split('-');
			to_date = new Date();
			to_date.setFullYear(todate[2], todate[1] - 1, todate[0]);
			if (from_date > to_date) {
				// alert("buttn Disabled")
				document.getElementById("btnsub").disabled = true;
				alert("Invalid Date");
			} else {
				document.getElementById("btnsub").disabled = false;
			}
		}

		function calClosingAmt() {

			var cashAmt = parseFloat($("#cash_amt").val());
			var openAmt = parseFloat($("#opening_amt").val());
			var withdrawAmt = parseFloat($("#withdrawal_amt").val());

			var closeAmt = openAmt + cashAmt - withdrawAmt;

			document.getElementById("closing_amt").value = parseFloat(closeAmt);
		}
	</script>

	<script type="text/javascript">
		function validate() {

			var fromDate = $("#fromDate").val();
			var toDate = $("#toDate").val();

			var isValid = true;

			if (fromDate == "" || fromDate == null) {

				isValid = false;
				alert("Please select From Date");
			} else if (toDate == "" || toDate == null) {

				isValid = false;
				alert("Please select To Date");
			}
			return isValid;

		}
	</script>

	<!-- Select Only Month and Year -->
	<script>
		function getData() {

			$('#table_grid td').remove();
			var isValid = validate();

			if (isValid) {
				$('#loader').show();
				var fromDate = document.getElementById("fromDate").value;
				var toDate = document.getElementById("toDate").value;

				//	alert(fromDate);

				$
						.getJSON(
								'${getPettyCashHandOverData}',
								{
									fromDate : fromDate,
									toDate : toDate,
									ajax : 'true'
								},
								function(data) {
									$('#loader').hide();

									//$('#table_grid tbody').remove(); 

									$
											.each(
													data,
													function(key, cashHndOvr) {

														//alert(JSON.stringify(cashHndOvr));
														$('#loader').hide();

														var tr = $('<tr  ></tr>');

														tr.append($(
																'<td  ></td>')
																.html(key + 1));
														tr
																.append($(
																		'<td  ></td>')
																		.html(
																				cashHndOvr.transactionDate));
														tr
																.append($(
																		'<td  ></td>')
																		.html(
																				cashHndOvr.fromUsername));
														tr
																.append($(
																		'<td  ></td>')
																		.html(
																				cashHndOvr.toUsername));

														tr
																.append($(
																		'<td style="text-align:right"></td>')
																		.html(
																				cashHndOvr.openingAmt));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				cashHndOvr.sellingAmt));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				cashHndOvr.actualAmtHandover));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				cashHndOvr.amtHandover));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				cashHndOvr.actualAmtHandover
																						- cashHndOvr.amtHandover));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				cashHndOvr.exVar1));

														//	tr.append($('<td></td>').html('<abbr title="Edit"><i id="edit'+key+'" onclick="edit('+key+')" class="fa fa-edit"></i> </abbr><span style="visibility: hidden;" class="glyphicon glyphicon-ok" onclick="submit('+key+');" id="ok'+key+'"></span><abbr title="Delete"><i onclick="del('+key+')" class="fa fa-trash"></i></abbr>'));
														$('#table_grid tbody')
																.append(tr);

													})
								});
			}

		}
	</script>




	<script>
		function showDiv(elem) {
			if (elem.value == 1) {
				document.getElementById('select_month_year').style = "display:none";
				document.getElementById('select_date').style = "display:none";
			} else if (elem.value == 2) {
				document.getElementById('select_month_year').style.display = "block";
				document.getElementById('select_date').style = "display:none";
			} else if (elem.value == 3) {
				document.getElementById('select_date').style.display = "block";
				document.getElementById('select_month_year').style = "display:none";
			}
		}
	</script>





	<script>
		(function() {
			var fauxTable = document.getElementById("faux-table");
			var mainTable = document.getElementById("table_grid");
			var clonedElement = table_grid.cloneNode(true);
			var clonedElement2 = table_grid.cloneNode(true);
			clonedElement.id = "";
			clonedElement2.id = "";
			fauxTable.appendChild(clonedElement);
			fauxTable.appendChild(clonedElement2);
		})();
	</script>
	<script>
		function myFunction() {
			var input, filter, table, tr, td, i;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("table_grid");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				if (td) {
					if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>

	<script type="text/javascript">
		function genPdf() {
			/* alert("hiii"); */
			/* var fromDate = document.getElementById("fromdatepicker").value;
			var toDate = document.getElementById("todatepicker").value;
			alert(fromDate);
			alert(toDate); */

			var selectRate = document.getElementById('select_rate').value;

			window
					.open('${pageContext.request.contextPath}/showStockDetailsPdf/'
							+ selectRate);
			/* document.getElementById("expExcel").disabled = true; */

		}

		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled = true;
		}
		$(function() {
			$('input').on(
					'input',
					function() {
						match = (/(\d{0,9})[^.]*((?:\.\d{0,2})?)/g)
								.exec(this.value.replace(/[^\d.]/g, ''));
						this.value = match[1] + match[2];
					});
		});
	</script>


	<script>
		$(document).ready(function($) {

			$("#petty_cash_hand").submit(function(e) {

				var isError = false;
				var errMsg = "";

				/*  var e1 = $("#from_emp").val();
				 if(e1 == 0){			 
					 alert("Select From Employee");
					 return false;
				 } */

				var e2 = $("#to_emp").val();
				if (e2 == 0) {

					alert("Select To Employee");
					return false;
				}

			});
		});

		$(document).ready(function() {
			$("#hide").click(function() {
				$("#pc_div").hide();
			});
			$("#show").click(function() {
				$("#pc_div").show();
			});

			$("#hide").click(function() {
				$("#popbtn").hide();
			});
			$("#show").click(function() {
				$("#popbtn").show();
			});

		});

		function compareDate() {
			var selDate = $("#fromdatepicker").val();

			var today = new Date();
			var dd = String(today.getDate()).padStart(2, '0');
			var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
			var yyyy = today.getFullYear();
			today = dd + '-' + mm + '-' + yyyy;

			var from_date = selDate;
			var to_date = today;
			var x = 0;
			//alert("Date---"+to_date+"*******++**** "+from_date);

			var fromdate = from_date.split('-');
			from_date = new Date();
			from_date.setFullYear(fromdate[2], fromdate[1] - 1, fromdate[0]);
			var todate = to_date.split('-');
			to_date = new Date();
			to_date.setFullYear(todate[2], todate[1] - 1, todate[0]);
			if (from_date > to_date) {
				// alert("buttn Disabled")
				document.getElementById("btnsub").disabled = true;
				alert("Invalid Date");
			} else {
				document.getElementById("btnsub").disabled = false;
			}
		}

		function calClosingAmt() {

			var cashAmt = parseFloat($("#cash_amt").val());
			var openAmt = parseFloat($("#opening_amt").val());
			var withdrawAmt = parseFloat($("#withdrawal_amt").val());

			//alert(withdrawAmt);

			if (Number.isNaN(cashAmt)) {
				cashAmt = 0;
				document.getElementById("cash_amt").value = 0.0;
			}

			if (Number.isNaN(withdrawAmt)) {
				withdrawAmt = 0;
				document.getElementById("withdrawal_amt").value = 0.0;
			}

			var closeAmt = openAmt + cashAmt - withdrawAmt;

			document.getElementById("closing_amt").value = parseFloat(closeAmt)
					.toFixed(0);
		}
	</script>



</body>

</html>