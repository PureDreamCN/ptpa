<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="${dynamicServer}/index.htm">首页</a></li>
			<li>>车辆类型</li>
			<li>>修改车辆类型</li>
		</ul>
	</div>
	<h1 class="page-title">
		车辆类型<small>>>修改车辆类型</small>
	</h1>
	<form role="form" id="vehicleForm" name="vehicleForm"
		class="form-horizontal" action="" method="post">

		<div class="tabbable-custom  nav-justified">
			<ul class="nav nav-tabs ">
				<li class="active" id="base"><a href="#tab_1_1"
					data-toggle="tab"> 基本信息 </a></li>
				<li class="" id="seat"><a href="#tab_1_2" data-toggle="tab">
						席别配置 </a></li>
				<!-- <li class="" id="depreciation"><a href="#tab_1_3"
					data-toggle="tab"> 检修参数 </a></li> -->

			</ul>
			<div class="tab-content ">

				<div class="tab-pane fade active in " id="tab_1_1">
					<div class="row">
						<div class="col-md-10">
							<input type="hidden" name="backUrl" value="${backUrl }">
							<div class="form-group">
								<label class="col-md-3 control-label">车型：</label>
								<div class="col-md-7">
									<form:select path="vehicle.cxCode"
										class="form-control input-inline  input-xlarge" name="cxCode"
										id="cxCode">
										<option value="">请选择车型</option>
										<form:options items="${listCX}" itemValue="code"
											itemLabel="name" />
									</form:select>
									
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">车种：</label>
								<div class="col-md-7">
									<input type="hidden" name="czName" value="czName">
									<form:select path="vehicle.czCode"
										class="form-control input-inline  input-xlarge" name="czCode"
										id="czCode">
										<option value="">请选择车种</option>
										<form:options items="${listCZ}" itemValue="code"
											itemLabel="code" />
									</form:select>
									
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">辆型：</label>
								<div class="col-md-7">
									<form:select path="vehicle.lxCode"
										class="form-control input-inline  input-xlarge" name="lxCode"
										id="lxCode">
										<option value="">请选择辆型</option>
										<form:options items="${listVehicleType}" itemValue="code"
											itemLabel="name" />
									</form:select>
									
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">购置成本：</label>
								<div class="col-md-7">
									<input id="purchasePrice" name="purchasePrice" type="text"
										class="form-control input-inline  input-xlarge" placeholder=""
										value="${vehiclePurchasePrice }"> 元 
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">平均年走行公里：</label>
								<div class="col-md-7">
									<input id="averageKilometer" name="averageKilometer"
										type="text" class="form-control input-inline  input-xlarge"
										placeholder="" value="${vehicle.averageKilometer }"> 公里
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">折旧年限：</label>
								<div class="col-md-7">
									<input id="depreciationPeriod" name="depreciationPeriod"
										type="text" class="form-control input-inline  input-xlarge"
										placeholder="" value="${vehicle.depreciationPeriod }"> 年
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">折旧残值率：</label>
								<div class="col-md-7">
									<input id="deperciationResidualRate"
										name="deperciationResidualRate" type="text"
										class="form-control input-inline  input-xlarge" placeholder=""
										value=""> %
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">大修清算单价：</label>
								<div class="col-md-7">
									<input id="maintainAdvancePrice" name="maintainAdvancePrice"
										type="text" class="form-control input-inline  input-xlarge"
										placeholder="" value="${vehicle.maintainAdvancePrice}"> 元
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">日常修清算单价：</label>
								<div class="col-md-7">
									<input id="maintainNormalPrice" name="maintainNormalPrice"
										type="text" class="form-control input-inline  input-xlarge"
										placeholder="" value="${vehicle.maintainNormalPrice}"> 元
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="tab-pane fade active in" id="tab_1_2">
					<div class="form-group">

						<div class="col-md-10">
							<table class="table table-striped table-hover table-bordered"
								id="seatTable" style="text-align: center;">
								<thead>
									<tr>
										<th style="text-align: center;">席别</th>
										<th style="text-align: center;">定员</th>
										<th style="text-align: center;">排序</th>
										<th style="text-align: center;">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listVehicleSeat}" var="vehicleSeat"
										varStatus="st">

										<tr role="row">
											<td><select type='text'
												class='form-control input-inline  input-xlarge'
												name="seatType" id="seatType${st.index }"><option value=''>请选择席别</option>
													<c:forEach items="${listSeatType}" var="seat">
														<option value="${seat.code}"
															<c:if test="${seat.code eq vehicleSeat.seatTypeCode }">
											   		  		selected
											   				</c:if>>&nbsp;${seat.name}
														</option>
													</c:forEach></select>
											</td>
											<td><input type="text" class="form-control input-small"
												name="capacity" id="capacity${st.index }" value="${vehicleSeat.capacity }"></td>
											<td><input type="text" class="form-control input-small"
												name="orderIndex" id="orderIndex${st.index }" value="${vehicleSeat.orderIndex }"></td>
											<td><a href='#' onclick='delRow(this)'>删除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br />
							<div id="submitBtn" class="form-actions"
								style="position: relative; left: -175px;">
								<div class="row">
									<div class="col-md-offset-3 col-md-9">

										<button type="button" class="btn btn-success" id="addSeatBtn"
											onClick="addSeat()">
											<i class="ace-icon fa fa-plus bigger-110"></i>新增
										</button>

										<button type="button" class="btn default"
											onclick="searchVehicle()">
											<i class="fa fa-undo" /></i> 取消
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<%-- <div class="tab-pane fade active in" id="tab_1_3">
					<div class="form-group">

						<div class="col-md-10">
							<table class="table table-striped table-hover table-bordered"
								id="maintainTable" style="text-align: center;">
								<thead>
									<tr>
										<th style="text-align: center;">维修类型</th>
										<th style="text-align: center;">平均年维修费用</th>
										<th style="text-align: center;">排序</th>
										<th style="text-align: center;">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listVehicleMaintain}" var="vehicleMaintain"
										varStatus="st">

										<tr role="row">
											<td>
											<select type='text' class='form-control input-inline  input-xlarge'><option value=''>&nbsp; --请选择席别-- </option>
											 <c:forEach items="${listVehicleMaintainType}" var="maintain"> 											
											   	<option value="${maintain.code}"
											   	 <c:if test="${maintain.name eq vehicleMaintain.vehicleMaintainTypeName }">
											   		  selected
											   	</c:if>>&nbsp;${maintain.name} </option>	
											    </c:forEach></select>
											</td>
											<td><input type="text" class="form-control input-small" value="${vehicleMaintain.charge }"></td>
											<td><input type="text" class="form-control input-small" value="${vehicleMaintain.orderIndex }"></td>
											<td><a href='#' onclick='delRow(this)'>删除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br />
							<div id="submitBtn" class="form-actions"
								style="position: relative; left: -175px;">
								<div class="row">
									<div class="col-md-offset-3 col-md-9">

										<button type="button" class="btn btn-success" id="addSeatBtn"
											onClick="addMaintain()">
											<i class="ace-icon fa fa-plus bigger-110"></i>新增
										</button>

										<button type="button" class="btn default"
											onclick="history.back(-1)">
											<i class="fa fa-undo" /></i> 取消
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> --%>
			</div>

		</div>
		<div class="form-actions">
			<div class="row">
				<div class="col-md-offset-4 col-md-6">
					<button type="commit" class="btn btn-primary" id="btnAdd">
						<i class="fa fa-save" /></i> 保存
					</button>
					<button type="button" class="btn default" onclick="searchVehicle()">
						<i class="fa fa-undo" /></i> 取消
					</button>
				</div>
			</div>
		</div>
	</form>
	</div>
	</div>

</body>
<critc-script> <script type="text/javascript">
	$(function() {
		init();		
		$("#btnAdd").bind('click', addVehicle);
		$("#averageKilometer").bind('input propertychange',changeKilometer);
		 var seatTable = document.getElementById('seatTable');
		// var maintainTable = document.getElementById('maintainTable');
		if('${vehicle.deperciationResidualRate}'!=''){
			$("#deperciationResidualRate").val(${vehicle.deperciationResidualRate *100});
		}else{
			$("#deperciationResidualRate").val(${vehicle.deperciationResidualRate});
		}
		//用于多个相同的name,校验是使用
	    if ($.validator) {
          $.validator.prototype.elements = function () {
             var validator = this,
               rulesCache = {};
             return $(this.currentForm)
             .find("input, select, textarea")
             .not(":submit, :reset, :image, [disabled]")
             .not(this.settings.ignore)
             .filter(function () {
                 if (!this.name && validator.settings.debug && window.console) {
                     console.error("%o has no name assigned", this);
                 }
                 rulesCache[this.name] = true;
                 return true;
             });
         }
     }
	})
	// 查询方法
	var searchVehicle = function() {
		var url = "index.htm";
		window.location = encodeURI(url);
	}
	  function init() {
            $("#tab_1_1").addClass("active in");
            $("#tab_1_2").removeClass("active in");
           // $("#tab_1_3").removeClass("active in");
            $("#base").addClass("active");
            $("#seat").removeClass("active");
           // $("#depreciation").removeClass("active");
        }
	var changeKilometer = function(){
		if ($("#averageKilometer").val() != '') {
			$("#depreciationPeriod").val("25");
			$("#deperciationResidualRate").val("4");
		}else{
			$("#depreciationPeriod").val('');
			$("#deperciationResidualRate").val('');
		}
	}
	$(document).ready(function() {
		$("#vehicleForm").validate({
			debug : true,
			errorElement : "label",
			errorClass : "valiError",
			/* errorPlacement : function(error, element) {
				error.appendTo($("#" + element.attr('id') + "Tip"));
			}, */
			rules : {
				cxCode : {
					required : true
				},
				czCode : {
					required : true
				},
				lxCode : {
					required : true
				},
				purchasePrice : {
					required : true,
					number : true
				},
				averageKilometer : {
					number : true
				},
				depreciationPeriod : {
					number : true
				},
				deperciationResidualRate : {
					number : true
				},
				maintainAdvancePrice : {
					number : true
				},
				maintainNormalPrice : {
					number : true
				},
				seatType:{
					required : true
				},
				capacity:{
					number : true
				},
				orderIndex:{
					number : true
				}
			},
			messages : {},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
	//席别配置新增
	//添加一行席别
	 function addSeat(){
		var seatTable = document.getElementById('seatTable');
		//表格当前的行数 
		var num=seatTable.rows.length;
		var row = seatTable.insertRow(num);
	   	var cell1="<select type='text' class='form-control input-inline  input-xlarge' name='seatType' id='seatTypeN"+num+"'><option value=''>&nbsp; --请选择席别-- </option>";
        
        <c:forEach items="${listSeatType}" var="seat">  
	   	cell1 += "<option value='" + "${seat.code}"+ "'>&nbsp;"+ "${seat.name}" + "</option>";
	    </c:forEach>  
	   	row.insertCell(0).innerHTML=cell1+"</select>";
	   	row.insertCell(1).innerHTML="<input type='text' class='form-control input-small' name='capacity' id='capacityN"+num+"' value=>";

	   	row.insertCell(2).innerHTML="<input type='text' class='form-control input-small' name='orderIndex' id='orderIndexN"+num+"' value=>";
	   	row.insertCell(3).innerHTML="<a href='#' onclick='delRow(this)'>删除</a>";
	     
	} 
	
	/* //添加一行维修类型
	 function addMaintain(){
		var maintainTable = document.getElementById('maintainTable');
		//表格当前的行数 
		var num=maintainTable.rows.length;
		var rownum=num;
		var row = maintainTable.insertRow(rownum);
	   	var cell1="<select type='text' class='form-control input-inline  input-xlarge'><option value=''>&nbsp; --请选择维修类型-- </option>";
        
        <c:forEach items="${listVehicleMaintainType}" var="maintain">  
	   	cell1 += "<option value='" + "${maintain.code}"+ "'>&nbsp;"+ "${maintain.name}" + "</option>";
	    </c:forEach>  
	   	row.insertCell(0).innerHTML=cell1+"</select>";
	   	row.insertCell(1).innerHTML="<input type='text' class='form-control input-small' value=>";

	   	row.insertCell(2).innerHTML="<input type='text' class='form-control input-small' value=>";
	   	row.insertCell(3).innerHTML="<a href='#' onclick='delRow(this)'>删除行</a>";
	     
	} 
	 */
	//删除行
	 function delRow(obj)
	 {
		 var Row=obj.parentNode;
		 while(Row.tagName.toLowerCase()!="tr")
		 {
		 Row=Row.parentNode;
		 }
		 Row.parentNode.removeChild(Row); //删除行
	 }
	//遍历表格内容返回数组Seat
	 function getTableSeat(){
		    var seatData = new Array();
		    for(var i=1,rows=seatTable.rows.length; i<rows; i++){
		    		var seat = new Object();
		    		seat.seatTypeCode = $('#seatTable tr:eq('+i+') select').val();
		    		seat.seatTypeName = $('#seatTable tr:eq('+i+') select').find("option:selected").text().trim();
		    		seat.capacity = $('#seatTable tr:eq('+i+') input:eq(0)').val();
		    		seat.orderIndex = $('#seatTable tr:eq('+i+') input:eq(1)').val();
		    		seatData.push(seat);
		    }
		    return seatData;
		}
	//遍历表格内容返回数组Maintain
	 /* function getTableMaintain(){
		  
		    var maintainData = new Array();
		    for(var i=1,rows=maintainTable.rows.length; i<rows; i++){
		            var maintain = new Object();
		            maintain.vehicleMaintainTypeCode = $('#maintainTable tr:eq('+i+') select').val();
		            maintain.vehicleMaintainTypeName = $('#maintainTable tr:eq('+i+') select').find("option:selected").text().trim();
		            maintain.charge = $('#maintainTable tr:eq('+i+') input:eq(0)').val();
		            maintain.orderIndex = $('#maintainTable tr:eq('+i+') input:eq(1)').val();
		            maintainData.push(maintain);
		    }
		    return maintainData;
		} */
	//提交表单
	var addVehicle = function(){
		
		var cxName = $("#cxCode").find("option:selected").text();
		//var czCode = $("#czName").find("option:selected").text();
		var lxName = $("#lxCode").find("option:selected").text();
		var form = document.getElementById("vehicleForm");
	    var data = new FormData(form);
	    data.append("cxName",cxName);
	    //data.append("czCode",czCode);
	    data.append("lxName",lxName);
	   	data.append("id",${vehicle.id});
	   	  $.each(getTableSeat(),function(index,item){
	   		data.append("listVehicleSeat["+index+"].seatTypeCode",item.seatTypeCode);
	   		data.append("listVehicleSeat["+index+"].seatTypeName",item.seatTypeName);
	   		data.append("listVehicleSeat["+index+"].capacity",item.capacity);
	   		data.append("listVehicleSeat["+index+"].orderIndex",item.orderIndex);
	   	});  
	    /*  $.each(getTableMaintain(),function(index,item){
	   		data.append("listVehicleMaintain["+index+"].vehicleMaintainTypeCode",item.vehicleMaintainTypeCode);
	   		data.append("listVehicleMaintain["+index+"].vehicleMaintainTypeName",item.vehicleMaintainTypeName);
	   		data.append("listVehicleMaintain["+index+"].charge",item.charge);
	   		data.append("listVehicleMaintain["+index+"].orderIndex",item.orderIndex);
	   	});  */
	     $.ajax({
            type: 'POST',
            url: 'update.htm',
            data: data,
            dataType: 'json',
            processData: false,
            contentType: false,
            success : function(result) {
				window.location.href = result.msgText + "&backUrl=${backUrl}";
			}
        }); 
	}
</script> </critc-script>
</html>