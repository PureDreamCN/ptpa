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
            <i class="fa fa-cogs"></i>车次备品配置
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
                    <td><label class="control-label">备品清算单价(元/列公里)：</label></td>
                    <td>
                        <input id="partPrice" name="partPrice" type="number"
                               class="form-control input-inline" placeholder=""
                               value="${partPrice}" maxlength="10"> <label id="partPriceTip"></label>
                    </td>
                    <td>
                        <button class="btn btn-primary" onclick="partAdd()">
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
        function partAdd(){
            if($("#partPrice").val()!=null){
                add();
            }else{
                bootbox.alert("请输入备品清算单价");
            }
        }
        function add(){
            $.ajax( {
                url:"partAdd.htm",
                data:{id:${id},partPrice:$("#partPrice").val()},
                type:'post',
                dataType:'json',
                success:function(result) {
                    if(result.success==true){
                        window.location.href="${dynamicServer}/success.htm?resultCode=10001&backUrl=train/part.htm?id=${id}";
                    }else{
                        bootbox.alert(error);
                    }
                },
                error : function() {
                    bootbox.alert(error);
                }
            });
        }

    </script>
</critc-script>