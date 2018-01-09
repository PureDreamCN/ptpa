<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>线路清算单价</title>
</head>

<body>
<!-- BEGIN PAGE BAR -->
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >单价模块
        </li>
        <li>
            >线路清算单价
        </li>
    </ul>
</div>
<h1 class="page-title"> 线路清算单价
    <c:if test="${linePrice.id eq 0}">
        <small>>>新增</small>
    </c:if>
    <c:if test="${linePrice.id ne 0}">
        <small>>>修改</small>
    </c:if>
</h1>
<div class="row">
    <div class="col-md-12">
        <form role="form" id="linePriceForm" name="linePriceForm" class="form-horizontal"
        >
            <input type="hidden" name="backUrl" value="${backUrl }">
            <input type="hidden" name="id" value="${linePrice.id }">
            <div class="form-body">

                <div class="form-group">
                    <label class="col-md-3 control-label">线路等级：</label>
                    <div class="col-md-9">
                        <form:select path="linePrice.linePriceLevelCode" class="form-control input-medium input-inline"
                                     id="cmbLinePriceLevelCode">
                            <form:option value="" label="--全部--"/>
                            <form:options items="${listPriceLevel}" itemValue="code" itemLabel="name"/>
                        </form:select>
                        <label id="cmbLinePriceLevelCodeTip"></label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">列车类型：</label>
                    <div class="col-md-9">
                        <form:select path="linePrice.trainTypeCode" class="form-control input-medium input-inline"
                                     id="cmbTrainTypeCode" name="trainTypeCode">
                            <form:option value="" label="--全部--"/>
                            <form:options items="${listTrainType}" itemValue="code" itemLabel="name"/>
                        </form:select>
                        <label id="cmbTrainTypeCodeTip"></label>
                    </div>
                </div>
                <div class="form-group ">
                    <label class="col-md-3 control-label">列车编组：</label>
                    <div class="col-md-9">
                        <form:select path="linePrice.trainMarshallingTypeCode"
                                     class="form-control input-medium input-inline"
                                     id="cmbTrainMarshallingTypeCode"  name ="trainMarshallingTypeCode">
                            <form:option value="" label="--全部--"/>
                            <form:options items="${listTrainMarshallingType}" itemValue="code" itemLabel="name"/>
                        </form:select>
                        <label id="cmbTrainMarshallingTypeCodeTip"></label>

                    </div>
                </div>
                <div class="form-group" id="isShowBusy">
                    <label class="col-md-3 control-label">动车组线路繁忙程度：</label>
                    <div class="col-md-9">
                        <form:select path="linePrice.lineBusyLevelCode" class="form-control input-medium input-inline"
                                     id="cmbLineBusyLevelCode">
                            <form:option value="" label="--全部--"/>
                            <form:options items="${listLineBusyLevel}" itemValue="code" itemLabel="name"/>
                        </form:select>
                    </div>
                </div>
                <div class="form-group " id="isShowRate">
                    <label class="col-md-3 control-label">动车段22时-次日6时：</label>
                    <div class="col-md-9">
                        <input id="beforeDawnRate" type="text" name="beforeDawnRate"
                               class="form-control input-inline input-small "
                               placeholder="" >%(占标准单价的百分比)<label
                            id="beforeDawnRateTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">单价：</label>
                    <div class="col-md-9">
                        <input id="price" type="text" name="price"
                               class="form-control input-inline input-small "
                               placeholder="" value="${linePrice.price}">元/列车公里<label
                            id="priceTip"></label>
                    </div>
                </div>

            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-3 col-md-9">
                        <button type="submit" class="btn btn-primary"><i
                                class="fa fa-save"/></i> 保存
                        </button>
                        <button type="button" class="btn default" onclick="history.back(-1)"><i class="fa fa-undo"/></i>
                            取消
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<critc-script>
    <script type="text/javascript">
        $(function () {
            $("#beforeDawnRate").val(${linePrice.beforeDawnRate eq null}?null:${linePrice.beforeDawnRate*100});

            if (${linePrice.trainTypeCode ne 1}) {
                $("#isShowRate").hide();
                $("#beforeDawnRate").attr("disabled","disabled");
                $("#isShowBusy").hide();
                $("#cmbLineBusyLevelCode").attr("disabled","disabled");
                $("#cmbLineBusyLevelCode").val("");

            }
            $("#cmbTrainTypeCode").bind('change', show);
        })
        var show = function () {
            if ($("#cmbTrainTypeCode").val() == "1") {
                $("#isShowRate").show();
                $("#beforeDawnRate").removeAttr("disabled");
                $("#isShowBusy").show();
                $("#cmbLineBusyLevelCode").removeAttr("disabled");
            } else {
                $("#isShowRate").hide();
                $("#beforeDawnRate").attr("disabled","disabled");
                $("#isShowBusy").hide();
                $("#cmbLineBusyLevelCode").attr("disabled","disabled");
                $("#cmbLineBusyLevelCode").val("");

            }
        }

        $(document).ready(function () {
            $("#linePriceForm").validate({
                debug: true,
                errorElement: "label",
                errorClass: "valiError",
                errorPlacement: function (error, element) {
                    error.appendTo($("#" + element.attr('id') + "Tip"));
                },
                rules: {
                    beforeDawnRate: {
                        number: true,
                        maxlength: 4
                    },
                    linePriceLevelCode:{
                        required: true
                    },
                    trainMarshallingTypeCode:{
                        required: true
                    },
                    trainTypeCode:{
                        required: true
                    },
                    price: {
                        required: true,
                        number: true,
                        maxlength: 13,
                    }

                },
                submitHandler: function (form) {
                    save();
                }


            });
        });
        function save() {
            var form = document.getElementById("linePriceForm");
            var data = new FormData(form);
            data.append("linePriceLevelName",
                ($("#cmbLinePriceLevelCode option:selected").val()=="")?"":$("#cmbLinePriceLevelCode option:selected").text())
            data.append("trainTypeName",
                ($("#cmbTrainTypeCode option:selected").val()=="")?"":$("#cmbTrainTypeCode option:selected").text())
            data.append("lineBusyLevelName",
                ($("#cmbLineBusyLevelCode option:selected").val()=="")?"":$("#cmbLineBusyLevelCode option:selected").text())
            data.append("trainMarshallingTypeName",
                ($("#cmbTrainMarshallingTypeCode option:selected").val()=="")?"":$("#cmbTrainMarshallingTypeCode option:selected").text())
            $.ajax({
                type: "POST",
                url: '${dynamicServer}/price/lineprice/update.htm',
                data: data,
                dataType: "json",
                processData: false,
                contentType: false,
                success: function (data) {
                    window.location.href = data.msgText + "&backUrl=${backUrl}" + "";
                }
            });
        }


    </script>
</critc-script>

</body>
