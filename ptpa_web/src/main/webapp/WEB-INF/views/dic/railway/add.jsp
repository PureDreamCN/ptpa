<%--
  Created by IntelliJ IDEA.
  User: guofei
  Date: 2017/11/28
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; utf-8">
    <title>新增</title>

</head>
<body>
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li><i class="fa fa-home"></i> <a
                href="${dynamicServer}/index.htm">首页</a></li>
        <li>>客运线路</li>

    </ul>
</div>
<h1 class="page-title">
    客运线路 <small>>>新增线路</small>
</h1>
<div class="row">
    <div class="col-md-8">
        <form role="form" id="resouceForm" name="resouceForm"
              class="form-horizontal" action="add.htm" method="post">
            <input type="hidden" name="backUrl" value="${backUrl }">
            <div class="form-body">
              <%--  <div class="form-group">
                    <label class="col-md-3 control-label">全称：</label>
                    <div class="col-md-9">
                        <input id="name" name="name" type="text"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="20"> <label id="nameTip"></label>
                    </div>
                </div>--%>

                <div class="form-group">
                    <label class="col-md-3 control-label">线路代码：</label>
                    <div class="col-md-9">
                        <input id="xldm" name="xldm" type="text"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为20个字符"
                               value="" maxlength="20"> <label id="xldmTip"></label>
                    </div>

                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">线路名称：</label>
                    <div class="col-md-9">
                        <input id="name" type="text" name="name"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为15个字符"
                               value="" maxlength="15"><label id="nameTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">起点：</label>
                    <div class="col-md-9">
                        <input  type="text" name="beginCzdm" id="beginCzdm"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为10个字符"
                               value="" maxlength="10"><label id="beginCzdmTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">讫点：</label>
                    <div class="col-md-9">
                        <input  type="text" name="endCzdm" id="endCzdm"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为10个字符"
                               value="" maxlength="10"><label id="endCzdmTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">长度：</label>
                    <div class="col-md-9">
                        <input  type="text" name="mileage" id="mileage"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为6个字符"
                               value="" maxlength="6"><label id="mileageTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">产权：</label>
                    <div class="col-md-9">
                        <input  type="text" name="propertyRight" id="propertyRight"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为10个字符"
                               value="" maxlength="10"><label id="propertyRightTip"></label>
                    </div>
                </div>

            </div>

            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-3 col-md-9">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa fa-save" /></i> 保存
                        </button>
                        <button type="button" class="btn default"
                                onclick="history.back(-1)">
                            <i class="fa fa-undo" /></i> 取消
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<critc-script>
    <script type="text/javascript">
        $("#resouceForm").validate({
            debug: true,
            errorElement: "label",
            errorClass: "valiError",
            errorPlacement: function (error, element) {
                error.appendTo($("#" + element.attr('id') + "Tip"));
            },
            rules: {
                xldm: {
                    required: true,
                    maxlength: 20,
                    checkCode: true
                },
                name: {
                    required: true,
                    maxlength: 15,

                },
                beginCzdm: {
                    required: true,
                    maxlength: 10,


                },
                endCzdm: {
                    required: true,
                    maxlength: 10,

                },
                mileage: {
                    required: true,
                    maxlength: 6,
                    number: true,
                    checkCode: true
                },
                propertyRight: {
                    required: true,
                    maxlength: 10,


                }

            },
            messages: {},
            submitHandler: function (form) {
                form.submit();
            }
        });


        jQuery.validator.addMethod("checkCode", function(value, element) {
            return this.optional(element) || /^[^\u4e00-\u9fa5]*$/.test(value);
        }, "不能包含中文");

    </script>

</critc-script>
</body>
</html>
