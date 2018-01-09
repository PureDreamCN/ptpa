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
					<c:if test="${critc:isP('VehicleAdd')}">
						<button type="button" class="btn btn-success" id="btnAdd">
							<i class="ace-icon fa fa-plus bigger-100"></i> 新增
						</button>
					</c:if>
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
						<th>操作</th>
					</tr>
				</thead>
				<tbody
					<c:forEach items="${list}" var="vehicle" varStatus="ve">
                <tr>
                    <td>${ve.index+1 }</td>
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
                    <td>
                        <c:if test="${critc:isP('VehicleUpdate')}">
                        <a href="toUpdate.htm?id=${vehicle.id }&backUrl=${backUrl}"> 修改 </a>
                        </c:if>
                        &nbsp;
                        <c:if test="${critc:isP('VehicleDelete')}">
                        <a href="javascript:delVehicle(${vehicle.id });"> 删除 </a>
                        </c:if>
                      </td>
                </tr>
            </c:forEach></tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">${ pageNavigate.pageModel}</div>
	</div>
</body>
<critc-script> <script type="text/javascript">
	$(function() {
		$("#btnSearch").bind('click', searchVehicle);
		$("#btnAdd").bind('click', addUser);
	})

	// 查询方法
	var searchVehicle = function() {
		var url = "index.htm?";
		if ($("#cxCode").val() != '') {
			url += "cxCode=" + $("#cxCode").val();
		}
		if ($("#czCode").val() != '') {
			url += "&czCode=" +  $("#czCode").val();
		}
		window.location = encodeURI(url);
	}
	// 删除
	var delVehicle = function(id) {
		bootbox.confirm("你确定要删除该车辆类型吗？",
				function(result) {
					if (result) {
						window.location = "delete.htm?id=" + id
								+ "&backUrl=${backUrl}";
					}
				})
	}
	//新增
	var addUser = function(id) {
		window.location = 'toAdd.htm';
	}
</script> </critc-script>
</html>