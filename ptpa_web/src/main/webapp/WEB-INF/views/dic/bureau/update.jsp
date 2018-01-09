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
        <li>>路局</li>

    </ul>
</div>
<h1 class="page-title">
    路局 <small>>>修改路局</small>
</h1>
<div class="row">
    <div class="col-md-8">
        <form role="form" id="resouceForm" name="resouceForm"
              class="form-horizontal" action="update.htm?oldLjdm=${bureau.ljdm}" method="post">
            <input type="hidden" name="backUrl" value="${backUrl }">
            <div class="form-body">
                <div class="form-group">
                    <label class="col-md-3 control-label">全称：</label>
                    <div class="col-md-9">
                        <input id="name" name="name" type="text"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为10个字符"
                               value="${bureau.name}" maxlength="10"> <label id="nameTip"></label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label">简称：</label>
                    <div class="col-md-9">
                        <input id="shortName" name="shortName" type="text"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为2个字符"
                               value="${bureau.shortName}" maxlength="2"> <label id="shortNameTip"></label>
                    </div>

                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">路局代码：</label>
                    <div class="col-md-9">
                        <input id="ljdm" type="text" name="ljdm"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为2个字符"
                               value="${bureau.ljdm}" maxlength="2"><label id="ljdmTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">编码：</label>
                    <div class="col-md-9">
                        <input id="code" type="text" name="code"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为2个字符"
                               value="${bureau.code}" maxlength="2"><label id="codeTip"></label>
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
                name: {
                    required: true,
                    maxlength: 10
                },
                shortName: {
                    required: true,
                    maxlength: 2,

                },
                ljdm: {
                    required: true,
                    maxlength: 2,

                },
                code: {
                    required: true,
                    number: true,
                    maxlength: 2,
                    checkCode: true
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
