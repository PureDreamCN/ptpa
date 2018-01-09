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
    <title>旅客统计</title>

</head>
<body>
<input type="hidden" id="backUrl" value="${backUrl }">
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li><i class="fa fa-home"></i> <a
                href="${dynamicServer}/index.htm">首页</a></li>
        <li>>旅客统计</li>

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
                    <td>车次：</td>
                    <td><input type="text" id="cc" name="cc"
                               class="form-control input-small" placeholder=""
                               value=""/>
                    </td>
                    <td>日期：</td>
                    <td><input type="text" id="statisticDate" name="statisticDate"
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
                <th>交路号</th>
                <th>日期</th>
                <th>车次</th>
                <th>旅客发送量（人）</th>
                <th>全程周转量（人/公里）</th>
                <th>票价合计（元）</th>
                <th>所属路局</th>
                <%--<th>操作</th>--%>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="trainStatistic" items="${list}" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${trainStatistic.jlCode }</td>
                    <td><fmt:formatDate value="${trainStatistic.statisticDate }" pattern="yyyy-MM-dd " /></td>
                    <td>${trainStatistic.cc }</td>
                    <td>${trainStatistic.passengerVolume }</td>
                    <td>${trainStatistic.passengerMileage }</td>
                    <td>${trainStatistic.fareSum }</td>
                    <td>${trainStatistic.ljdm }</td>
                   <%-- <td >

                        <a href="toUpdate.htm?id=${trainStatistic.id}&backUrl=${backUrl}">修改</a>&nbsp;&nbsp;
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
            var url = "trainps.htm?";
            if ($("#cc").val() != ""){
                url += "cc=" + $("#cc").val().trim();
            }
            if ($("#statisticDate").val() != "") {
                url += "&statisticDate=" + $("#statisticDate").val().trim();
            }

            window.location = encodeURI(url);
        }

        $("#btnAdd").click(function(){
            window.location = "toAdd.htm?backUrl=${backUrl }";
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

