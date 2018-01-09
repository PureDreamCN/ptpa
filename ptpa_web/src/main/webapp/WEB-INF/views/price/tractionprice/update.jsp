<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>牵引清算单价</title>
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
            >牵引清算单价
        </li>
    </ul>
</div>
<h1 class="page-title"> 牵引清算单价
    <small>>>新增</small>
</h1>
<div class="row">
    <div class="col-md-12">
        <form role="form" id="linePriceForm" name="linePriceForm" class="form-horizontal"
              action="update.htm" method="post">
            <input type="hidden" name="backUrl" value="${backUrl }">
            <input type="hidden" name="id" value="${tractionPrice.id }">
            <div class="form-body">

                <div class="form-group">
                    <label class="col-md-3 control-label">单位：</label>
                    <div class="col-md-9">
                        <form:select path="tractionPrice.ljdm" class="form-control input-medium input-inline"
                                     id="cmbljdm" name="ljdm">
                            <form:option value="" label="--全部--"/>
                            <form:options items="${listLJDM}" itemValue="ljdm" itemLabel="name"/>
                        </form:select>
                        <input type="hidden" id="ljName" name="ljName"
                               value="${tractionPrice.ljName }"/>
                        <label id="ljdmTip"></label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">牵引类型：</label>
                    <div class="col-md-9">
                        <form:select path="tractionPrice.tractionTypeCode"
                                     class="form-control input-medium input-inline"
                                     id="cmbTractionTypeCode" name="tractionTypeCode">
                            <form:option value="" label="--全部--"/>
                            <form:options items="${listTractionType}" itemValue="code" itemLabel="name"/>
                        </form:select>
                        <input type="hidden" id="tractionTypeName" name="tractionTypeName"
                               value="${tractionPrice.tractionTypeName }"/>
                        <label id="cmbTractionTypeCodeTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">牵引单价：</label>
                    <div class="col-md-9">
                        <input id="locomotivePrice" type="text" name="locomotivePrice"
                               class="form-control input-inline input-small "
                               placeholder="" value="${tractionPrice.locomotivePrice}">元/万总重吨公里
                        <label id="locomotivePriceTip"></label>
                    </div>
                </div>
                <div class="form-group" id="isShow">
                    <label class="col-md-3 control-label">电力机车网电单价：</label>
                    <div class="col-md-9">
                        <input id="cePrice" type="text" name="cePrice"
                               class="form-control input-inline input-small "
                               placeholder="" value="${tractionPrice.cePrice}">元/万总重吨公里<label
                            id="cePriceTip"></label>
                    </div>
                </div>

            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-3 col-md-9">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-save"/></i> 保存</button>
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
            $("#cmbljdm").change(function(){
                $("#ljName").val($("#cmbljdm option:selected").text());
            })
            $("#cmbTractionTypeCode").change(function(){
                $("#tractionTypeName").val($("#cmbTractionTypeCode option:selected").text());
            })
            if (${tractionPrice.tractionTypeCode ne 2}) {
                $("#isShow").hide();
                $("#cePrice").attr("disabled","disabled");
            }
            $("#cmbTractionTypeCode").bind('change', show);
        })
        //显示电力机车牵引单价
        var show = function () {
            if ($("#cmbTractionTypeCode").val() == "2") {
                $("#isShow").show();
                $("#cePrice").removeAttr("disabled");

            } else {
                $("#isShow").hide();
                $("#cePrice").attr("disabled","disabled");
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
                    tractionTypeCode: {
                        required: true,
                    },
                    ljdm: {
                        required: true,
                    },
                    locomotivePrice: {
                        number: true,
                        maxlength: 13
                    },
                    cePrice: {
                        required: true,
                        number: true,
                        maxlength: 13,
                    }

                },
                messages: {},
                submitHandler: function (form) {
                    form.submit();
                }
            });
        });

    </script>
</critc-script>

</body>
