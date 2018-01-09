<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/taglib.jsp" %>
<head>
    <title>操作日志</title>
</head>
<style>
    #trainInfo tr td {font-size: larger;}
</style>
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
        <li>
            >车次详情
        </li>
    </ul>
</div>
<div style="margin-left: 1%;">
    <div class="row col-md-12">
        <div style="" class="col-md-4 col-xs-3 text-center"><br/>
            <br/><br/>
                <h1 style="display: inline;font-weight: bolder"><b style="font-size:larger">${train.cc}</b></h1>

                <h3 style="font-weight: bold;margin-top:8%;;color:#BCBCBC;"><b>${train.beginCzdmName}~${train.endCzdmName}</b></h3>
                <h4 style="display: inline;font-weight: bold;margin-top:4%;color:#BCBCBC;"><b>担当局：${train.ljdm}</b></h4>
            <h5 style="color:#BCBCBC;"><b>(${train.name})</b></h5>

        </div>
        <div class="col-md-4 col-xs-6 " style="margin-top: 5%;">
            <table id="trainInfo" class="table table-striped  table-hover text-left">
                <tr>
                    <td><b>客运列车类型：</b></td>
                    <td>${train.trainTypeName}</td>
                </tr>
                <tr>
                    <td><b>客车编组类型：</b></td>
                    <td>${train.trainMarshallingTypeName}</td>
                </tr>
                <tr>
                    <td><b>车底数：</b></td>
                    <td>${train.vehicleGroupSize}</td>
                </tr>
                <tr>
                    <td><b>吨数：</b></td>
                    <td>${train.ds}吨</td>
                </tr>
            </table>
        </div>
        <div class="col-xs-4" style="margin-top: 10%">
            <div class="col-xs-12">
            <button  class="btn btn-info" id="toAdd">
                <i class="ace-icon fa fa-cog"></i> 信息维护
            </button>
             </div>
            <div class="col-xs-12">
                <button  class="btn" style="margin-top: 5%;" onclick="javascript:window.history.back();">
                    <i class="ace-icon fa fa-undo"></i> &nbsp;&nbsp;返&nbsp;&nbsp;回&nbsp;&nbsp;&nbsp;
                </button>
            </div>

        </div>
    </div>
    <div class="row invoice-cust-add">

    </div>
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>各项成本统计</div>
            <div class="tools">
                <a href="javascript:;" class="collapse"> </a>
            </div>
        </div>
        <div class="portlet-body">
            <div style="width: 100%;height: 400px;">
            <div id="main"  style="float: left;width: 60%;height:400px;"></div>
            <div >
            <table id="12" class="table table-striped  table-hover text-left" style="float: left;width: 30%;margin-top: 3%;">
                <tr>
                    <td><b>线路成本：</b></td>
                    <td>${train.lineCost}</td>
                </tr>
                <tr>
                    <td><b>牵引成本：</b></td>
                    <td>${train.tractionCost}</td>
                </tr>
                <tr>
                    <td><b>接触网成本：</b></td>
                    <td>${train.ceCost}</td>
                </tr>
                <tr>
                    <td><b>车辆日常修成本：</b></td>
                    <td>${train.maintainNormalCost}</td>
                </tr>
                <tr>
                    <td><b>车辆大修成本：</b></td>
                    <td>${train.maintainAdvanceCost}</td>
                </tr>
                <tr>
                    <td><b>车辆折旧成本：</b></td>
                    <td>${train.depreciationCost}</td>
                </tr>
                <tr>
                    <td><b>人力成本：</b></td>
                    <td>${train.humanResourceCost}</td>
                </tr>
                <tr>
                    <td><b>备品成本：</b></td>
                    <td>${train.partCost}</td>
                </tr>
                <tr>
                    <td><b>服务成本：</b></td>
                    <td>${train.serviceCost}</td>
                </tr>
                <tr>
                    <td><b>合计：</b></td>
                    <td id="total"></td>
                </tr>
            </table></div></div>
        </div>
    </div>
    <%--<div class="portlet box blue ">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>各项成本统计</div>
            <div class="tools">
                <a href="javascript:;" class="expand" data-original-title title> </a>
            </div>
        </div>
        <div class="portlet-body " style="display: none;">
            <table id="csotTable" class="table table-striped table-bordered table-hover">
                <tr>
                    <th width="34">线路成本</th>
                    <th width="40">牵引成本</th>
                    <th width="35">接触网成本</th>
                    <th width="35">车辆成本</th>
                    <th width="35">人力成本</th>
                    <th width="30">备品成本</th>
                    <th width="50">合计</th>
                </tr>
                <tbody>
                    <tr>
                        <td>${train.lineCost}</td>
                        <td>${train.tractionCost}</td>
                        <td>${train.ceCost}</td>
                        <td>${train.maintainAdvanceCost + train.maintainNormalCost + train.depreciationCost}</td>
                        <td>${train.humanResourceCost}</td>
                        <td>${train.partCost}</td>
                        <td>${train.lineCost+train.tractionCost+train.ceCost+train.depreciationCost+train.maintainAdvanceCost+train.maintainNormalCost+train.humanResourceCost+train.partCost}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>--%>
    <div class="portlet box blue ">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>线路区段详情</div>
            <div class="tools">
                <a href="javascript:;" class="expand" data-original-title title> </a>
            </div>
        </div>
        <div class="portlet-body " style="display: none;">
            <table id="lineTable" class="table table-striped table-bordered table-hover">
                <tr>
                    <th width=20>#</th>
                    <%--<th width="34">列车类型</th>
                    <th width="40">列车编组类型</th>--%>
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
                </tr>

                <tbody>
                <c:forEach items="${listTrainLine }" var="line" varStatus="st">
                    <tr>
                        <td>${st.index+1 }</td>
                        <%--<td>${line.trainTypeName}</td>
                        <td>${line.trainMarshallingTypeName}</td>--%>
                        <td>${line.xldmName}</td>
                        <td>${line.beginCzdmName}</td>
                        <td>${line.endCzdmName}</td>
                        <td>${line.mileage}</td>
                        <td>${line.linePriceLevelName}</td>
                        <td>${line.lineBusyLevelName}</td>
                        <td><c:if test="${line.beforeDawn eq 0}">否</c:if>
                            <c:if test="${line.beforeDawn eq 1}">是</c:if></td>
                        <td><c:if test="${!empty line.beforeDawnRate}">${line.beforeDawnRate}%</c:if></td>
                        <td>${line.price}</td>
                        <td>${line.orderIndex}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="portlet box blue ">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>牵引区段详情</div>
            <div class="tools">
                <a href="javascript:;" class="expand" data-original-title title> </a>
            </div>
        </div>
        <div class="portlet-body " style="display: none;">
            <table id="TractionTable" class="table table-striped table-bordered table-hover">
                <tr>
                    <th width=20>#</th>
                    <th width="35">线路</th>
                    <th width="35">起点站</th>
                    <th width="35">讫点站</th>
                    <th width="35">牵引类型</th>
                    <th width="30">里程(km)</th>
                    <th width="30">机车清算单价(元/吨公里)</th>
                    <th width="55">电力机车使用接触网和电费清算单价(元/吨公里)</th>
                    <th width="30">排序</th>
                </tr>

                <tbody>
                <c:forEach items="${listTrainTraction }" var="traction" varStatus="st">
                    <tr>
                        <td>${st.index+1 }</td>
                        <td>${traction.xldmName}</td>
                        <td>${traction.beginCzdmName}</td>
                        <td>${traction.endCzdmName}</td>
                        <td>${traction.tractionTypeName}</td>
                        <td>${traction.mileage}</td>
                        <td>${traction.locomotivePrice}</td>
                        <td>${traction.cePrice}</td>
                        <td>${traction.orderIndex}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="portlet box blue ">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>接触网区段详情</div>
            <div class="tools">
                <a href="javascript:;" class="expand" data-original-title title> </a>
            </div>
        </div>
        <div class="portlet-body " style="display: none;">
            <table id="TractionceTable" class="table table-striped table-bordered table-hover">
                <tr>
                    <th width=20>#</th>
                    <th width="35">线路</th>
                    <th width="35">起点站</th>
                    <th width="35">讫点站</th>
                    <th width="35">客专企业</th>
                    <th width="30">里程(km)</th>
                    <th width="30">接触网清算单价(元/吨公里)</th>
                    <th width="55">电费清算单价(元/吨公里)</th>
                    <th width="30">排序</th>
                </tr>

                <tbody>
                <c:forEach items="${listTrainCe }" var="tractionce" varStatus="st">
                    <tr>
                        <td>${st.index+1 }</td>
                        <td>${tractionce.xldmName}</td>
                        <td>${tractionce.beginCzdmName}</td>
                        <td>${tractionce.endCzdmName}</td>
                        <td>${tractionce.pseName}</td>
                        <td>${tractionce.mileage}</td>
                        <td>${tractionce.catenaryPrice}</td>
                        <td>${tractionce.electricityPrice}</td>
                        <td>${tractionce.orderIndex}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="portlet box blue ">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>客车编组信息</div>
            <div class="tools">
                <a href="javascript:;" class="expand" data-original-title title> </a>
            </div>
        </div>
        <div class="portlet-body " style="display: none;">
            <div class="row">
                <div class="col-md-12">
                    <table id="vehicleTable" class="table table-striped table-bordered table-hover">
                        <tr>
                            <th width=20>#</th>
                            <th width="35">车型</th>
                            <th width="35">车种</th>
                            <th width="35">辆型</th>
                            <th width="30">购置成本(元)</th>
                            <th width="30">平均年走行公里(公里/年)</th>
                            <th width="55">折旧年限(年)</th>
                            <%--<th width="30">折旧残值率(%)</th>
                            <th width="30">年折旧率(%)</th>--%>
                            <th width="30">每公里折旧率(%/公里)</th>
                            <th width="30">折旧清算单价(元)</th>
                            <th width="30">大修清算单价(元)</th>
                            <th width="30">日常修清算单价(元)</th>
                            <th width="30">排序</th>
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
                                <%--<td>${vehicle.deperciationResidualRate}</td>
                                <td>${vehicle.deperciationRate}</td>--%>
                                <td>${vehicle.deperciationPkRate}</td>
                                <td>${vehicle.deperciationPrice}</td>
                                <td>${vehicle.maintainAdvancePrice}</td>
                                <td>${vehicle.maintainNormalPrice}</td>
                                <td>${vehicle.orderIndex}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="portlet box blue ">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>客车人力配置信息</div>
            <div class="tools">
                <a href="javascript:;" class="expand" data-original-title title> </a>
            </div>
        </div>
        <div class="portlet-body " style="display: none;">
            <table id="humanResourceTable" class="table table-striped table-bordered table-hover">
                <tr>
                    <th width=20>#</th>
                    <th width="85">人力类型</th>
                    <th width="30">铁路局</th>
                    <th width="85">每列车每公里人员配置数(人/列公里)</th>
                    <th width="70">平均人力支出(元/人年)</th>
                </tr>

                <tbody>
                <c:forEach items="${listHumanResource }" var="humanResource" varStatus="st">
                    <tr>
                        <td>${st.index+1 }</td>
                        <td>${humanResource.humanResourceTypeName}</td>
                        <td>${humanResource.ljdm}</td>
                        <td>${humanResource.rate}</td>
                        <td>${humanResource.price}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="portlet box blue ">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>客车备品配置信息</div>
            <div class="tools">
                <a href="javascript:;" class="expand" data-original-title title> </a>
            </div>
        </div>
        <div class="portlet-body " style="display: none;">
            <table id="partTable" class="table table-striped table-bordered table-hover">
                <tr>
                    <th width=20>#</th>
                    <th width="85">铁路局</th>
                    <th width="50">客运列车类型</th>
                    <th width="50">清算单价</th>
                </tr>

                <tbody>
                    <tr>
                        <td>1</td>
                        <td>${train.ljdm}</td>
                        <td>${train.trainTypeName}</td>
                        <td>${train.partPrice}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="portlet box blue ">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>客车服务信息</div>
            <div class="tools">
                <a href="javascript:;" class="expand" data-original-title title> </a>
            </div>
        </div>
        <div class="portlet-body " style="display: none;">
            <table id="serviceTable" class="table table-striped table-bordered table-hover">
                <tr>
                    <th width=20>#</th>
                    <th width="85">服务名称</th>
                    <th width="50">铁路局</th>
                    <th width="50">服务次数</th>
                    <th width="50">服务计量单位</th>
                    <th width="70">清算单价(元/计量单位)</th>
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
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="portlet box blue ">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>客车席别票价信息</div>
            <div class="tools">
                <a href="javascript:;" class="expand" data-original-title title> </a>
            </div>
        </div>
        <div class="portlet-body " style="display: none;">
            <table id="ticketpriceTable" class="table table-striped table-bordered table-hover">
                <tr>
                    <th width=20>#</th>
                    <th width="85">席别类型</th>
                    <th width="70">票价(元/张)</th>
                    <th width="70">排序</th>
                </tr>

                <tbody>
                <c:forEach items="${listTrainTicketprice }" var="ticketprice" varStatus="st">
                    <tr>
                        <td>${st.index+1 }</td>
                        <td>${ticketprice.seatTypeName}</td>
                        <td>${ticketprice.price}</td>
                        <td>${ticketprice.orderIndex}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>



    </div>
</div>
</body>
<critc-script>
    <script type="text/javascript" src="${staticServer}/assets/echarts/js/echarts.min.js" ></script>
    <script type="text/javascript">
        var maintainNormalCost = "${train.maintainNormalCost}";
        var maintainAdvanceCost = "${train.maintainAdvanceCost}";
        var depreciationCost = "${train.depreciationCost}";
        var lineCost = "${train.lineCost}";
        var tractionCost = "${train.tractionCost}";
        var ceCost = "${train.ceCost}";
        var partCost = "${train.partCost}";
        var humanResourceCost = "${train.humanResourceCost}";
        function format(val) {
            if(val=="")return 0;else{return val;}
        }
        $(function () {
            $("#toAdd").bind("click",btnAdd);
        });
        // 修改维护
        var btnAdd = function () {
            window.location = encodeURI("toUpdate.htm?id=${train.id}");
        }
        var myChart = echarts.init(document.getElementById('main'));
        option = {
            title: {
                text: '成本占比统计',
                left: 'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                // orient: 'vertical',
                // top: 'middle',
                bottom: 10,
                left: 'center',
                data: ['线路成本', '牵引成本','接触网成本','车辆日常修成本','车辆大修成本','车辆折旧成本','人力成本','备品成本','服务成本']
            },
            series : [
                {
                    type: 'pie',
                    radius : '65%',
                    center: ['50%', '50%'],
                    selectedMode: 'single',
                    data:[
                        {value:format(lineCost), name: '线路成本'},
                        {value:format(tractionCost), name: '牵引成本'},
                        {value:format(ceCost), name: '接触网成本'},
                        {value:format(maintainNormalCost), name: '车辆日常修成本'},
                        {value:format(maintainAdvanceCost), name: '车辆大修成本'},
                        {value:format(depreciationCost), name: '车辆折旧成本'},
                        {value:format(humanResourceCost), name: '人力成本'},
                        {value:format(partCost), name: '备品成本'},
                        {value:format(partCost), name: '服务成本'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        myChart.setOption(option);
        var total = "${train.lineCost+train.tractionCost+train.ceCost+train.depreciationCost+train.maintainAdvanceCost+train.maintainNormalCost+train.humanResourceCost+train.partCost+train.serviceCost}";
        $("#total").html(returnFloat(total));
        function returnFloat(value){
            var value=Math.round(parseFloat(value)*100)/100;
            var xsd=value.toString().split(".");
            if(xsd.length==1){
                value=value.toString()+".00";
                return value;
            }
            if(xsd.length>1){
                if(xsd[1].length<2){
                    value=value.toString()+"0";
                }
                return value;
            }
        }
    </script>
</critc-script>