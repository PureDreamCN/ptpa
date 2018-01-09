<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/taglib.jsp" %>
<head>
    <title>资源管理</title>
    <critc-css>
        <link href="${staticServer }/assets/zTree3.5/css/zTreeStyle/metro.css"
              rel="stylesheet" type="text/css" />
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
<div class="portlet box blue">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-cogs"></i>车次服务
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
        <table id="humanResourceTable" class="table table-striped table-bordered table-hover">
            <tr>
                <th width=20>#</th>
                <th width="85">服务名称</th>
                <th width="50">铁路局</th>
                <th width="50">服务次数</th>
                <th width="50">服务计量单位</th>
                <th width="70">清算单价(元/计量单位)</th>
                <th width="110">操作</th>
            </tr>

            <tbody>
            <c:forEach items="${listTrainService }" var="trainService" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${trainService.serviceName}</td>
                    <td>${trainService.ljdm}</td>
                    <td>${trainService.count}</td>
                    <td>${trainService.unit}</td>
                    <td>${trainService.price}</td>
                    <td><a  onclick="updateResource(${trainService.id})">修改</a>
                        <a  onclick="deleteResource(${trainService.id})">&nbsp;&nbsp;删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="modal fade" id="trainServiceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">车次服务新增</h4>
            </div>
            <div class="modal-body">
                <form role="form" id="resouceForm" name="resouceForm"
                      class="form-horizontal" method="post">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label">服务类型：</label>
                            <div class="col-md-6">
                                <form:select path="trainservice.serviceCode"
                                             class="form-control input-inline input-large" id="trainServiceType">

                                    <form:option value="" label="--请选择--" />
                                    <form:options items="${listServiceType}" itemValue="code"
                                                  itemLabel="name" />
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">铁路局：</label>
                            <div class="col-md-6">
                                <form:select path="trainservice.ljdm"
                                             class="form-control input-inline input-large" id="trainServiceLjdm">

                                    <form:option value="" label="--请选择--" />
                                    <form:options items="${listBureau}" itemValue="value"
                                                  itemLabel="content" />
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label ">次数：</label>
                            <div class="col-md-9">
                                <input id="trainServiceCount" type="number"
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
    <script type="text/javascript">
        var trainServiceType = null;
        var trainServiceTypeName=null;
        var trainServiceLjdm = null;
        var trainServiceLjdmName = null;
        var trainServiceCount = null;
        function add() {
            $("#save").unbind('click');
            $("#save").bind('click',function () {
                trainServiceSave(1);
            });
            showTrainServiceModal();
        }
        function showTrainServiceModal(){
            $("#trainServiceModal").modal("show");
        };

        function trainServiceSave(param,id){//1.新增 2.修改 3.删除
            valueGet();
            if (param==1){
                Todata({
                    trainId : ${id},
                    ljdm : trainServiceLjdm,
                    serviceCode : trainServiceType,
                    count : trainServiceCount
                },"trainserviceAdd.htm","网络异常，保存失败");
            }
            if(param==2){
                Todata({
                    id:id,
                    trainId : ${id},
                    ljdm : trainServiceLjdm,
                    serviceCode : trainServiceType,
                    count : trainServiceCount
                },"trainserviceUpdate.htm","网络异常，修改失败");
            }
            if(param==3){
                $("#humanResourceModal").modal("hide");
                $.ajax( {
                    url:"trainserviceDelete.htm",
                    data:{id:id},
                    type:'post',
                    dataType:'json',
                    success:function(result) {
                        if(result.success==true){
                            window.location.href="trainservice.htm?id=${id}";
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
        function deleteResource(id){
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
                        trainServiceSave(3,id);
                    }else{
                        return;
                    }
                }
            });

        }
        function updateResource(id){
            $("#save").unbind('click');
            $("#save").bind('click',function () {
                trainServiceSave(2,id);
            });
            showTrainServiceModal();
        }

        function Todata(data,url,error){

            if(trainServiceType==""||trainServiceLjdm==""||trainServiceCount=="")
            {
                $("#errorTip").attr("hidden",false);
            }else{
                $("#humanResourceModal").modal("hide");
                $.ajax( {
                    url:url,
                    data:data,
                    type:'post',
                    dataType:'json',
                    success:function(result) {
                        if(result.success==true){
                            window.location.href="trainservice.htm?id=${id}";
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
            trainServiceType = $("#trainServiceType option:selected").val();
            trainServiceTypeName = $("#trainServiceType option:selected").text();
            trainServiceLjdm = $("#trainServiceLjdm option:selected").val();
            trainServiceLjdmName = $("#trainServiceLjdm option:selected").text();
            trainServiceCount = $("#trainServiceCount").val();
        }
    </script>
</critc-script>