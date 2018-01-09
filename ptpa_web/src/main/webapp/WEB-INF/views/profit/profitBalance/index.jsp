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
            >客车相关
        </li>
        <li>
            >客车车次详情
        </li>
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
                    <td>&nbsp;</td>
                    <td>车次：</td>
                   <input type="hidden" vlaue="${bookSearchVO.trainId}" id="trainId2" name="trainId2"/>
                    <td><input type="text" id="trainId" name="trainId"
                               class="form-control input-small" placeholder=""
                               value="${bookSearchVO.cc}" onkeyup="toUpperCase(this)"  autocomplete="off"/></td><td>&nbsp;</td>
                    <td>开行日期</td>
                    <td> <input id="startDate" maxlength="10" name="startDate" type="text"
                                class="form-control input-inline  input-small"
                                placeholder=""
                                value="${bookSearchVO.startDate}"> <label id="startDateTip"></label></td>
                    <td>结束日期</td>
                    <td> <input id="endDate" maxlength="10" name="endDate" type="text"
                                class="form-control input-inline  input-small"
                                placeholder=""
                                value="${bookSearchVO.endDate}"> <label id="endDateTip"></label></td>
                    <td>
                        <button class="btn btn-primary" id="btnSearch">
                            <i class="ace-icon fa fa-search"></i> 查询
                        </button>
                        <button class="btn btn-file" id="btnSearch2">
                            <i class="ace-icon fa fa-search"></i> 平均值查询
                        </button>
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
                <th>序号</th>
                <th>车次详情</th>
                <th width="100px">开行日期</th>
                <th>客运部票价收入</th>
                <th>客运部发送人数</th>
                <th>发改部票价收入</th>
                <th>发改部发送人数</th>
                <th>客运部车站服务成本</th>
                <th>客运部售票服务成本</th>
                <th>发改部车站服务成本</th>
                <th>发改部售票服务成本</th>
                <th width="100px">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="book" items="${list}" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${book.cc }-${book.name }</td>
                    <td><fmt:formatDate value="${book.startDate}" pattern="yyyy-MM-dd " /></td>
                    <td>${book.ptTickeIncoming }</td>
                    <td>${book.ptPersonCount }</td>
                    <td>${book.drTickeIncoming }</td>
                    <td>${book.drPersonCount }</td>
                    <td>${book.ptTicketServiceCost }</td>
                    <td>${book.ptStationServiceCost }</td>
                    <td>${book.drTicketServiceCost }</td>
                    <td>${book.drStationServiceCost }</td>

                    <td>
                        <a  onclick="toUpdate(${book.id},${book.trainId})">盈利平衡</a><br/>
                        <a  onclick="showDetail(${book.trainId})">详情</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="row">
    <div class="col-xs-12">${ pageNavigate.pageModel}</div>
</div>
</body>
<critc-script>
    <script
            src="${staticServer}/assets/autocomplete/js/jquery.autocomplete.js"></script>
    <script type="text/javascript">

        function toUpperCase(obj){
            obj.value=  obj.value.toUpperCase();
        }
        $(function () {
            $("#btnSearch").bind("click",searchUser);
            $("#btnSearch2").bind("click",searchUser2);
            $('#startDate').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'Y-m-d'
            });
            $('#endDate').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'Y-m-d'
            });
        });
        // 查询方法
        var searchUser = function () {
            var url = "/profit/balance.htm?";
            if ($("#trainId").val() != ''){
                url += "cc=" + $("#trainId").val();
            }
            if ($("#trainId2").val() != ''){
                url += "&trainId=" + $("#trainId2").val();
            }
            if($("#startDate").val() !=''){
                url += "&startDate=" + $("#startDate").val();
            }
            if($("#endDate").val() !=''){
                url += "&endDate=" + $("#endDate").val();
            }

            window.location = encodeURI(url);
        }

        var searchUser2 = function () {
            var url = "/profit/toAvgProfit.htm?backUrl=${backUrl}";
           /* if ($("#trainId").val() != ''){
                url += "cc=" + $("#trainId").val();
            }
            if ($("#trainId2").val() != ''){
                url += "&trainId=" + $("#trainId2").val();
            }
            if($("#startDate").val() !=''){
                url += "&startDate=" + $("#startDate").val();
            }
            if($("#endDate").val() !=''){
                url += "&endDate=" + $("#endDate").val();
            }
            if($("#startDate").val()==""||$("#endDate").val()==""){
                bootbox.alert("请填写开始日期或结束日期");
            }*/


            window.location = encodeURI(url);
        }
        //开始函数
        $(document).ready(function(){
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
            $("#trainId").autocomplete(data,{
                minChars:0,
                max: 10,
                dataType:"json",
                autoFill: false,
                mustMatch: false,
                matchContains: true,
                scrollHeight: 220,
                formatItem: function(data, i, total) {
                    return "<font style='color:black;font-size:14px'>"+data.cc+"</font><font style='color:black;font-size:14px;float:right'>"+data.name+"</font>";
                },
                formatMatch: function(data, i, total) {
                    return data.cc;
                },
                formatResult: function(data) {
                    return data.cc;
                }
            }).result(function(event, data, formatted){
                //此处当填充文本框后，会将VALUE填充到我的input隐藏域中
                $("#trainId2").val("");
                $("#trainId2").val(data.id);
            });
        }
        function showDetail(id) {
            var url = "${staticServer}/train/showdetail.htm?id="+id;
            window.location.href=url;
        }
        $(function () {
            $("#btnAdd").bind("click",btnAdd);
        });
        // 新增
        var btnAdd = function () {
            window.location = encodeURI("toAdd.htm");
        }
        var toUpdate = function (id,trainId) {
            window.location = encodeURI("profitDetail.htm?id="+id+"&trainId="+trainId);
        }
    </script>
</critc-script>