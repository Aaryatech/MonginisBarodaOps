
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<style type="text/css">
label::before {
	width: 0px;
	height: 0px;
	border: 0px;
}

.main-table tbody>tr:hover {
	background-color: #ffa;
}
</style>
<style>
table, th, td {
	border: 1px solid #9da88d;
}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<c:url var="getViewGvnOption" value="/getViewGvnOption" />

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
					
				<!-- 	<div class="col-md-3">

						<button type="button" class="buttonsaveorder"
							style="display: none;" id='searchButton'
							onclick="getViewOption()" style="width: 100px; height: 40px">Search
						</button>
						

					</div>
 -->
					

				
					<form action="${pageContext.request.contextPath}/postManualGrn"
						onsubmit="return confirm('Do you really want to save ?');"
						name="grn_add" id="grn_add" method="post">

						<div class="col-md-9">
							<h6 class="pageTitle" style="margin: 0; padding:0;">
							<i class="fa fa-refresh" aria-hidden="true"></i>GRN Based on Expiry of Product</h6>
						</div>
						<label for="search" class="col-md-3" id="search" style="margin:-10px 0 0 0 ;"> <i
							class="fa fa-search" ></i> <input
							type="text" style="border-radius: 25px;" id="myInput"
							onkeyup="myFunction()" placeholder="Search items by name.."
							title="Type in a name">
						</label>
<c:set var="flag" value="0" />

						<div class="clearfix"></div>
						<div class="clr"></div>
						
						<div class="tableFixHead marg_top">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style=" white-space: nowrap;">Select </th>
			<th style="text-align: center; white-space: nowrap;">Invoice No</th>
			<th style="text-align: center;  white-space: nowrap;">Invoice Date</th>
			<th style="text-align: center; white-space: nowrap;">Name</th>
			<th style="text-align: center; white-space: nowrap;">Type</th>
			<th style="text-align: center; white-space: nowrap;">Pur Qty</th>
			<th style="text-align: center; white-space: nowrap;">Rate</th>											
			<th style="text-align: center; white-space: nowrap;">Qty</th>											
			<th style="text-align: center; white-space: nowrap;">Amount</th>
			<th style="text-align: center;  white-space: nowrap;">Remark</th>
		</tr>
	</thead>
	
	<tbody>

										<c:forEach items="${grnConfList}" var="grnConfList"
											varStatus="count">
											<c:set var="flag" value="1" />
											
											<tr id="row${grnConfList.billDetailNo}">

												<td style="text-align: center; white-space: nowrap;"><input
													type="checkbox" name="select_to_grn"
													id="${grnConfList.billDetailNo}"
													value="${grnConfList.billDetailNo}" style="display: inline-block !important;" /></td>
													
												<td style="text-align: center;font-size: 15px;  white-space: nowrap;"><c:out
														value="${grnConfList.invoiceNo}"></c:out></td>
													
												<td style="text-align: center;font-size: 15px;  white-space: nowrap;"><fmt:formatDate
														pattern="dd-MM-yyyy" value="${grnConfList.billDate}" /></td>
												
												
														
												<td style="text-align: left; font-size: 15px;  white-space: nowrap;"><c:out
														value="${grnConfList.itemName}"></c:out></td>
														<td style="text-align: right;  white-space: nowrap;"><c:out
																value="${grnConfList.grnType}"></c:out></td>
												

												<td style="text-align: right;font-size: 15px;  white-space: nowrap;"><c:out
														value="${grnConfList.billQty}"></c:out> <input
													type="hidden" name="grnqty${grnConfList.billDetailNo}"
													id="grnqty${grnConfList.billDetailNo}" size="5" 
													readonly="readonly" value="${grnConfList.autoGrnQty}" /></td>

												<td style="text-align: right;font-size: 15px;  white-space: nowrap;"
													id="grn_rate${grnConfList.billDetailNo}"><c:out
														value="${grnConfList.rate}"></c:out></td>


												<td style="font-size: 15px; white-space: nowrap;" ><input type="text"
													name="grnqtyauto${grnConfList.billDetailNo}" value="0"
													id='grnqtyauto${grnConfList.billDetailNo}' size="5"
													style="text-align: center;" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onkeyup="calcGrn(${grnConfList.grnType},${grnConfList.rate},${grnConfList.itemId},
																	${grnConfList.sgstPer},${grnConfList.cgstPer},${grnConfList.cessPer},${grnConfList.billQty},${grnConfList.billDetailNo},${grnConfList.discPer})" />


												</td>


												<fmt:formatNumber var="grnAmt" type="number"
													minFractionDigits="2" maxFractionDigits="2"
													value="${grnConfList.grnAmt}" />

												<c:set var="grnAmt" value="${grnAmt}" />

												<td style="font-size: 15px; text-align:right; width:80px; white-space: nowrap; " id="grn_amt${grnConfList.billDetailNo}"><c:out
														value="${grnAmt}"></c:out></td>

												<td style="font-size: 15px; white-space: nowrap;"><select
													name="grn_remark${grnConfList.billDetailNo}"
													style="" required="required"
													id="grn_remark${grnConfList.billDetailNo}"
													class="form-control"
													onchange="changeQty(${grnConfList.billDetailNo},${grnConfList.autoGrnQty})">
														<option selected value="0">Goods Expired</option>
														<c:forEach items="${remarkList}" var="remarkList">
																${remarkList.remark}
																<option value="${remarkList.remark}">${remarkList.remark}</option>
														</c:forEach>
												</select></td>

											</tr>
										</c:forEach>
									</tbody>
	</table>
</div>

						
						<div class="form-group btn_l">

							<c:choose>
								<c:when test="${isOpen==1 || flag==0}">
									<button type="submit" class="btn additem_btn" disabled>
										Save
									</button>

								</c:when>
								<c:otherwise>
									<button type="submit" class="btn additem_btn">
										 Save
									</button>
								</c:otherwise>
							</c:choose>

							<!--<button type="button" class="btn">Cancel</button>-->

						</div>
					</form>
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
});

	</script>
<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "100%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
		function openNav1() {
			document.getElementById("mySidenav1").style.width = "100%";
		}

		function closeNav1() {
			document.getElementById("mySidenav1").style.width = "0";
		}
		function openNav3() {
			document.getElementById("mySidenav3").style.width = "100%";
		}

		function closeNav3() {
			document.getElementById("mySidenav3").style.width = "0";
		}
	</script>

<script type="text/javascript">
	
	function changeQty(billDetailNo,autoQty){
		//alert("HIII "+ itemId);
		
		var remark = document.getElementById("grn_remark"+billDetailNo).value;
	 //	alert(remark);
	 	if(remark==0){
	 		//alert("In remark ==0");
			    document.getElementById("grnqtyauto"+billDetailNo).value=autoQty;
	 	}else{
			 $("#grnqtyauto"+billDetailNo).removeAttr("readonly"); 
	 	}
		 
	}
	
	</script>

<script type="text/javascript">
	
	function calcGrn(grnType,rate,itemId,sgstPer,cgstPer,cessPer,autoQty,detailId,discPer){
		
		document.getElementById(""+detailId).checked = false;
		document.getElementById("row"+detailId).style.backgroundColor="white";
		
		var baseRate=rate*100/(sgstPer+cgstPer+cessPer+100);
	
		var grnBaseRate;
		
		var grnRate;
		var grnQty=$("#grnqtyauto"+detailId).val();
		
		if(parseInt(grnQty)>autoQty){
			alert("Edit Quantity can not be greater than Bill Quantity");
			//document.getElementById("grnqtyauto"+itemId).value=autoQty;
			document.getElementById("grnqtyauto"+detailId).value=0.00;
			//---------Extra-------------
			$("#grn_amt"+detailId).html(0);
			
			$("#taxable_amt"+detailId).html(0);

			$("#tax_amt"+detailId).html(0);
			//---------------------
			document.getElementById(""+detailId).checked = false;
			document.getElementById("row"+detailId).style.backgroundColor="white";
			//calcGrn(grnType,rate,itemId,sgstPer,cgstPer,autoQty)
		}else{
			var grnRate=$("#grn_rate"+detailId).text();
			grnBaseRate = baseRate * grnType / 100;
			 grnRate=(parseFloat(rate) * parseFloat(grnType)) / 100;
		/* if(grnType==0){
			var grnRate=$("#grn_rate"+detailId).text();
			grnBaseRate = baseRate * 85 / 100;
			 grnRate=(rate * 85) / 100;
		}
	 if(grnType==1){
			var grnRate=$("#grn_rate"+detailId).text();
			grnBaseRate = baseRate * 75 / 100;
			grnRate=(rate * 75) / 100;
			}
			if(grnType==2){
			var grnRate=$("#grn_rate"+detailId).text();
			grnBaseRate=baseRate;
			grnRate=rate;
			}
			if(grnType==4){
				var grnRate=$("#grn_rate"+detailId).text();
				grnBaseRate=baseRate;
				grnRate=rate;
				} */
			
		var totTaxPer=parseFloat(sgstPer)+parseFloat(cgstPer)+parseFloat(cessPer);
			var taxableAmt=grnBaseRate*grnQty;
			var discAmt=(taxableAmt*discPer)/100;
			taxableAmt=taxableAmt-discAmt;
			var totalTax=taxableAmt*(cgstPer+sgstPer+cessPer)/100;
			
			var grandTotal=taxableAmt+totalTax;
			/* alert(taxableAmt);
			alert(totalTax);
			alert(grandTotal);
			 */
		//$("#grn_rate"+itemId).html(baseRate.toFixed(2));

		$("#grn_amt"+detailId).html(grandTotal.toFixed(2));
		$("#tax_per"+detailId).html(totTaxPer.toFixed(2));
		
		$("#taxable_amt"+detailId).html(taxableAmt.toFixed(2));

		$("#tax_amt"+detailId).html(totalTax.toFixed(2));
		
		if(grnQty>0)
		{
		document.getElementById(""+detailId).checked = true;
		document.getElementById("row"+detailId).style.backgroundColor="pink";
		}
		/* var x=$("#grn_remark"+itemId).val();
		if(grnQty>0){
		
		if(x ==null ||x == ""){
			alert("Enter Remark");
			
		    document.getElementById("grn_remark"+itemId).focus();
		    
		}
		} */
		
		}//end of else
	}
	</script>
<script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("table_grid");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[3];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

function showDate(){
//	alert("HELlo");
	var viewOpt = $("#view_opt").val();
	
	if(viewOpt==1){
		document.getElementById("datepicker").style.display= "block";
		document.getElementById("searchButton").style.display= "block";

		$('#table_grid td').remove();
		
	}
	else{
		document.getElementById("datepicker").style="display:none";
		
		document.getElementById("searchButton").style="display:none";
		$('#table_grid td').remove();
	}
}
</script>



</body>
</html>