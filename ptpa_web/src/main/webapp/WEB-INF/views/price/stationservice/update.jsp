<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../../common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="${dynamicServer}/index.htm">首页</a></li>
			<li>>车站旅客服务清算单价</li>
			<li>>修改车站旅客服务类别</li>
		</ul>
	</div>
	<h1 class="page-title">
		车站旅客服务清算单价<small>>>修改车站旅客服务类别</small>
	</h1>
	<div class="row">
		<div class="col-md-10">
			<form role="form" id="priceStationServiceForm" name="priceStationServiceForm"
				class="form-horizontal" action="" method="post">
				<input type="hidden" name="backUrl" value="${backUrl }">
				<input type="hidden" name="id" value="${priceStationService.id }">
				<div class="form-body">
					<div class="form-group">
						<label class="col-md-3 control-label">车站旅客服务类别：</label>
						<div class="col-md-9">
							<form:select path="priceStationService.stationServiceTypeCode"
								class="form-control input-inline  input-xlarge" name="stationServiceTypeCode"
								id="stationServiceTypeCode">
								<option value="">请选择车站旅客服务类别</option>
								<form:options items="${listStationServiceType}" itemValue="code"
									itemLabel="name" />
							</form:select>
							<label id="stationServiceTypeCodeTip"></label>
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label">清算单价：</label>
						<div class="col-md-9">
							<input id="price" name="price" type="text"
								class="form-control input-inline  input-xlarge" placeholder=""
								value="${priceStationService.price}"> 元 <label id="priceTip"></label>
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
		$("#btnAdd").bind('click', addPriceStationService);
	}) 
	
	$(document).ready(function() {
		$("#priceStationServiceForm").validate({
			debug : true,
			errorElement : "label",
			errorClass : "valiError",
			errorPlacement : function(error, element) {
				error.appendTo($("#" + element.attr('id') + "Tip"));
			},
			rules : {
				stationServiceTypeCode : {
					required : true
				},				
				price : {
					required : true,
					number : true
				}
			},
			messages : {},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
	var addPriceStationService = function() {
		var stationServiceTypeName = $("#stationServiceTypeCode").find("option:selected").text();
		var form = document.getElementById("priceStationServiceForm");
		var data = new FormData(form);
		data.append("stationServiceTypeName", stationServiceTypeName);
		$.ajax({
			type : 'POST',
			url : 'update.htm',
			data : data,
			dataType : 'json',
			processData : false,
			contentType : false,
			success : function(result) {
				window.location.href= result.msgText+"&backUrl=${backUrl}";
			}
		});
	}
</script> </critc-script>
</html>