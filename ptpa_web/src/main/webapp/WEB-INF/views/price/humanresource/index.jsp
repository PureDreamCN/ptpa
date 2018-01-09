<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>人力清算单价</title>
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
            >人力清算单价
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
                    <td><form:select path="priceHumanResourceSearchVO.ljdm"
								class="form-control input-medium" name="ljdm"
								id="ljdm">
								<option value="">请选择铁路局</option>
								<form:options items="${listBureau}" itemValue="value"
									itemLabel="content" />
				     </form:select>
				     </td>
                    <td>人力类型名称：</td>
                    <td> 
                    <form:select path="priceHumanResourceSearchVO.humanResourceTypeCode"
								class="form-control input-medium" name="humanResourceTypeCode"
								id="humanResourceTypeCode">
								<option value="">请选择人力类型</option>
								<form:options items="${listHumanResource}" itemValue="value"
									itemLabel="content" />
				     </form:select>
                     
                    
                     <td>
                        <button class="btn btn-primary" id="btnSearch">
                            <i class="ace-icon fa fa-search"></i> 查询
                        </button>
                        <c:if test="${critc:isP('PriceHumanResourceAdd')}">
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
                <th width=80>人力类型代码</th>
                <th width="120">人力类型名称</th>
                <th width="80">铁路局</th>
                <th width="160">平均年度人力支出(万元/年)</th>
                <th width="200">每列车每公里人员配置数(人/列公里)</th>
                <th width="160">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list }" var="priceHumanResource" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${priceHumanResource.humanResourceTypeCode }</td>
                    <td>${priceHumanResource.humanResourceTypeName }</td>
                    <td>${priceHumanResource.shortName }</td>
                    <td>${priceHumanResource.price }</td>
                    <td>${priceHumanResource.rate }</td>
                    <td>
                        <c:if test="${critc:isP('PriceHumanResourceUpdate')}">
                         <a href="toUpdate.htm?id=${priceHumanResource.id }&backUrl=${backUrl}"> 修改 </a>
                    </c:if>
                         <c:if test="${critc:isP('PriceHumanResourceDelete')}">
                        <a href="javascript:delPriceHumanResource(${priceHumanResource.id });"> 删除 </a>
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
	         $("#btnAdd").bind('click', addPriceHumanResource);
	         $("#btnSearch").bind('click', searchPriceHumanResource);
	     })
	     
	     
	     // 删除
         var delPriceHumanResource = function (id) {
            bootbox.confirm("你确定要删除该条人力清算单价吗？", function (result) {
                if (result) {
                    window.location = "delete.htm?id=" + id + "&backUrl=${backUrl}";
                }
            })
         }
	     
	     var addPriceHumanResource = function () {
	            window.location = 'toAdd.htm?backUrl=${backUrl }';
	     }
	     
	     // 查询方法
         var searchPriceHumanResource = function () {
             var url = "index.htm?";
             if ($("#humanResourceTypeCode").val() != '')
                url += "humanResourceTypeCode=" + $("#humanResourceTypeCode").val();
             if ($("#ljdm").val() != '')
                url += "&ljdm=" + $("#ljdm").val();
             window.location = encodeURI(url);
         }
	
	</script>
</critc-script>
</body>