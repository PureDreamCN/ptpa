<%--
  Created by IntelliJ IDEA.
  User: mary
  Date: 2017/11/28
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/taglib.jsp" %>

<head>
    <title>线路清算单价</title>
</head>

<body>

<div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >牵引清算单价
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
        <div class="row">
            <div class="col-md-4">
                牵引类型：
                <form:select path="tractionPriceSearchVo.tractionTypeCode"
                             class="form-control input-medium input-inline"
                             id="cmbTractionTypeCode">
                    <form:option value="" label="--全部--"/>
                    <form:options items="${listTractionType}" itemValue="code" itemLabel="name"/>
                </form:select>
            </div>
            <div class="col-md-4">
                铁路局：
                <form:select path="tractionPriceSearchVo.ljdm" class="form-control input-medium input-inline"
                             id="cmbljdm">
                    <form:option value="" label="--全部--"/>
                    <form:options items="${listLJDM}" itemValue="ljdm" itemLabel="name"/>
                </form:select>
            </div>

        </div>
        <hr/>
        <button class="btn btn-primary" id="btnSearch">
            <i class="ace-icon fa fa-search"></i> 查询
        </button>
        <button type="button" class="btn btn-success" id="btnAdd">
            <i class="ace-icon fa fa-plus bigger-100"></i>新增
        </button>
    </div>


</div>

<div class="row">
    <div class="col-md-12">
        <table id="simple-table" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th width=40>#</th>
                <th>铁路局</th>
                <th>牵引类型</th>
                <th>牵引单价(元/万总重吨公里)</th>
                <th>网电单价(元/万总重吨公里)</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody
            <c:forEach items="${list}" var="tractionPrice" varStatus="lp">
                <tr>
                    <td>${lp.index+1 }</td>
                    <td>${tractionPrice.ljName } </td>
                    <td>${tractionPrice.tractionTypeName }</td>
                    <td><fmt:formatNumber value="${tractionPrice.locomotivePrice }" type="currency"/></td>
                    <td><fmt:formatNumber value="${tractionPrice.cePrice}" type="currency"/></td>
                    <td>
                        <c:if test="${critc:isP('TractionPriceUpdate')}">
                            <a href="toUpdate.htm?id=${tractionPrice.id }&backUrl=${backUrl}&pageType=0"> 修改 </a>
                        </c:if>
                        <c:if test="${critc:isP('TractionPriceDelete')}">
                            <a href="javascript:delTractionPrice(${tractionPrice.id });"> 删除 </a>
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
</body>
<critc-script>

    <script type="text/javascript">
        $(function () {
            $("#btnSearch").bind('click', search);
            $("#btnAdd").bind('click', addTractionPrice);
        })

        // 查询方法
        var search = function () {
            var url = "index.htm?";
            if ($("#cmbljdm").val() != '')
                url += "ljdm=" + $("#cmbljdm").val();
            if ($("#cmbTractionTypeCode").val() != '')
                url += "&tractionTypeCode=" + $("#cmbTractionTypeCode").val();
            window.location = encodeURI(url);
        }
        //新增
        var addTractionPrice = function (id) {
            window.location = 'toAdd.htm?backUrl=${backUrl }';
        }
        // 删除
        var delTractionPrice = function (id) {
            bootbox.confirm("你确定要删除该条数据吗？", function (result) {
                if (result) {
                    window.location = "delete.htm?id=" + id + "&backUrl=${backUrl}";
                }
            })
        }
    </script>
</critc-script>
</body>
