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
                线路等级：
                <form:select path="linePriceSearchVo.linePriceLevelCode" class="form-control input-medium input-inline"
                             id="cmbLinePriceLevelCode">
                    <form:option value="" label="--全部--"/>
                    <form:options items="${listPriceLevel}" itemValue="code" itemLabel="name"/>
                </form:select>
            </div>
            <div class="col-md-3">
                繁忙程度：
                <form:select path="linePriceSearchVo.lineBusyLevelCode" class="form-control input-medium input-inline"
                             id="cmbLineBusyLevelCode">
                    <form:option value="" label="--全部--"/>
                    <form:options items="${listLineBusyLevel}" itemValue="code" itemLabel="name"/>
                </form:select>
            </div>
            <div class="col-md-3">
                列车类型：
                <form:select path="linePriceSearchVo.trainTypeCode" class="form-control input-medium input-inline"
                             id="cmbTrainTypeCode">
                    <form:option value="" label="--全部--"/>
                    <form:options items="${listTrainType}" itemValue="code" itemLabel="name"/>
                </form:select>
            </div>
            <div class="col-md-3">
                列车编组：
                <form:select path="linePriceSearchVo.trainMarshallingTypeCode"
                             class="form-control input-medium input-inline"
                             id="cmbTrainMarshallingTypeCode" >
                    <form:option value="" label="--全部--"/>
                    <form:options items="${listTrainMarshallingType}" itemValue="code" itemLabel="name"/>
                </form:select>
            </div>

        </div>
        <hr/>
        <button class="btn btn-primary" id="btnSearch">
            <i class="ace-icon fa fa-search"></i> 查询
        </button>
        <button type="button" class="btn btn-success" id="btnConfirm">
            <i class="ace-icon fa fa-plus bigger-100"></i>确认
        </button>
    </div>


</div>

<div class="row">
    <div class="col-md-12">
        <table id="simple-table" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>选择</th>
                <th width=40>#</th>
                <th>线路等级</th>
                <th>列车类型</th>
                <th>列车编组</th>
                <th>动车组线路繁忙程度</th>
                <c:if test="${beforeDawn eq 1 } ">
                    <th>动车段22时-次日6时价格占比</th>
                </c:if>
                <th>单价</th>

            </tr>
            </thead>
            <tbody
            <c:forEach items="${list}" var="linePrice" varStatus="lp">
                <tr>
                    <td>
                        <label class="mt-checkbox mt-checkbox-outline">
                            <input name="module" type="radio" value="${linePrice.id}" class="father">
                            <span></span>
                        </label>
                    </td>
                    <td>${lp.index+1 }</td>
                    <td>${linePrice.linePriceLevelName } </td>
                    <td>${linePrice.trainTypeName }</td>
                    <td>${linePrice.trainMarshallingTypeName }</td>
                    <td>${linePrice.lineBusyLevelName }</td>
                    <c:if test="${ beforeDawn eq 1 } ">
                        <td><fmt:formatNumber value="${linePrice.beforeDawnRate }" type="percent"/></td>
                    </c:if>
                    <td><fmt:formatNumber value="${linePrice.price}" type="currency"/></td>

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
            $("#btnConfirm").bind('click', confirm);
        })

        // 查询方法
        var search = function () {
            var url = "commonLinePrice.htm?";
            if ($("#cmbLinePriceLevelCode").val() != '') {
                url += "linePriceLevelCode=" + $("#cmbLinePriceLevelCode").val();
            }
            if ($("#cmbLineBusyLevelCode").val() != '') {
                url += "&lineBusyLevelCode=" + $("#cmbLineBusyLevelCode").val();
            }
            if ($("#cmbTrainTypeCode").val() != '') {
                url += "&trainTypeCode=" + $("#cmbTrainTypeCode").val();
            }
            if ($("#cmbTrainMarshallingTypeCode").val() != '') {
                url += "&trainMarshallingTypeCode=" + $("#cmbTrainMarshallingTypeCode").val();
            }
           url += "&trainId=" +${trainId};

           url += "&lineId=" +${lineId};


            window.location = encodeURI(url);
        }
        //确认
        var confirm = function (id) {
            var id = $("input[name='module']:checked").val();
            if (id) {
                window.location = "${dynamicServer}/train/linepricedate.htm?trainId=${trainId}&lineId=${lineId}&dataId=" + id + "&param=2";
            }else{
                bootbox.alert("请选择一条数据！")
            }
        }
    </script>
</critc-script>