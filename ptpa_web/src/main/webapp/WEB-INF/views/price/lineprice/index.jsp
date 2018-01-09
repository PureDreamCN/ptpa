<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
            >线路清算单价
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
            <div class="col-md-3">
                <label >线路等级：</label>
                <form:select path="linePriceSearchVo.linePriceLevelCode" class="form-control input-medium input-inline"
                             id="cmbLinePriceLevelCode">
                    <form:option value="" label="--全部--"/>
                    <form:options items="${listPriceLevel}" itemValue="code" itemLabel="name"/>
                </form:select>
            </div>
            <div class="col-md-3">
                <label >列车类型：</label>

                <form:select path="linePriceSearchVo.trainTypeCode" class="form-control input-medium input-inline"
                             id="cmbTrainTypeCode">
                    <form:option value="" label="--全部--"/>
                    <form:options items="${listTrainType}" itemValue="code" itemLabel="name"/>
                </form:select>
            </div>
            <div class="col-md-3">
               <label>列车编组：</label>
                <form:select path="linePriceSearchVo.trainMarshallingTypeCode"
                             class="form-control input-medium input-inline"
                             id="cmbTrainMarshallingTypeCode">
                    <form:option value="" label="--全部--"/>
                    <form:options items="${listTrainMarshallingType}" itemValue="code" itemLabel="name"/>
                </form:select>
            </div>
            <div class="col-md-3">
                <label class="control-label">繁忙程度：</label>
                <form:select path="linePriceSearchVo.lineBusyLevelCode" class="form-control input-medium input-inline"
                             id="cmbLineBusyLevelCode">
                    <form:option value="" label="--全部--"/>
                    <form:options items="${listLineBusyLevel}" itemValue="code" itemLabel="name"/>
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
                <th>线路等级</th>
                <th>列车类型</th>
                <th>列车编组</th>
                <th>动车组线路繁忙程度</th>
                <th>动车段22时-次日6时价格占比</th>
                <th>单价(元/列车公里)</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody
            <c:forEach items="${list}" var="linePrice" varStatus="lp">
                <tr>
                    <td>${lp.index+1 }</td>
                    <td>${linePrice.linePriceLevelName } </td>
                    <td>${linePrice.trainTypeName }</td>
                    <td>${linePrice.trainMarshallingTypeName }</td>
                    <td>${linePrice.lineBusyLevelName }</td>
                    <td><fmt:formatNumber value="${linePrice.beforeDawnRate }" type="percent"/></td>
                    <td><fmt:formatNumber value="${linePrice.price}" type="currency"/></td>
                    <td>
                        <c:if test="${critc:isP('LinePriceUpdate')}">
                            <a href="toUpdate.htm?id=${linePrice.id }&backUrl=${backUrl}&pageType=0"> 修改 </a>
                        </c:if>
                        <c:if test="${critc:isP('LinePriceDelete')}">
                            <a href="javascript:del(${linePrice.id });"> 删除 </a>
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
            $("#btnAdd").bind('click', add);
        })

        // 查询方法
        var search = function () {
            var url = "index.htm?";
            if ($("#cmbLinePriceLevelCode").val() != '')
                url += "linePriceLevelCode=" + $("#cmbLinePriceLevelCode").val();
            if ($("#cmbTrainTypeCode").val() != '')
                url += "&trainTypeCode=" + $("#cmbTrainTypeCode").val();
            if ($("#cmbTrainMarshallingTypeCode").val() != '')
                url += "&trainMarshallingTypeCode=" + $("#cmbTrainMarshallingTypeCode").val();
            if ($("#cmbLineBusyLevelCode").val() != '')
                url += "&lineBusyLevelCode=" + $("#cmbLineBusyLevelCode").val();
            window.location = encodeURI(url);
        }
        // 删除
        var del = function (id) {
            bootbox.confirm("你确定要删除该条数据吗？", function (result) {
                if (result) {
                    window.location = "delete.htm?id=" + id + "&backUrl=${backUrl}";
                }
            })
        }
        //新增
        var add = function (id) {
            window.location = 'toAdd.htm?backUrl=${backUrl }';
        }
    </script>
</critc-script>