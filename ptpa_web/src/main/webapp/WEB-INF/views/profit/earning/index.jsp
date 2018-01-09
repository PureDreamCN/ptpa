<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../../common/taglib.jsp" %>
<head>
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
            >盈利额测算
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
                    <td><input type="text" id="cc" name="cc"
                               class="form-control input-small" placeholder=""
                               value="${trainSearchVO.cc }" /></td><td>&nbsp;</td>
                    <td>
                        <button class="btn btn-primary" id="btnSearch">
                            <i class="ace-icon fa fa-search"></i> 查询
                        </button>
                    </td>
                   
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <table id="simple-table" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th width=20>#</th>
                <th width="85">车次详情名称</th>
                <th width="40">车次</th>
                <th width="70">列车类型</th>
                <th width="70">列车等级</th>
                <th width="50">车底数</th>
                <th width="60">担当局</th>
                <th width="60">始发站</th>
                <th width="60">终到站</th>
                <th width="70">上次修改人</th>
                <th width="80">上次修改时间</th>
                <th width="110">操作</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${list }" var="train" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${train.name }</td>
                    <td>${train.cc }</td>
                    <td>${train.trainTypeName }</td>
                    <td>${train.trainLevelName }</td>
                    <td>${train.vehicleGroupSize }</td>
                    <td>${train.ljdm}</td>
                    <td>${train.beginCzdm }</td>
                    <td>${train.endCzdm }</td>
                    <td>${train.lastModifiedBy }</td>
                    <td>${train.lastModifiedAt }</td>
                    <td><a  onclick="profitEarning(${train.id})">盈利额测算</a>
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
        $(function () {
            $("#btnSearch").bind("click",searchUser);
        });
        // 查询方法
        var searchUser = function () {
                var url = "index.htm?";
                if ($("#cc").val() != '')
                    url += "cc=" + $("#cc").val();
                window.location = encodeURI(url);
        }

        //开始函数
        $(document).ready(function(){
            $.ajax({
                type:'POST',
                contentType: "application/json",
                url: "getCcList.htm",
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
                autoFill: true,
                mustMatch: false,
                matchContains: true,
                scrollHeight: 220,
                formatItem: function(data, i, total) {
                    return "<font style='color:black;font-size:14px'>"+data.cc+"</font>";
                },
                formatMatch: function(data, i, total) {
                    return data.cc;
                },
                formatResult: function(data) {
                    return data.cc;
                }
            });
        }
        function profitEarning(id) {
            var url = "toCalculate.htm?id="+id;
            window.location.href=url;
        }
       
       
    </script>
</critc-script>