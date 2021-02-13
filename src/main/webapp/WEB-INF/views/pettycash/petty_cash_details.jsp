<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">

<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/feviconicon.png"
	type="images/png" sizes="32x32">

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
</style>

<body onload="getData()">

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/loader.css">
	<!--datepicker-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#fromdatepicker").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
		$(function() {
			$("#todatepicker").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>
	<!--datepicker-->


	<c:url var="getPettyCashData" value="/getPettyCashData"></c:url>
	<c:url var="editPettyCashData" value="/editPettyCashData"></c:url>
	<c:url var="updateWithdrawAmt" value="/updateWithdrawAmt"></c:url>


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
					<div class="order-left">
						<h2 class="pageTitle">Petty Cash Management</h2>
					</div>
					<div class="order-right" align="right" style="padding-top: 0%;">
						<a href="${pageContext.request.contextPath}/showPattyCashMgmnt"><input
							type="button" value="Petty Cash" class="btn additem_btn">
						</a>
					</div>
					
					
					<!-- <form action="addPettyCash" method="post"> -->

					<div class="colOuter">
						<div class="col-md-1">
							<div class="col1title" align="left">From Date</div>
						</div>
						<div class="col-md-2">
							<input id="datepicker" class="texboxitemcode texboxcal"
								autocomplete="off" value="${firstDate}" name="from_Date"
								type="text">
						</div>



						<div class="col-sm-1">
							<div class="col1title" align="left">To Date</div>
						</div>
						<div class="col-md-2">
							<input id="datepicker2" class="texboxitemcode texboxcal"
								autocomplete="off" value="${currentDate}" name="to_Date"
								type="text">
						</div>


						<div class="col-sm-6" style="text-align: left;">

							<input class="buttonsaveorder" value="Submit" type="submit" style="padding: 5px 10px;"
								onclick="getData()">


							<button type="button" class="btn btn-primary" onclick="genPdf()" style="padding: 5px 10px; font-size: 16px;"
								disabled id="pdf" style="padding: 8px 12px;">PDF</button>


						</div>


					</div>






					<div class="colOuter">
						<div class="col1">
							<div class="col1title"></div>
						</div>
						<div class="col2">

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




					</div>

					<!-- </form> -->



					<div class="row">
						<div class="col-md-12">
							<!--table-->
							<form action="monthEndProcess" method="POST"
								onsubmit="substk.disabled = true; return confirm('Do you want to Month End ?');">
								<div class="clearfix"></div>
								<div class="col-md-9"></div>
								<!-- <label for="search" class="col-md-3" id="search"> <i
								class="fa fa-search" style="font-size: 20px"></i> <input
								type="text" id="myInput" onkeyup="myFunction()"
								style="border-radius: 25px;" placeholder="Search items by name"
								title="Type item name">
							</label>
 -->

								<div id="table-scroll" class="table-scroll responsive-table-one">
									<!-- class="table-scroll" -->
									<div>
										<!--  class="table-wrap" -->
										<table id="table_grid" class="responsive-table">
											<!-- class="main-table" -->
											<thead>
												<tr class="bgpink">
													<th style="text-align: center;">Sr. No</th>
													<th style="text-align: center;">Date & Time</th>
													<th style="text-align: center;">Day End By</th>
													<th style="text-align: center;">Opening Amt</th>
													<th style="text-align: center;">Cash Amt</th>
													<th style="text-align: center;">Withdrawal Amt</th>
													<th style="text-align: center;">Closing Amt</th>
													<th style="text-align: center;">Action</th>
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

	<div id="editModal" class="modal">
		<div id="overlay">
			<div class="clock"></div>
		</div>

		<div class="modal-content" style="width: 75%; padding: 2%;">
			<span class="close" onclick="closeEditPopup()" style="opacity: 2;">&times;</span>
			<br>

			<div class="row">

				<div class="col-md-6">
					<h3 class="pop_head">Edit Petty Cash</h3>
				</div>
				<div class="col-md-6" style="text-align: right;">
					<h4>Date : <input type="text" name="edit_date" id="edit_date"
						style="border: transparent;" readonly="readonly" /></h4>
				</div>

			</div>
			<hr>
			<br>
			<div class="row" style="margin-left: 0%">

				<input type="text" style="display: none;" name="pettyId"
					id="pettyId" />

				<div class="row">

					<div class="col-md-2">Opening Amount</div>

					<div class="col-md-4">
						<input type="text" class="input_add" name="opening_amt"
							readonly="readonly" onchange="trim(this)" id="opening_amt" />
					</div>

					<div class="col-md-2">Cash Amount</div>

					<div class="col-md-4">
						<input type="text" class="input_add" name="cash_amt"
							readonly="readonly" onchange="trim(this)" id="cash_amt" />
					</div>

				</div>

				<br>

				<div class="row">

					<div class="col-md-2">Withdrawl Amount</div>

					<div class="col-md-4">
						<input type="text" class="input_add"
							placeholder="Enter Withdrawal Amt" name="withdrawal_amt"
							onkeyup="calClosingAmt()" id="withdrawal_amt" />
					</div>

					<div class="col-md-2">Closing Amount</div>

					<div class="col-md-4">
						<input type="text" class="input_add" readonly="readonly"
							name="closing_amt" onchange="trim(this)" id="closing_amt" />
					</div>

				</div>



			</div>

			<div class="pop_btns" style="text-align: center;">
				<br> <a href="#" onclick="savePettyCash()" id="savePettyCash"
					class="buttonsaveorder">Update</a> <br>

				<div align="center" id="loader1" style="display: none">

					<span>
						<h4>
							<font color="#343690">Loading</font>
						</h4>
					</span> <span class="l-1"></span> <span class="l-2"></span> <span
						class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
					<span class="l-6"></span>
				</div>

			</div>

		</div>


	</div>

	<!-- -*********************------------- -->


	<!--easyTabs-->
	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->


	<script type="text/javascript">
		function openEditPopup() {

			var modal = document.getElementById("editModal");
			modal.style.display = "block";

		}

		function closeEditPopup() {

			var modal = document.getElementById("editModal");
			modal.style.display = "none";

		}
	</script>

	<script>
		function calClosingAmt() {

			var cashAmt = parseFloat($("#cash_amt").val());
			var openAmt = parseFloat($("#opening_amt").val());
			var withdrawAmt = parseFloat($("#withdrawal_amt").val());

			var closeAmt = openAmt + cashAmt - withdrawAmt;

			document.getElementById("closing_amt").value = parseFloat(closeAmt);
		}

		function editPettyCashDetails(pettyCashIdId) {
			//alert("LogId--"+logId);
			window
					.open("${pageContext.request.contextPath}/editPettyCash?pettyCashIdId="
							+ pettyCashIdId);
		}
	</script>

	<!-- Select Only Month and Year -->
	<script>
		function getData() {
			$('#loader').show();

			var from_date = $("#datepicker").val();
			var to_date = $("#datepicker2").val();
			$
					.getJSON(
							'${getPettyCashData}',
							{
								from_date : from_date,
								to_date : to_date,
								ajax : 'true'
							},
							function(data) {
								if (data != null) {
									document.getElementById("pdf").disabled = false;
									$('#loader').hide();
								}
								//alert("Petty Info1----"+JSON.stringify(data));
								$('#table_grid td').remove();

								var cashTotal = 0;
								var withdrawlTotal = 0;

								$
										.each(
												data,
												function(i, v) {

													var acButton = '&nbsp;&nbsp;<a href="#" class="slide_open" onclick="editPettyCash('
															+ v.pettycashId
															+ ')"><i class="fa fa-edit" style="color: black;"></i></a>';

												 	var deleteButton = '<a href="${pageContext.request.contextPath}/deletePettyCashData/'
															+ v.pettycashId
															+ '" onClick="return confirm();"> <abbr title="Delete"><i class="fa fa-trash"></i></abbr> </a>';
 
 

 
													var tr = $('<tr></tr>');

													tr
															.append($(
																	'<td style="text-align:center;"></td>')
																	.html(i + 1));

													tr
															.append($(
																	'<td style="text-align:center;"></td>')
																	.html(
																			v.exVar1));

													tr
															.append($(
																	'<td style="text-align:left;"></td>')
																	.html(
																			v.exVar2));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			v.openingAmt));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			v.cashAmt));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			v.withdrawalAmt));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			v.closingAmt));

													if (i == 0) {

														if (v.del == "1") {

															tr
																	.append($(
																			'<td style="text-align:center;"></td>')
																			.html(
																					acButton
																							+ " "
																							+ deleteButton));

														} else {

															tr
																	.append($(
																			'<td style="text-align:center;"></td>')
																			.html(
																					acButton));

														}
													} else {

														tr
																.append($(
																		'<td></td>')
																		.html(
																				" "));
													}

													cashTotal = cashTotal
															+ v.cashAmt;
													withdrawlTotal = withdrawlTotal
															+ v.withdrawalAmt;

													$('#table_grid tbody')
															.append(tr);

												})

								var tr = $('<tr></tr>');

								tr.append($('<td colspan="2"></td>').html(
										"TOTAL"));
								tr.append($('<td></td>').html(" "));
								tr.append($('<td></td>').html(" "));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html("" + cashTotal));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html("" + withdrawlTotal));
								tr.append($('<td></td>').html(" "));
								tr.append($('<td></td>').html(" "));

								$('#table_grid tbody').append(tr);

							});

		}
	</script>
	
	<script type="text/javascript">
	
	function test(){
		alert("Hi");
	}
	
	</script>
	

	<script type="text/javascript">
		function genPdf() {
			var fromDate = $("#datepicker").val();
			var toDate = $("#datepicker2").val();
			window
					.open('${pageContext.request.contextPath}/getPettyCashDetailPdf/'
							+ fromDate + '/' + toDate);
		}

		/* function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled = true;
		} */
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

	<script type="text/javascript">
		function editPettyCash(pettyCashId) {

			openEditPopup();

			$
					.get(
							'${editPettyCashData}',
							{
								pettyCashId : pettyCashId,
								ajax : 'true',
							},
							function(data) {

								//alert(JSON.stringify(data));

								if (data != "") {
									$('#loader').hide();
								}

								document.getElementById("edit_date").value = data.date;

								document.getElementById("opening_amt").value = parseFloat(data.openingAmt);
								document.getElementById("withdrawal_amt").value = parseFloat(data.withdrawalAmt);
								document.getElementById("closing_amt").value = parseFloat(data.closingAmt);
								document.getElementById("cash_amt").value = parseFloat(data.cashAmt);
								document.getElementById("pettyId").value = data.pettycashId;

							});
		}
	</script>

	<script type="text/javascript">
		function savePettyCash() {

			$('#loader1').show();

			var closeAmt = $("#closing_amt").val();
			var withdrawl = $("#withdrawal_amt").val();
			var id = $("#pettyId").val();

			//alert(closeAmt + " " + withdrawl + " " + id);

			if (withdrawl == "") {

				alert("Please Enter Withdrawl Amount");
				$('#loader1').hide();

			} else {

				$.get('${updateWithdrawAmt}',

				{
					closeAmt : closeAmt,
					withdrawl : withdrawl,
					id : id,
					ajax : 'true',

				}, function(data) {

					//alert(data);

					if (data != "") {
						$('#loader1').hide();
					}

					if (data == 1) {
						alert("Record Updated successfully.");
						closeEditPopup();
						getData();
						document.getElementById("btnCloseModal").click();
					}

				});

			}

		}

		function clearAddCustomerpopup() {

			$('#edt_petty').popup('hide');
		}
	</script>


	<script type="text/javascript">
		function deleteData(id) {
			window
					.open('${pageContext.request.contextPath}/deletePettyCashData/'
							+ id);
		}

		/* function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled = true;
		} */
	</script>




</body>

</html>