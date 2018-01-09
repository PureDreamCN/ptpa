<%--
  Created by IntelliJ IDEA.
  User: mary
  Date: 2017/11/28
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>接触网和电费清算单价</title>
</head>

<body>

<div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >接触网和电费清算电费
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
                客专公司：
                <form:select path="cePriceSearchVo.pseCode" class="form-control input-medium input-inline"
                             id="cmbPseCode">
                    <form:option value="" label="--全部--"/>
                    <form:options items="${listPse}" itemValue="code" itemLabel="name"/>
                </form:select>
            </div>
            <div class="col-md-4">
                铁路局：
                <form:select path="cePriceSearchVo.ljdm" class="form-control input-medium input-inline"
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
                <th>客专公司</th>
                <th>铁路局</th>
                <th>接触网使用费单价(元/万总重吨公里)</th>
                <th>电费单价(元/万总重吨公里)</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody
            <c:forEach items="${list}" var="cePrice" varStatus="lp">
                <tr>
                    <td>${lp.index+1 }</td>
                    <td>${cePrice.pseName } </td>
                    <td>${cePrice.ljName }</td>
                    <td><fmt:formatNumber value="${cePrice.catenaryPrice }" type="currency"/></td>
                    <td><fmt:formatNumber value="${cePrice.electricityPrice}" type="currency"/></td>
                    <td>
                        <c:if test="${critc:isP('CePriceUpdate')}">
                            <a href="toUpdate.htm?id=${cePrice.id }&backUrl=${backUrl}&pageType=0"> 修改 </a>
                        </c:if>
                        <c:if test="${critc:isP('CePriceDelete')}">
                            <a href="javascript:delCePricee(${cePrice.id });"> 删除 </a>
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

    <script src="${staticServer }/assets/zTree3.5/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#btnSearch").bind('click', search);
            $("#btnAdd").bind('click', addCePrice);
        })

        // 查询方法
        var search = function () {
            var url = "index.htm?";
            if ($("#cmbPseCode").val() != '') {
                url += "pseCode=" + $("#cmbPseCode").val();
            }
            if ($("#cmbljdm").val() != ''){
                url += "&ljdm=" + $("#cmbljdm").val();
            }
            window.location = encodeURI(url);
        }
        // 删除
        var delCePricee = function (id) {
            bootbox.confirm("你确定要删除该条数据吗？", function (result) {
                if (result) {
                    window.location = "delete.htm?id=" + id + "&backUrl=${backUrl}";
                }
            })
        }
        //新增
        var addCePrice = function (id) {
            window.location = 'toAdd.htm?backUrl=${backUrl }';
        }
    </script>
</critc-script>
