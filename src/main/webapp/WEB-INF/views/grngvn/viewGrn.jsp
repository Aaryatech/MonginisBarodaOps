<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
table, th, td {
    border: 1px solid #9da88d;
}
</style>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<!--topLeft-nav-->
<div class="sidebarOuter"></div>
<!--topLeft-nav-->

<!--wrapper-start-->
<div class="wrapper">

	<!--topHeader-->
	<c:url var="getGrnList" value="/getGrnHeaderList" />
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
			
				<div class="title_row">
					<div class="title_l">
						<div class="order-left">
							<h2 class="pageTitle" style="margin:0; padding: 0;"><i class="fa fa-refresh" aria-hidden="true"></i> View GRN</h2>
						</div>
					</div>
					<div class="title_r">
						<form id="validation-form">
 <input type="hidden" value="${gstType}" name="type" id="type"/>

					<div class="colOuter">
						<!-- copy div kalpesh -->

						<div class="frm_l_one">
						<div class="frm_l">From </div>
						<div class="frm_r_one">
							<input id="datepicker" class="texboxitemcode texboxcal" autocomplete="off"
								value="${cDate}" name="from_Date" type="text">
						</div>
						</div>
						
						<div class="frm_l_one">
						<div class="frm_l">To </div>
						<div class="frm_r_one">
							<input id="datepicker2" class="texboxitemcode texboxcal" autocomplete="off"
								value="${cDate}" name="to_Date" type="text">
						</div>
						</div>
						
						



						
						<div class="frm_single">
							<input type="hidden" class="form-control" id="headeIdText"
								style="width: 120px" name="headeIdText" value="0" />
						</div>
						
						<div class="frm_single">
							<button type="button" class="btn additem_btn" style="margin: 0;"
								onclick="searchGRN()">Search</button>

						</div>

					</div>
					</div>
					<div class="clr"></div>
				</div>
			
			
				
				




					<!--tabNavigation-->
					<div class="cd-tabs">
						<!--tabMenu-->

						<!--tabMenu-->
						
						<div class="tableFixHead">
	<table id="table_grid">         
	<thead style="background-color: #f3b5db;">
		<tr class="bgpink">
			<th style="text-align: center; white-space: nowrap;">GRN Sr No</th>
			<th style="text-align: center; white-space: nowrap;">Date</th>
			<th style="text-align: center; white-space: nowrap;">Taxable Amt</th>
			<th style="text-align: center; white-space: nowrap;">Tax Amt</th>
			<th style="text-align: center; white-space: nowrap;">Amount</th>
			<th style="text-align: center; white-space: nowrap;">Approved Amt</th>
			<th style="text-align: center; white-space: nowrap;">Status</th>
			<th style="text-align: center; white-space: nowrap;">Credited?</th>
			<th style="text-align: center; white-space: nowrap;">Credit Number</th>
			<th style="text-align: center; white-space: nowrap;">Action</th>
	
		</tr>
	</thead>
	
	<tbody>

										<c:forEach items="${grnList}" var="grnList" varStatus="count">
											
											<tr>
												<td style="text-align: center; white-space: nowrap;"><c:out
														value="${grnList.grngvnSrno}" /> <input type="hidden"
													name="headerId" id="headerId"
													value="${grnList.grnGvnHeaderId}"></td>
												<td style="text-align: center; white-space: nowrap;"><c:out
														value="${grnList.grngvnDate}" /></td>
												<td style="text-align: right; white-space: nowrap;"><c:out
														value="${grnList.taxableAmt}" /></td>
												<td style="text-align: right; white-space: nowrap;"><c:out value="${grnList.taxAmt}" /></td>
												<td style="text-align: right; white-space: nowrap;"><c:out value="${grnList.totalAmt}" /></td>
													<c:choose>
													<c:when test="${grnList.isCreditNote==1}">
													<td style="text-align: right; white-space: nowrap;"><fmt:formatNumber type="number"
														minFractionDigits="2" maxFractionDigits="2"
														value="${grnList.aprGrandTotal}" /></td>
													</c:when>
													<c:otherwise>
													<td style="text-align: right; white-space: nowrap;">-</td>
													</c:otherwise>
													</c:choose>
												<c:set var="status" value="a"></c:set>
												<c:forEach items="${grStatusLst}" var="grnStatus">
												<c:if test="${grnStatus.statusValue==grnList.grngvnStatus}">
												<c:set var="status" value="${grnStatus.statusName}"></c:set>
												
												</c:if>
												</c:forEach>
												
												<td style="text-align: left; white-space: nowrap;"><c:out value="${status}"></c:out></td>
														<c:set var="isCredit" value="a"></c:set>

												<c:choose>
													<c:when test="${grnList.isCreditNote==1}">
														<c:set var="isCredit" value="Yes"></c:set>
													</c:when>
													<c:otherwise>
														<c:set var="isCredit" value="No"></c:set>
													</c:otherwise>
												</c:choose>

												<td style="text-align: left; white-space: nowrap;"><c:out
														value="${isCredit}"></c:out></td>

												<td style="text-align: left;"><c:out
														value="${grnList.creditNoteId}"></c:out></td>
												
												<c:choose>
												<c:when test="${grnList.isCreditNote==1}">
												
												<td style="text-align: right; white-space: nowrap;"><a href='#' class='action_btn'
													onclick="getGrnDetail(${grnList.grnGvnHeaderId})"><abbr
														title='Detail'><i class='fa fa-list'></i></abbr></a> &nbsp;<a href='#' class='action_btn'
													onclick="genPdf(${grnList.grnGvnHeaderId})"><abbr
														title='Pdf'><i class='fa fa-file-pdf-o' style="color:red;"></i></abbr></a>
												 &nbsp;<a href='#' class='action_btn'
													onclick="genCrnPdf(${grnList.grnGvnHeaderId})"><abbr
														title='Pdf'>CRN</abbr></a>
														</td>
 
												</c:when>
												<c:otherwise>
												<td style="text-align: center; white-space: nowrap;"><a href='#' class='action_btn'
													onclick="getGrnDetail(${grnList.grnGvnHeaderId})"><abbr
														title='Detail'><i class='fa fa-list'></i></abbr></a> &nbsp;<a href='#' class='action_btn'
													onclick="genPdf(${grnList.grnGvnHeaderId})"><abbr
														title='Pdf'><i class='fa fa-file-pdf-o' style="color:red;"></i></abbr></a>
												
														</td>
												</c:otherwise>
												</c:choose>		
											</tr>
										</c:forEach>



									</tbody>
	</table>
</div>


						



					</div>
					<!--tabNavigation-->


				</form>
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
			var headeIdText=$("#headeIdText").val();
			
			//if(!headeIdText==null || headeIdText=="")
			//var isValid = validate();

			//if (isValid) {

				var fromDate = document.getElementById("datepicker").value;
				var toDate = document.getElementById("datepicker2").value;
				//var headeIdText=$("#headeIdText").val();
				
				
				//var headerCheckBox = document.getElementById("headerCheckBox").value;
				//alert("CHK "+headerCheckBox);

				$.getJSON('${getGrnList}', {

					fromDate : fromDate,
					toDate : toDate,
					headerId : headeIdText,
					ajax : 'true'

				}, function(data) {

					//$('#table_grid td').remove();
document.getElementById("headeIdText").value=0;
					if (data == "") {
						alert("No records found !!");

					}

					$.each(data, function(key, grndata) {
						
						var tr = $('<tr></tr>');
						
						 var aprvVal;
								var isCredit;
								if(grndata.isCreditNote==1){
									isCredit="Yes";
									aprvVal = grndata.aprGrandTotal;
								}
								else{
									aprvVal = '-';
									isCredit="No";
								}
									
								
						tr.append($('<td style="text-align: left; white-space: nowrap;"></td>').html(grndata.grngvnSrno));
						tr.append($('<td style="text-align: left; white-space: nowrap;"></td>').html(grndata.grngvnDate));
						tr.append($('<td style="text-align: right; white-space: nowrap;"></td>').html(grndata.taxableAmt));
						tr.append($('<td style="text-align: right; white-space: nowrap;"></td>').html(grndata.taxAmt));
						tr.append($('<td style="text-align: right; white-space: nowrap;"></td>').html(grndata.totalAmt));
						tr.append($('<td style="text-align: right; white-space: nowrap;"></td>').html(aprvVal));/* grndata.aprGrandTotal */
						tr.append($('<td style="text-align: right; white-space: nowrap;"></td>').html(grndata.grnGvnStatusStr));
						
						tr.append($('<td style="text-align: right; white-space: nowrap;"></td>').html(isCredit));

						tr.append($('<td style="text-align: left; white-space: nowrap;"></td>').html(grndata.creditNoteId));	


						//tr.append($('<td class="col-md-2"></td>').html("<input type='button' onclick='getGrnDetail("+grndata.grnGvnHeaderId+")' id='grnDetailButton' value='Detail'>"));
						if(grndata.isCreditNote==1)
							{
						  tr.append($('<td style="text-align: right; white-space: nowrap;" ><a href="#" class="action_btn" onclick="getGrnDetail('+grndata.grnGvnHeaderId+')"><abbr title="Detail"><i class="fa fa-list"></i></abbr></a>&nbsp; <a href="#" class="action_btn" onclick="genPdf('+grndata.grnGvnHeaderId+')"><i class="fa fa-file-pdf-o" style="color:red"></i></a>&nbsp; <a href="#" class="action_btn" onclick="genCrnPdf('+grndata.grnGvnHeaderId+')">CRN</a></td>'));
							}else{
					    tr.append($('<td style="text-align: right; white-space: nowrap;" ><a href="#" class="action_btn" onclick="getGrnDetail('+grndata.grnGvnHeaderId+')"><abbr title="Detail"><i class="fa fa-list"></i></abbr></a>&nbsp; <a href="#" class="action_btn" onclick="genPdf('+grndata.grnGvnHeaderId+')"><i class="fa fa-file-pdf-o" style="color:red"></i></a></td>'));
							}
							//tr.append($('<td ><a href="#" class="action_btn" onclick="genPdf('+grndata.grnGvnHeaderId+')"><abbr title="Pdf"><i class="far fa-file-pdf"></i></abbr></a></td>'));

						//tr.append($('<td class="col-md-2"><a href=''#' class='action_btn' onclick='getGrnDetail("+grndata.grnGvnHeaderId+")'> <abbr title='Detail'><i class="fa fa-trash"></i></abbr></a></td>'));
$('#table_grid tbody')
	.append(
			tr);
			
})

});
				

			
//}//if block
}
		
	
	</script>


<script type="text/javascript">

function getGrnDetail(headerId){
			//alert("HIII");
			//alert("header ID "+headerId)
			
			var fromDate =$("#datepicker").val();
			var toDate =$("#datepicker2").val();
		    var form = document.getElementById("validation-form");
		    form.action ="getGrnDetailList/"+headerId;
		    form.submit();
		}
</script>

<script type="text/javascript">
		function validate() {
		
			var fromDate =$("#datepicker").val();
			var toDate =$("#datepicker2").val();
			
			var headeIdText=$("#headeIdText").val();
			alert(headeIdText);
			
			var isValid = true;
			if(headeIdText =="" || headeIdText == null){
				 isValid = false;
			}
			else if (fromDate == "" || fromDate == null) {

				isValid = false;
				alert("Please select From Date");
			}
		 else if (toDate == "" || toDate == null) {

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

<script>

function genPdf(headerId) {
		//alert("Inside Gen Pdf ");

		var fromDate =$("#datepicker").val();
		var toDate =$("#datepicker2").val();
		var type =$("#type").val();

	// window.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/getGrnPdf/'+fromDate+'/'+'/'+toDate+'/'+headerId+'/'+1+'/'+type);
		    
		    window.open('${pageContext.request.contextPath}/billPdf?url=pdf/getGrnPdf/'+fromDate+'/'+toDate+'/'+headerId+'/'+1+'/'+type);
		   
			
	}
	</script>
<script>

function genCrnPdf(headerId) {
	   
		    window.open('${pageContext.request.contextPath}/pdf/getCrnCheckedHeaders/'+headerId);
			
	}
	</script>
</body>
</html>