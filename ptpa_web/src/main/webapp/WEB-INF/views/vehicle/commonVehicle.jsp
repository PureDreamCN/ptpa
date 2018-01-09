<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆类型</title>
</head>
<body>
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="${dynamicServer}/index.htm">首页</a></li>
			<li>>车辆类型</li>
		</ul>
	</div>
	<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-cogs"></i>操作面板
			</div>
			<div class="tools">
				<a href="javascript:;" class="collapse"> </a>
			</div>
		</div>

		<div class="portlet-body">

			<div class="row">
				<div class="col-md-4">
					车型：
					<form:select path="vehicleSearchVO.cxCode"
						class="form-control input-inline  input-medium" name="cxCode"
						id="cxCode">
						<option value="">请选择车型</option>
						<form:options items="${listCX}" itemValue="code" itemLabel="name" />
					</form:select>
				</div>
				<div class="col-md-4">
					车种：
					<form:select path="vehicleSearchVO.czCode"
						class="form-control input-inline  input-medium" name="czCode"
						id="czCode">
						<option value="">请选择车种</option>
						<form:options items="${listCZ}" itemValue="code" itemLabel="code" />
					</form:select>
				</div>
				<div class="col-md-4">
					<button class="btn btn-primary" id="btnSearch">
						<i class="ace-icon fa fa-search"></i> 查询
					</button>
					<button type="button" class="btn btn-success" id="btnConfirm">
						<i class="ace-icon fa fa-plus bigger-100"></i> 确定
					</button>
					<button onclick="history.back(-1)" class="btn default">
                        <i class="ace-icon fa fa-undo"></i> 返回
                    </button>
				</div>
			</div>


		</div>

	</div>
	<div class="row">
		<div class="col-md-12">
			<table id="simple-table"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width=40>#</th>
						<th>车型</th>
						<th>车种</th>
						<th>辆型</th>
						<th>购置成本（元）</th>
						<th>年平均公里数（公里）</th>
						<th>折旧清算单价</th>
						<th>大修清算单价</th>
						<th>日常修清算单价</th>
						<th>席别配置</th>

					</tr>
				</thead>
				<tbody
					<c:forEach items="${list}" var="vehicle" varStatus="ve">
                <tr>
                    <td> 
                    <label class="mt-checkbox mt-checkbox-outline">
                            <input name="module" type="radio" value="${vehicle.id}" class="father">
                            <span></span>
                        </label>
                    </td>
                    <td>${vehicle.cxName } </td>
                    <td>${vehicle.czCode }(${vehicle.czName })</td>
                    <td>${vehicle.lxName }</td>
                    <td><fmt:formatNumber value="${vehicle.purchasePrice }" type="currency"/></td>
                    <td>${vehicle.averageKilometer }</td>
                    <td>${vehicle.deperciationPrice}</td>
                    <td>${vehicle.maintainAdvancePrice}</td>
                    <td>${vehicle.maintainNormalPrice}</td>
                    <td>${vehicle.seatTypeCapacity}
                    <c:if test="${not empty vehicle.capacity}">
                    	<br/>定员：${vehicle.capacity}
                    </c:if>
                    </td>
                </tr>
            </c:forEach></tbody>
			</table>
		</div>
	</div>
	<div class="modal fade" id="vehicleModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">车辆类型维护</h4>
				</div>
				<div class="modal-body">
					<form role="form" id="resouceForm" name="resouceForm"
						class="form-horizontal" method="post">
						<div class="form-body">
							<div class="form-group">
								<label class="col-md-3 control-label ">车辆编号：</label>
								<div class="col-md-9">
									<input id="orderIndex" name="orderIndex" type="number"
										class="form-control input-inline input-large" placeholder=""
										value="" maxlength="20">
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<label id="errorTip" hidden="hidden" style="color: red;">请补全数据后提交!</label>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="save">保存</button>
				</div>
			</div>
		</div>
	</div>
</body>
<critc-script> <script type="text/javascript">
	$(function() {
		$("#btnSearch").bind('click', searchVehicle);
		$("#btnConfirm").bind('click', confirm);
		$("#save").bind('click', submitVehicle);
		if($("#orderIndex").val()==''){
			$("#errorTip").attr("hidden","false");
			$("#save").attr("disabled", true); 
		}
	})

		// 查询方法
	var searchVehicle = function() {
		var url = "commonVehicle.htm?param=${type}&trainId=${trainId}&srcVehicleId=${srcVehicleId}";

		if ($("#cxCode").val() != '') {
			url += "&cxCode=" + $("#cxCode").val();
		}
		if ($("#czCode").val() != '') {
			url += "&czCode=" +  $("#czCode").val();
		}
		window.location = encodeURI(url);
	}
	var confirm = function() {
		var vehicleId = $("input[name='module']:checked").val();
		if (vehicleId) {
			    $("#vehicleModal").modal("show");	
		} else {
			bootbox.alert("请选择一条数据！");
		}
	}
	$("#orderIndex").bind('input propertychange', function(){
		if($("#orderIndex").val()==''){
			$("#errorTip").attr("hidden",false);
			$("#save").attr("disabled", true); 
		}else{
			$("#errorTip").attr("hidden",true);
			$("#save").attr("disabled", false); 
		}
	});
	var submitVehicle = function(){
		$("#vehicleModal").modal("hide");
		var vehicleId = $("input[name='module']:checked").val();
		if (vehicleId !='' & $('#orderIndex').val()!='') {
		    if( ${type} == 1) {
			window.location = "${dynamicServer}/train/vehicleAdd.htm?trainId=${trainId}&vehicleId="+ vehicleId+"&orderIndex="+$('#orderIndex').val();
			}else if( ${type} == 2){
                window.location = "${dynamicServer}/train/vehicleUpdate.htm?trainId=${trainId}&srcVehicleId=${srcVehicleId}&vehicleId="+ vehicleId+"&orderIndex="+$('#orderIndex').val();
			}
		} else {
			bootbox.alert("请选择一条数据！")
		}
	}
</script> </critc-script>
</html>