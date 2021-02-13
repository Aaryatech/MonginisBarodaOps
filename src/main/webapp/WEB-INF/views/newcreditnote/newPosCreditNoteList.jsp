<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
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
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>
	
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/loader.css">
	<!-- chosen CSS ============================================ -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/dropdownmultiple/bootstrap-chosen.css">

	<!-- ----------------------------------------------------END------------------------------------------------------------ -->

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


	<c:url var="getPosCreditNoteHeaderList"
		value="/getPosCreditNoteHeaderList" />

	<c:url var="getPosCreditNoteListByCrNo"
		value="/getPosCreditNoteListByCrNo" />




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

					<div class="colOuter">
						<div class="col-md-8">
							<h2 class="pageTitle"><i class="fa fa-credit-card" aria-hidden="true"></i> Credit Note List</h2>
						</div>

						<div class="col-md-4" style="text-align: right;">
							<a href="${pageContext.request.contextPath}/insertCreditNote"><input
								type="button" value="Add Credit Note" class="buttonsaveorder">
							</a> <br> <br>
						</div>

					</div>


					<div class="colOuter">
						<br>
						<div class="col-md-1">
							<div class="col1title">
								<b>Customer</b>
							</div>
						</div>
						<div class="col-md-3">
							<select name="cust" id="cust" class="chosen-select"
								required>
								<option value="0">All</option>


								<c:forEach items="${customerList}" var="customerList">

									<option value="${customerList.custId}"
										style="text-align: left;">${customerList.custName}
										&nbsp;${customerList.phoneNumber}</option>


								</c:forEach>


							</select>
						</div>


						<div class="col-md-1">
							<div class="col1title">
								<b>From Date</b>
							</div>
						</div>
						<div class="col-md-2">
							<input id="datepicker" class="texboxitemcode texboxcal"
								autocomplete="off" placeholder="From Date" name="fromDt"
								type="text" value="${todaysDate}">
						</div>

						<div class="col-md-1">
							<div class="col1title">
								<b>To Date</b>
							</div>
						</div>
						<div class="col-md-2">
							<input id="datepicker2" class="texboxitemcode texboxcal"
								autocomplete="off" placeholder="To Date" name="toDt" type="text"
								value="${todaysDate}">
						</div>




						<div class="col-md-2">
							<input name="" class="buttonsaveorder" value="Search"
								type="button" onclick="getBillDetails()">
						</div>
					</div>


					<div class="cd-tabs">
						<!--tabMenu-->

						<!--tabMenu-->


						<div class="clearfix"></div>


						<div id="table-scroll" class="table-scroll">
							<div class="table-responsive">
								<table id="table_grid" class="main-table">
									<thead>
										<tr class="bgpink">
											<th class="col-md-1" style="text-align: center;">Sr No</th>
											<th class="col-md-1" style="text-align: center;">Crn
												Invoice</th>
											<th class="col-md-1" style="text-align: center;">Bill
												Invoice</th>
											<th class="col-md-1" style="text-align: center;">Date</th>
											<th class="col-md-1" style="text-align: center;">Customer</th>
											<th class="col-md-1" style="text-align: center;">Grand
												Total</th>
											<th class="col-md-1" style="text-align: center;">User</th>
											<th class="col-md-1" style="text-align: center;">Action</th>

										</tr>
									</thead>
									<tbody>

									</tbody>

								</table>
							</div>
						</div>


						<div class="col-md-2">
							<input type="button" id="expExcel" class="btn btn-primary"
								value="EXPORT TO Excel" onclick="exportToExcel();"
								style="display: none;">

						</div>

						<br />
					</div>


				</div>
			</div>

		</div>
	</div>
	<!--wrapper-end-->
	<div>
		<div id="slide" class="modal">
		<div class="modal-content" style="width: 75%;">
			<span class="close" onclick="closeListPopUp()" style="opacity: 2; margin-top: 11px;">&times;</span>

				<div class="col-md-8" style="margin-top: 10px; ">
					<span class="pageTitle"><i class="fa fa-credit-card" aria-hidden="true"></i> Edit Credit Note</span>
				</div>
			
		<!-- <div class="row"> -->
			<form name="frm_search" id="frm_search"
				action="${pageContext.request.contextPath}/editCreditNote"
				method="post">
							<table class="responsive-table" id="table_grid1">
								<thead>
									<tr>
										<th style="text-align: center;">Sr. No</th>
										<th style="text-align: center;">Item Name</th>
										<th style="text-align: center;">Rate</th>
										<th style="text-align: center;">Prev Qty</th>
										<th style="text-align: center;">Disc</th>
										<th style="text-align: center;">Qty</th>
										<th style="text-align: center;">Bill Total</th>
										<th style="text-align: center;">Ret %</th>
										<th style="text-align: center;">Taxable Amt</th>
										<th style="text-align: center;">Tax Amt</th>
										<th style="text-align: center;">Grand Total</th>

									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						
					
				
				<br>
				<div class="row" style="text-align: center;">
					<button class="btn additem_btn" onclick="getData()" id="editSave">Save</button>
				</div>

			</form>
<!-- </div> -->
		</div>
		</div>
	</div>

	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->

	<script
		src="${pageContext.request.contextPath}/resources/customerBill/chosen.jquery.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/init.js"
		type="text/javascript" charset="utf-8"></script>


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
		function getBillDetails() {
			//alert("hi");

			var fromDate = $('#datepicker').val();
			var toDate = $('#datepicker2').val();
			var custId = $('#cust').val();
			//alert("jhgjjhg "+custId);

			//if (custId == 0) {
			//	alert("Please select customer");
			//} else {

			$('#table_grid td').remove();

			$
					.getJSON(
							'${getPosCreditNoteHeaderList}',
							{
								fromDate : fromDate,
								toDate : toDate,
								custId : custId,
								ajax : 'true'
							},
							function(data) {

								//alert(JSON.stringify(data));

								if (data == "") {
									alert("No records found !!");
								}

								$
										.each(
												data,
												function(key, crn) {

													//alert(JSON.stringify(sellBillData));

													var index = key + 1;

													var tr = $('<tr></tr>');
													tr
															.append($(
																	'<td class="col-md-1" style="text-align:center;"></td>')
																	.html(
																			key + 1));

													tr
															.append($(
																	'<td class="col-md-1" style="text-align:center;"></td>')
																	.html(
																			crn.crnInvoiceNo));

													tr
															.append($(
																	'<td class="col-md-1" style="text-align:center;"></td>')
																	.html(
																			crn.billInvoice));

													tr
															.append($(
																	'<td id="date'+crn.crnNo+'" class="col-md-1" style="text-align:center;"></td>')
																	.html(
																			crn.crnDate));

													tr
															.append($(
																	'<td class="col-md-1" style="text-align:left;"></td>')
																	.html(
																			crn.custName));

													tr
															.append($(
																	'<td class="col-md-1" style="text-align:right;"></td>')
																	.html(
																			crn.grandTotal
																					.toFixed(2)));

													tr
															.append($(
																	'<td class="col-md-1" style="text-align:left;"></td>')
																	.html(
																			crn.userName));

													tr
															.append($(
																	'<td class="col-md-1" style="text-align:center;"></td>')
																	.html(
																			'<a  href="#" onClick="getDetailsByCrnNo('
																					+ crn.crnNo
																					+ ','+crn.userId+ ')" class="buttonsaveorder singlebtn initialism slide_open"><abbr title="Edit"><i class="fa fa-pencil"></i></abbr></a>'));

													$('#table_grid tbody')
															.append(tr);

												});

							});
			//}

		}
	</script>



	<script type="text/javascript">
		function getDetailsByCrnNo(x,eId) {
			//alert("hi");
		var modal = document.getElementById("slide");
		modal.style.display = "block";
			
			
			var dt=document.getElementById("date"+x).innerHTML;
			
			//alert(dt);
			
			const parts = dt.split("-");

			var month = parts[1];
			var year = parts[0];

			//alert(month+"          "+year);

			
			var currentdate = new Date();
			var cur_month = currentdate.getMonth() + 1;
			var cur_year = currentdate.getFullYear();
			
			var empId=${sessionScope.frEmpDetails.frEmpId};
			//alert(empId+"           "+eId);
			

			
			if (cur_month == month && year == cur_year && empId==eId) {
				//alert("in this month");
				
				$('#editSave').show();
				
			} else {
				 //alert("not in this month");
				$('#editSave').hide();
			}  

			$('#table_grid1 td').remove();

			$
					.getJSON(
							'${getPosCreditNoteListByCrNo}',
							{
								crnNo : x,
								ajax : 'true'
							},
							function(data) {

								//alert(JSON.stringify(data));

								if (data == "") {
									alert("No records found !!");
								}

								$
										.each(
												data,
												function(key, crn) {

													//alert(JSON.stringify(sellBillData));

													var index = key + 1;

													var tr = $('<tr></tr>');

													tr.append($('<td></td>')
															.html(key + 1));

													tr
															.append($(
																	'<td style="text-align:left;"></td>')
																	.html(
																			crn.itemName));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			'<p class="detail" id="rate_'+crn.crnDetailNo+'">'
																					+ crn.rate
																					+ '</p>'));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			'<p class="detail" id="oldQty_'+crn.crnDetailNo+'">'
																					+ crn.billQty
																					+ '</p>'));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			'<p class="detail" id="discAmt_'+crn.crnDetailNo+'">'
																					+ crn.discAmt
																							.toFixed(2)
																					+ '</p>'));

													tr
															.append($(
																	'<td style="text-align:center;"></td>')
																	.html(
																			'<input class="detail" type="text" min="0" value="'
																					+ crn.crnQty
																					+ '" style="text_align:center; width:50px;" name="qty'
																					+ crn.crnDetailNo
																					+ '" id="qty_'
																					+ crn.crnDetailNo
																					+ '"  value="0" onkeyup="qtyChange('
																					+ crn.crnDetailNo
																					+ ')" >'));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			'<p class="detail" id="billTot_'+crn.crnDetailNo+'">'
																					+ crn.billTotal.toFixed(2)
																					+ '</p>'));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			'<input class="detail" type="number" min="0" value="'
																					+ crn.returnPer
																					+ '" style="text_align:center; width:50px;" name="retPer'
																					+ crn.crnDetailNo
																					+ '" id="retPer_'
																					+ crn.crnDetailNo
																					+ '" onchange="qtyChange('
																					+ crn.crnDetailNo
																					+ ')" >'));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			'<p class="detail" id="taxable_'+crn.crnDetailNo+'">'
																					+ crn.taxableAmt.toFixed(2)
																					+ '</p>'));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			'<p class="detail" id="tax_'+crn.crnDetailNo+'">'
																					+ (crn.cgstAmt + crn.sgstAmt).toFixed(2)
																					+ '</p>'));

													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			'<p class="detail" id="grandTot_'+crn.crnDetailNo+'">'
																					+ crn.grandTotal.toFixed(2)
																					+ '</p>'));

													tr
															.append($(
																	'<td style="text-align:right; display:none;"></td>')
																	.html(
																			'<p class="detail" id="sgstPer_'+crn.crnDetailNo+'">'
																					+ crn.sgstPer.toFixed(2)
																					+ '</p>'));

													tr
															.append($(
																	'<td style="text-align:right; display:none;"></td>')
																	.html(
																			'<p class="detail" id="cgstPer_'+crn.crnDetailNo+'">'
																					+ crn.cgstPer.toFixed(2)
																					+ '</p>'));

													$('#table_grid1 tbody')
															.append(tr);

												});

							});

		}
		
		function closeListPopUp() {
			var modal = document.getElementById("slide");
			modal.style.display = "none";
		}
	</script>


	<script type="text/javascript">
		function qtyChange(x) {

			//alert(x);

			// var x = document.getElementsByClassName("detail")[0].id;
			//alert(x);

			//var x = document.getElementById("tempDetailId").value;

			var qty = parseFloat(document.getElementById("qty_" + x).value);
			var oldQty = parseFloat(document.getElementById("oldQty_" + x).innerHTML);
			
			if(isNaN(qty)==true){
				qty=0;
				document.getElementById("qty_" + x).value=0;
			}
			

			//alert(qty + "              " + oldQty);

			if (qty > oldQty) {
				alert("Invalid Qty");
				document.getElementById("qty_" + x).value = 0;

				qtyChange1(x);

			} else {

				var discAmt = parseFloat(document
						.getElementById("discAmt_" + x).innerHTML);

				var rate = parseFloat(document.getElementById("rate_" + x).innerHTML);

				var retPer = parseFloat(document.getElementById("retPer_" + x).value);

				var sgstPer = parseFloat(document
						.getElementById("sgstPer_" + x).innerHTML);
				var cgstPer = parseFloat(document
						.getElementById("cgstPer_" + x).innerHTML);

				var billTot = parseFloat((rate - (discAmt / oldQty)) * qty);

				var tempGrandTot = (billTot * retPer) / 100;

				var taxableAmt = (tempGrandTot * 100)
						/ (100 + sgstPer + cgstPer);
				//alert("Taxable = "+taxableAmt);

				var cgstAmt = taxableAmt * (cgstPer / 100);
				//alert(cgstAmt);
				var sgstAmt = taxableAmt * (sgstPer / 100);

				var taxedAmt = cgstAmt + sgstAmt;

				var grandTotal = taxableAmt + taxedAmt;

				document.getElementById("billTot_" + x).innerHTML = billTot
						.toFixed(2);
				document.getElementById("taxable_" + x).innerHTML = taxableAmt
						.toFixed(2);
				document.getElementById("tax_" + x).innerHTML = taxedAmt
						.toFixed(2);
				document.getElementById("grandTot_" + x).innerHTML = grandTotal
						.toFixed(2);

			}

		}

		function qtyChange1(x) {

			document.getElementById("billTot_" + x).innerHTML = 0;
			document.getElementById("taxable_" + x).innerHTML = 0;
			document.getElementById("tax_" + x).innerHTML = 0;
			document.getElementById("grandTot_" + x).innerHTML = 0;

		}
	</script>




</body>

</html>