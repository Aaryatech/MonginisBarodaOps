<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<%@ page import="com.monginis.ops.constant.Constant" %>



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

<c:url var="getBillWiseTaxReport" value="/findBillWiseTaxReport" />

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
					<div class="col-md-12">
						<h2 class="pageTitle"><i class="fa fa-pie-chart" aria-hidden="true"></i> Purchase Billwise Tax (Input) Report</h2>
					</div>
				</div>
					<input type="hidden" name="factoryName" id="factoryName" value="${Constant.FACTORYNAME}">
					
					

				<div class="row">
					<input type="hidden" name="frId" id="frId" value="${frId}">
					
					<div class="form-quarter">
							<div class="form_text">From</div>
							<div class="form_input">
								<input id="fromdatepicker" autocomplete="off" 
							class="texboxitemcode texboxcal" placeholder="DD-MM-YYYY"
							name="fromDate" type="text">
							</div>
						</div>
						
					<div class="form-quarter">
							<div class="form_text">To</div>
							<div class="form_input">
								<input id="todatepicker" autocomplete="off"
							class="texboxitemcode texboxcal" placeholder="DD-MM-YYYY"
							name="toDate" type="text">
							</div>
						</div>
						
					<div class="form-quarter">
							<div class="form_text">Select</div>
							<div class="form_input">
								<select id="typeId" name="typeId" class="form-control">
							<option value="">Select</option>
							<option value="1">Purchase</option>
							<option value="2">GRN</option>
							<option value="3">Cumulative</option>
						</select>
							</div>
						</div>		
					
					<div class="form-quarter last center">						
						<button class="btn additem_btn" onclick="billWiseTaxReport()" style="margin: 0;">Search</button>
						<button class="btn additem_btn" value="PDF" id="PDFButton" onclick="genPdf()" style="margin: 0;">PDF</button>
					</div>
					
					
					
					
					
					
				</div>

				<div class="row">
					<div class="col-md-12">
						<!--table-->
						<div class="clearfix"></div>


						<div id="table-scroll" >
							<div id="faux-table" class="faux-table" aria="hidden"style="display: none;">
								<table id="table_grid1" class="main-table" border="1">
									<thead>
										<tr class="bgpink">

											<!-- 							
									<th class="col-md-1">Sr. NO.</th>
									<th class="col-md-1">Party Name</th>
									<th class="col-md-1">GSTIN</th>
									<th class="col-md-1">Bill No</th>
									<th class="col-md-1">Bill Date</th>
									
									<th class="col-md-1">Taxable Amt</th>
									<th class="col-md-1">Tax Rate</th>
									<th class="col-md-1">IGST</th>
									<th class="col-md-1">CGST</th>
									<th class="col-md-1">SGST</th>
									<th class="col-md-1">Bill Amount</th>
									<th class="col-md-1">CESS</th> -->
										</tr>

									</thead>
									<tbody>
								</table>
							</div>
							<div class="table-wrap">
								<table id="table_grid"  class="responsive-table" border="1">
									<thead>
										<tr class="bgpink">


											<th style="white-space: nowrap;">Sr. NO.</th>
											<th style="white-space: nowrap;">Party Name</th>
											<th style="white-space: nowrap;">Taxable Amt</th>
											<th style="white-space: nowrap;">Tax Rate</th>
											<th style="white-space: nowrap;">IGST</th>
											<th style="white-space: nowrap;">CGST</th>
											<th style="white-space: nowrap;">SGST</th>
											<th style="white-space: nowrap;">Bill Amount</th>
											<th style="white-space: nowrap;">CESS</th>
										</tr>

									</thead>
									<tbody>
								</table>

							</div>
							<br>
							<div class="form-group" style="display: none; text-align: center;" id="range">
								<div class="controls">
									<input type="button" id="expExcel" class="btn btn-primary" style="margin: 0;"
										value="EXPORT TO Excel" onclick="exportToExcel();" disabled="disabled">
								</div>
							</div>
						</div>
						<!--table end-->

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

<!--easyTabs-->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<!--easyTabs-->


<script type="text/javascript">
	function billWiseTaxReport() {
		$('#table_grid td').remove();

		var isValid = validate();

		if (isValid) {

			//document.getElementById('btn_pdf').style.display = "block";
			var fromDate = document.getElementById("fromdatepicker").value;
			var toDate = document.getElementById("todatepicker").value;
			var factoryName= document.getElementById("factoryName").value;
			var typeId= document.getElementById("typeId").value;
			
			
			$
					.getJSON(
							'${getBillWiseTaxReport}',
							{

								fromDate : fromDate,
								toDate : toDate,
								typeId : typeId,
								ajax : 'true',

							},
							function(data) {

								var taxTotal = 0;
								var igstTotal = 0;
								var cgstTotal = 0;
								var cessTotal = 0;
								var sgstTotal = 0;
								var roundOffTotal = 0;
								var billTotal = 0;

								$('#loader').hide();
								var len = data.length;

								if (data == "") {
									alert("No records found !!");
									document.getElementById("expExcel").disabled = true;
								}
								document.getElementById("expExcel").disabled = false;
								document.getElementById('range').style.display = 'block';

								$('#table_grid td').remove();

								$
										.each(
												data,
												function(key, billWiseTaxData) {

													var partyname = factoryName;
													/* var gstNo = "#012"; */

													var tr = $('<tr></tr>');

													tr
															.append($(
																	'<td style="white-space: nowrap;"></td>')
																	.html(
																			key + 1));

													tr
															.append($(
																	'<td style="white-space: nowrap;"></td>')
																	.html(
																			partyname));

												/* 	tr
															.append($(
																	'<td class="col-md-1"></td>')
																	.html(gstNo));
 */
												/* 	tr
															.append($(
																	'<td class="col-md-1"></td>')
																	.html(
																			billWiseTaxData.billNo));

													tr
															.append($(
																	'<td class="col-md-1" ></td>')
																	.html(
																			billWiseTaxData.billDate));
 */
													tr
															.append($(
																	'<td style="text-align:right; white-space: nowrap;"></td>')
																	.html(
																			(billWiseTaxData.taxableAmt).toFixed(2)));

													tr
															.append($(
																	'<td style="text-align:right; white-space: nowrap;"></td>')
																	.html(
																			(billWiseTaxData.taxRate).toFixed(2)));

													tr
															.append($(
																	'<td style="text-align:right; white-space: nowrap;"></td>')
																	.html(
																			(billWiseTaxData.igstRs).toFixed(2)));

													tr
															.append($(
																	'<td style="text-align:right; white-space: nowrap;"></td>')
																	.html(
																			(billWiseTaxData.cgstRs).toFixed(2)));

													tr
															.append($(
																	'<td style="text-align:right; white-space: nowrap;"></td>')
																	.html(
																			(billWiseTaxData.sgstRs).toFixed(2)));

													tr
															.append($(
																	'<td style="text-align:right; white-space: nowrap;"></td>')
																	.html(
																			(billWiseTaxData.grandTotal).toFixed(2)));

													tr
															.append($(
																	'<td style="text-align:right; white-space: nowrap;"></td>')
																	.html(
																			billWiseTaxData.cess));

													taxTotal = taxTotal
															+ billWiseTaxData.taxableAmt;
													cgstTotal = cgstTotal
															+ billWiseTaxData.cgstRs;
													sgstTotal = sgstTotal
															+ billWiseTaxData.sgstRs;
													igstTotal = igstTotal
															+ billWiseTaxData.igstRs;

													cessTotal = cessTotal
															+ billWiseTaxData.cess;

													billTotal = billTotal
															+ billWiseTaxData.grandTotal;

													$('#table_grid tbody')
															.append(tr);

												});

								var tr = $('<tr></tr>');

								tr.append($('<td style="white-space: nowrap;"></td>').html(
										""));

								tr
										.append($(
												'<td style="font-weight:bold; white-space: nowrap;"></td>')
												.html("Total"));
								/* tr.append($('<td class="col-md-1"></td>').html(
										""));
								tr.append($('<td class="col-md-1"></td>').html(
										"")); */
							/* 	tr.append($('<td class="col-md-1"></td>').html(
										"")); */

								tr
										.append($(
												'<td style="text-align:right"></td>')
												.html((taxTotal).toFixed(2)));
								tr.append($('<td style="white-space: nowrap;"></td>').html(
										""));

								tr
										.append($(
												'<td style="text-align:right; white-space: nowrap;"></td>')
												.html(igstTotal.toFixed(2)));

								tr
										.append($(
												'<td style="text-align:right;white-space: nowrap;"></td>')
												.html(cgstTotal.toFixed(2)));

								tr
										.append($(
												'<td style="text-align:right; white-space: nowrap;"></td>')
												.html(sgstTotal.toFixed(2)));

								tr
										.append($(
												'<td style="text-align:right; white-space: nowrap;"></td>')
												.html(billTotal.toFixed(2)));

								tr
										.append($(
												'<td style="text-align:right; white-space: nowrap;"></td>')
												.html(cessTotal.toFixed(2)));

								$('#table_grid tbody').append(tr);
							}

					);
		}
	}
	/* function(data) {

		//$('#table_grid td').remove();
		
		

		if (data == "") {
			alert("No records found !!");

		}
		alert(data);

		
		$.each(data,function(key, billWiseTaxData) {

							var index = key + 1;

							var tr = "<tr>";

							var partyname="GFPL";

							var gstno="#00";
							
							
							
							var partyName = "<td>&nbsp;&nbsp;&nbsp;"
									+ partyname
									+ "</td>";
									
									var gstNo = "<td>&nbsp;&nbsp;&nbsp;"
										+ gstno
										+ "</td>";
										
										var billNo = "<td>&nbsp;&nbsp;&nbsp;"
											+ billWiseTaxData.billNo
											+ "</td>";
											
										var billDate = "<td>&nbsp;&nbsp;&nbsp;"
											+ billWiseTaxData.billDate
											+ "</td>";

										

												var taxableAmt = "<td>&nbsp;&nbsp;&nbsp;"
													+ billWiseTaxData.taxableAmt
													+ "</td>";
													
													var taxRate = "<td>&nbsp;&nbsp;&nbsp;"
														+ billWiseTaxData.taxRate
														+ "</td>";

														var igstAmt = "<td>&nbsp;&nbsp;&nbsp;"
		 													+ billWiseTaxData.igstRs
		 													+ "</td>";
															
		  													var cgstAmt = "<td>&nbsp;&nbsp;&nbsp;"
																+ billWiseTaxData.cgstRs
																+ "</td>";

															var sgstAmt = "<td>&nbsp;&nbsp;&nbsp;"
																+ billWiseTaxData.sgstRs
																+ "</td>";
																

														     var grandTotal = "<td>&nbsp;&nbsp;&nbsp;"
															   + billWiseTaxData.grandTotal
															  + "</td>";
	                                                    
															  var CESS = "<td>&nbsp;&nbsp;&nbsp;"
																	+ billWiseTaxData.cess
																	+ "</td>";

							var trclosed = "</tr>";

							$('#table_grid tbody')
									.append(tr);
							$('#table_grid tbody')
									.append(partyName);
							
							$('#table_grid tbody')
							.append(gstNo);
							$('#table_grid tbody')
							.append(billNo);
							$('#table_grid tbody')
							.append(billDate);
							$('#table_grid tbody')
							.append(taxableAmt);
							$('#table_grid tbody')
							.append(taxRate);
							$('#table_grid tbody')
							.append(igstAmt);
							
							$('#table_grid tbody')
							.append(cgstAmt);
							
							$('#table_grid tbody')
							.append(sgstAmt);
							
							$('#table_grid tbody')
							.append(grandTotal);
							
							$('#table_grid tbody')
							.append(CESS);
							
							$('#table_grid tbody')
							.append(trclosed);
							
							

						})
							

	});

	}
	} */
</script>
<script type="text/javascript">
	function validate() {

		var fromDate = $("#fromdatepicker").val();
		var toDate = $("#todatepicker").val();
		var typeId= document.getElementById("typeId").value;
		
		var isValid = true;

		if (fromDate == "" || fromDate == null) {

			isValid = false;
			alert("Please select From Date");
		} else if (toDate == "" || toDate == null) {

			isValid = false;
			alert("Please select To Date");
		}else if (typeId=="") {

			isValid = false;
			alert("Please select ");
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
		var isValid = validate();
		if (isValid == true) {
			var fromDate = document.getElementById("fromdatepicker").value;
			var toDate = document.getElementById("todatepicker").value;
			var frId = document.getElementById("frId").value;
			var typeId = document.getElementById("typeId").value;
			window
					.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/showPurchaseTaxBillwiseReportPdf/'
							+ fromDate + '/' + toDate + '/' + frId + '/' + typeId);
		}
	}
</script>
</body>
</html>
