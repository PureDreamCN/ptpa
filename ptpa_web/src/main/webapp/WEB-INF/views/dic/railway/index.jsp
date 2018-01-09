<%--
  Created by IntelliJ IDEA.
  User: guofei
  Date: 2017/11/28
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; utf-8">
    <title>线路</title>

</head>
<body>
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li><i class="fa fa-home"></i> <a
                href="${dynamicServer}/index.htm">首页</a></li>
        <li>>线路</li>

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
                    <td>线路代码：</td>
                    <td><input type="text" id="xldm"
                               class="form-control input-small" placeholder=""
                               value=""/>
                    </td>
                    <td>线路名称：</td>
                    <td>
                        <input type="text" id="name"
                               class="form-control input-small" placeholder=""
                               value=""/>
                    </td>
                    <td>起点：</td>
                    <td><input type="text" id="beginCzdm"
                               class="form-control input-small" placeholder=""
                               value=""/>
                    </td>
                    <td>讫点：</td>
                    <td><input type="text" id="endCzdm"
                               class="form-control input-small" placeholder=""
                               value=""/>
                    </td>
                    <td>
                        <button class="btn btn-primary" id="btnSearch">
                            <i class="ace-icon fa fa-search"></i> 查询
                        </button>
                    </td>
                    <td>
                        <%-- <c:if test="${critc:isP('SysResourceAdd')}">--%>
                        <button type="button" class="btn btn-success" id="btnAdd">
                            <i class=" fa fa-plus bigger-110"></i> 新增
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

                <th>线路代码</th>
                <th>线路名称</th>
                <th>起点</th>
                <th>讫点</th>
                <th>长度</th>
                <th>产权</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="line" items="${list}" varStatus="st">
                <tr>
                    <td>${line.xldm }</td>
                    <td>${line.name }</td>
                    <td>${line.beginCzdm }</td>
                    <td>${line.endCzdm }</td>
                    <td>${line.mileage }</td>
                    <td>${line.propertyRight }</td>
                    <td>
                        <a href="toUpdate.htm?xldm=${line.xldm }&backUrl=${backUrl}">修改</a>&nbsp;&nbsp;
                        <a href="javascript:delModule(${line.xldm });">删除</a>
                    </td>
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
            $("#btnSearch").bind('click', searchUser);

        })
        // 查询方法
        var searchUser = function() {
            var url = "index.htm?";
            if ($("#xldm").val() != ""){
                url += "xldm=" + $("#xldm").val().trim();
            }
            if ($("#name").val() != "") {
                url += "&name=" + $("#name").val().trim();
            }

            if ($("#beginCzdm").val() != ""){
                url += "&beginCzdm=" + $("#beginCzdm").val().trim();
            }
            if ($("#endCzdm").val() != ""){
                url += "&endCzdm=" + $("#endCzdm").val().trim();
            }

            window.location = encodeURI(url);
        }

        $("#btnAdd").click(function(){
            window.location = "toAdd.htm?backUrl=${backUrl}";
        });

        // 删除
        var delModule = function (xldm) {

            bootbox.confirm("你确定要删除该模块吗？", function (result) {
                if (result) {

                    window.location = "delete.htm?xldm=" + xldm + "&backUrl=${backUrl}";
                }
            })
        }

    </script>
</critc-script>
</body>

