<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../common/taglib.jsp"%>
<head>
    <title>资源管理</title>
    <critc-css>
        <link href="${staticServer }/assets/zTree3.5/css/zTreeStyle/metro.css"
              rel="stylesheet" type="text/css" />
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
<h1 class="page-title">
    车次详情 <small>>>维护模块</small>
</h1>
<%--<div class="tabbable-custom">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#baseinfo" data-toggle="tab">基本信息</a></li>
        <li><a href="#line" data-toggle="tab">线路区段维护</a></li>
        <li><a href="#traction" data-toggle="tab">牵引区段维护</a></li>
        <li><a href="#tractionCe" data-toggle="tab">接触网区段维护</a></li>
        <li><a href="#vehicle" data-toggle="tab">车辆编组维护</a></li>
        <li><a href="#humanresource" data-toggle="tab">车次人力配置</a></li>

    </ul>
    <div class="tab-content" style="border: none;"><hr style="margin-top:-10px;"/>
        <div class="tab-pane fade in active" style="margin-top:-10px;" id="baseinfo">
            <jsp:include page="jspf/baseinfo.jsp"></jsp:include>
        </div>
        <div class="tab-pane fade" style="margin-top:-10px;" id="line">
            <jsp:include page="jspf/line.jsp"></jsp:include>
        </div>
        <div class="tab-pane fade" style="margin-top:-10px;" id="traction">
            <jsp:include page="jspf/traction.jsp"></jsp:include>
        </div>
        <div class="tab-pane fade" style="margin-top:-10px;" id="tractionCe">
            <jsp:include page="jspf/tractionCe.jsp"></jsp:include>
        </div>
        <div class="tab-pane fade" style="margin-top:-10px;" id="humanresource">
            <jsp:include page="jspf/humanresource.jsp"></jsp:include>
        </div>
        <div class="tab-pane fade" style="margin-top:-10px;" id="vehicle">
            <jsp:include page="jspf/vehicle.jsp"></jsp:include>
        </div>
    </div>
</div>--%>
</body>
<critc-script>
    <script type="text/javascript">
    </script>
</critc-script>