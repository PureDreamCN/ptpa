<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../common/taglib.jsp"%>


<head>
    <title>资源管理</title>
    <critc-css>
        <link rel="stylesheet"
              href="${staticServer}/assets/autocomplete/css/jquery.autocomplete.css" />
    </critc-css>
</head>
<body>
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li><i class="fa fa-home"></i> <a
                href="${dynamicServer}/index.htm">首页</a></li>
        <li>>客车相关</li>
        <li>>客车车次详情</li>
    </ul>
</div>
<h1 class="page-title">
    车次详情 <small>>>新增模块</small>
</h1>

<div class="row">
    <div class="col-md-9">
        <form role="form" id="resouceForm" name="resouceForm"
              class="form-horizontal" action="add.htm" method="post">
            <input type="hidden" name="backUrl" value="${backUrl }">
            <input type="hidden" name="id" value="${train.id }">
            <input type="hidden" id="beginCzdm" name="beginCzdm" value="${train.beginCzdm }">
            <input type="hidden" id="endCzdm" name="endCzdm" value="${train.endCzdm }">
            <input type="hidden" id="beginCzdmName" name="beginCzdmName" value="${train.beginCzdmName }">
            <input type="hidden" id="endCzdmName" name="endCzdmName" value="${train.endCzdmName }">
            <div class="form-body">
                <div class="form-group">
                    <label class="col-md-3 control-label">车次详情名称：</label>
                    <div class="col-md-9">
                        <input id="name" name="name" type="text"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为20个字符"
                               value="${train.name}" maxlength="20"> <label id="nameTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">客运列车车次：</label>
                    <div class="col-md-9">
                        <input id="cc" name="cc" type="text"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为20个字符"
                               value="${train.cc}" maxlength="20"> <label id="ccTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">客运列车等级：</label>
                    <div class="col-md-9">
                        <form:select path="train.trainLevelCode"
                                     class="form-control input-inline input-xlarge" id="trainLevelCode">

                            <form:option value="" label="--请选择--" />
                            <form:options items="${listTrainLevel}" itemValue="code"
                                          itemLabel="name" />
                        </form:select>
                        <label id="trainLevelCodeTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">客运列车类型：</label>
                    <div class="col-md-9">
                        <form:select path="train.trainTypeCode"
                                     class="form-control input-inline input-xlarge" id="trainTypeCode">

                            <form:option value="" label="--请选择--" />
                            <form:options items="${listTrainType}" itemValue="code"
                                          itemLabel="name" />
                        </form:select>
                        <label id="trainTypeCodeTip"></label>
                    </div>
                </div>
                <%--<div class="form-group">
                    <label class="col-md-3 control-label">年度开行列数：</label>
                    <div class="col-md-9">
                        <input id="frequency" name="frequency" type="text"
                               class="form-control input-inline  input-xlarge" placeholder="365"
                               value="${train.frequency}" maxlength="20">次<label id="frequencyTip"></label>
                    </div>
                </div>--%>
                <div class="form-group">
                    <label class="col-md-3 control-label">担当局：</label>
                    <div class="col-md-9">
                        <form:select path="train.ljdm"
                                     class="form-control input-inline input-xlarge" id="ljdm">

                            <form:option value="" label="--请选择--" />
                            <form:options items="${listBureau}" itemValue="value"
                                          itemLabel="content" />
                        </form:select>
                        <label id="ljdmTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">始发站：</label>
                    <div class="col-md-9">
                        <input id="begin" value="${train.beginCzdmName}" class="form-control input-inline input-xlarge czdm"/>
                        <label id="beginTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">终到站：</label>
                    <div class="col-md-9">
                        <input id="end" value="${train.endCzdmName}" class="form-control input-inline input-xlarge czdm"/>
                        <label id="endTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">客车编组类型：</label>
                    <div class="col-md-9">
                        <form:select path="train.trainMarshallingTypeCode"
                                     class="form-control input-inline input-xlarge" id="trainMarshallingTypeCode">
                            <form:option value="" label="--请选择--" />
                            <form:options items="${listTrainMarshallingType}" itemValue="code"
                                          itemLabel="name" />
                        </form:select>
                        <label id="trainMarshallingTypeCodeTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">车底数：</label>
                    <div class="col-md-9">
                        <input id="vehicleGroupSize" name="vehicleGroupSize" type="text"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为20个字符"
                               value="${train.vehicleGroupSize}" maxlength="20"> <label id="vehicleSetSizeTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">车底占用比例：</label>
                    <div class="col-md-9">
                        <input id="vehicleGroupRate" name="vehicleGroupRate" type="number" min="0" max="100"
                               class="form-control input-inline  input-xlarge" placeholder="输入长度限制为20个字符"
                               value="${train.vehicleGroupRate}" maxlength="20">%<label id="vehicleSetRateTip"></label>
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
            </div><br/>
        </form>
    </div>
</div>
</body>
<critc-script>
    <script
            src="${staticServer}/assets/autocomplete/js/jquery.autocomplete.js"></script>
    <script type="text/javascript">
    $(document).ready(function () {
        $("#resouceForm").validate({
            debug: true,
            errorElement: "label",
            errorClass: "valiError",
            errorPlacement: function (error, element) {
                error.appendTo($("#" + element.attr('id') + "Tip"));
            },
            rules: {
                name:{
                    required: true,
                    maxlength: 20
                },
                cc: {
                    required: true,
                    maxlength: 20
                },
                trainLevelCode: {
                    required: true
                },
                trainTypeCode: {
                    required: true
                },
                ljdm: {
                    required: true
                },
                begin: {
                    required: true
                },
                end: {
                    required: true
                },
                trainMarshallingTypeCode : {
                    required: true
                },
                vehicleGroupSize: {
                    required: true
                },
                vehicleGroupRate: {
                    required: true
                },
                frequency: {
                    required: true
                }
            },
            messages: {},
            submitHandler: function (form) {
                form.submit();
            }
        });
    });
    var names ; //定义数据
    $(document).ready(function(){
        $.ajax({
            type:'POST',
            contentType: "application/json",
            url: "${dynamicServer}/station/getAutoComplteList.htm",
            dataType: "json",
            success:function(data){
                names = data;
                autocompleteFn(data);
            }
        });
    });
    function autocompleteFn(names){
        $(".czdm").autocomplete(names,{
            minChars:0,
            max: 10,
            dataType:"json",
            autoFill: true,
            mustMatch: false,
            matchContains: true,
            scrollHeight: 220,
            formatItem: function(data, i, total) {
                return "<font style='color:black;font-size:14px'>"+data.CONTENT+"</font><font style='float: right'><b>"+data.VALUE+"</b></font>";
            },
            formatMatch: function(data, i, total) {
                return data.CONTENT+""+data.VALUE;
            },
            formatResult: function(data) {
                return data.CONTENT;
            }
        }).result(function(event, data, formatted){
            $("#"+this.id+"Czdm").val(data.VALUE);
            $("#"+this.id+"CzdmName").val(data.CONTENT);
        });
    }
</script> </critc-script>