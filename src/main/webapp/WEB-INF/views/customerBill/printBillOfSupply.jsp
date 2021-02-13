<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.monginis.ops.constant.Constant"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Bill</title>
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

	<table width="250" border="0" cellspacing="0" cellpadding="0"
		style="font-family: verdana; font-size: 11px; border: 1px solid #E7E7E7;">
		<tbody>

			<tr>
				<td colspan="2" align="center"
					style="padding: 2px; border-bottom: 1px solid #E7E7E7;"><img
					src="${pageContext.request.contextPath}/resources/images/minlogo.png"
					alt="logo"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"
					style="padding: 2px; border-bottom: 1px solid #E7E7E7; font-size: 12px;"><b>BILL
						OF SUPPLY</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center"
					style="padding: 2px; border-bottom: 1px solid #E7E7E7;"><b>${frDetails.frName}
						
				</b><br /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"
					style="padding: 2px; font-family: verdana; border-bottom: 1px solid #E7E7E7; font-size: 11px;">${frDetails.frAddress}
					<br />Outlet Ph:&nbsp;<strong>${frDetails.frMob}</strong><br /> <span
					style="font-size: 11px; font-family: verdana;">GSTIN:&nbsp;<b>${frDetails.frGstNo}</b>
						State:&nbsp; ${frSup.frState} <br>FSSAI:&nbsp;&nbsp;${frDetails.fbaLicenseDate}
				</span>
				</td>
			</tr>
			<tr>
				<c:set var="totalAmt" value="0"></c:set>
				<c:set var="calTotalAmt" value="0"></c:set>
				<td colspan="2">
					<table width="100%" border="0" cellspacing="0" cellpadding="2">
						<tbody>
							<tr>
								<td align="left">Inv No:</td>
								<td align="left" colspan="3">${sellBillHeaderAndDetail.invoiceNo}</td>
							</tr>
							<tr>
								<td align="left">Date:</td>
								<td align="left" colspan="3">${sellBillHeaderAndDetail.timestamp}</td>

							</tr>
							<tr>
								<td align="left">Place of Supply:</td>
								<td align="left" colspan="3"> </td>

							</tr>
							<tr>
								<td align="left">Customer :</td>
								<td align="left" colspan="3">${sellBillHeaderAndDetail.custName}</td>

							</tr>
							<tr>
								<td align="left">Sales Person:</td>
								<td align="left" colspan="3">${frEmpMaster.frEmpName}</td>
							</tr>

							<tr>
								<td align="left">Payment Mode :</td>
								<td align="left" colspan="3">${paymentMode}</td>
							</tr>

							<tr>
								<td colspan="4"><table width="100%" border="0"
										cellspacing="0" cellpadding="4" class="tbl-inner">

										<tbody>

											<tr>
												<th width="43%" align="left" bgcolor="#ECECEC">Item<span
													style="font-size: 8">(HSN)</span></th>

												<th width="8%" bgcolor="#ECECEC" align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
												<th width="8%" bgcolor="#ECECEC" align="right">QTY</th>
												<th width="8%" bgcolor="#ECECEC" align="right">UOM</th>
												<th width="13%" bgcolor="#ECECEC" align="right">Rate</th>
												<th width="29%" align="right" bgcolor="#ECECEC">AMT</th>
											</tr>

											<c:forEach items="${sellBillHeaderAndDetail.list}"
												var="itemBillList" varStatus="count">
												<tr>
													<td><span style="font-size: 11px">${itemBillList.itemName}<br />
															<span style="font-size: 8px">HSN-${itemBillList.qty}
																${itemBillList.itemHsncd}</span></span></td>

													<td align="right"><span style="font-size: 11px">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></td>

													<td align="right"><span style="font-size: 11px">
															<c:choose>
																<c:when test="${itemBillList.isDecimal==1}">
																	<fmt:formatNumber type="number" groupingUsed="false"
																		value="${itemBillList.qty}" maxFractionDigits="3"
																		minFractionDigits="3" />
																</c:when>
																<c:otherwise>
																	<fmt:formatNumber type="number" groupingUsed="false"
																		value="${itemBillList.qty}" maxFractionDigits="0"
																		minFractionDigits="0" />
																</c:otherwise>
															</c:choose>
													</span></td>
													<td align="right"><span style="font-size: 11px">
															${itemBillList.itemUom} </span></td>
													<td align="right"><span style="font-size: 11px"><fmt:formatNumber
																type="number" groupingUsed="false"
																value="${itemBillList.mrp}" maxFractionDigits="0"
																minFractionDigits="0" /> </span></td>
													<td align="right"><span style="font-size: 11px">
															<fmt:formatNumber type="number" groupingUsed="false"
																value="${itemBillList.discAmt+itemBillList.grandTotal}"
																maxFractionDigits="2" minFractionDigits="2" var="total" />
															${total} <c:set var="calTotalAmt"
																value="${total+calTotalAmt}"></c:set>
													</span></td>
													<c:set var="totalAmt"
														value="${totalAmt+itemBillList.grandTotal}"></c:set>
												</tr>
											</c:forEach>
											<c:if test="${sellBillHeaderAndDetail.discountAmt>0}">
												<tr>
													<td colspan="4" align="right"><span class="style7">SubTotal:</span></td>
													<td align="right"><span class="style7"><fmt:formatNumber
																type="number" maxFractionDigits="2"
																minFractionDigits="2" value="${calTotalAmt}"
																groupingUsed="false" /></span></td>
												</tr>
												<tr>
													<td colspan="4" align="right"><span class="style7">Disc
															Amt:</span></td>
													<td align="right"><span class="style7"><fmt:formatNumber
																type="number" maxFractionDigits="2"
																minFractionDigits="2"
																value="${sellBillHeaderAndDetail.discountAmt}"
																groupingUsed="false" /></span></td>
												</tr>
											</c:if>
											<fmt:formatNumber type="number" maxFractionDigits="2"
												minFractionDigits="2"
												value="${calTotalAmt-sellBillHeaderAndDetail.discountAmt}"
												groupingUsed="false" var="billTotal" />
											<%-- <fmt:formatNumber
															type="number" maxFractionDigits="0" minFractionDigits="0"
															value="${calTotalAmt-sellBillHeaderAndDetail.discountAmt}"
															groupingUsed="false" var="total"/> --%>

											<fmt:formatNumber type="number" maxFractionDigits="0"
												minFractionDigits="0"
												value="${billTotal+ (billTotal % 1 == 0 ? 0 : 0.5)}"
												groupingUsed="false" var="total" />

											<tr>
												<td colspan="4" align="right"><span class="style7">Bill
														Total:</span></td>
												<td align="right"><span class="style7">${billTotal}</span></td>
											</tr>
											<tr>
												<td colspan="4" align="right"><span class="style7">R.Off:</span></td>
												<td align="right"><span class="style7"><fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${total-billTotal}" groupingUsed="false" /></span></td>
											</tr>
											<tr>
												<td colspan="4" align="right"><span class="style7">Total:</span></td>
												<td align="right"><span class="style7">${total}</span></td>
											</tr>
										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2"><table width="100%" border="0" cellspacing="0"
						cellpadding="7">

						<tr>
							<td align="center"
								style="border-top: 1px solid #E7E7E7; padding: 3px;" colspan="6"><span>
									Customer Care: 9824051188 </span></td>
						</tr>
						<tr>
							<td align="left"
								style="border-top: 1px solid #E7E7E7; padding: 3px;" colspan="6">
								<span>
									For wholesale enquiry contact DairyMart Team 
									<br>Ph: 8260060048/49
									<br> Visit us on www.monginis.in<br> Please
									Email us your feedback/suggestions on<br>
									monginis@gmail.com<br> This is a computer generated
									invoice <br> Subject to ${frDetails.frCity} Jurisdiction
							</span></td>
						</tr>

					</table></td>
			</tr>
			<c:choose>
				<c:when test="${frDetails.frGstType!=0}">
					<tr>
						<td colspan="2"><table width="100%" border="0"
								cellspacing="0" cellpadding="7">
								<tr>
									<td align="center"
										style="border-top: 1px solid #E7E7E7; padding: 3px;"
										colspan="6"><span>Composition Taxable Person,Not
											eligible to collect Tax on Supplies</span></td>
								</tr>

							</table></td>
					</tr>
				</c:when>
			</c:choose>
			<tr>
				<td colspan="2"><table width="100%" border="0" cellspacing="0"
						cellpadding="7">
						<tr>
							<td align="center"
								style="border-top: 1px solid #E7E7E7; padding: 3px;" colspan="6"><span
								style="font-weight: bold;"> With You @ Your Great
									Moments!</span></td>
						</tr>

					</table></td>
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