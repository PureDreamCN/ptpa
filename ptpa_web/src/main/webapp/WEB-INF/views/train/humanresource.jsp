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
            <i class="fa fa-cogs"></i>车次人力配置
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
                <th width="85">人力类型</th>
                <th width="50">铁路局</th>
                <th width="50">每列车每公里人员配置数(人/列公里)</th>
                <th width="70">平均人力支出(元/人年)</th>
                <th width="110">操作</th>
            </tr>

            <tbody>
            <c:forEach items="${listHumanResource }" var="humanResource" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${humanResource.humanResourceTypeName}</td>
                    <td>${humanResource.ljdm}</td>
                    <td>${humanResource.rate}</td>
                    <td>${humanResource.price}</td>
                    <td><a  onclick="updateResource(${humanResource.id})">修改</a>
                        <a  onclick="deleteResource(${humanResource.id})">&nbsp;&nbsp;删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="modal fade" id="humanResourceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">人力配置</h4>
            </div>
            <div class="modal-body">
                <form role="form" id="resouceForm" name="resouceForm"
                      class="form-horizontal" method="post">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label">人力类型：</label>
                            <div class="col-md-6">
                                <form:select path="humanResource.humanResourceTypeCode"
                                             class="form-control input-inline input-large" id="humanResourceType">

                                    <form:option value="" label="--请选择--" />
                                    <form:options items="${listHumanResourceType}" itemValue="code"
                                                  itemLabel="name" />
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">铁路局：</label>
                            <div class="col-md-6">
                                <form:select path="humanResource.ljdm"
                                             class="form-control input-inline input-large" id="humanResourceLjdm">

                                    <form:option value="" label="--请选择--" />
                                    <form:options items="${listBureau}" itemValue="value"
                                                  itemLabel="content" />
                                </form:select>
                            </div>
                        </div>
                        <%--<div class="form-group">--%>
                            <%--<label class="col-md-3 control-label ">人次：</label>--%>
                            <%--<div class="col-md-9">--%>
                                <%--<input id="humanResourcePeopleNum" type="number"--%>
                                       <%--class="form-control input-inline input-large" placeholder=""--%>
                                       <%--value="" maxlength="20">--%>
                            <%--</div>--%>
                        <%--</div>--%>
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
    var humanResourceCount=1;
    var humanResourceType = null;
    var humanResourceTypeName=null;
    var humanResourceLjdm = null;
    var humanResourceLjdmName = null;
//    var humanResourcePeopleNum = null;
    function add() {
        $("#save").unbind('click');
        $("#save").bind('click',function () {
            humanResourceSave(1);
        });
        showHumanResourceModal();
    }
    function showHumanResourceModal(){
        $("#humanResourceModal").modal("show");
    };

    function humanResourceSave(param,id){//1.新增 2.修改 3.删除
        valueGet();
        if (param==1){
        Todata({
            trainId : ${id},
            ljdm : humanResourceLjdm,
            humanResourceTypeCode : humanResourceType,
            humanResourceTypeName : humanResourceTypeName
//            peopleNumber : humanResourcePeopleNum
        },"humanResourceAdd.htm","网络异常，保存失败");
        }
        if(param==2){
            Todata({
                id:id,
                trainId : ${id},
                ljdm : humanResourceLjdm,
                humanResourceTypeCode : humanResourceType,
                humanResourceTypeName : humanResourceTypeName
//                peopleNumber : humanResourcePeopleNum
            },"humanResourceUpdate.htm","网络异常，修改失败");
        }
        if(param==3){
            $("#humanResourceModal").modal("hide");
            $.ajax( {
                url:"humanResourceDelete.htm",
                data:{id:id},
                type:'post',
                dataType:'json',
                success:function(result) {
                    if(result.success==true){
                        window.location.href="humanresource.htm?id=${id}";
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
                     humanResourceSave(3,id);
                }else{
                    return;
                }
            }
        });

    }
    function updateResource(id){
        $("#save").unbind('click');
        $("#save").bind('click',function () {
            humanResourceSave(2,id);
        });
        showHumanResourceModal();
    }

    function Todata(data,url,error){

        if(humanResourceType==""||humanResourceLjdm=="")
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
                    window.location.href="humanresource.htm?id=${id}";
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
        humanResourceType = $("#humanResourceType option:selected").val();
        humanResourceTypeName = $("#humanResourceType option:selected").text();
        humanResourceLjdm = $("#humanResourceLjdm option:selected").val();
        humanResourceLjdmName = $("#humanResourceLjdm option:selected").text();
//        humanResourcePeopleNum = $("#humanResourcePeopleNum").val();
    }
</script>
</critc-script>