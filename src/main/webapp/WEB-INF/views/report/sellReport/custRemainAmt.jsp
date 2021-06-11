
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<style>
table, th, td {
	border: 1px solid #9da88d;
}

chosen-container {
	width: 82%;
}
</style>

<link rel="stylesheet"
	href="/ops/resources/dropdownmultiple/bootstrap-chosen.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loader.css">
<body>



	<!--datepicker-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#todatepicker").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
		$(function() {
			$("#fromdatepicker").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>
	<!--datepicker-->

	<c:url var="getCustPendingAmtReport" value="/getCustPendingAmtReport" /> 

	<div class="sidebarOuter"></div>

	<div class="wrapper">

		<!--topHeader-->

		<jsp:include page="/WEB-INF/views/include/logo.jsp">
			<jsp:param name="frDetails" value="${frDetails}" />

		</jsp:include>

		<!--topHeader-->

		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">

				<!--leftNav-->

				<jsp:include page="/WEB-INF/views/include/left.jsp">
					<jsp:param name="myMenu" value="${menuList}" />

				</jsp:include>


				<!--leftNav-->
				<!--rightSidebar-->

				<!-- Place Actual content of page inside this div -->
				<div class="sidebarright">


					<div class="row">
						<br>
						<div class="col-md-12">
							<h2 class="pageTitle">Customer Pending Details</h2>

						</div>
						<br>
					</div>

					<input type="hidden" name="frId" id="frId" value="${frId}">


					<%-- <div class="row">
						<br>
						<div class="form-group">

							<label class="col-sm-3 col-lg-2 control-label"
								style="text-align: right;">Customer </label>
							<div class="col-sm-6 col-lg-7">

								<select data-placeholder="Choose Customer" multiple="multiple"
									class="chosen-select chosen" tabindex="6" id="selCust"
									name="selCust">

									<option selected value="0" style="text-align: left;"><c:out value="All" /></option>

									<c:forEach items="${customerList}" var="cust" varStatus="count">
										<option value="${cust.custId}" style="text-align: left;"><c:out
												value="${cust.custName}-${cust.phoneNumber}" /></option>
									</c:forEach>
								</select>

							</div>

							<div class="col-sm-6 col-lg-3">
								<button class="buttonsaveorder" onclick="searchSellBill()">HTML
									View</button>

								<button class="btn btn-primary" value="PDF" id="PDFButton"
									onclick="genPdf()">PDF</button>
							</div>

							<div align="center" id="loader" style="display: none">
								<span> <br>
									<h4>
										<font color="#343690">Loading</font>
									</h4>
								</span> <span class="l-1"></span> <span class="l-2"></span> <span
									class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
								<span class="l-6"></span>
							</div>

						</div>
					</div> --%>

					<div class="row">
						<br>
						<div class="col-md-12">
							<!--table-->
							<div class="clearfix"></div>

<div class="table-responsive">
							<div id="table-scroll" class="table-scroll responsive-table-one">

								<div>
									<table id="table_grid" class="responsive-table">
										<thead>
											<tr class="bgpink">

												<th style="text-align: center;">Sr.No.</th>												
												<th style="text-align: center; width: 40px;">Customer</th>
												<th style="text-align: center;">Remaining Amt</th>
												<th style="text-align: center;">Action</th>

											</tr>
										</thead>
										
										<tbody>

												<c:forEach items="${getSellBillHeaderList}" var="list" varStatus="count">
												<tr class="responsive-table">
												<td class="col-sm-1" style="text-align: center;"><c:out
													value="${count.index+1}" /></td>													
												<td class="col-md-2" style="text-align: left;"><c:out
													value="${list.custName} - ${list.phoneNumber}" /></td>
												<td class="col-md-2" style="text-align: right;"><c:out
													value="${list.remainingAmt}" /></td>
												<td class="col-md-2" style="text-align: center;">
													<a
														href="#" onclick="getCustData(${list.custId})" id="popbtn" class="buttonsaveorder singlebtn initialism slide_open">
														<abbr title='Customer Details'><i class='fa fa-list'></i></abbr>
													</a> 
												
												</td>	
												
												
												</tr>
										</c:forEach>
										</tbody>

									</table>

								</div>

							</div>
							</div>
							<!--table end-->
							<br>
							<!-- <div class="form-group" style="display: none;" id="range">



								<div class="col-sm-3  controls">
									<input type="button" id="expExcel" class="btn btn-primary"
										value="EXPORT TO Excel" onclick="exportToExcel();"
										disabled="disabled">
								</div>
							</div> -->
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
	<div>
		<div id="slide" class="pending_pop">

			<div class="row">
				<div class="col-md-12">
				<button class="slide_close">
					<i class="fa fa-times" aria-hidden="true"></i>
				</button>
				<h2 class="page_title" id="add_cust_head_name">Customer Pending Details</h2>
				<div class="clr"></div>

<input type="hidden" id="cust_Id" name="custId">
				<div class="pop_date">
					<div class="pop_date_one">
						<div class="pop_date_txt">Name:-</div>
						<div class="pop_date_fld">

							<span id="custName" style="font-weight: bold; font-size: 20px;"></span>
						</div>
					</div>
					

					<!-- <div class="pop_date_btn">
						<button class="btn btn-primary" value="PDF" id="PDFButton"
									onclick="genPdf()">PDF</button>
					</div> -->

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

			</div>
			<div class="row">
				<div class="col-md-12">
					<!--table-->
					<div class="clearfix"></div>

					<div class="pending_tab" style="overflow-x: auto; height: 320px;">
						<table class="pending_tab1" id="remainamt_table_grid">
							<thead>
								<tr>
										<th style="text-align: center;">Sr.No.</th>
										<th style="text-align: center;">Invoice No</th>
										<th style="text-align: center;">Bill Date</th>
										<!-- <th style="text-align: left; width: 40px;">Customer</th> -->
										<th style="text-align: right;">Grand Total</th>
										<th style="text-align: right;">Paid Amt</th>
										<th style="text-align: right;">Remaining Amt</th>
										<th style="text-align: center;">Payment Mode</th>

								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
							<div class="col-sm-6 controls">
						<button class="btn btn-primary" value="PDF" id="PDFButton"
									onclick="genPdf()">PDF</button>
					</div>
					<div class="form-group"  style="display: none;" id="range">

								<div class="col-sm-6 controls">
									<input type="button" id="expExcel" class="btn btn-primary"
										value="EXPORT TO Excel" onclick="exportToExcel();"
										disabled="disabled">
								</div>
					</div>
					
					</div>
				
				</div>
				
			</div>
			
		</div>
	</div>
	
	
	

	<!--easyTabs-->
	<%-- <script src="${pageContext.request.contextPath}/resources/js/main.js"></script> --%>
	<!--easyTabs-->

	<script type="text/javascript"
		src="/ops/resources/dropdownmultiple/chosen.jquery.js"></script>
	<script type="text/javascript"
		src="/ops/resources/dropdownmultiple/chosen-active.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
			$('#slide').popup({
				focusdelay : 400,
				outline : true,
				vertical : 'top'
			});
		});
	</script>

	<script type="text/javascript">
		function radioOption() {

			var val1 = document.getElementById("rdRem");
			var val2 = document.getElementById("rdPay");

			if (val1.checked == true) {
				$('#divRemAmt').show();
				$('#divPayOpt').hide();
			} else {
				$('#divRemAmt').hide();
				$('#divPayOpt').show();
			}

		}
	</script>


	<script type="text/javascript">
		function getCustData(custId){
			$('#remainamt_table_grid td').remove();
			$('#loader').show();
			
				//alert(custId);

				$
						.getJSON(
								'${getCustPendingAmtReport}',
								{
									custId : custId,
									ajax : 'true',

								},
								function(data) {

									$('#loader').hide();

									//alert( JSON.stringify(data));

									//$('#table_grid td').remove();

									if (data == "") {
										alert("No records found !!");
										document.getElementById("expExcel").disabled = true;
									}

									
									var amtTotal = 0;								
									var paidTotal = 0;
									var remainingTotal = 0;

									var cashTotal = 0;
									var cardTotal = 0;
									var epayTotal = 0;
									var cust;
									var custId = 0;
									$
											.each(
													data,
													function(key, sellBillData) {

														document
																.getElementById("expExcel").disabled = false;
														document
																.getElementById('range').style.display = 'block';

														var tr = $('<tr class="responsive-table"></tr>');

														tr
																.append($(
																		'<td  style="text-align:center;"></td>')
																		.html(
																				key + 1));

													 	tr
																.append($(
																		'<td  style="text-align:center;" ></td>')
																		.html(
																				sellBillData.invoiceNo));

														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				sellBillData.billDate)); 

														cust = sellBillData.custName
																+ "_"
																+ sellBillData.phoneNumber;
														custId = sellBillData.custId;

													/* 	tr.append($(
																'<td ></td>')
																.html(cust)); */
														
													

														tr
																.append($(
																		'<td   style="text-align:right;"></td>')
																		.html(
																				(sellBillData.grandTotal))); 
														

														tr
																.append($(
																		'<td   style="text-align:right;"></td>')
																		.html(
																				(sellBillData.paidAmt)
																						.toFixed(2))); 

														tr
																.append($(
																		'<td   style="text-align:right;"></td>')
																		.html(
																				(sellBillData.remainingAmt)
																						.toFixed(2)));

													 	amtTotal = amtTotal
																+ sellBillData.grandTotal;
														
														paidTotal = paidTotal
																+ sellBillData.paidAmt; 
														
														remainingTotal = remainingTotal
																+ sellBillData.remainingAmt;
													

														cashTotal = cashTotal
																+ sellBillData.cash;
														cardTotal = cardTotal
																+ sellBillData.card;
														epayTotal = epayTotal
																+ sellBillData.ePay;														
														
														var paymentMode = sellBillData.paymentMode; 

														tr
																.append($(
																		'<td  style="text-align:right;"></td>')
																		.html(
																				paymentMode));
 
														$('#remainamt_table_grid tbody')
																.append(tr);

													})
									document.getElementById("custName").innerHTML=cust;
									document.getElementById("cust_Id").value=custId;
								 	
									var tr = "<tr>";
									var total = "<td colspan='3'>&nbsp;&nbsp;&nbsp;<b> Total</b></td>";	
									
									var totalAmt = "<td style=text-align:right;>&nbsp;&nbsp;&nbsp;<b>"
											+ (amtTotal).toFixed(2);
									+"</b></td>";
									
									var paid = "<td style=text-align:right;>&nbsp;&nbsp;&nbsp;<b>"
											+ (paidTotal).toFixed(2);
									+"</b></td>";
									var remaining = "<td style=text-align:right;>&nbsp;&nbsp;&nbsp;<b>"
											+ (remainingTotal).toFixed(2);
									+"</b></td>";

									var payMode = cashTotal + "-Cash ,"
											+ cardTotal + "-Card ," + epayTotal
											+ "-E-pay";

									var pay = "<td style=text-align:right;><b>"
											+ payMode + "</b></td>";

									var td = "<td></td>";

									var trclosed = "</tr>";

									$('#remainamt_table_grid tbody').append(tr);
									$('#remainamt_table_grid tbody').append(total);									
									
									$('#remainamt_table_grid tbody').append(
											addCommas(totalAmt));
									$('#remainamt_table_grid tbody').append(
											addCommas(paid)); 
									$('#remainamt_table_grid tbody').append(
											addCommas(remaining));
									$('#remainamt_table_grid tbody').append(pay);
									$('#remainamt_table_grid tbody').append(trclosed);
									 
								});

			
		}
	</script>

	<script type="text/javascript">
		function getSelectValues(select) {
			var result = [];
			var options = select && select.options;
			var opt;

			for (var i = 0, iLen = options.length; i < iLen; i++) {
				opt = options[i];

				if (opt.selected) {
					result.push(opt.value || opt.text);
				}
			}
			return result;
		}
	</script>

	<script type="text/javascript">
		 function addCommas(nStr) {
			nStr += '';
			x = nStr.split('.');
			x1 = x[0];
			x2 = x.length > 1 ? '.' + x[1] : '';
			var rgx = /(\d+)(\d{3})/;
			while (rgx.test(x1)) {
				x1 = x1.replace(rgx, '$1' + ',' + '$2');
			}
			return x1 + x2;
		} 

		/* function addCommas(x){
			
			 x=String(x).toString();
			  var afterPoint = '';
			  if(x.indexOf('.') > 0)
			     afterPoint = x.substring(x.indexOf('.'),x.length);
			  x = Math.floor(x);
			  x=x.toString();
			  var lastThree = x.substring(x.length-3);
			  var otherNumbers = x.substring(0,x.length-3);
			  if(otherNumbers != '')
			      lastThree = ',' + lastThree;
			  return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + afterPoint;
			} */ 
	</script>


	<script type="text/javascript">
		function validate() {

			var fromDate = $("#fromdatepicker").val();
			var toDate = $("#todatepicker").val();
			var cust = $("#selCust").val();

			//alert(cust);

			var isValid = true;

			if (fromDate == "" || fromDate == null) {

				isValid = false;
				alert("Please select From Date");
			} else if (toDate == "" || toDate == null) {

				isValid = false;
				alert("Please select To Date");
			} else if (cust == "" || cust == null) {

				isValid = false;
				alert("Please select Customer");
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

		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcelNew");
			document.getElementById("expExcel").disabled = true;
		}
	</script>
	<script type="text/javascript">
		function genPdf() {
			
			
				var frId = document.getElementById("frId").value;
				var cust = $("#cust_Id").val();

				//alert("jj");

				window
						.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/showCustRemainAmtRepPdf/'
								+ frId
								+ '/'
								+ cust );
			

		}
	</script>



</body>
</html>
