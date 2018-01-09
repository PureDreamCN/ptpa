<%--
  Created by IntelliJ IDEA.
  User: 郭飞
  Date: 2017/12/5
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>客车车次详情</title>
    <link rel="stylesheet"
          href="${staticServer}/assets/autocomplete/css/jquery.autocomplete.css" />

</head>
<body>
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >盈利测算
        </li>
        <li>
            >盈利平衡点测算
        </li>
    </ul>
</div>

<div class="row">
    <div style="" class="col-md-4  text-center"><br/>
        <br/><br/>
        <h1 style="display: inline;font-weight: bolder"><b style="font-size:larger">${train.cc}</b></h1>

        <h3 style="font-weight: bold;margin-top:8%;;color:#BCBCBC;"><b>${train.beginCzdmName}~${train.endCzdmName}</b></h3>
        <h4 style="display: inline;font-weight: bold;margin-top:4%;color:#BCBCBC;"><b>担当局：${train.ljdm}</b></h4>
        <h5 style="color:#BCBCBC;"><b>(${train.name})</b></h5>
        <h4 style="display: inline;font-weight: bold;margin-top:4%;"><a  href="${staticServer}/train/showdetail.htm?id=${train.id}"><b>详&nbsp;情</b></a></h4>

    </div>

    <div class="col-md-4   " style="margin-top: 5%;">
        <div class="row"><b>客运部</b></div>
        <table id="trainInfo" class="table table-striped  table-hover text-left">
            <tr>
                <td><b>营业收入：</b></td>
                <td><fmt:formatNumber value="${book.ptTickeIncoming}" type="number" maxFractionDigits="2"/></td>
            </tr>
            <tr>
                <td><b>总成本：</b></td>
                <td><fmt:formatNumber value="${fixedCost+ptmodifyCost}" type="number" maxFractionDigits="2"/></td>
            </tr>
            <tr >
                <td><b>&nbsp;&nbsp;&nbsp;&nbsp;固定成本：</b></td>
                <td><fmt:formatNumber value="${fixedCost}" type="number" maxFractionDigits="2"/></td>
            </tr>
            <tr>
                <td><b>&nbsp;&nbsp;&nbsp;&nbsp;变动成本：</b></td>
                <td><fmt:formatNumber value="${ptmodifyCost}" type="number" maxFractionDigits="2"/></td>
            </tr>


        </table>

    </div>

    <div class="col-md-4   " style="margin-top: 5%;">
        <div class="row"><b>发改部</b></div>
        <table id="trainInfo2" class="table table-striped  table-hover text-left">
            <tr>
                <td><b>营业收入：</b></td>
                <td><fmt:formatNumber value="${book.drTickeIncoming}" type="number" maxFractionDigits="2"/></td>
            </tr>
            <tr>
                <td><b>总成本：</b></td>
                <td><fmt:formatNumber value="${fixedCost+drmodifyCost}" type="number" maxFractionDigits="2"/></td>
            </tr>
            <tr >
                <td><b>&nbsp;&nbsp;&nbsp;&nbsp;固定成本：</b></td>
                <td><fmt:formatNumber value="${fixedCost}" type="number" maxFractionDigits="2"/></td>
            </tr>
            <tr>
                <td><b>&nbsp;&nbsp;&nbsp;&nbsp;变动成本：</b></td>
                <td><fmt:formatNumber value="${drmodifyCost}" type="number" maxFractionDigits="2"/></td>
            </tr>

        </table>
    </div>

</div>


<div class="row">
    <div class="col-md-4 col-md-offset-4">
        <div class="row">
            <div class=" col-md-5 text-danger demo"><font style="font-size:larger"><strong>平衡点客座率：</strong></font></div>
            <div class="col-md-7 text-danger"><font style="font-size:larger"><strong><fmt:formatNumber value="${ptPoint}" type="number" maxFractionDigits="4"/>%</strong></font></div>
        </div>
        <div class="row">
            <div class=" col-md-5 text-danger demo"><font style="font-size:larger"><strong>盈&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;利&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额：</strong></font></div>
            <div class="col-md-7 text-danger"><font style="font-size:larger"><strong><fmt:formatNumber value="${book.ptTickeIncoming-fixedCost-ptmodifyCost}" type="number" maxFractionDigits="2"/></strong></font></div>
        </div>

    </div>
    <div class="col-md-4 ">
        <div class="row">
            <div class=" col-md-5 text-danger"><font style="font-size:larger"><strong>平衡点客座率：</strong></font></div>
            <div class="col-md-7 text-danger"><font style="font-size:larger"><strong><fmt:formatNumber value="${ptPoint}" type="number" maxFractionDigits="4"/>%</strong></font></div>
        </div>
        <div class="row">
            <div class=" col-md-5 text-danger demo"><font style="font-size:larger"><strong>盈&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;利&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额：</strong></font></div>
            <div class="col-md-7 text-danger"><font style="font-size:larger"><strong><fmt:formatNumber value="${book.drTickeIncoming-fixedCost-drmodifyCost}" type="number" maxFractionDigits="2"/></strong></font></div>
        </div>
    </div>

</div>

      <br/>
    <!--      一个用于绘图的 DOM 容器  -->
         <div class="page-breadcrumb" style="border-top: 1px solid #60aee4;"><h2>基于客运部数据测算</h2></div>
        <div class="row">
            <div class="col-md-4">
                <div id="pieChart" class="text-center"  style="height:260px"></div>
                <div class="text-center"><h2>客运部营业收入</h2></div>
            </div>
            <div class="col-md-4">
                <div id="pieChart3"  class="text-center"  style="height:260px"></div>
                <div class="text-center">  <h2>客运部变动成本</h2></div>
            </div>
            <div class="col-md-4">
                <div id="pieChart2"   class="text-center" style="height:260px"></div>
                <div class="text-center"> <h2>固定成本</h2></div>
            </div>

        </div>
         <br/>
         <div class=" page-breadcrumb"  style="border-top: 1px solid #60aee4;"><h2>基于发改部数据测算</h2></div>
        <div class="row">
            <div class="col-md-4">
                <div id="pieChart4" class="text-center"  style="height:260px"></div>
                <div class="text-center"><h2>发改部营业收入</h2></div>
            </div>
            <div class="col-md-4">
                <div id="pieChart5"  class="text-center"  style="height:260px"></div>
                <div class="text-center">  <h2>发改部变动成本</h2></div>
            </div>
            <div class="col-md-4">
                <div id="pieChart6"   class="text-center" style="height:260px"></div>
                <div class="text-center"> <h2>固定成本</h2></div>
            </div>
        </div>



<critc-script>
    <script type="text/javascript" src="${staticServer}/assets/echarts/js/echarts.min.js"></script>
    <script>




        var chartContainer = document.getElementById('pieChart');
        var chartContainer2 = document.getElementById('pieChart2');
        var chartContainer3 = document.getElementById('pieChart3');
        var chartContainer4 = document.getElementById('pieChart4');
        var chartContainer5 = document.getElementById('pieChart5');
        var chartContainer6 = document.getElementById('pieChart6');


        var resizeChartContainer = function () {
            chartContainer.style.width = $("#pieChart").attr("width");
            chartContainer.style.height = $("#pieChart").attr("hieght");
        };
        var resizeChartContainer2 = function () {
            chartContainer.style.width = $("#pieChart2").attr("width");
            chartContainer.style.height = $("#pieChart2").attr("hieght");
        };
        var resizeChartContainer3 = function () {
            chartContainer.style.width = $("#pieChart3").attr("width");
            chartContainer.style.height = $("#pieChart3").attr("hieght");
        };
        var resizeChartContainer4 = function () {
            chartContainer.style.width = $("#pieChart4").attr("width");
            chartContainer.style.height = $("#pieChart4").attr("hieght");
        };
        var resizeChartContainer5 = function () {
            chartContainer.style.width = $("#pieChart5").attr("width");
            chartContainer.style.height = $("#pieChart5").attr("hieght");
        };
        var resizeChartContainer6 = function () {
            chartContainer.style.width = $("#pieChart6").attr("width");
            chartContainer.style.height = $("#pieChart6").attr("hieght");
        };

        resizeChartContainer();
        resizeChartContainer2();
        resizeChartContainer3();
        resizeChartContainer4();
        resizeChartContainer5();
        resizeChartContainer6();
        var myChart = echarts.init(chartContainer);
        var myChart2 = echarts.init(chartContainer2);
        var myChart3 = echarts.init(chartContainer3);
        var myChart4 = echarts.init(chartContainer4);
        var myChart5 = echarts.init(chartContainer5);
        var myChart6 = echarts.init(chartContainer6);
        var ptTickeIncoming = ${book.ptTickeIncoming};
        var ptTickeIncoming2 = parseFloat(ptTickeIncoming.toFixed(2));
        var option = {
            title : {
                text: '',
                x:'center'
            },
            toolbox: {
                /*  feature: {
                 dataView:{
                 show:true
                 },
                 restore: {},
                 saveAsImage: {}
                 }*/
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                /*  data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']*/
            },
            series : [
                {
                    name: '',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {value:ptTickeIncoming2, name:'售票收入'},
                        {value:0, name:'行李车收入'},
                        {value:0, name:'邮政车收入'},

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

        var lineCost = ${costResource.lineCost};
        var lineCost2 = parseFloat(lineCost.toFixed(2));
        var trainCost = ${trainCost};
        var trainCost2 = parseFloat(trainCost.toFixed(2));
        var tractionCost =  ${costResource.tractionCost};
        var tractionCost2 = parseFloat(tractionCost.toFixed(2));
        var tractionceCost = ${costResource.tractionceCost};
        var tractionceCost2 =  parseFloat(tractionceCost.toFixed(2));
        var humanCost = ${costResource.humanCost};
        var humanCost2 =  parseFloat(humanCost.toFixed(2));
        var partCost = ${costResource.partCost};
        var partCost2 = parseFloat(partCost.toFixed(2));
        var serviceCost = ${costResource.serviceCost};
        var serviceCost2 =  parseFloat(serviceCost.toFixed(2));
        var option2 = {
            title : {
                text: '',
                x:'center'
            },
            toolbox: {
                /*  feature: {
                 dataView:{
                 show:true
                 },
                 restore: {},
                 saveAsImage: {}
                 }*/
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                /*  data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']*/
            },
            series : [
                {
                    name: '',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {   value:lineCost2,
                            name:'线路成本',
                            itemStyle:{
                            normal:{color:'#c23531'}
                        }},
                        {  value:trainCost2,
                            name:'车辆成本',
                            itemStyle:{
                            normal:{color:'#61a0a8'}
                            }
                        },
                        {    value:tractionCost2,
                             name:'牵引成本',
                             itemStyle:{
                                normal:{color:'#d48265'}
                             }
                        },
                        {   value:tractionceCost2,
                            name:'接触网成本',
                            itemStyle:{
                                normal:{color:'#91c7ae'}
                            }
                         },
                        {   value:humanCost2,
                            name:'人员成本',
                            itemStyle:{
                                normal:{color:'#6e7074'}
                            }

                        },
                        {   value:partCost2,
                            name:'备品成本',
                            itemStyle:{
                                normal:{color:'#c4ccd3'}
                            }
                        },
                        {   value:serviceCost2,
                            name:'服务',
                            itemStyle:{
                                normal:{color:'#749f83'}
                            }
                        }

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
        var ptTicketServiceCost = ${book.ptTicketServiceCost};
        var ptTicketServiceCost2 = parseFloat(ptTicketServiceCost.toFixed(2));
        var ptStationServiceCost = ${book.ptStationServiceCost};
        var ptStationServiceCost2 = parseFloat(ptStationServiceCost.toFixed(2));
        var option3 = {
            title : {
                text: '',
                x:'center'
            },
            toolbox: {
                /*  feature: {
                 dataView:{
                 show:true
                 },
                 restore: {},
                 saveAsImage: {}
                 }*/
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                /*  data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']*/
            },
            series : [
                {
                    name: '',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {  value:ptTicketServiceCost2,
                            name:'售票服务',
                            itemStyle:{
                                normal:{color:'#61a0a8'}
                            }
                        },
                        {  value:ptStationServiceCost2,
                            name:'车站服务',
                            itemStyle:{
                                normal:{color:'#d48265'}
                            }
                        }
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
        var drTickeIncoming = ${book.drTickeIncoming};
        var drTickeIncoming2 = parseFloat(drTickeIncoming.toFixed(2));
        var option4 = {
            title : {
                text: '',
                x:'center'
            },
            toolbox: {
                /*  feature: {
                 dataView:{
                 show:true
                 },
                 restore: {},
                 saveAsImage: {}
                 }*/
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                /*  data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']*/
            },
            series : [
                {
                    name: '',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {value:drTickeIncoming2, name:'售票收入'},
                        {value:0, name:'行李车收入'},
                        {value:0, name:'邮政车收入'},

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
        var drTicketServiceCost = ${book.drTicketServiceCost};
        var drTicketServiceCost2 = parseFloat(drTicketServiceCost.toFixed(2));
        var drStationServiceCost = ${book.drStationServiceCost};
        var drStationServiceCost2 = parseFloat(drStationServiceCost.toFixed(2));
        var option5 = {
            title : {
                text: '',
                x:'center'
            },
            toolbox: {
                /*  feature: {
                 dataView:{
                 show:true
                 },
                 restore: {},
                 saveAsImage: {}
                 }*/
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                /*  data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']*/
            },
            series : [
                {
                    name: '',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {  value:drTicketServiceCost2,
                            name:'售票服务',
                            itemStyle:{
                                normal:{color:'#61a0a8'}
                            }
                        },
                        {  value:drStationServiceCost2,
                            name:'车站服务',
                            itemStyle:{
                                normal:{color:'#d48265'}
                            }
                        },
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
        var option6 = {
            title : {
                text: '',
                x:'center'
            },
            toolbox: {
                /*  feature: {
                 dataView:{
                 show:true
                 },
                 restore: {},
                 saveAsImage: {}
                 }*/
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                /*  data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']*/
            },
            series : [
                {
                    name: '',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:[
                        {   value:lineCost2,
                            name:'线路成本',
                            itemStyle:{
                                normal:{color:'#c23531'}
                            }
                        },
                        {  value:trainCost2,
                            name:'车辆成本',
                            itemStyle:{
                                normal:{color:'#61a0a8'}
                            }
                        },
                        {    value:tractionCost2,
                            name:'牵引成本',
                            itemStyle:{
                                normal:{color:'#d48265'}
                            }
                        },
                        {   value:tractionceCost2,
                            name:'接触网成本',
                            itemStyle:{
                                normal:{color:'#91c7ae'}
                            }
                        },
                        {   value:humanCost2,
                            name:'人员成本',
                            itemStyle:{
                                normal:{color:'#6e7074'}
                            }

                        },
                        {   value:partCost2,
                            name:'备品成本',
                            itemStyle:{
                                normal:{color:'#c4ccd3'}
                            }
                        },
                        {   value:serviceCost2,
                            name:'服务',
                            itemStyle:{
                                normal:{color:'#749f83'}
                            }
                        }

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
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        myChart2.setOption(option2);
        myChart3.setOption(option3);
        myChart4.setOption(option4);
        myChart5.setOption(option5);
        myChart6.setOption(option6);

        window.onresize = function () {
            //重置容器高宽
            resizeChartContainer();
            resizeChartContainer2();
            resizeChartContainer3();
            resizeChartContainer4();
            resizeChartContainer5();
            resizeChartContainer6();
            myChart.resize();
            myChart2.resize();
            myChart3.resize();
            myChart4.resize();
            myChart5.resize();
            myChart6.resize();
        };

    </script>

</critc-script>
</body>
</html>
