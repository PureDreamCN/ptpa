<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/taglib.jsp" %>
<head>
    <title>资源管理</title>
    <critc-css>
        <link rel="stylesheet"
              href="${staticServer}/assets/autocomplete/css/jquery.autocomplete.css" />
        <style>
            #lineTable td,th {
                vertical-align: middle!important;
            }
        </style>
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
<div class="portlet box blue">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-cogs"></i>线路区段维护
        </div>
        <div class="tools">
            <a href="javascript:;" class="collapse"> </a>
        </div>
    </div>
    <div class="portlet-body">
        <div class="table-responsive">
            <table class="searchTable">
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <button class="btn btn-primary" onclick="javascript:window.location.reload()">
                            <i class="ace-icon fa fa-search"></i> 刷新
                        </button>
                    </td>
                    <c:if test="${critc:isP('TrainAdd')}">
                        <td>
                            <button type="button" class="btn btn-success" onclick="add()">
                                <i class=" fa fa-plus bigger-110"></i> 新增
                            </button>
                        </td>
                    </c:if>
                    <td><button onclick="javascript:window.location.href='toUpdate.htm?id=${id}';" class="btn default">
                        <i class="ace-icon fa fa-undo"></i> 返回
                    </button></td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <table id="lineTable" class="table table-striped table-bordered table-hover">
            <tr>
                <th width=20>#</th>
                <th width="34">列车类型</th>
                <th width="40">列车编组类型</th>
                <th width="35">线路</th>
                <th width="35">起点站</th>
                <th width="35">讫点站</th>
                <th width="30">里程(km)</th>
                <th width="50">线路清算等级</th>
                <th width="50">线路繁忙程度</th>
                <th width="70">是否在22时至次日6时运行</th>
                <th width="76">在22时至次日6时运行折算比例</th>
                <th width="55">清算单价(元/公里)</th>
                <th width="30">排序</th>
                <th width="60">操作</th>
            </tr>

            <tbody>
            <c:forEach items="${listTrainLine }" var="line" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${line.trainTypeName}</td>
                    <td>${line.trainMarshallingTypeName}</td>
                    <td>${line.xldmName}</td>
                    <td>${line.beginCzdmName}</td>
                    <td>${line.endCzdmName}</td>
                    <td>${line.mileage}</td>
                    <td>${line.linePriceLevelName}</td>
                    <td>${line.lineBusyLevelName}</td>
                    <td><c:if test="${line.beforeDawn eq 2}">否</c:if>
                        <c:if test="${line.beforeDawn eq 1}">是</c:if></td>
                    <td><c:if test="${!empty line.beforeDawnRate}">${line.beforeDawnRate}%</c:if></td>
                    <td>${line.price}</td>
                    <td>${line.orderIndex}</td>
                    <td><a  onclick="lineNameUpdate(${id},${line.id})">维护线路信息<br/></a>
                        <a  onclick="priceUpdate(${id},${line.id},${line.trainTypeCode},${line.trainMarshallingTypeCode})">维护清算信息<br/></a>
                        <a  onclick="updateResource(${line.id},'${line.trainTypeCode}','${line.trainTypeName}','${line.trainMarshallingTypeCode}','${line.trainMarshallingTypeName}','${line.beginCzdm}','${line.beginCzdmName}','${line.endCzdm}','${line.endCzdmName}','${line.mileage}','${line.beforeDawn}','${line.orderIndex}')">修改<br/></a>
                        <a  onclick="deleteResource(${line.id})">删除<br/></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="modal fade" id="lineModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">线路区段维护</h4>
            </div>
            <div class="modal-body">
                <form role="form" id="resouceForm" name="resouceForm"
                      class="form-horizontal" method="post">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label">列车类型：</label>
                            <div class="col-md-9">
                                <form:select path="trainLine.trainTypeCode"
                                             class="form-control input-inline input-large" id="trainTypeCode">

                                    <form:option value="" label="--请选择--" />
                                    <form:options items="${listTrainType}" itemValue="code"
                                                  itemLabel="name" />
                                </form:select>
                                <label id="trainTypeCodeTip"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">客车编组类型：</label>
                            <div class="col-md-9">
                                <form:select path="trainLine.trainMarshallingTypeCode"
                                             class="form-control input-inline input-large" id="trainMarshallingTypeCode">
                                    <form:option value="" label="--请选择--" />
                                    <form:options items="${listTrainMarshallingType}" itemValue="code"
                                                  itemLabel="name" />
                                </form:select>
                                <label id="trainMarshallingTypeCodeTip"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">起点站：</label>
                            <div class="col-md-9">
                                <input id="beginCzdm" value="${train.beginCzdm}" class="form-control input-inline input-large czdm"/>
                                <label id="beginTip"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">讫点站：</label>
                            <div class="col-md-9">
                                <input id="endCzdm" value="${train.endCzdm}" class="form-control input-inline input-large czdm"/>
                                <label id="endTip"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label ">在22时至次日6时运行：</label>
                            <div class="col-md-9">
                                    <select id="beforeDawn" name="beforeDawn" class="form-control input-inline input-large"><option value="">--请选择--</option><option value="1">是</option><option value="2">否</option></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label ">里程：</label>
                            <div class="col-md-9">
                                <input id="mileage" name="mileage" type="number"
                                       class="form-control input-inline input-large" placeholder=""
                                       value="" maxlength="20">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label ">排序：</label>
                            <div class="col-md-9">
                                <input id="orderIndex" name="orderIndex" type="number"
                                       class="form-control input-inline input-large" placeholder=""
                                       value="" maxlength="20">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <label id="errorTip" hidden="hidden" style="color: red;">请补全数据后提交!</label>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save">保存</button>
            </div>
        </div>
    </div>
</div>
</body>
<critc-script>
    <script
            src="${staticServer}/assets/autocomplete/js/jquery.autocomplete.js"></script>
    <script type="text/javascript">

        var beforeDawn = null;
        var mileage = null;
        var orderIndex = null;
        var trainTypeCode = null;
        var trainTypeCodeName = null;
        var trainMarshallingTypeCode = null;
        var trainMarshallingTypeCodeName = null;
        var beginCzdm = null;
        var beginCzdmName = null;
        var endCzdm = null;
        var endCzdmName = null;
        function add() {
            $("#save").unbind('click');
            $("#save").bind('click',function () {
                lineSave(1);
            });
            showLineModal();
        }
        function showLineModal(){
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
            $("#lineModal").modal("show");
        };

        function lineSave(param,id){//1.新增 2.修改 3.删除
            valueGet();
            if (param==1){
                Todata({
                    trainId : ${id},
                    mileage : mileage,
                    trainTypeCode : trainTypeCode,
                    trainTypeName : trainTypeCodeName,
                    trainMarshallingTypeCode : trainMarshallingTypeCode,
                    trainMarshallingTypeName : trainMarshallingTypeCodeName,
                    beforeDawn : beforeDawn,
                    beginCzdm : beginCzdm,
                    beginCzdmName : beginCzdmName,
                    endCzdm : endCzdm,
                    endCzdmName : endCzdmName,
                    orderIndex : orderIndex
                },"lineAdd.htm","网络异常，保存失败");
            }
            if(param==2){
                Todata({
                    id:id,
                    trainId : ${id},
                    mileage : mileage,
                    trainTypeCode : trainTypeCode,
                    trainTypeName : trainTypeCodeName,
                    trainMarshallingTypeCode : trainMarshallingTypeCode,
                    trainMarshallingTypeName : trainMarshallingTypeCodeName,
                    beforeDawn : beforeDawn,
                    beginCzdm : beginCzdm,
                    beginCzdmName : beginCzdmName,
                    endCzdm : endCzdm,
                    endCzdmName : endCzdmName,
                    orderIndex : orderIndex
                },"lineUpdate.htm","网络异常，修改失败");
            }
            if(param==3){
                $("#lineModal").modal("hide");
                $.ajax( {
                    url:"lineDelete.htm",
                    data:{id:id},
                    type:'post',
                    dataType:'json',
                    success:function(result) {
                        if(result.success==true){
                            window.location.href="line.htm?id=${id}";
                        }else{
                            bootbox.alert("网络异常，删除失败!");
                        }
                    },
                    error : function() {
                        bootbox.alert("网络异常，删除失败!");
                    }
                });
            }
        }
        function deleteResource(id,line){
            bootbox.confirm({
                title : "提醒",
                message: "删除后不可恢复，确定删除？",
                buttons: {
                    confirm: {
                        label: "确定"
                    },
                    cancel:{
                        label:"取消"

                    }
                },
                callback: function(result) {
                    if(result) {


                        lineSave(3,id);
                    }else{
                        return;
                    }
                }
            });

        }
        function updateResource(id,trainTypeCode1,trainTypeName1,trainMarshallingTypeCode1,trainMarshallingTypeName1,beginCzdm1,beginCzdmName1,endCzdm1,endCzdmName1,mileage1,beforeDawn1,orderIndex1){
            $("#save").unbind('click');
            $("#save").bind('click',function () {
                lineSave(2,id);
            });
            $("#trainTypeCode").val(trainTypeCode1);
            $("#trainMarshallingTypeCode").val(trainMarshallingTypeCode1);
            $("#mileage").val(mileage1);
            $("#beforeDawn").val(beforeDawn1);
            $("#orderIndex").val(orderIndex1);
            $("#beginCzdm").val(beginCzdmName1);
            $("#endCzdm").val(endCzdmName1);
            mileage=mileage1;
            trainTypeCode=trainTypeCode1;
            trainTypeCodeName=trainTypeName1;
            trainMarshallingTypeCode=trainMarshallingTypeCode1;
            trainMarshallingTypeCodeName=trainMarshallingTypeName1;
            beforeDawn=beforeDawn1;
            beginCzdm=beginCzdm1;
            beginCzdmName=beginCzdmName1;
            endCzdm=endCzdm1;
            endCzdmName=endCzdmName1;
            orderIndex = orderIndex1;

            showLineModal();
        }

        function Todata(data,url,error){
            if(trainTypeCode==""||beginCzdm==""||endCzdm==""||orderIndex==""||beforeDawn==""||trainMarshallingTypeCode==""||mileage=="")
            {
                $("#errorTip").attr("hidden",false);
            }else{
                $("#lineModal").modal("hide");
                $.ajax( {
                    url:url,
                    data:data,
                    type:'post',
                    dataType:'json',
                    success:function(result) {
                        if(result.success==true){
                            window.location.href="line.htm?id=${id}";
                        }else{
                            bootbox.alert(error);
                        }
                    },
                    error : function() {
                        bootbox.alert(error);
                    }
                });
            }
        }
        function valueGet(){
//            lineBusyLevelCode = $("#lineBusyLevelCode option:selected").val();
//            lineBusyLevelCodeName = $("#lineBusyLevelCode option:selected").text();
//            linePriceLevelCode = $("#linePriceLevelCode option:selected").val();
//            linePriceLevelCodeName = $("#linePriceLevelCode option:selected").text();
//            lineLjdm = $("#ljdm option:selected").val();
//            lineLjdmName = $("#ljdm option:selected").text();
            trainTypeCode = $("#trainTypeCode option:selected").val();
            trainTypeCodeName = $("#trainTypeCode option:selected").text();
            trainMarshallingTypeCode = $("#trainMarshallingTypeCode option:selected").val();
            trainMarshallingTypeCodeName = $("#trainMarshallingTypeCode option:selected").text();
            mileage = $("#mileage").val();
            beforeDawn = $("#beforeDawn option:selected").val();
            orderIndex = $("#orderIndex").val();
        }

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
                    return data.CONTENT;
                },
                formatResult: function(data) {
                    return data.CONTENT;
                }
            }).result(function(event, data, formatted){
                if(this.id=="beginCzdm"){
                    beginCzdm=data.VALUE;
                    beginCzdmName=data.CONTENT;
                }
                if(this.id=="endCzdm"){
                    endCzdm=data.VALUE;
                    endCzdmName=data.CONTENT
                }
            });
        }
        //线路信息修改
        function lineNameUpdate(trainId,lineId){
            var param ="trainId="+trainId+
            "&lineId="+lineId+
            "&backCode=1";
            window.location.href="${dynamicServer}/railway/commonRailway.htm?"+param;
        }
        //清算数据修改
        function priceUpdate(trainId,lineId,trainTypeCode,trainMarshallingTypeCode,beforeDawn){
            var param ="trainId="+trainId+
                "&lineId="+lineId+
                "&backCode=1"+
                "&trainTypeCode="+trainTypeCode+
                "&trainMarshallingTypeCode="+trainMarshallingTypeCode;
//                "&beforeDown="+beforeDawn;
            window.location.href="${dynamicServer}/price/lineprice/commonLinePrice.htm?"+param;
        }
    </script>
</critc-script>