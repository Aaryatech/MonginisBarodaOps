



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
	<!-- code goes here -->
	<!-- scripts
     <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.12.0/semantic.min.css" />
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
    </script>
    <script type="text/javascript" src="//cdn.rawgit.com/MrRio/jsPDF/master/dist/jspdf.min.js">
    </script>
    <script type="text/javascript" src="//cdn.rawgit.com/niklasvh/html2canvas/0.5.0-alpha2/dist/html2canvas.min.js">
    </script>
    
<script type="text/javascript" src="<c:url value='/resources/appjs/app.js'/>"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script> -->
	<script type="text/javascript">
		document.body.onload = function() {

			createPDF2();
		}
	</script>
</head>
<body>
	<!-- <div class="ui page grid">
		<div class="wide column">
			<div class="ui segment">
				<div class="ui button aligned center teal" id="create_pdf">Download PDF</div>
				<div class="ui divider"></div>
				<form class="ui form"> -->
	<table width="250" border="0" cellspacing="0" cellpadding="0"
		style="font-family: Times New Roman; font-size: 12px; border: 1px solid #E7E7E7;">
		<tbody>
			<!--   <tr>
      <td colspan="2" align="center"><p></p></td>
    </tr> -->
			<%--  <tr>
      <td colspan="2" align="center" style="padding:5px; border-bottom:1px solid #E7E7E7;"><img src="${pageContext.request.contextPath}/resources/images/monginislogo.png" alt="logo"></td>
    </tr> --%>
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
								<td>${currDate}</td>
								<td><strong></td>
							</tr>
							<tr>
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
												<th bgcolor="#ECECEC">Qty</th>
												<th bgcolor="#ECECEC">Rate</th>
												<th align="center" bgcolor="#ECECEC">Amt</th>
											</tr>
											<tr>
												<td><p style="font-size: 12px">${rspName}</p></td>
												<td align="center"><p style="font-size: 12px">${regularSpCake.qty}</p></td>
												<td align="center"><p style="font-size: 12px">${regularSpCake.rate}</p></td>
												<td align="right"><p style="font-size: 12px">${regularSpCake.rspSubTotal}</p></td>
											</tr>


											<!--   <tr>
            <td><p style="font-size:12px">##MESSAGE</p></td>
            <td align="center"><p style="font-size:12px"></p></td>
            <td align="center"><p style="font-size:12px">##FRATE</p></td>
            <td align="right"><p style="font-size:12px">##FAMT</p></td>
            </tr>
            
           
            
            
             -->

											<tr>

												<td><small style="font-size: 12px;"></small></td>
												<td align="center"><p style="font-size: 12px"></p></td>
												<td align="center"><p style="font-size: 12px"></p></td>
												<td align="right"><p style="font-size: 12px"></p></td>
											</tr>
											<tr>
												<td rowspan="3">&nbsp;</td>
												<td colspan="2" align="right"><strong>Total: </strong></td>
												<td align="right"><strong>${regularSpCake.rspSubTotal}</strong></td>
											</tr>
											<tr>
												<td colspan="2" align="right"><strong>Advance:
												</strong></td>
												<td align="right"><strong>${regularSpCake.rspAdvanceAmt}</strong></td>
											</tr>
											<tr>
												<td colspan="2" align="right"><strong>Balance:</strong></td>
												<td align="right"><strong>${regularSpCake.rspRemainingAmt}</strong></td>
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
	<!-- </form>
			</div>
		</div>
	</div> -->
	<!-- scripts -->
	<!-- 	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript" src="//cdn.rawgit.com/niklasvh/html2canvas/0.5.0-alpha2/dist/html2canvas.min.js"></script>
	<script type="text/javascript" src="//cdn.rawgit.com/MrRio/jsPDF/master/dist/jspdf.min.js"></script>
	<script type="text/javascript" src="app.js"></script> -->
</body>
</html>