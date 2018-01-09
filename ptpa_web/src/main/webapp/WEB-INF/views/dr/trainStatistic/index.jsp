<%--
  Created by IntelliJ IDEA.
  User: 郭飞
  Date: 2017/11/30
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; utf-8">
    <title>客车统计</title>

</head>
<body>
<input type="hidden" id="backUrl" value="${backUrl }">
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li><i class="fa fa-home"></i> <a
                href="${dynamicServer}/index.htm">首页</a></li>
        <li>>客车统计</li>

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
                    <td>上报车次：</td>
                    <td><input type="text" id="cc" name="cc"
                               class="form-control input-small" placeholder=""
                               value=""/>
                    </td>
                    <td>列车当局：</td>
                    <td><input type="text" id="ddjmc" name="ddjmc"
                               class="form-control input-small" placeholder=""
                               value=""/>
                    </td>
                    <td>
                        <button class="btn btn-primary" id="btnSearch">
                            <i class="ace-icon fa fa-search"></i> 查询
                        </button>
                        <%-- <c:if test="${critc:isP('SysResourceAdd')}">--%>
                       <%-- <button type="button" class="btn btn-success" id="btnAdd">
                            <i class=" fa fa-plus bigger-110"></i> 新增
                        </button>--%>
                        <button class="btn btn-file" id="importUser" DISABLED>
                            <i class="fa fa-cloud-upload"></i> 导入
                        </button>

                        <%-- </c:if>--%>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <table id="treeTable" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>#</th>
                <th width="80px" >上报车次</th>
                <th width="80px" >列车当局</th>
                <th width="80px" >区段代码</th>
                <th >区段起讫点</th>
                <th width="80px" >区段里程</th>
                <th >线路名</th>
                <th width="80px" >线路等级</th>
                <th width="110px" >线路所属局名</th>
                <th width="80px" >机车种类</th>
                <th width="100px" >机车配属局</th>
                <th>列车公里</th>
                <th>客车车辆公里合计</th>
                <%--<th >操作</th>--%>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="trainStatistic" items="${list}" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${trainStatistic.cc }</td>
                    <td>${trainStatistic.ddjmc }</td>
                    <td>${trainStatistic.lineCode }</td>
                    <td>${trainStatistic.beginEnd }</td>
                    <td>${trainStatistic.mileage }</td>
                    <td>${trainStatistic.railwayName }</td>
                    <td>${trainStatistic.railwayLevel }</td>
                    <td>${trainStatistic.railwaySsjmc }</td>
                    <td>${trainStatistic.locomotiveType }</td>
                    <td>${trainStatistic.locomotivePsjmc }</td>
                    <td>${trainStatistic.trainMileage }</td>
                    <td>${trainStatistic.trainVehicleMileageSum }</td>
                    <%--<td >

                        <a href="toTrainstatisticUpdate.htm?id=${trainStatistic.id}&backUrl=${backUrl}">修改</a>&nbsp;&nbsp;
                        <a href="javascript:delModule(${trainStatistic.id });">删除</a>
                    </td>--%>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">${pageNavigate.pageModel}</div>
</div>



<critc-script>

    <script type="text/javascript">
        $(function() {
            $("#btnSearch").bind('click', search);

        })
        // 查询方法
        var search = function() {
            var url = "trainstatistic.htm?";
            if ($("#cc").val() != ""){
                url += "cc=" + $("#cc").val().trim();
            }
            if ($("#ddjmc").val() != "") {
                url += "&ddjmc=" + $("#ddjmc").val().trim();
            }

            window.location = encodeURI(url);
        }

        $("#btnAdd").click(function(){
            window.location = "toTrainstatisticAdd.htm?backUrl=${backUrl }";
        });

        // 删除
        var delModule = function (ljdm) {

            bootbox.confirm("你确定要删除该模块吗？", function (result) {
                if (result) {

                   // window.location = "delete.htm?ljdm=" + ljdm + "&backUrl=${backUrl}";
                }
            })
        }
    </script>
</critc-script>
</body>

