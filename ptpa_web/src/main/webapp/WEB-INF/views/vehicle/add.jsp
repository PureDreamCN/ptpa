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
			<li>>新增车辆类型</li>
		</ul>
	</div>
	<h1 class="page-title">
		车辆类型<small>>>新增车辆类型</small>
	</h1>
	<div class="row">
		<div class="col-md-10">
			<form role="form" id="vehicleForm" name="vehicleForm"
				class="form-horizontal" action="" method="post">
				<div class="form-body">
					<div class="form-group">
						<label class="col-md-3 control-label">车型：</label>
						<div class="col-md-9">
							<form:select path="vehicle.cxCode"
								class="form-control input-inline  input-xlarge" name="cxCode"
								id="cxCode">
								<option value="">请选择车型</option>
								<form:options items="${listCX}" itemValue="code"
									itemLabel="name" />
							</form:select>
							<label id="cxCodeTip"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">车种：</label>
						<div class="col-md-9">
							<form:select path="vehicle.czName"
								class="form-control input-inline  input-xlarge" name="czName"
								id="czName">
								<option value="">请选择车种</option>
								<form:options items="${listCZ}" itemValue="name"
									itemLabel="code" />
							</form:select>
							<label id="czNameTip"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">辆型：</label>
						<div class="col-md-9">
							<form:select path="vehicle.lxCode"
								class="form-control input-inline  input-xlarge" name="lxCode"
								id="lxCode">
								<option value="">请选择辆型</option>
								<form:options items="${listVehicleType}" itemValue="code"
									itemLabel="name" />
							</form:select>
							<label id="lxCodeTip"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">购置成本：</label>
						<div class="col-md-9">
							<input id="purchasePrice" name="purchasePrice" type="text"
								class="form-control input-inline  input-xlarge" placeholder=""
								value=""> 元 <label id="purchasePriceTip"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">平均年走行公里：</label>
						<div class="col-md-9">
							<input id="averageKilometer" name="averageKilometer" type="text"
								class="form-control input-inline  input-xlarge" placeholder=""
								value=""> 公里<label id="averageKilometerTip"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">折旧年限：</label>
						<div class="col-md-9">
							<input id="depreciationPeriod" name="depreciationPeriod"
								type="text" class="form-control input-inline  input-xlarge"
								placeholder="" value=""> 年<label
								id="depreciationPeriodTip"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">折旧残值率：</label>
						<div class="col-md-9">
							<input id="deperciationResidualRate"
								name="deperciationResidualRate" type="text"
								class="form-control input-inline  input-xlarge" placeholder=""
								value=""> %<label id="deperciationResidualRateTip"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">大修清算单价：</label>
						<div class="col-md-9">
							<input id="maintainAdvancePrice"
								name="maintainAdvancePrice" type="text"
								class="form-control input-inline  input-xlarge" placeholder=""
								value=""> 元<label id="maintainAdvancePriceTip"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">日常修清算单价：</label>
						<div class="col-md-9">
							<input id="maintainNormalPrice"
								name="maintainNormalPrice" type="text"
								class="form-control input-inline  input-xlarge" placeholder=""
								value=""> 元<label id="maintainNormalPriceTip"></label>
						</div>
					</div>

				</div>
				<div class="form-actions">
					<div class="row">
						<div class="col-md-offset-3 col-md-9">
							<button type="submit" class="btn btn-primary" id="btnAdd">
								<i class="fa fa-save" /></i> 保存
							</button>
							<button type="button" class="btn default"
								onclick="history.back(-1)">
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
		$("#btnAdd").bind('click', addVehicle);
		$("#averageKilometer").bind('input propertychange', changeKilometer);

	})
	var changeKilometer = function() {
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
			errorPlacement : function(error, element) {
				error.appendTo($("#" + element.attr('id') + "Tip"));
			},
			rules : {
				cxCode : {
					required : true
				},
				czName : {
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
				}
			},
			messages : {},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
	var addVehicle = function() {
		var cxName = $("#cxCode").find("option:selected").text();
		var czCode = $("#czName").find("option:selected").text();
		var lxName = $("#lxCode").find("option:selected").text();

		var form = document.getElementById("vehicleForm");
		var data = new FormData(form);
		data.append("cxName", cxName);
		data.append("czCode", czCode);
		data.append("lxName", lxName);
		$.ajax({
			type : 'POST',
			url : 'add.htm',
			data : data,
			dataType : 'json',
			processData : false,
			contentType : false,
			success : function(result) {
				window.location.href= result.msgText;
			}
		});
	}
</script> </critc-script>
</html>