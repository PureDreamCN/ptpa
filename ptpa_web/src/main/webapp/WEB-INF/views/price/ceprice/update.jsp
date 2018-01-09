<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>接触网和电费清算单价</title>
</head>

<body>
<!-- BEGIN PAGE BAR -->
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >单价模块
        </li>
        <li>
            >接触网和电费清算单价
        </li>
    </ul>
</div>
<h1 class="page-title"> 接触网和电费清算单价
    <small>>>新增</small>
</h1>
<div class="row">
    <div class="col-md-12">
        <form role="form" id="cePriceForm" name="cePriceForm" class="form-horizontal"
              action="update.htm" method="post">
            <input type="hidden" name="backUrl" value="${backUrl }">
            <input type="hidden" name="id" value="${cePrice.id }">
            <div class="form-body">

                <div class="form-group">
                    <label class="col-md-3 control-label">客专公司：</label>
                    <div class="col-md-9">
                        <form:select path="cePrice.pseCode" class="form-control input-medium input-inline"
                                     id="cmbPseCode">
                            <form:option value="" label="--全部--"/>
                            <form:options items="${listPse}" itemValue="code" itemLabel="name"/>
                        </form:select>
                        <input type="hidden" id="pseName" name="pseName" value="${cePrice.pseName}"/>
                        <label id="cmbPseCodeTip"></label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">铁路局：</label>
                    <div class="col-md-9">
                        <form:select path="cePrice.ljdm" class="form-control input-medium input-inline"
                                     id="cmbljdm">
                            <form:option value="" label="--全部--"/>
                            <form:options items="${listLJDM}" itemValue="ljdm" itemLabel="name"/>
                        </form:select>
                        <label id="cmbljdmTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">接触网使用费：</label>
                    <div class="col-md-9">
                        <input id="catenaryPrice" type="text" name="catenaryPrice"
                               class="form-control input-inline input-small "
                               placeholder="" value="${cePrice.catenaryPrice}">元/万总重吨公里
                        <label id="catenaryPriceTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">电费：</label>
                    <div class="col-md-9">
                        <input id="electricityPrice" type="text" name="electricityPrice"
                               class="form-control input-inline input-small "
                               placeholder="" value="${cePrice.electricityPrice}">元/万总重吨公里<label
                            id="electricityPriceTip"></label>
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
            $("#cmbPseCode").change(function () {
                $("#pseName").val($("#cmbPseCode option:selected").text());
            })
        });
        $(document).ready(function () {
            $("#cePriceForm").validate({
                debug: true,
                errorElement: "label",
                errorClass: "valiError",
                errorPlacement: function (error, element) {
                    error.appendTo($("#" + element.attr('id') + "Tip"));
                },
                rules: {
                    pseCode: {
                        required: true,
                    },
                    ljdm: {
                        required: true,
                    },
                    electricityPrice: {
                        number: true,
                        maxlength: 13
                    },
                    catenaryPrice: {
                        number: true,
                        maxlength: 13
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
