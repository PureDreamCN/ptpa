<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../../common/taglib.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><i class="fa fa-home"></i> <a
				href="${dynamicServer}/index.htm">首页</a></li>
			<li>>盈利测算</li>
			<li>>盈利额测算</li>
		</ul>
	</div>
	<h1 class="page-title">
		盈利测算<small>>>>盈利额测算</small>
	</h1>
	<div class="row">
		<div class="col-md-10 form-horizontal">
			<div class="form-group">
				<label class="col-md-3 control-label">车次：</label>
				<label class="col-md-9" style="padding-top: 7px;">${train.cc }</label>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">车次详情：</label>
				<label class="col-md-9"  style="padding-top: 7px;">${train.name }</label>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">平衡点客座率：</label>
				<label class="col-md-9"  style="padding-top: 7px;">
				<fmt:formatNumber type="number" value=" ${balancePoit }" pattern="0.0000" maxFractionDigits="4"/> %</label>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">客座率（%）：</label>
				<div class="col-md-4">
					<input id="seatReat" name="seatReat" type="text"
						class="form-control input-inline  input-medium" placeholder=""
						value=""><label id="seatReatTip"></label>
				</div>
				<div class="col-md-5">
					<button type="button" class="btn btn-success" id="calculateBtn"
						onClick="calculate()">测算</button>
				</div>
			</div>
		</div>

		<div class="modal fade " id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">


			<i class="fa fa-spinner fa-spin fa-5x  "
				style="margin-top: 25%; margin-left: 45%"></i>



		</div>
		<div class="col-md-10">
			<table class="table table-striped table-hover table-bordered"
				id="earningTable" style="text-align: center;">
				<thead>
					<tr>
						<th style="text-align: center;">客座率</th>
						<th style="text-align: center;">票价收入</th>
						<th style="text-align: center;">固定成本</th>
						<th style="text-align: center;">服务成本</th>
						<th style="text-align: center;">售票成本</th>
						<th style="text-align: center;">盈利额</th>
					</tr>
				</thead>
			</table>
		</div>
		<div class="col-md-10">
			<br /> <br /> <br />
			<div id="earingLine" style="height: 400px;"></div>
		</div>
	</div>
</body>
<critc-script> <script type="text/javascript"
	src="${staticServer}/assets/echarts/js/echarts.min.js"></script> <script
	type="text/javascript">

var earningTable = document.getElementById('earningTable');
var num=earningTable.rows.length;
//客座率数组
var seatReatArray = new Array();
//去掉千分符
function commafyback(num)
{
var x = num.split(',');
return parseFloat(x.join(""));
}
//加上千分符
function Convert(money) {
    var s = money; //获取小数型数据
    s += "";
    if (s.indexOf(".") == -1) s += ".0"; //如果没有小数点，在后面补个小数点和0
    if (/\.\d$/.test(s)) s += "0"; //正则判断
    while (/\d{4}(\.|,)/.test(s)) //符合条件则进行替换
        s = s.replace(/(\d)(\d{3}(\.|,))/, "$1,$2"); //每隔3位添加一个
    return s;
}
var calculate = function(){
	var seatReat = $("#seatReat").val();
	if(seatReat ==''){
		bootbox.alert("请输入客座率！");
		return;
	}else{
		for(var i = 0;i<seatReatArray.length;i++){
			if(seatReat == seatReatArray[i]){
				bootbox.alert("该客座率已测算！");
				return;
			}
		}
		seatReatArray.push(seatReat);
		$('#myModal').modal({backdrop: "static", keyboard: false});
        $('#myModal').modal('show');
		$.ajax({
			type : 'POST',
			url : 'calculate.htm',
			dataType : 'json',
			data : {
				id : ${train.id},
				seatRate:seatReat		
			},
			success: function(result) {
                $('#myModal').modal('hide');
				//保留标题，删除表中其他数据
				// $("#earningTable tr:gt(0)").remove();
				//表格当前的行数 
				num=earningTable.rows.length;
				var row = earningTable.insertRow(num);
				row.insertCell(0).innerHTML=seatReat+"%";
				row.insertCell(1).innerHTML=Convert(result.price.toFixed(2));
				row.insertCell(2).innerHTML=Convert(result.constantCost.toFixed(2));
				row.insertCell(3).innerHTML=Convert(result.stationService.toFixed(2));
				row.insertCell(4).innerHTML=Convert(result.ticketAgentfee.toFixed(2));
				row.insertCell(5).innerHTML=Convert(result.earning.toFixed(2));
				num=earningTable.rows.length;
				if(num>2){
					a();
				}
				return;
			},
			failure:function(){
				bootbox.alert("测算失败！");		
			}
		});
	}	
}

//遍历表格内容返回数组
function getEarningTable(){
	    var seatData = new Array();
	    for(var i=1; i<num; i++){
	    		var seat = new Object();
	    		seat.seatReat = earningTable.rows[i].cells[0].innerHTML;
	    		seat.price = earningTable.rows[i].cells[1].innerHTML;
	    		seat.constantCost = earningTable.rows[i].cells[2].innerHTML;
	    		seat.stationService = earningTable.rows[i].cells[3].innerHTML;
	    		seat.ticketAgentfee = earningTable.rows[i].cells[4].innerHTML;
	    		seat.earning = earningTable.rows[i].cells[5].innerHTML;
	    		seatData.push(seat);
	    }
	    return seatData;
}

var a = function(){
var earning = getEarningTable();
var seatReatArrays = new Array();
var priceArray = new Array(); 
var constantCostArray = new Array(); 
var stationServiceArray = new Array(); 
var ticketAgentfeeArray = new Array(); 
var earningArray = new Array(); 
for(var i = 0;i<earning.length; i++){
	seatReatArrays[i] = earning[i].seatReat;
	/*  var series = new Object;
	series.name = earning[i].seatReat;
	series.type = 'line';
	series.data =[earning[i].earning];
	seriesArray.push(series);  */
	priceArray[i] = commafyback(earning[i].price);
	constantCostArray[i] = commafyback(earning[i].constantCost);
	stationServiceArray[i] = commafyback(earning[i].stationService);
	ticketAgentfeeArray[i] = commafyback(earning[i].ticketAgentfee);
	earningArray[i] = commafyback(earning[i].earning);
}


var chartContainer = document.getElementById('earingLine');

var resizeChartContainer = function (container,id) {
	 container.style.width = $("#"+id).parent().css("width");
	 container.style.height = $("#"+id).parent().css("hieght");
};

resizeChartContainer(chartContainer,"earingLine"); 
var myChart = echarts.init(chartContainer);
var option = {
   title: {
       text: '',
       left:140
   }, 
   tooltip: {
       trigger: 'axis'
   },
   grid:{
      left:140,
      top:-5
   },
   legend: {
   	left:340,
       data:['票价收入','固定成本','服务成本','售票成本','盈利额']
   },
   xAxis:  {
       type: 'category',
       data: seatReatArrays,
       name: '客座率',
   },
   yAxis: {
       type: 'value',
       axisLabel: {
           formatter: '{value} 元'
       },
   },
   series:[{
	   
           name:'票价收入',
           type:'line',
           data:priceArray, 
   },{
	   
       name:'固定成本',
       type:'line',
       data:constantCostArray, 
} ,{
	   
    name:'服务成本',
    type:'line',
    data:stationServiceArray, 
} ,{
	   
    name:'售票成本',
    type:'line',
    data:ticketAgentfeeArray, 
} ,{
	   
    name:'盈利额',
    type:'line',
    data:earningArray, 
}  
           //eval(JSON.stringify(seriesArray))
   ]         
   
};

myChart.setOption(option);

window.onresize = function () {
    //重置容器高宽
    resizeChartContainer(chartContainer,"earingLine"); 
    myChart.resize();
}; 
}
</script> </critc-script>
</html>