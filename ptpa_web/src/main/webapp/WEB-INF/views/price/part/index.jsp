<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>备品成本</title>
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
            >备品成本
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
                    <td><form:select path="pricePartSearchVO.ljdm"
								class="form-control input-medium" name="ljdm"
								id="ljdm">
								<option value="">请选择铁路局</option>
								<form:options items="${listBureau}" itemValue="value"
									itemLabel="content" />
				     </form:select>
				     </td>
                    <td>客运列车类型：</td>
                    <td> 
                    <form:select path="pricePartSearchVO.trainTypeCode"
								class="form-control input-medium" name="trainTypeCode"
								id="trainTypeCode">
								<option value="">请选择客运列车类型：</option>
								<form:options items="${listTrainType}" itemValue="value"
									itemLabel="content" />
				     </form:select>
                     </td>
                    
                    
                     <td>
                        <button class="btn btn-primary" id="btnSearch">
                            <i class="ace-icon fa fa-search"></i> 查询
                        </button>
                        <c:if test="${critc:isP('PricePartAdd')}">
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
                <th width="120">铁路局</th>
                <th width="120">客运列车类型编码</th>
                <th width="120">客运列车类型名称</th>
                <th width="160">平均年使用费用（元/年）</th>
                <th width="160">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list }" var="pricePart" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${pricePart.shortName }</td>
                    <td>${pricePart.trainTypeCode }</td>
                    <td>${pricePart.trainTypeName }</td>
                    <td>${pricePart.price }</td>
                    <td>
                        <c:if test="${critc:isP('PricePartUpdate')}">
                         <a href="toUpdate.htm?id=${pricePart.id }&backUrl=${backUrl}"> 修改 </a>
                    </c:if>
                         <c:if test="${critc:isP('PricePartDelete')}">
                        <a href="javascript:delPricePart(${pricePart.id });"> 删除 </a>
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
	         $("#btnAdd").bind('click', addPricePart);
	         $("#btnSearch").bind('click', searchPricePart);
	     })
	     
	     
	     // 删除
         var delPricePart = function (id) {
            bootbox.confirm("你确定要删除该条备品成本吗？", function (result) {
                if (result) {
                    window.location = "delete.htm?id=" + id + "&backUrl=${backUrl}";
                }
            })
         }
	     
	     var addPricePart = function () {
	            window.location = 'toAdd.htm?backUrl=${backUrl }';
	     }
	     
	     // 查询方法
         var searchPricePart = function () {
             var url = "index.htm?";
             if ($("#ljdm").val() != '')
                url += "&ljdm=" + $("#ljdm").val();
             
             if ($("#trainTypeCode").val() != '')
                 url += "&trainTypeCode=" + $("#trainTypeCode").val();
             window.location = encodeURI(url);
         }
	
	</script>
</critc-script>
</body>