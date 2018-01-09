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
            <i class="fa fa-cogs"></i>车站旅客服务配置
        </div>
        <div class="tools">
            <a href="javascript:;" class="collapse"> </a>
        </div>
    </div>
    <div class="portlet-body">
        <td class="table-responsive">
            <table class="searchTable">
                <tr>
                    <td>&nbsp;</td>
                    <td><label class="control-label">车站旅客服务类别：</label></td>
                    <td>
                        <form:select path="train.stationServiceTypeCode"
                                     class="form-control input-inline input-large" id="stationServicePrice">

                            <form:option value="" label="--请选择--" />
                            <form:options items="${stationServiceList}" itemValue="stationServiceTypeCode"
                                          itemLabel="stationServiceTypeName" />
                        </form:select>
                    </td>
                    <td>
                        <button class="btn btn-primary" onclick="stationServiceAdd()">
                            <i class="ace-icon fa fa-search"></i>确定
                        </button>
                    </td>
                    <td><button onclick="javascript:window.location.href='toUpdate.htm?id=${id}';" class="btn default">
                        <i class="ace-icon fa fa-undo"></i> 返回
                    </button></td>
                </tr>
            </table>
    </div>
</div>
</div>
</body>
<critc-script>
    <script type="text/javascript">
        function stationServiceAdd(){
            if($("#stationServicePrice option:selected").val()!=null){
                add();
            }else{
                bootbox.alert("请选择车站旅客服务类别！");
            }
        }
        function add(){
            $.ajax( {
                url:"stationServiceAdd.htm",
                data:{id:${id},
                    stationServiceTypeCode:$("#stationServicePrice option:selected").val(),
                    stationServiceTypeName:$("#stationServicePrice option:selected").text()
                },
                type:'post',
                dataType:'json',
                success:function(result) {
                    if(result.success==true){
                        window.location.href="${dynamicServer}/success.htm?resultCode=10001&backUrl=train/stationservice.htm?id=${id}";
                    }else{
                        bootbox.alert("内部错误，维护失败！");
                    }
                },
                error : function() {
                    bootbox.alert("网络不通，维护失败！");
                }
            });
        }

    </script>
</critc-script>