<%--
  Created by IntelliJ IDEA.
  User: 郭飞
  Date: 2017/11/24
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; utf-8">
    <title>路局</title>

</head>
<body>
<input type="hidden" id="backUrl" value="${backUrl }">
    <div class="page-bar">
        <ul class="page-breadcrumb">
            <li><i class="fa fa-home"></i> <a
                    href="${dynamicServer}/index.htm">首页</a></li>
            <li>>路局</li>

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
                        <td>
                            <button class="btn btn-primary" id="btnSearch">
                                <i class="fa fa-search"></i> 刷新
                            </button>
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
                    <th>#</th>
                    <th>全称</th>
                    <th>简称</th>
                    <th>路局代码</th>
                    <th>编码</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="bureau" items="${list}" varStatus="st">
                        <tr>
                            <td>${st.index+1 }</td>
                            <td>${bureau.name }</td>
                            <td>${bureau.shortName }</td>
                            <td>${bureau.ljdm }</td>
                            <td>${bureau.code }</td>
                            <td >

                                <a href="toUpdate.htm?ljdm=${bureau.ljdm }&backUrl=${backUrl}">修改</a>&nbsp;&nbsp;
                                <a href="javascript:delModule(${bureau.ljdm });">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>



    <critc-script>

    <script type="text/javascript">
       $("#btnAdd").click(function(){
           window.location = "toAdd.htm?backUrl=${backUrl }";
       });

       // 删除
       var delModule = function (ljdm) {

           bootbox.confirm("你确定要删除该模块吗？", function (result) {
               if (result) {

                   window.location = "delete.htm?ljdm=" + ljdm + "&backUrl=${backUrl}";
               }
           })
       }
    </script>
</critc-script>
</body>

