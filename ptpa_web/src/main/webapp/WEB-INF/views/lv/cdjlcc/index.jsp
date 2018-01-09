<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>机辆部车底交路车次</title>
</head>

<body>
 <div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >车底交路
        </li>
        <li>
            > 机辆部车底交路车次
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
                    <td>
                        <button class="btn btn-primary" id="btnSearch">
                            <i class="ace-icon fa fa-search"></i> 刷新
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
                <th width=40>#</th>
                <th width=160>车次</th>
                <th width=160>车底交路ID</th>
                <th width=160>车次里程</th>
                <th width="160">运行区段</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list }" var="lvcdjlcc" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${lvcdjlcc.cc }</td>
                    <td>${lvcdjlcc.cdjlId }</td>
                    <td>${lvcdjlcc.mileage }</td>
                    <td>${lvcdjlcc.startEnd }</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">${ pageNavigate.pageModel}</div>
</div>

<critc-script>
	<script type="text/javascript">
		 $(function () {
	         $("#btnSearch").bind('click', searchLvcdjlcc);
	     })
	     
	     
	     // 查询方法
         var searchLvcdjlcc = function () {
             var url = "index.htm?";
             window.location = encodeURI(url);
         }
	
	</script>
</critc-script>
</body>