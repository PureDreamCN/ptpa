<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/taglib.jsp" %>
<head>
    <title>资源管理</title>
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
            <i class="fa fa-cogs"></i>席别票价维护
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
                        <button class="btn btn-primary" onclick="javascript:window.location.load()">
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
        <table id="ticketpriceTable" class="table table-striped table-bordered table-hover">
            <tr>
                <th width=20>#</th>
                <th width="85">席别类型</th>
                <th width="70">票价(元/张)</th>
                <th width="70">排序</th>
                <th width="110">操作</th>
            </tr>

            <tbody>
            <c:forEach items="${listTrainTicketprice }" var="ticketprice" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${ticketprice.seatTypeName}</td>
                    <td>${ticketprice.price}</td>
                    <td>${ticketprice.orderIndex}</td>
                    <td><a  onclick="updateResource(${ticketprice.id})">修改</a>&nbsp;&nbsp;
                        <a  onclick="deleteResource(${ticketprice.id})">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="modal fade" id="ticketpriceModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">席别票价维护</h4>
            </div>
            <div class="modal-body">
                <form role="form" id="resouceForm" name="resouceForm"
                      class="form-horizontal" method="post">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label">席别类型：</label>
                            <div class="col-md-6">
                                <form:select path="trainTicketprice.seatTypeCode"
                                             class="form-control input-inline input-large" id="seatTypeCode">

                                    <form:option value="" label="--请选择--" />
                                    <form:options items="${listSeatType}" itemValue="code"
                                                  itemLabel="name" />
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label ">票价：</label>
                            <div class="col-md-9">
                                <input id="price" type="number"
                                       class="form-control input-inline input-large" placeholder=""
                                       value="" maxlength="20">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label ">排序：</label>
                            <div class="col-md-9">
                                <input id="orderIndex" type="number"
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
        var seatTypeCode = null;
        var seatTypeCodeName=null;
        var price = null;
        var orderIndex = null;
        function add() {
            $("#save").unbind('click');
            $("#save").bind('click',function () {
                ticketpriceSave(1);
            });
            showticketpriceModal();
        }
        function showticketpriceModal(){
            $("#ticketpriceModal").modal("show");
        };

        function ticketpriceSave(param,id){//1.新增 2.修改 3.删除
            valueGet();
            if (param==1){
                Todata({
                    trainId : ${id},
                    seatTypeCode : seatTypeCode,
                    seatTypeName : seatTypeCodeName,
                    price : price,
                    orderIndex : orderIndex
                },"ticketpriceAdd.htm","网络异常，保存失败");
            }
            if(param==2){
                Todata({
                    id:id,
                    trainId : ${id},
                    seatTypeCode : seatTypeCode,
                    seatTypeName : seatTypeCodeName,
                    price : price,
                    orderIndex : orderIndex
                },"ticketpriceUpdate.htm","网络异常，修改失败");
            }
            if(param==3){
                $("#ticketpriceModal").modal("hide");
                $.ajax( {
                    url:"ticketpriceDelete.htm",
                    data:{id:id},
                    type:'post',
                    dataType:'json',
                    success:function(result) {
                        if(result.success==true){
                            window.location.href="ticketprice.htm?id=${id}";
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
                        ticketpriceSave(3,id);
                    }else{
                        return;
                    }
                }
            });

        }
        function updateResource(id){
            $("#save").unbind('click');
            $("#save").bind('click',function () {
                ticketpriceSave(2,id);
            });
            showticketpriceModal();
        }

        function Todata(data,url,error){

            if(seatTypeCode==""||price==""||orderIndex=="")
            {
                $("#errorTip").attr("hidden",false);
            }else{
                $("#ticketpriceModal").modal("hide");
                $.ajax( {
                    url:url,
                    data:data,
                    type:'post',
                    dataType:'json',
                    success:function(result) {
                        if(result.success==true){
                            window.location.href="ticketprice.htm?id=${id}";
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
            seatTypeCode = $("#seatTypeCode option:selected").val();
            seatTypeCodeName = $("#seatTypeCode option:selected").text();
            price = $("#price").val();
            orderIndex = $("#orderIndex").val();
        }
    </script>
</critc-script>