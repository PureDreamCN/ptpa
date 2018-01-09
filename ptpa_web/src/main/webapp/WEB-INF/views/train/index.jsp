<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/taglib.jsp" %>
<head>
    <title>操作日志</title>
    <link rel="stylesheet"
          href="${staticServer}/assets/autocomplete/css/jquery.autocomplete.css" />
    <style>
        #indexTable td,th {
            vertical-align: middle!important;
        }
    </style>
</head>
<body>
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >客车相关
        </li>
        <li>
            >客车车次详情
        </li>
    </ul>
</div>
<div class="portlet box blue">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-cogs"></i>操作面板
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
                    <td>车次：</td>
                    <td><input type="text" id="cc" name="cc"
                               class="form-control input-small" placeholder=""
                               value="${trainSearchVO.cc }" onkeyup="toUpperCase(this)"/></td><td>&nbsp;</td>
                    <td>
                        <button class="btn btn-primary" id="btnSearch">
                            <i class="ace-icon fa fa-search"></i> 查询
                        </button>
                    </td>
                    <c:if test="${critc:isP('TrainAdd')}">
                        <td>
                        <button type="button" class="btn btn-success" id="btnAdd">
                            <i class=" fa fa-plus bigger-110"></i> 新增
                        </button>
                        </td>
                    </c:if>
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <table id="indexTable" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th width=20>#</th>
                <th width="85">车次详情名称</th>
                <th width="40">车次</th>
                <th width="70">列车类型</th>
                <th width="70">列车等级</th>
                <th width="50">车底数</th>
                <th width="60">担当局</th>
                <th width="60">始发站</th>
                <th width="60">终到站</th>
                <th width="70">上次修改人</th>
                <th width="80">上次修改时间</th>
                <th width="60">操作</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${list }" var="train" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${train.name }</td>
                    <td>${train.cc }</td>
                    <td>${train.trainTypeName }</td>
                    <td>${train.trainLevelName }</td>
                    <td>${train.vehicleGroupSize }</td>
                    <td>${train.ljdm}</td>
                    <%--<td>${train.beginCzdm }</td>--%>
                    <%--<td>${train.endCzdm }</td>--%>
                    <td>${train.beginCzdmName }</td>
                    <td>${train.endCzdmName }</td>
                    <td>${train.lastModifiedBy }</td>
                    <td>${train.lastModifiedAt }</td>
                    <td><a  onclick="showDetail(${train.id})">查看详情</a><br/>
                        <a  onclick="toUpdate(${train.id})">信息维护</a><br/>
                        <a onclick="deleteResource(${train.id})">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">${ pageNavigate.pageModel}</div>
</div>
</body>
<critc-script>
    <script
            src="${staticServer}/assets/autocomplete/js/jquery.autocomplete.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btnSearch").bind("click",searchUser);
        });
        // 查询方法
        var searchUser = function () {
                var url = "index.htm?";
                if ($("#cc").val() != '')
                    url += "cc=" + $("#cc").val();
                window.location = encodeURI(url);
        }

        //开始函数
        $(document).ready(function(){
            $.ajax({
                type:'POST',
                contentType: "application/json",
                url: "getCcList.htm",
                dataType: "json",
                success:function(data){
                    autocompleteFn(data);
                }
            });
        });

        //自动 补全方法
        function autocompleteFn(data){
            $("#cc").autocomplete(data,{
                minChars:0,
                max: 10,
                dataType:"json",
                autoFill: true,
                mustMatch: false,
                matchContains: true,
                scrollHeight: 220,
                formatItem: function(data, i, total) {
                    return "<font style='color:black;font-size:14px'>"+data.cc+"</font>";
                },
                formatMatch: function(data, i, total) {
                    return data.cc;
                },
                formatResult: function(data) {
                    return data.cc;
                }
            });
        }
        function showDetail(id) {
            var url = "showdetail.htm?id="+id;
            window.location.href=url;
        }
        $(function () {
            $("#btnAdd").bind("click",btnAdd);
        });
        // 新增
        var btnAdd = function () {
            window.location = encodeURI("toAdd.htm");
        }
        var toUpdate = function (id) {
            window.location = encodeURI("toUpdate.htm?id="+id);
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
                        $.ajax( {
                            url:"delete.htm",
                            data:{id:id},
                            type:'post',
                            dataType:'json',
                            success:function(result) {
                                if(result.success==true){
                                    window.location.href="${dynamicServer}/success.htm?backUrl=train/index.htm?resultCode=10001";
                                }else{
                                    bootbox.alert(error);
                                }
                            },
                            error : function() {
                                bootbox.alert(error);
                            }
                        });
                    }else{
                        return;
                    }
                }
            });

        }
        function toUpperCase(obj){
            obj.value = obj.value.toUpperCase();
        }
    </script>
</critc-script>