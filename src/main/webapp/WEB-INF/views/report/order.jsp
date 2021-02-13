<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Monginis</title>
<html>
<head>
<style type="text/css">
<!--
.style2 {
	font-size: 14px
}

.style5 {
	font-size: 10px
}

.style6 {
	font-size: 9px
}

.style7 {
	font-size: 12px;
	font-weight: bold;
}

.style8 {
	font-size: 11px;
	font-weight: bold;
}
-->
</style>
<!--     <meta charset="UTF-8" />
 -->
<title></title>

</head>
<body>
	<script type="text/javascript">
		document.body.onload = function() {

			createPDF2();
		}
	</script>
</head>
<body>

	<table width="250" border="0" cellspacing="0" cellpadding="0"
		style="font-family: Times New Roman; font-size: 12px; border: 1px solid #E7E7E7;">
		<tbody>
			
			<tr>
				<td colspan="2" align="center"
					style="padding: 10px; border-bottom: 1px solid #E7E7E7; font-size: 12px; font-weight: bold;"><p>ORDER
						MEMO</p></td>
			</tr>
			<tr>
				<td colspan="2">
					<table width="250" border="0" cellspacing="0" cellpadding="0"
						style="padding: 5px; font-family: verdana; font-size: 12px;">
						<tbody>
							<tr>
								<td width="20%" align="left"><strong>Shop:</strong></td>
								<td width="80%" align="left">${shopName}</td>
								<td width="0%"><strong></td>
							</tr>
							<tr>
								<td><strong>Tel:</strong></td>
								<td>${tel}</td>
								<td><strong></td>
							</tr>


							<tr>
								<td><strong>Date:</strong></td>



								<td><fmt:parseDate value="${currDate}" pattern="yyyy-MM-dd"
										var="currDateFrmt" /> <fmt:formatDate value="${currDateFrmt}"
										var="currDateFormat" pattern="dd-MM-yyyy" />
									${spCakeOrder.orderDate}</td>
								<td><strong></td>
							</tr>
							<tr style="display: none;">
								<td><strong>Time:</strong></td>
								<td>${currTime}</td>
								<td><strong></td>
							</tr>
							<tr>
								<td colspan="3"><table width="100%" border="0"
										cellspacing="0" cellpadding="0" class="tbl-inner"
										style="padding: 5px; font-family: verdana; font-size: 12px;">
										<tbody>
											<tr>
												<th align="left" bgcolor="#ECECEC">Name</th>
												<th bgcolor="#ECECEC">Kg.</th>
												<th bgcolor="#ECECEC">Rate</th>
												<th align="center" bgcolor="#ECECEC">Amt</th>
											</tr>
											<tr>
												<td><p style="font-size: 12px">${spCakeOrder.itemId}</p></td>
												<td align="center"><p style="font-size: 12px">${spCakeOrder.spSelectedWeight}&nbsp;&nbsp;</p></td>
												<td align="center"><p style="font-size: 12px">
														<fmt:formatNumber type="number" maxFractionDigits="2"
															minFractionDigits="2"
															value="${(spCakeOrder.spSubTotal)/spCakeOrder.spSelectedWeight}" />
													</p></td>
												<td align="right"><p style="font-size: 12px">${spCakeOrder.spSubTotal}</p></td>
											</tr>
											<tr>
												<td><p style="font-size: 12px">${flavourName}</p></td>
											<tr>
												<td><p style="font-size: 12px">${spCakeOrder.spInstructions}</p></td>
												<td align="center"><p style="font-size: 12px"></p></td>
												<td align="center"><p style="font-size: 12px"></p></td>
												<td align="right"><p style="font-size: 12px"></p></td>

											</tr>
											<tr>

												<td><small style="font-size: 12px;"></small></td>
												<td align="center"><p style="font-size: 12px"></p></td>
												<td align="center"><p style="font-size: 12px"></p></td>
												<td align="right"><p style="font-size: 12px"></p></td>
											</tr>
											<tr>

												<td><small style="font-size: 12px;"></small></td>
												<td align="center"><p style="font-size: 12px"></p></td>
												<td align="center"><p style="font-size: 12px"></p></td>
												<td align="right"><p style="font-size: 12px"></p></td>
											</tr>
											<tr>
												<td rowspan="3">&nbsp;</td>
												<td colspan="2" align="right"><strong>Total :</strong></td>
												<td align="right"><strong><fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${spCakeOrder.spSubTotal}" /></strong></td>

											</tr>
											<tr>
												<td colspan="2" align="right"><strong>Advance
														:</strong></td>
												<td align="right"><strong>${spCakeOrder.spAdvance}</strong></td>
											</tr>
											<tr>
												<td colspan="2" align="right"><strong>Balance
														:</strong></td>
												<td align="right"><strong>${spCakeOrder.rmAmount}</strong></td>
											</tr>
										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<table width="100%" border="0" cellspacing="0" cellpadding="7">

						<tr>
							<td width="200" style="padding: 5px 7px;"><strong>Delivery
									Date : </strong> ${regularSpCake.rspDeliveryDt}</td>

						</tr>
						<tr>
							<td width="200"
								style="border-top: 1px solid #E7E7E7; padding: 5px 7px;"><strong>Order
									No:</strong> ${regularSpCake.rspPlace}</td>
						</tr>

					</table>
				</td>
			</tr>
			<tr>
				<td width="200"
					style="border-top: 1px solid #E7E7E7; padding: 5px 7px;"><strong>Customer
						Name : </strong> ${regularSpCake.rspCustName}</td>

			</tr>
			<tr>
				<td width="200"
					style="border-top: 1px solid #E7E7E7; padding: 5px 7px;"><strong>Customer
						Phone : </strong> ${regularSpCake.rspCustMobileNo}</td>
			</tr>
			<tr>
				<td colspan="2"
					style="border-top: 1px solid #E7E7E7; padding: 4px 6px;"><p
						style="font-size: 12px;">While we shall take every care to
						execute your order as per your instruction, We shall not be liable
						for delay/non delivery or for variations in the order and
						decoration due to circumstances beyond our control.</p>
					<p style="font-size: 12px;">Fresh cream items should be stored
						under refrigeration.Please present this receipt at the time of
						delivery. Order once given will not be cancelled/reversed at any
						cost.</p></td>
			</tr>
			<tr>
				<td colspan="2" width="200"
					style="border-top: 1px solid #E7E7E7; padding: 5px 7px;">I
					agree to the terms mentioned on the Memo</td>
			</tr>
			<tr>
				<td colspan="2" width="200" align="right" style="padding: 5px 7px;"></td>
			</tr>
			<tr>
				<td colspan="2" width="200" align="right" style="padding: 5px 20px;">Signature</td>
			</tr>
		</tbody>
	</table>

</body>
</html>

