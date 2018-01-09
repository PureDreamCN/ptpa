<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>机辆部车底交路编组车辆</title>
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
            >机辆部车底交路编组车辆
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
                        <button class="btn btn-primary" id="btnRefresh">
                            <i class="ace-icon fa fa-search"></i> 刷新
                        </button>
                    </td>
                    
                     <td>
                        <button class="btn btn-primary" id="btnReback">
                            <i class="ace-icon fa fa-search"></i> 返回
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
                <th width=160>车底交路ID</th>
                <th width="120">车型编码</th>
                <th width="120">车型名称</th>
                <th width="120">车种编码</th>
                <th width="160">车种名称</th>
                <th width="160">定员</th>
                <th width="120">排序</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list }" var="lvcdjl" varStatus="st">
                <tr>
                    <td>${st.index+1 }</td>
                    <td>${lvcdjl.cdjlId }</td>
                    <td>${lvcdjl.cxCode }</td>
                    <td>${lvcdjl.cxName }</td>
                    <td>${lvcdjl.czCode }</td>
                    <td>${lvcdjl.czName }</td>
                    <td>${lvcdjl.capacity }</td>
                    <td>${lvcdjl.orderIndex }</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<critc-script>
	<script type="text/javascript">
		 $(function () {
	         $("#btnRefresh").bind('click', refreshLvcdjlcl);
	         $("#btnReback").bind("click",rebackLvcdjlcl);
	     })
	     
	     // 查询方法
         var refreshLvcdjlcl = function () {
			 var id = "${list[0].cdjlId}";
             var url = "toDetail.htm?id="+id;
             window.location = encodeURI(url);
         }
		 
		 var rebackLvcdjlcl = function(){
			 var trainTypeCode = "${trainTypeCode}";
			 var pageIndex = "${pageIndex}";
			 var url = "index.htm?trainTypeCode="+trainTypeCode;
			 if(pageIndex!= "0"){
				 url+= "&pageIndex="+pageIndex;
			 } 
			 
			 window.location = encodeURI(url);
		 }
		 
	
	</script>
</critc-script>
</body>
</body>