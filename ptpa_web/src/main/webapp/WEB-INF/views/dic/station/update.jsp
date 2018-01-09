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
        <li>>客运营业站</li>

    </ul>
</div>
<h1 class="page-title">
    客运营业站 <small>>>修改车站</small>
</h1>
<div class="row">
    <div class="col-md-8">
        <form role="form" id="resouceForm" name="resouceForm"
              class="form-horizontal" action="update.htm" method="post">
            <div class="form-body">
                <input type="hidden" name="backUrl" value="${backUrl }">

                <div class="form-group">
                    <label class="col-md-3 control-label">站名：</label>
                    <div class="col-md-9">
                        <input id="shortName" name="name" type="text"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为10个字符"
                               value="${list[0].name}" maxlength="10"> <label id="nameTip"></label>
                    </div>

                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">所属铁路局：</label>
                    <div class="col-md-9">
                        <input type="hidden" value="${list[0].ljdm}" id="bureauName"/>
                        <form:select path="trainStatisticVO.ljdm"
                                     class="form-control input-inline  input-xlarge"  name="ljdm" id-="ljdm">

                            <form:option value="" label=""/>
                            <form:options items="${listBureau}" itemValue="value"
                                          itemLabel="content"/>

                        </form:select> <label id="ljdmTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">车站代码：</label>
                    <div class="col-md-9">
                        <input type="hidden" value="${list[0].czdm}" name="oldCzdm"/>
                        <input  type="text" name="czdm" id="czdm"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为20个字符"
                               value="${list[0].czdm}" maxlength="20"><label id="czdmTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">拼音：</label>
                    <div class="col-md-9">
                        <input  type="text" name="pinyin" id="pinyin"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为20个字符"
                               value="${list[0].pinyin}" maxlength="20"><label id="pinyinTip"></label>
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
        $(function() {
            var str = $("#bureauName").val();
            $("#ljdm option[value='"+str+"']").attr("selected", "selected");
        });

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
                ljdm: {
                    required: true,
                    maxlength: 2,

                },
                czdm: {
                    required: true,
                    maxlength: 20,
                    checkCode: true

                },
                pinyin: {
                    required: true,
                    maxlength: 20,
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

