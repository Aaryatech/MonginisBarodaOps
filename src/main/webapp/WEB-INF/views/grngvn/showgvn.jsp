 <%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loader.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">
<style type="text/css">
label::before {
    width: 0px;
    height: 0px;
    border: 0px; 
    }
    
 .main-table tbody > tr:hover{
  background-color: #ffa;
}
.radio_row{display: inline-block; width:100%; text-align: left;}
.input_row{display: inline-block; width: 100%; margin: 0 0 15px 0; text-align: left;}
.radio_one{float: left; width: 25%; margin: 10px 0 0 0 }
.radio_one label{font-size: 14px;
    color: #555;
    vertical-align: text-bottom;
    margin: 0 0 0 3px;}
.bill_row{display: inline-block; width: 100%; margin: 0 0 15px 0;}
.small_radio{float: left; width: 50%;}
.bills_drop{float: left; width: 30%; margin: 0 15px 0 0;}
.row_button{float: left;}
.btn-primary {padding: 6px 15px; border: none; cursor: pointer; background: #ec268f; color: #FFF; font-size: 14px; border-radius: 3px;}
.btn-primary:hover {color:#fff; background-color:#e51d87;}
.date_row_r{float: right; width: 50%;}
.date_one{float: left; width: 25%; margin: 0 15px 0 0;}
.date_btn{float: left;}
.date_one.increse{width:35%;}
.date_row {
    position: relative;
    display: inline-block;
    width: 100%;
}
.input_one {
    border: 1px solid #ddd;
    padding: 7px 12px;
    width: 100%;
    border-radius: 3px;
    color: #555;
    font-size: 14px;
    outline: none;
    resize: none;
}
.input_one::-webkit-input-placeholder {color: #555 !important;opacity: 1 !important;}
.input_one:-moz-placeholder { color: #555 !important;opacity: 1 !important;}
.input_one::-moz-placeholder {color: #555!important;opacity: 1 !important;}
.calendar_icn {
    position: absolute;
    right: 10px;
    top: 11px;
    font-size: 14px;
    cursor: pointer;
    z-index: 0;
}

.drop_down_one{float: left; width: 20%; margin: 0 15px 0 0;}
.drop_down_one.multitple{width: 35%;}
.drop_down_one.date{width: 15%;}

.select-css {display: block; font-size: 14px; color: #555; line-height: 1.3; padding: 8px 12px; width: 100%; 
border: 1px solid #ddd; max-width: 100%; box-sizing: border-box; margin: 0; border-radius: 3px; -moz-appearance: none; 
-webkit-appearance: none; appearance: none; background:#FFF url(${pageContext.request.contextPath}/resources/images/dropdown_arrow.jpg) no-repeat; 
background-position: right .7em top 50%, 0 0;}
.select-css::-ms-expand {display: none;}
.select-css:hover {border-color: none;}
.select-css:focus {outline: none;}
.select-css option {font-weight:normal;}
*[dir="rtl"] .select-css, :root:lang(ar) .select-css, :root:lang(iw) .select-css {background-position: left .7em top 50%, 0 0; padding: .6em .8em .5em 1.4em;}
</style>

 <style>
table, th, td {
    border: 1px solid #9da88d;
}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<c:url var="getViewGvnOption" value="/getViewGvnOption" />
	<c:url var="getItemListByMenu" value="/getItemListById"></c:url>

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
			
				<div class="title_row">
					<div class="title_l high">
						<h2 class="pageTitle"><i class="fa fa-refresh" aria-hidden="true"></i> Request GVN </h2>
					</div>
					
					<div class="clr"></div>
				</div>
				
				<form
							action="${pageContext.request.contextPath}/getGvnBillDetails"
							name="grn" id="grn" method="post">
				<!-- new designer code start here 07-05-2021 -->
				<div class="row">
					<div class="col-md-12">
						<div class="radio_row">
							<div class="input_row">
								
								<div class="radio_owen one">
									<div class="radio_one" id="d1">
					            <input type="radio" id="bill" name="prodBill" ${p1==1 ? 'checked' : ''} value="1" onchange="setDiv(1,this.value)">
					            <label for="bill" class="checkbox_txt"> As Per Bill</label>
					            </div>
					            
					            <div class="radio_one" id="d2">
					            <input type="radio" id="product" name="prodBill" ${p1==0 ? 'checked' : ''} value="0" onchange="setDiv(2,this.value)">
					            <label for="product" class="checkbox_txt"> As per Product</label>
					            </div>
					            
								</div>
								<div class="radio_owen two">
									<c:set var="divStylep2" value="style=display:none"></c:set>
					            <c:if test="${p1==1}">
					            <c:set var="divStylep2" value=""></c:set>
					            </c:if>
					            <div class="radio_one" id="d3" ${divStylep2}>
					            <input type="radio" id="billwise" name="billdatewise" value="1" ${p2==1 ? 'checked' : ''} onchange="setDiv(3,this.value)">
					            <label for="billwise" class="checkbox_txt"> Billwise</label>
					            </div>
					            
					            <div class="radio_one" id="d4" ${divStylep2}>
					            <input type="radio" id="datewise" name="billdatewise" value="0" ${p2==0 ? 'checked' : ''} onchange="setDiv(4,this.value)">
					            <label for="datewise" class="checkbox_txt"> Datewise</label>
					            </div>
								</div>
							
							
					            
					
					            
					            
					        </div>
						</div>
						
						<div class="input_row">
						 <c:set var="divStyleP" value="style=display:none"></c:set>
					            <c:if test="${p1==1}">
					            <c:set var="divStyleP" value=""></c:set>
					            </c:if>
					            
					             <c:set var="dateDivStyle" value="style=display:none"></c:set>
					            <c:if test="${p1==0||p2==0}">
					            <c:set var="dateDivStyle" value=""></c:set>
					            </c:if>
					            
							 <div class="date_one" id="d5" ${dateDivStyle}>
                                <div class="date_row" >
                                    <input type="text" id="fd" value="${fd}"   name="fd" class="input_one" placeholder="From Date">
                                    <i class="fa fa-calendar calendar_icn" aria-hidden="true"></i>
                                </div> 
                            </div>
                            <div class="date_one" id="d6"  ${dateDivStyle}>
                                <div class="date_row" >
                                    <input type="text" id="td"  value="${td}" name="td" class="input_one" placeholder="To Date">
                                    <i class="fa fa-calendar calendar_icn" aria-hidden="true"></i>
                                </div> 
                            </div>
                            <c:set var="divStyleQ" value="style=display:none"></c:set>
                             <c:if test="${p1==0}">
					            <c:set var="divStyleQ" value=""></c:set>
					            </c:if>
                            <div class="date_one" id="d7" ${divStyleQ}>
                            	<div class="form_field">
                                 <select class="select-css" id="catId" name="catId" onchange="getItems()">
                                 <option selected value="">Select Category</option>
			<c:forEach var="catList" items="${catList}">
			<c:choose>
			<c:when test="${catList.catId==selectedCatId}">
						<option selected value="${catList.catId}">${catList.catName}</option>   
			</c:when>
			<c:otherwise>
			<option value="${catList.catId}">${catList.catName}</option> 
			</c:otherwise>
			</c:choose>
			  
			</c:forEach>
                                    </select>
                            </div>
                            </div>
                            <div class="date_btn" id="d8" ${divStyleP}>
                            	<button type="button" onclick="getBills()" class="btn additem_btn addcust_open" style="margin:0;"> Search Bills</button>
                            </div>
						</div>
						
						<div class="input_row">
							<div class="date_one increse" id="d9" ${divStyleQ}>
                            	<!-- <div class="form_field"> -->
                                 <select   id="items" name="items" multiple="multiple"  class="chosen-select">
                                 <c:choose>
                                 <c:when test="${selectedCatId==5}">
                                 <c:forEach items="${itemList}" var="itemList">
                                 <c:set var="isFound" value="0"></c:set>
                                 <c:forEach var="selItem" items="${selectedItemArray}">
                                 <c:if test="${selItem==itemList.spId}">
                                 <c:set var="isFound" value="1"></c:set>
                                 </c:if>
                                 </c:forEach>
                                 <c:choose>
                                 <c:when test="${isFound==1}">
                                                                 <option selected value="${itemList.spId}">${itemList.spName}-${itemList.spCode}</option>
                                 
                                 </c:when>
                                 <c:otherwise>
                                                                 <option value="${itemList.spId}">${itemList.spName}-${itemList.spCode}</option>
                                 
                                 </c:otherwise>
                                 </c:choose>
                                 </c:forEach>
                                 </c:when>
                                 <c:otherwise>
                                 <c:forEach items="${itemList}" var="itemList">
                                 <c:set var="isFound" value="0"></c:set>
                                 <c:forEach var="selItem" items="${selectedItemArray}">
                                 <c:if test="${selItem==itemList.itemId}">
                                 <c:set var="isFound" value="1"></c:set>
                                 </c:if>
                                 </c:forEach>
                                 <c:choose>
                                 <c:when test="${isFound==1}">
                                                                 <option selected value="${itemList.itemId}">${itemList.itemName}</option>
                                 
                                 </c:when>
                                 <c:otherwise>
                                                                 <option value="${itemList.itemId}">${itemList.itemName}</option>
                                 
                                 </c:otherwise>
                                 </c:choose>
                                 </c:forEach>
                                 </c:otherwise>
                                 </c:choose>
                                 
                                    </select>
                            <!-- </div> -->
                            </div>
                            
                            <div class="date_one" id="d10" ${divStylep2}>
                            	<div class="form_field">
                                 <select class="select-css" id="bills" name="bills">
                                   <c:forEach var="frBillList" items="${frBillList}">
			<c:choose>
			<c:when test="${frBillList.billNo==selctedBillNo}">
						<option selected value="${frBillList.billNo}">${frBillList.invoiceNo}- Inv Date${frBillList.billDate}</option>   
			</c:when>
			<c:otherwise>
			<option value="${frBillList.billNo}">${frBillList.invoiceNo}- Inv Date${frBillList.billDate}</option> 
			</c:otherwise>
			</c:choose>
			  
			</c:forEach>
                                    </select>
                            </div>
                            </div>
                            <!-- <div class="date_one">
                            	<input name="" type="text" class="input_one" placeholder="Get Details">
                            </div> -->
                            <div class="date_btn" id="d11">
                            	<button type="submit" class="btn additem_btn addcust_open" style="margin:0;"> Get Details</button>
                            </div>
						</div>
						
					</div>
				</div>
				<div align="center" id="loader" style="display: none">

									<span>
										<h4>
											<font color="#343690">Loading</font>
										</h4>
									</span> <span class="l-1"></span> <span class="l-2"></span> <span
										class="l-3"></span> <span class="l-4"></span> <span
										class="l-5"></span> <span class="l-6"></span>
								</div>
				</form>
			<!-- new designer code end here 07-05-2021 -->

				

				<div class="row">
					<div class="col-md-12">
						

					</div>
					<!-- 						</form>
 -->
					<form action="${pageContext.request.contextPath}/addTempGvn"
						name="grn_add" id="grn_add" method="post">
						
						<div class="col-md-9" ></div> 
					<label for="search" class="col-md-3 flt_rgt"  id="search">
    <i class="fa fa-search" ></i>
									<input type="text"  id="myInput" style="border-radius: 25px;" onkeyup="myFunction()" placeholder="Search items by name.." title="Type in a name">
										</label> 
						

						<div class="clearfix"></div>
						
						<div class="tableFixHead">
							<table id="table_grid">         
							<thead style="background-color: #f3b5db;">
								<tr class="bgpink">
									<th style="text-align: center; white-space: nowrap;">Select</th>
									<th style="text-align: center; white-space: nowrap;">Item Name</th>
									<th style="text-align: center; white-space: nowrap;">Invoice</th>
									<th style="text-align: center; white-space: nowrap;">Expiry Date</th>
									<th style="text-align: center; white-space: nowrap;">Purchase</th>
									<th style="text-align: center; white-space: nowrap;">GVN Qty</th>
									<th style="text-align: center; white-space: nowrap;">Rate</th>
									<th style="text-align: center; white-space: nowrap;">Tax %</th>
									<th style="text-align: center; white-space: nowrap;">Amount</th>
								</tr>
							</thead>
							
							<tbody>
										<c:forEach items="${gvnConfList}" var="gvnConfList"
											varStatus="count">

											<input type="hidden" id="b_qty${gvnConfList.billDetailNo}"
												value="${gvnConfList.billQty}" />

											<tr id="row${gvnConfList.billDetailNo}">
												<td style="text-align: center; width:80px; white-space: nowrap;"><input type="checkbox" 
													name="select_to_gvn" id="${gvnConfList.billDetailNo}"
													value="${gvnConfList.billDetailNo}"  /></td>

												<td style="text-align: left; white-space: nowrap;">${gvnConfList.itemName}</td>
												<fmt:formatDate pattern = "yyyy-MM-dd" 
         value = "${gvnConfList.billDate}" var="invDate" />
												<td style="text-align: left; white-space: nowrap;">${gvnConfList.invoiceNo}-${invDate}</td>
												<td style="text-align: right; white-space: nowrap;">${gvnConfList.expiryDate}</td>
												
												<td style="text-align: right; white-space: nowrap;">${gvnConfList.billQty}</td>
												<td style="text-align: center; white-space: nowrap;"><input type="text"
													name="gvn_qty${gvnConfList.billDetailNo}"
													id='gvn_qty${gvnConfList.billDetailNo}' size="5" value="0"  onkeypress='return event.charCode >= 48 && event.charCode <= 57'
													onkeyup="calcGvn(${gvnConfList.calcBaseRate},${gvnConfList.itemId},${gvnConfList.sgstPer},${gvnConfList.cgstPer},${gvnConfList.cessPer},${gvnConfList.billDetailNo})" /></td>

												<td style="text-align: right; white-space: nowrap;">${gvnConfList.rate}</td>

												<td id="tax_per${gvnConfList.billDetailNo}" style="text-align: right; white-space: nowrap;"><c:out
														value="00"></c:out></td>

												<td id="gvn_amt${gvnConfList.billDetailNo}" style="text-align: right; white-space: nowrap;"><c:out
														value="00"></c:out></td>

											</tr>

										</c:forEach>

									</tbody>
							</table>
						</div>

						

                        
						<div class="form-group">

							<button type="button" class="btn additem_btn" onclick="checkAnyRecordSelected()" style="margin:15px 0 0 0;">
								Proceed
							</button>
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

<!-- new css for 07-05-2021 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/css/jquery-ui.css"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/chosen.jquery.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/init.js"
		type="text/javascript" charset="utf-8"></script>
      <script type="text/javascript">
      $( function() {
        $(".datepicker").datepicker();
      } );
          $(".datepicker").datepicker({
        inline: true
    });
          window.onload = function() {
        	  var pp1=${p1};
        	  var pp2=${p2};
        	  //setDiv(pp1,pp2);
        	};
          $(function() {
        		$("#fd").datepicker({ dateFormat: 'dd-mm-yy' });
        	});
        	$(function() {
        		$("#td").datepicker({ dateFormat: 'dd-mm-yy' });
        	});
      </script> 
<script>
function getBills(){
	$('#loader').show();
	var x=$('input[name="billdatewise"]:checked').val();
	var formData=new  FormData();
	formData.append("x",x);
	if(x==1){
		//15 days bill
		formData.append("fd","");
		formData.append("td","");
	}else{
		//fd td bill
		var fd = $("#fd").val();
		var td = $("#td").val();
	
		formData.append("fd",fd);
		formData.append("td",td);
	}
	
	$('#loader').show();
	$.ajax({
        url:"${pageContext.request.contextPath}/getInvoiecesForGVN",
  type: "POST",
  data: formData,
  contentType: false,
        cache: false,
  processData:false,
  beforeSend : function()
  {
	  /* if(fd=="" || fd==null){
		  alert("Please select From Date")
	  } */
  },
  success: function(data)
     {
	  	var len=data.length;
	  $('#bills')
	    .find('option')
	    .remove()
	    .end()
		for ( var i = 0; i < len; i++) {
         $("#bills").append(
                 $("<option></option>").attr(
                     "value", data[i].billNo).text(data[i].invoiceNo+ " - Inv Date " + data[i].billDate)
             );
		}
		   $("#bills").trigger("chosen:updated");
		   $('#loader').hide();
     },
	})
}

function getItems(){
	
	 var catId=document.getElementById("catId").value;	
	 $('#loader').show();
$
.getJSON(
		'${getItemListByMenu}',
		{
			menu_id : catId,
			ajax : 'true'
		},
		function(data) {
			var len=data.length;
		
			$('#items')
		    .find('option')
		    .remove()
		    .end()
			 $("#items").append($("<option></option>").attr( "value",-1).text("ALL"));
			for ( var i = 0; i < len; i++) {
				if(parseInt(catId)==5){
					 $("#items").append(
		                       $("<option></option>").attr(
		                           "value", data[i].spId).text(data[i].spName+" "+data[i].spCode)
		                   );
				}else{
					 $("#items").append(
		                       $("<option></option>").attr(
		                           "value", data[i].itemId).text(data[i].itemName)
		                   );
				}
              
			}
			   $("#items").trigger("chosen:updated");
			   $('#loader').hide();
			  // getData()
		})
		//$('#loader').hide();
		
}


function setDiv(p1,p2){
	//alert("OK")
	//document.getElementById("d1").style="display:none";
	//document.getElementById("d2").style="display:none";
	document.getElementById("d3").style="display:none";
	document.getElementById("d4").style="display:none";
	document.getElementById("d5").style="display:none";
	document.getElementById("d6").style="display:none";
	document.getElementById("d7").style="display:none";
	document.getElementById("d8").style="display:none";
	document.getElementById("d9").style="display:none";
	document.getElementById("d10").style="display:none";
	document.getElementById("d11").style="display:none";
	
	if(p1==1){
		document.getElementById("d3").style.display= "block";
		document.getElementById("d4").style.display= "block";
		$("input[name='billdatewise']").attr("checked", false);

	}else if(p1==2){
		//document.getElementById("datepicker").style="display:none";
		document.getElementById("d5").style.display= "block";
		document.getElementById("d6").style.display= "block";
		document.getElementById("d7").style.display= "block";
		document.getElementById("d9").style.display= "block";
		document.getElementById("d11").style.display= "block";
		$("input[name='billdatewise']").attr("checked", false);
	}else if(p1==3){
		document.getElementById("d10").style.display= "block";
		document.getElementById("d11").style.display= "block";
		
		document.getElementById("d3").style.display= "block";
		document.getElementById("d4").style.display= "block";
		
		document.getElementById("d3").style.display= "block";
		document.getElementById("d4").style.display= "block";
		getBills();
	}
	else if(p1==4){
		document.getElementById("d5").style.display= "block";
		document.getElementById("d6").style.display= "block";
		document.getElementById("d8").style.display= "block";
		document.getElementById("d10").style.display= "block";
		document.getElementById("d11").style.display= "block";
		
		document.getElementById("d3").style.display= "block";
		document.getElementById("d4").style.display= "block";
		
	}
	 $('#bills')
	    .find('option')
	    .remove()
	    .end()
$("#bills").trigger("chosen:updated");
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

<script>

 document.getElementById("order_photo1").onchange = function () {
    var reader = new FileReader();

    reader.onload = function (e) {
        // get loaded data and render thumbnail.
        document.getElementById("image").src = e.target.result;
    };

    // read the image file as a data URL.
    reader.readAsDataURL(this.files[0]);
};

</script>

<script type="text/javascript">
function calcGvn(baseRate,itemId,sgstPer,cgstPer,cessPer,billDetailNo){

	$("#"+billDetailNo).prop("checked", false);
		document.getElementById("row"+billDetailNo).style.backgroundColor="white";
		$("#gvn_amt"+billDetailNo).html(0);//new
	var gvnQty=$("#gvn_qty"+billDetailNo).val();
	var billQty=$("#b_qty"+billDetailNo).val();
//	alert("gvnQty ="+gvnQty+ "Bill Qty "+billQty);
	if(parseInt(gvnQty) > parseInt(billQty)){
		
		document.getElementById("gvn_qty"+billDetailNo).value=0;
		alert("GVN Qty can not be greater than Purchase Qty ");
		//var zero=0;
		//$("#gvn_qty"+itemId).value=0;
	}
	else{
	//alert(gvnQty);
	//$("#gvn_qty"+itemId).html(gvnQty);

	
	var gvnAmt=parseFloat(gvnQty)*parseFloat(baseRate);
	gvnAmt.toFixed(2);
	//alert(gvnAmt);
	//$("#gvn_amt"+itemId).html(gvnAmt.toFixed(2));

	 var taxableAmt=baseRate*gvnQty;
		
		var totalTax=(taxableAmt*(sgstPer+cgstPer+cessPer))/100;
		
		var grandTotal=taxableAmt+totalTax;
		
		$("#gvn_amt"+billDetailNo).html(grandTotal.toFixed(2));
		
		var taxPer=parseFloat(sgstPer)+parseFloat(cgstPer)+parseFloat(cessPer);
		$("#tax_per"+billDetailNo).html(taxPer.toFixed(2));

var x=$("#gvn_remark"+billDetailNo).val();

if(gvnQty>0){
document.getElementById(""+billDetailNo).checked = true;
document.getElementById("row"+billDetailNo).style.backgroundColor="pink";
}
};
}


</script>

<script type="text/javascript">
function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $(input).next('img').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$(".upld").change(function () {
    readURL(this);
});

</script>
<script type="text/javascript">

function getViewOption(){
	
	//alert("HJFHKJ");
	
	var viewOpt = $("#view_opt").val();
	var bill_date = $("#datepicker").val();
	
	//alert("option "+viewOpt);
	//alert("bill_date "+bill_date);

	$.getJSON('${getViewGvnOption}', {
		view_opt : viewOpt,
		bill_date : bill_date,
		ajax : 'true',

	});
	
	window.location.reload();
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
    td = tr[i].getElementsByTagName("td")[1];
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
		document.getElementById("byBillNo").style="display:none";

		$('#table_grid td').remove();
		
	}
	else{
		document.getElementById("datepicker").style="display:none";
		document.getElementById("byBillNo").style="block";
		document.getElementById("searchButton").style="display:none";
		$('#table_grid td').remove();
	}
}
function checkAnyRecordSelected()
{
        if($('#grn_add input:checked').length > 0){
        	document.getElementById("grn_add").submit();

        }
        else {
            alert("No records selected for GVN");
        }
}
$('input[type="checkbox"]').on('click', function(event) {
    event.preventDefault();
    event.stopPropagation();
    
    return false;
    
});
</script>



</body>
</html>