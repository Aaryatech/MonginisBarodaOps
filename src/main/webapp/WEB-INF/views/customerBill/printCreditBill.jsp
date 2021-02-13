<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Credit Bill</title>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title></title>
</head>
<style type="text/css">
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
</style>
</head>

</head>
<body>

	<table width="290" border="0" cellspacing="0" cellpadding="0"
		style="padding: 2px; font-family: verdana; font-size: 12px; border: 1px solid #E7E7E7;">
		<tbody>

			<tr>
				<td colspan="2" align="center" style="padding: 2px;"><span><b>${frName}</b><br />
				</span></td>
			</tr>
			<tr>
				<td colspan="2" align="center"
					style="padding: 2px; border-top: 1px solid #E7E7E7; font-size: 12px;"><span><b>Sales
							Person:&nbsp;${frEmpMaster.frEmpName} </b><br /> </span></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"
					style="padding: 2px; border-top: 1px solid #E7E7E7; font-size: 12px;"><span><b>Customer
							:&nbsp;${customer} </b><br /> </span></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"
					style="padding: 2px; border-top: 1px solid #E7E7E7; font-size: 9px;"><span><b>Date
							& Time:&nbsp;</b>${date}</span><br /></td>
			</tr>
			<tr>
				<td colspan="2">
					<table width="100%" border="0" cellspacing="0" cellpadding="2">
						<tbody>
							<tr>
								<td colspan="4"><table width="100%" border="0"
										cellspacing="0" cellpadding="3" class="tbl-inner">
										<tbody>

											<tr>
												<th width="43%" align="left" bgcolor="#ECECEC">Invoice
													No.</th>
												<th width="8%" bgcolor="#ECECEC" align="right">Bill Amt</th>
												<th width="8%" bgcolor="#ECECEC" align="right">Pending
													Amt</th>
												<th width="8%" bgcolor="#ECECEC" align="right">Paid Amt</th>
											</tr>

											<c:set var="totalAmt" value="0"></c:set>

											<c:forEach items="${printData}" var="itemBillList"
												varStatus="count">
												<tr>
													<td width="43%" align="left" bgcolor="#ECECEC">${itemBillList.invoiceNo}</td>
													<td width="8%" bgcolor="#ECECEC" align="right">${itemBillList.payable}</td>
													<td width="8%" bgcolor="#ECECEC" align="right">${itemBillList.pending}</td>
													<td width="8%" bgcolor="#ECECEC" align="right">${itemBillList.settle}</td>
												</tr>

												<c:set var="totalAmt"
													value="${totalAmt+itemBillList.settle}"></c:set>

											</c:forEach>

											<tr>

												<td colspan="3" align="right"><span class="style7">Total:</span></td>
												<td align="right"><span class="style7"> <fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${totalAmt}" groupingUsed="false" /></span></td>
											</tr>

										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>

		</tbody>
	</table>
</body>
<body onload="directPrint()">
	<script>
		function directPrint() {
			window.print();

		}
	</script>
</body>
</html>