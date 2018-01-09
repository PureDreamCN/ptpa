<%--
  Created by IntelliJ IDEA.
  User: 郭飞
  Date: 2017/11/24
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; utf-8">
    <title>路局</title>

</head>
<body>
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li><i class="fa fa-home"></i> <a
                href="${dynamicServer}/index.htm">首页</a></li>
        <li>>车站</li>

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

                    <td>站 名：</td>
                    <td><input type="text" id="name"
                               class="form-control input-small" placeholder=""
                               value=""/>
                    </td>
                    <td>所属路局：</td>
                    <td>
                        <form:select path="stationSearchVo.ljdm"
                                     class="form-control" id="ljdm">

                            <form:option value="" label=""/>
                            <form:options items="${listBureau}" itemValue="value"
                                          itemLabel="content"/>

                        </form:select>
                    </td>
                    <td>车站代码：</td>
                    <td><input type="text" id="czdm"
                               class="form-control input-small" placeholder=""
                               value=""/>
                    </td>
                    <td>拼 音：</td>
                    <td><input type="text" id="pinyin"
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
                <th>#</th>
                <th>站名</th>
                <th>所属铁路局</th>
                <th>车站代码</th>
                <th>拼音</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="station" items="${list}" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${station.name }</td>
                    <td>${station.bureauName }</td>
                    <td>${station.czdm }</td>
                    <td>${station.pinyin }</td>
                    <td>
                        <a href="toUpdate.htm?czdm=${station.czdm }&backUrl=${backUrl}">修改</a>&nbsp;&nbsp;
                        <a href="javascript:delModule(${station.czdm });">删除</a>
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
            if ($("#ljdm").val() != ""){
                url += "ljdm=" + $("#ljdm").val().trim();
            }
            if ($("#name").val() != "") {
                url += "&name=" + $("#name").val().trim();
            }

            if ($("#czdm").val() != ""){
                url += "&czdm=" + $("#czdm").val().trim();
            }
            if ($("#pinyin").val() != ""){
                url += "&pinyin=" + $("#pinyin").val().trim();
            }

            window.location = encodeURI(url);
        }

        $("#btnAdd").click(function(){
            window.location = "toAdd.htm?backUrl=${backUrl}";
        });

        // 删除
        var delModule = function (czdm) {

            bootbox.confirm("你确定要删除该模块吗？", function (result) {
                if (result) {

                    window.location = "delete.htm?czdm=" + czdm + "&backUrl=${backUrl}";
                }
            })
        }


    </script>
</critc-script>
</body>

