<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../../common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车站旅客服务清算单价</title>
</head>
<body>
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="${dynamicServer}/index.htm">首页</a></li>
			<li>>车站旅客服务清算单价</li>
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

			<div>
				<button class="btn btn-primary" id="btnSearch">
					<i class="ace-icon fa fa-search"></i> 刷新
				</button>
				<c:if test="${critc:isP('PriceStationServiceAdd')}">
					<button type="button" class="btn btn-success" id="btnAdd">
						<i class="ace-icon fa fa-plus bigger-100"></i> 新增
					</button>
				</c:if>
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
						<th>车站旅客服务类别名称</th>
						<th>清算单价</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody
					<c:forEach items="${list}" var="priceStationService" varStatus="pstation">
                <tr>
                    <td>${pstation.index+1 }</td>
                    <td>${priceStationService.stationServiceTypeName } </td>
                    <td>${priceStationService.price}</td>
                    <td>
                        <c:if test="${critc:isP('PriceStationServiceUpdate')}">
                        <a href="toUpdate.htm?id=${priceStationService.id }&backUrl=${backUrl}"> 修改 </a>
                        </c:if>
                        <c:if test="${critc:isP('PriceStationServiceDelete')}">
                        <a href="javascript:delPriceStationService(${priceStationService.id });"> 删除 </a>
                        </c:if>
                      </td>
                </tr>
            </c:forEach></tbody>
			</table>
		</div>
	</div>

</body>
<critc-script> <script type="text/javascript">
	$(function() {
		$("#btnSearch").bind('click', searchPriceStationService);
		$("#btnAdd").bind('click', addUser);
	})

	// 查询方法
	var searchPriceStationService = function() {
		var url = "index.htm";
		window.location = encodeURI(url);
	}
	// 删除
	var delPriceStationService = function(id) {
		bootbox.confirm("你确定要删除该车站旅客服务清算单价吗？",
				function(result) {
					if (result) {
						window.location = "delete.htm?id=" + id
								+ "&backUrl=${backUrl}";
					}
				})
	}
	//新增
	var addUser = function(id) {
		window.location = 'toAdd.htm?backUrl='+"${backUrl}";
	}
</script> </critc-script>
</html>