<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/taglib.jsp" %>
<head>
    <title>资源管理</title>
    <critc-css>
        <style>
            #TractionTable td,th {
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
            <i class="fa fa-cogs"></i>列车编组维护
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
                            <button type="button" class="btn btn-success" onclick="add(${id})">
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
        <table id="TractionTable" class="table table-striped table-bordered table-hover">
            <tr>
                <th width=20>#</th>
                <th width="35">车型</th>
                <th width="35">车种</th>
                <th width="35">辆型</th>
                <th width="30">购置成本(元)</th>
                <th width="30">平均年走行公里(公里/年)</th>
                <th width="55">折旧年限(年)</th>
                <th width="30">折旧残值率(%)</th>
                <th width="30">年折旧率(%)</th>
                <th width="30">每公里折旧率(%/公里)</th>
                <th width="30">折旧清算单价(元)</th>
                <th width="30">大修清算单价(元)</th>
                <th width="30">日常修清算单价(元)</th>
                <th width="30">排序</th>
                <th width="60">操作</th>
            </tr>

            <tbody>
            <c:forEach items="${listTrainVehicle }" var="vehicle" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${vehicle.cxName}</td>
                    <td>${vehicle.czName}</td>
                    <td>${vehicle.lxName}</td>
                    <td>${vehicle.purchasePrice}</td>
                    <td>${vehicle.averageKilometer}</td>
                    <td>${vehicle.depreciationPeriod}</td>
                    <td>${vehicle.deperciationResidualRate}</td>
                    <td>${vehicle.deperciationRate}</td>
                    <td>${vehicle.deperciationPkRate}</td>
                    <td>${vehicle.deperciationPrice}</td>
                    <td>${vehicle.maintainAdvancePrice}</td>
                    <td>${vehicle.maintainNormalPrice}</td>
                    <td>${vehicle.orderIndex}</td>
                    <td>
                        <a  onclick="updateResource(${vehicle.id})">修改<br/></a>
                        <a  onclick="deleteResource(${vehicle.id})">删除<br/></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
<critc-script>
    <script type="text/javascript">
        function add(trainId){
            window.location.href="${dynamicServer}/vehicle/commonVehicle.htm?trainId=${id}&param=1"
        }
        function updateResource(id) {
            window.location.href="${dynamicServer}/vehicle/commonVehicle.htm?trainId=${id}&srcVehicleId="+id+"&param=2"

        }
        function deleteResource(id) {
        $.ajax( {
            url:"vehicleDelete.htm",
            data:{vehicleId:id},
            type:'post',
            dataType:'json',
            success:function(result) {
                if(result.success==true){
                    window.location.href="vehicle.htm?id=${id}";
                }else{
                    bootbox.alert("内部错误，删除失败!");
                }
            },
            error : function() {
                bootbox.alert("网络异常，删除失败!");
            }
        });
        }
    </script>
</critc-script>