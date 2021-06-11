<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>



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


<c:url var="getHsnWiseReport" value="/getItemWiseHsnReportAjax" />

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
						<h2 class="pageTitle">View Item wise HSN Report</h2>
					</div>
				</div>

				<div class="colOuter">
					<div align="center">
						<div class="col1">
							<div class="col1title">
								<b><span class="frm_txt">From</span></b> <input
									id="fromdatepicker" autocomplete="off" placeholder="From Date"
									name="from_Date" type="text" size="35"
									class="texboxitemcode texboxcal float_l">
									
									
							</div>
						</div>
						<div class="col2">
							<div class="col1title">
								<b><span class="frm_txt">To</span></b> <input id="todatepicker"
									autocomplete="off" placeholder="To Date" name="to_Date"
									type="text" size="35" class="texboxitemcode texboxcal float_l">
							</div>
						</div>
						<input type="hidden" name="frId" id="frId" value="${frId}">
						<input type="hidden" name="frName" id="frName" value="${frName}">

					</div>


					<div align="center" class="right_btn">
						<button class="buttonsaveorder" onclick="searchSellBill()">Search
						</button>
						<%--   &nbsp;&nbsp;&nbsp;
		    	     <a href='${pageContext.request.contextPath}/pdf?reportURL=showSellTaxBillwiseReportpPdf' id="btn_pdf" class="btn search_btn" style="display: none">PDF</a> --%>
						<button class="btn btn-primary" value="PDF" id="PDFButton"
							onclick="genPdf()" style="display: none;">PDF</button>
						<br>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<!--table-->
						<div class="clearfix"></div>


						<div id="table-scroll">
							<div id="faux-table" class="faux-table" aria="hidden"
								style="display: none;"></div>
							<div>
								<table id="table_grid" class="responsive-table" border="1">
									<thead>
										<tr class="bgpink">



											<th style="text-align: center;">Sr.No.</th>
											<th style="text-align: center;">Item Name</th>
											<th style="text-align: center;">HSN</th>
											<th style="text-align: center;">UOM</th>
											<th style="text-align: center;">TAX %</th>
											<th style="text-align: center;">MANUF</th>
											<th style="text-align: center;">RET</th>
											<th style="text-align: center;">TOTAL</th>
											<th style="text-align: center;">TAXABLE AMT</th>
											<th style="text-align: center;">CGST</th>
											<th style="text-align: center;">CGST AMT</th>
											<th style="text-align: center;">SGST</th>
											<th style="text-align: center;">SGST AMT</th>
											<th style="text-align: center;">Total</th>
										</tr>
									</thead>

									<tbody>

									</tbody>

								</table>


							</div>
							<div class="form-group" style="display: none;" id="range">



								<div class="col-sm-3  controls">
									<input type="button" id="expExcel" class="btn btn-primary"
										value="EXPORT TO Excel" onclick="exportToExcel();"
										disabled="disabled">
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
	function searchSellBill() {

		$('#table_grid td').remove();

		var isValid = validate();

		if (isValid) {
			//document.getElementById('btn_pdf').style.display = "block";
			var fromDate = document.getElementById("fromdatepicker").value;
			var toDate = document.getElementById("todatepicker").value;

			$.getJSON('${getHsnWiseReport}', {

				fromDate : fromDate,
				toDate : toDate,
				ajax : 'true',

			}, function(data) {

				//alert(JSON.stringify(data));

				if (data == "") {
					alert("No records found !!");
					document.getElementById("expExcel").disabled = true;
				}

				var totalTaxableAmt = 0;
				var totalSgst = 0;
				var totalCgst = 0;
				var totalFinal = 0;

				$.each(data, function(key, report) {

					document.getElementById("expExcel").disabled = false;
					document.getElementById('range').style.display = 'block';

					var tr = $('<tr></tr>');

					tr.append($('<td  style="text-align: center;"></td>').html(
							key + 1));

					tr.append($('<td style="text-align: left;"></td>').html(report.itemName));

					tr.append($('<td style="text-align: center;"></td>').html(report.itemHsncd));

					tr.append($('<td style="text-align: left;"></td>').html(report.itemUom));

					tr.append($('<td></td>').html(
							report.itemTax1 + report.itemTax2));

					tr.append($('<td  style="text-align:right;"></td>').html(
							report.billQty));

					tr.append($('<td  style="text-align:right;"></td>').html(
							report.grnGvnQty));
					tr.append($('<td  style="text-align:right;"></td>').html(
							report.billQty - report.grnGvnQty));

					totalTaxableAmt = totalTaxableAmt + report.taxableAmt;

					totalSgst = totalSgst + report.sgstRs;
					totalCgst = totalCgst + report.cgstRs;

					totalFinal = totalFinal + report.cgstRs + report.sgstRs
							+ report.taxableAmt;

					tr.append($('<td style="text-align:right;"></td>').html(
							report.taxableAmt.toFixed(2)));
					tr.append($('<td style="text-align:right;"></td>').html(
							report.itemTax1));
					tr.append($('<td style="text-align:right;"></td>').html(
							report.cgstRs.toFixed(2)));
					tr.append($('<td style="text-align:right;"></td>').html(
							report.itemTax2));
					tr.append($('<td style="text-align:right;"></td>').html(
							report.sgstRs.toFixed(2)));
					tr.append($('<td style="text-align:right;"></td>').html(
							(report.cgstRs + report.sgstRs + report.taxableAmt)
									.toFixed(2)));

					$('#table_grid tbody').append(tr);

				})

				var tr = $('<tr></tr>');

				tr.append($('<td></td>').html(""));
				tr.append($('<td></td>').html(""));
				tr.append($('<td></td>').html(""));
				tr.append($('<td></td>').html(""));
				tr.append($('<td></td>').html(""));
				tr.append($('<td></td>').html(""));
				tr.append($('<td></td>').html(""));
				tr.append($('<td style="font-weight:bold;"></td>')
						.html("Total"));
				tr.append($('<td style="text-align:right;"></td>').html(
						totalTaxableAmt.toFixed(2)));
				tr.append($('<td></td>').html(""));
				tr.append($('<td style="text-align:right;"></td>').html(
						totalCgst.toFixed(2)));
				tr.append($('<td></td>').html(""));
				tr.append($('<td style="text-align:right;"></td>').html(
						totalSgst.toFixed(2)));

				tr.append($('<td style="text-align:right;"></td>').html(
						totalFinal.toFixed(2)));

				$('#table_grid tbody').append(tr);

			});

		}
	}
</script>
<script type="text/javascript">
	function validate() {

		var fromDate = $("#fromdatepicker").val();
		var toDate = $("#todatepicker").val();

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

	function exportToExcel() {

		window.open("${pageContext.request.contextPath}/exportToExcel");
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
			window
					.open('${pageContext.request.contextPath}/tSellReport?reportURL=pdf/getHsnWiseReportPdf/'
							+ fromDate + '/' + toDate + '/' + frId + '/');
		}
	}
</script>

</body>
</html>
