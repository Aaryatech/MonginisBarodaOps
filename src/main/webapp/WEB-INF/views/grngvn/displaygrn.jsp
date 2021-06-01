<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<!--topLeft-nav-->
<div class="sidebarOuter"></div>
<!--topLeft-nav-->

<!--wrapper-start-->
<div class="wrapper">

	<!--topHeader-->
	<c:url var="getGrnList" value="/getGrnList" />
	<jsp:include page="/WEB-INF/views/include/logo.jsp"></jsp:include>

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
			<div class="sidebarright">
				<div class="det_row">
					<div class="det_l"><h2 class="pageTitle"><i class="fa fa-refresh" aria-hidden="true"></i> GRN Details </h2></div>
					<div class="det_r">
						<form action="" id="grnForm" method="get">
							<div class="grn_one">GRN Date :<span>${grnDate}</span></div>
							<div class="grn_one">GRN SrNo :<span>${grnSrNo}</span></div>
							<div class="grn_one">Approved Amt :<span>${aprAmt}</span></div>
						</form>
					</div>
					<div class="clr"></div>
				</div>
				
				

				<!--tabNavigation-->
				<div class="cd-tabs">
					<!--tabMenu-->
					
					<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center;">Invoice No</th>
			<th style="text-align: center;">Item Name</th>
			<th style="text-align: center;">Type</th>
			<th style="text-align: center;">Disc.%</th>
			<th style="text-align: center;">Bill Rate</th>
			<th style="text-align: center;">Refund Rate</th>
			<th style="text-align: center;">Qty</th>
			<th style="text-align: center;">Tot Refund Requested</th>
			<th style="text-align: center;">Approved Qty</th>
			<th style="text-align: center;">Approved Tot Refund</th>
			<th style="text-align: center;">Status</th>
		</tr>
	</thead>
	
	<tbody>
									<c:forEach items="${grnList}" var="grnList" varStatus="count">
										<c:set var="color" value="white"></c:set>
										<c:choose>
											<c:when test="${grnList.grnGvnQty!=grnList.aprQtyAcc || grnList.grnGvnStatus==7}">
												<c:set var="color" value="re-order"></c:set>
											</c:when>
											<c:otherwise>
												<c:set var="color" value="white"></c:set>
											</c:otherwise>
										</c:choose>
										<tr class="${color}">
											<td style="text-align: center;"><c:out value="${grnList.invoiceNo}" /></td>
											<td style="text-align: left;"><c:out value="${grnList.itemName}" /></td>
											<td style="text-align: right;"><c:out value="${grnList.grnType}"></c:out></td>
											<td style="text-align: right;"><c:out value="${grnList.itemMrp}"></c:out></td>
											<td style="text-align: right;"><c:out value="${grnList.itemRate}" /></td>
											<td style="text-align: right;"><c:out value="${grnList.baseRate}" /></td>
											<td style="text-align: right;"><c:out value="${grnList.grnGvnQty}" /></td>
											<td style="text-align: right;"><c:out value="${grnList.grnGvnAmt}" /></td>
											<c:choose>
											<c:when test="${grnList.isCreditNote==1}">
											<td style="text-align: right;"><c:out value="${grnList.aprQtyAcc}" /></td>
											<td style="text-align: right;"><c:out value="${grnList.aprGrandTotal}" /></td>
											</c:when>
											<c:otherwise>
											<td style="text-align: right;"><c:out value="-" /></td>
											<td style="text-align: right;"><c:out value="-" /></td>
											</c:otherwise>
											</c:choose>
											<c:set var="statusGRN" value="NA"></c:set>
											<c:forEach items="${grStatusLst}" var="grnStatus">
											<c:if test="${grnStatus.statusValue==grnList.grnGvnStatus}">
											<c:set var="statusGRN" value="${grnStatus.statusName}"></c:set>
											</c:if>
											</c:forEach>
											<td style="text-align: left;"><c:out value="${statusGRN}"></c:out></td>
										</tr>
									</c:forEach>
								</tbody>
	</table>
</div>

					
				</div>
				<!--tabNavigation-->
			</div>
			<!--rightSidebar-->

		</div>
		<!--fullGrid-->
	</div>
	<!--rightContainer-->

</div>
<!--wrapper-end-->

<script type="text/javascript">
	function searchGRN() {

		$('#table_grid td').remove();

		var isValid = validate();

		if (isValid) {

			var fromDate = document.getElementById("datepicker").value;
			var toDate = document.getElementById("datepicker2").value;

			$.getJSON('${getGrnList}', {

				fromDate : fromDate,
				toDate : toDate,
				ajax : 'true'

			}, function(data) {

				//$('#table_grid td').remove();

				if (data == "") {
					alert("No records found !!");

				}

				$.each(data, function(key, grndata) {

					var tr = $('<tr></tr>');
					var calcTaxPer = parseFloat(grndata.sgstPer)
							+ parseFloat(grndata.cgstPer);

					var grnType;
					var grnStatus;
					var grnType=grndata.grnType;
					/* if (grndata.grnType == 0)
						grnType = "GRN 1";
					if (grndata.grnType == 1)
						grnType = "GRN 2";
					if (grndata.grnType == 2)
						grnType = "GRN 3";
					if (grndata.grnType == 3)
						grnType = "No GRN";
					if (grndata.grnType == 4)
						grnType = "GRN 4"; */

					if (grndata.grnGvnStatus == 1)
						grnStatus = "Pending";
					if (grndata.grnGvnStatus == 2)
						grnStatus = "Approved From Dispatch";
					if (grndata.grnGvnStatus == 3)
						grnStatus = "Reject From Dispatch";
					if (grndata.grnGvnStatus == 4)
						grnStatus = "Approved From Sales";
					if (grndata.grnGvnStatus == 5)
						grnStatus = "Reject From Sales";
					if (grndata.grnGvnStatus == 6)
						grnStatus = "Approved From Account";
					if (grndata.grnGvnStatus == 7)
						grnStatus = "Reject From Account";

					tr.append($('<td class="col-md-1"></td>').html(
							grndata.invoiceNo));
					tr.append($('<td class="col-md-2"></td>').html(
							grndata.itemName));
					tr.append($('<td class="col-md-1"></td>').html(grnType));
					tr.append($('<td class="col-md-1"></td>').html(
							grndata.baseRate));
					tr.append($('<td class="col-md-1"></td>').html(
							grndata.grnGvnQty));

					tr.append($('<td class="col-md-1"></td>').html(
							grndata.grnGvnAmt));

					tr.append($('<td class="col-md-1"></td>').html(
							grndata.aprQtyAcc));

					tr.append($('<td class="col-md-1"></td>').html(
							grndata.aprGrandTotal));

					tr.append($('<td class="col-md-1"></td>').html(
							grndata.aprTotalTax));

					tr.append($('<td class="col-md-1"></td>').html(
							grndata.aprGrandTotal));

					tr.append($('<td class="col-md-1"></td>').html(
							grndata.aprGrandTotal));

					tr.append($('<td class="col-md-1"></td>').html(grnStatus));

					$('#table_grid tbody').append(tr);

				})

			});

		}
	}
</script>

<script type="text/javascript">
	function validate() {

		var fromDate = $("#datepicker").val();
		var toDate = $("#datepicker2").val();
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
	/*
	//  jquery equivalent
	jQuery(document).ready(function() {
	jQuery(".main-table").clone(true).appendTo('#table-scroll .faux-table').addClass('clone');
	jQuery(".main-table.clone").clone(true).appendTo('#table-scroll .faux-table').addClass('clone2'); 
	});
	 */
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

</body>
</html>