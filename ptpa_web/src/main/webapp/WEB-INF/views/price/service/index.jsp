<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>服务清算单价</title>
</head>

<body>
 <div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >清算单价
        </li>
        <li>
            >服务清算单价
        </li>
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
        <div class="table-responsive">
            <table class="searchTable">
                <tr>
                    <td>铁路局：</td>
                     <td><form:select path="priceServiceSearchVO.ljdm"
								class="form-control input-medium" name="ljdm"
								id="ljdm">
								<option value="">请选择铁路局</option>
								<form:options items="${listBureau}" itemValue="value"
									itemLabel="content" />
				     </form:select>
				     </td>
                    <td>服务类型：</td>
                    <td> 
                    <form:select path="priceServiceSearchVO.serviceCode"
								class="form-control input-medium" name="serviceCode"
								id="serviceCode">
								<option value="">请选择服务类型</option>
								<form:options items="${listService}" itemValue="value"
									itemLabel="content"/>
				     </form:select>
                     
                    
                     <td>
                        <button class="btn btn-primary" id="btnSearch">
                            <i class="ace-icon fa fa-search"></i> 查询
                        </button>
                        <c:if test="${critc:isP('PriceServiceAdd')}">
                            <button type="button" class="btn btn-success" id="btnAdd">
                                <i class="ace-icon fa fa-plus bigger-110"></i>新增
                            </button>
                        </c:if>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <table id="simple-table" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th width=40>#</th>
                <th width=120>服务代码</th>
                <th width="120">服务名称</th>
                <th width="120">铁路局</th>
                <th width="120">服务计量单位</th>
                <th width="120">清算单价（元）</th>
                <th width="160">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list }" var="priceService" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${priceService.serviceCode }</td>
                    <td>${priceService.serviceName }</td>
                    <td>${priceService.shortName }</td>
                    <td>${priceService.unit }</td>
                    <td>${priceService.price }</td>
                    <td>
                        <c:if test="${critc:isP('PriceServiceUpdate')}">
                         <a href="toUpdate.htm?id=${priceService.id }&backUrl=${backUrl}"> 修改 </a>
                    </c:if>
                         <c:if test="${critc:isP('PriceServiceDelete')}">
                        <a href="javascript:delPriceService(${priceService.id });"> 删除 </a>
                    </c:if>
                    
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">${ pageNavigate.pageModel}</div>
</div>

<critc-script>
	<script type="text/javascript">
		 $(function () {
	         $("#btnAdd").bind('click', addPriceService);
	         $("#btnSearch").bind('click', searchPriceService);
	     })
	     
	     
	     // 删除
         var delPriceService = function (id) {
            bootbox.confirm("你确定要删除该条服务清算单价吗？", function (result) {
                if (result) {
                    window.location = "delete.htm?id=" + id + "&backUrl=${backUrl}";
                }
            })
         }
	     
	     var addPriceService = function () {
	            window.location = 'toAdd.htm?backUrl=${backUrl }';
	     }
	     
	     // 查询方法
         var searchPriceService = function () {
             var url = "index.htm?";
             if ($("#serviceCode").val() != '')
                url += "serviceCode=" + $("#serviceCode").val();
             if ($("#ljdm").val() != '')
                url += "&ljdm=" + $("#ljdm").val();
             window.location = encodeURI(url);
         }
	
	</script>
</critc-script>
</body>