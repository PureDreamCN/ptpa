<%--
  Created by IntelliJ IDEA.
  User: sunchao
  Date: 2017/12/8
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="../common/taglib.jsp" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; utf-8">
    <title>客车账本</title>
    <link rel="stylesheet"
          href="${staticServer}/assets/autocomplete/css/jquery.autocomplete.css" />
</head>

<div class="page-bar">
    <ul class="page-breadcrumb">
        <li><i class="fa fa-home"></i> <a
                href="${dynamicServer}/index.htm">首页</a></li>
        <li>>客车账本</li>

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
        <div class="row">
            <div class="col-md-4">
                <input type="hidden" vlaue="${bookSearchVO.trainId}" id="trainId" name="trainId"/>
                <label  class=" control-label">车次:</label>
                <input type="text" id="cc" name="cc"
                class="form-control  input-inline input-small" placeholder=""
                value="${bookSearchVO.cc}" onkeyup="toUpperCase(this)"  />

            </div>
            <div class="col-md-5">
                <label for="startDate" class=" control-label">开行日期:</label>

                <input id="startDate" maxlength="10" name="startDate" type="text"
                       class=" form-control input-inline  input-small "
                       placeholder="开始日期"
                       value="${bookSearchVO.startDate}"><label id="startDateTip"></label>
                <input id="endDate" maxlength="10" name="endDate" type="text"
                       class="form-control input-inline  input-small "
                       placeholder="结束日期"
                       value="${bookSearchVO.endDate}"><label id="endDateTip"></label>
            </div>
            <div class="col-md-3">
                <button class="btn btn-primary" id="btnSearch">
                    <i class="ace-icon fa fa-search"></i> 查询
                </button>
                <%-- <c:if test="${critc:isP('SysResourceAdd')}">--%>
                <button type="button" class="btn btn-success" id="btnAdd">
                    <i class=" fa fa-plus bigger-110"></i> 新增
                </button>
                <%-- </c:if>--%>
            </div>
        </div>

    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <table id="treeTable" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>序号</th>
                <th>车次详情</th>
                <th whith="100px">开行日期</th>
                <th>客运部票价收入</th>
                <th>客运部发送人数</th>
                <th>发改部票价收入</th>
                <th>发改部发送人数</th>
                <th>客运部车站服务成本</th>
                <th>客运部售票服务成本</th>
                <th>发改部车站服务成本</th>
                <th>发改部售票服务成本</th>
                <th width="">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="book" items="${list}" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${book.cc }</td>
                    <td><fmt:formatDate value="${book.startDate}" pattern="yyyy-MM-dd "/></td>
                    <td><fmt:formatNumber value="${book.ptTickeIncoming}" type="currency"/></td>
                    <td>${book.ptPersonCount }</td>
                    <td><fmt:formatNumber value="${book.drTickeIncoming}" type="currency"/></td>
                    <td>${book.drPersonCount }</td>
                    <td><fmt:formatNumber value="${book.ptTicketServiceCost}" type="currency"/></td>
                    <td><fmt:formatNumber value="${book.ptStationServiceCost}" type="currency"/></td>
                    <td><fmt:formatNumber value="${book.drTicketServiceCost}" type="currency"/></td>
                    <td><fmt:formatNumber value="${book.drStationServiceCost}" type="currency"/></td>
                    <td>
                        <a href="toUpdate.htm?id=${book.id}&backUrl=${backUrl}">修改</a>&nbsp;&nbsp;
                        <a href="javascript:delModule(${book.id});">删除</a>
                        <a  onclick="showDetail(${book.trainId})">详情</a>
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
    <script
            src="${staticServer}/assets/autocomplete/js/jquery.autocomplete.js"></script>
    <script type="text/javascript">
        function toUpperCase(obj){
            obj.value=  obj.value.toUpperCase();
        }
        $(function () {
            $("#btnSearch").bind('click', search);
            $('#startDate').datetimepicker({
                lang: 'ch',
                timepicker: false,
                allowBlank: true,
                format: 'Y-m-d'
            });
            $('#endDate').datetimepicker({
                lang: 'ch',
                timepicker: false,
                allowBlank: true,
                format: 'Y-m-d'
            });
        })
        $("#btnAdd").click(function () {
            window.location = "toAdd.htm";
        });
        $(document).ready(function(){
            //加载车次list
            $.ajax({
                type:'POST',
                contentType: "application/json",
                url: "${staticServer}/train/getCcList.htm",
                dataType: "json",
                success:function(data){
                    autocompleteFn(data);
                }
            });
        });
        //自动 补全方法
        function autocompleteFn(data){
            $("#cc").autocomplete(data,{
                minChars:0,
                max: 10,
                dataType:"json",
                autoFill: false,
                mustMatch: false,
                matchContains: true,
                scrollHeight: 220,
                formatItem: function(data, i, total) {

                    return   "<font style='color:black;font-size:20px'>"+data.cc+"</font><font style='color:black;font-size:14px;float:right'>"+data.name+"</font>";
                },
                formatMatch: function(data, i, total) {
                    return data.cc;
                },
                formatResult: function(data) {
                    return data.cc;
                }
            }).result(function(event, data, formatted){
                //此处当填充文本框后，会将VALUE填充到我的input隐藏域中
                $("#trainId").val("");
                $("#trainId").val(data.id);
            });
        }

        var search = function () {
            var url = "/profit/balance.htm?";
            //如果直接在input框中输入车次传cc
            if ($("#cc").val() != ''){
                url += "cc=" + $("#cc").val();
            }
            //如果选择了车次传trainId车次id
            if ($("#trainId").val() != ''){
                url += "&trainId=" + $("#trainId").val();
            }
            if($("#startDate").val() !=''){
                url += "&startDate=" + $("#startDate").val();
            }
            if($("#endDate").val() !=''){
                url += "&endDate=" + $("#endDate").val();
            }
            window.location = encodeURI(url);
        }
        var delModule = function(id){
            bootbox.confirm("你确定要删除该条数据吗？", function (result) {
                if (result) {
                    window.location = "delete.htm?id=" + id + "&backUrl=${backUrl}";
                }
            })
        }
        function showDetail(id) {
            var url = "${staticServer}/train/showdetail.htm?id="+id;
            window.location.href=url;
        }

    </script>
</critc-script>
</body>
</html>
