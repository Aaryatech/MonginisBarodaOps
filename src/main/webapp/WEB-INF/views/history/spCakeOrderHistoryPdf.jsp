<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Special Cake Order History</title>
<style type="text/css">
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 2px;
	font-size: 10;
}

th {
	background-color: #EA3291;
	color: white;
}
</style>
</head>
<body>
	<h4 align="center">Regular Cake Order History</h4>
	<div align="center">
		<h6>${frName}&nbsp;&nbsp;&nbsp;&nbsp;Date :&nbsp;${fromDate} </h6>
	</div>
	<c:choose>
	<c:when test="${orderTyp==1}">
	<table align="center" border="1" cellspacing="0" cellpadding="1"
		id="table_grid" class="table table-bordered">
		<thead>
			<tr class="bgpink">


				<th style="text-align: center; width: 60px">Sr no.</th>
				<th style="text-align: center; width: 100px">Item Name </th>
				<th style="text-align: center; width: 100px">Flavour </th>
				<th style="text-align: center; width: 100px">Delivery Date</th>
				<th style="text-align: center; width: 100px">Rate</th>				
				<th style="text-align: center; width: 100px">Add On Rate</th>
				<th style="text-align: center; width: 100px">Total</th>
				<th style="text-align: center; width: 100px">Advance</th>
				
			</tr>
		</thead>

		<tbody>
			<c:set var="ttl" value="${0}" />
			<c:set var="ttlAdvance" value="${0}" />
			

			<c:forEach items="${reportList}" var="spCakeOrder" varStatus="count">
				<tr>
					<%-- <c:set var="price"
						value="${spCakeOrder.spGrandTotal * spCakeOrder.spTotalAddRate}" /> --%>
					<td><c:out value="${count.index+1}" /></td>

					<td><c:out value="${spCakeOrder.spName}" /></td>

					<td><c:out value="${spCakeOrder.spfName}" /></td>

					<td style="text-align: center;">
						<c:out value="${spCakeOrder.spDeliveryDate}" /></td>
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${spCakeOrder.spGrandTotal * spCakeOrder.spTotalAddRate}" /></td>				
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${spCakeOrder.spTotalAddRate}" /></td>
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${spCakeOrder.spGrandTotal}" /></td>
							
					<c:set var="ttl"
						value="${ttl + spCakeOrder.spGrandTotal}" />
							
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${spCakeOrder.spAdvance}" /></td>	
						<c:set var="ttlAdvance"
						value="${ttlAdvance + spCakeOrder.spAdvance}" />				
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td>Total</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${ttl}" /></td>
				<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${ttlAdvance}" /></td>
			
			</tr>
		</tbody>
	</table>
	</c:when>
	<c:otherwise>
		<table align="center" border="1" cellspacing="0" cellpadding="1"
		id="table_grid" class="table table-bordered">
		<thead>
			<tr class="bgpink">


				<th style="text-align: center; width: 60px">Sr no.</th>
				<th style="text-align: center; width: 100px">Item Name </th>
				<th style="text-align: center; width: 100px">MRP </th>
				<th style="text-align: center; width: 100px">Qty</th>
				<th style="text-align: center; width: 100px">Rate</th>
				<th style="text-align: center; width: 100px">Total</th>
				
			</tr>
		</thead>

		<tbody>
			<c:set var="total" value="${0}" />
			<c:set var="grndTtl" value="${0}" />
			<c:set var="ttlMrp" value="${0}" />
			<c:set var="ttlRate" value="${0}" />
			<c:set var="ttlQty" value="${0}" />
			

			<c:forEach items="${reportList}" var="spCakeOrder" varStatus="count">
				<tr>
					 <c:set var="total"
						value="${spCakeOrder.orderQty * spCakeOrder.orderRate}" /> 
					<td><c:out value="${count.index+1}" /></td>

					<td><c:out value="${spCakeOrder.itemName}" /></td>
						
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${spCakeOrder.orderMrp}" /></td>
					<c:set var="ttlMrp"
						value="${ttlMrp + spCakeOrder.orderMrp}" />
							
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${spCakeOrder.orderQty}" /></td>
					<c:set var="ttlQty"
						value="${ttlQty + spCakeOrder.orderQty}" />
							
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${spCakeOrder.orderRate}" /></td>
					<c:set var="ttlRate"
						value="${ttlRate + spCakeOrder.orderRate}" />
					
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${total}" /></td>
							
					<c:set var="grndTtl"
						value="${grndTtl + total}" />
					
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td>Total</td>
				<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${ttlMrp}" /></td>
				<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${ttlQty}" /></td>			
				<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${ttlRate}" /></td>
				<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${grndTtl}" /></td>
			
			</tr>
		</tbody>
	</table>
	</c:otherwise>
</c:choose>

	<!-- <script>
	function print()
	{
		alert("JJ");
		window.print();
		//window.close();
	}
	
	</script> -->
</body>
</html>