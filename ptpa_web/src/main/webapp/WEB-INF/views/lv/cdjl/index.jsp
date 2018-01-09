<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title> 机辆部车底交路</title>
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
            > 机辆部车底交路
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
                    <td>车底交路车次：</td>
                    <td><input type="text" id="cc" class="form-control input-middle"
                               placeholder=""
                               value="${lvCdjlSearchVO.cc }"></td>
                     <td>
                        <button class="btn btn-primary" id="btnSearch">
                            <i class="ace-icon fa fa-search"></i> 查询
                        </button>
                        <button class="btn btn-primary" id="btnRefresh">
                            <i class="ace-icon fa fa-search"></i> 刷新
                        </button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div>
 	<div class="portlet-body">
      <div class="tabbable-custom nav-justified">
         <ul class="nav nav-tabs">
          <li class="in active" id="1">		
              <a href="#tab_1" data-toggle="tab">高速动车组列车	</a>
          </li>
          <li class="" id="2">
              <a href="#tab_2" data-toggle="tab">新型空调列车列车</a>
          </li>
          
          <li class="" id="3">
              <a href="#tab_3" data-toggle="tab"> 普通列车</a>
          </li>  
        </ul>
        <div class="tab-content">  
         	 <div class="tab-pane active" id="tab_1">
				<div class="row">
				    <div class="col-md-12">
				        <table id="simple-table" class="table table-striped table-bordered table-hover">
				            <thead>
				            <tr>
				                <th width=40>#</th>
				                <th width=140>车底交路名称</th>
				                <th width="120">车底交路车次</th>
				                <th width="120">配属局</th>
				                <th width="140">交路运行区段</th>
				                <th width="180">客运列车类型代码</th>
				                <th width="160">客运列车类型名称</th>
				                <th width="160">交路总里程</th>
				                <th width="100">车底组数</th>
				                <th width="80">编组</th>
				                   
				            </tr>
				            </thead>
				            <tbody id="tbody_1">
				            <c:forEach items="${list }" var="lvcdjl" varStatus="st">
				                <tr>
				                    <td>${st.index+1 }</td>
				                    <td>${lvcdjl.name }</td>
				                    <td>${lvcdjl.cc }</td>	
				                    <td>${lvcdjl.shortName }</td>
				                    <td>${lvcdjl.line }</td>
				                    <td>${lvcdjl.trainTypeCode }</td>
				                    <td>${lvcdjl.trainTypeName }</td>
				                    <td>${lvcdjl.mileage }</td>
				                    <td>${lvcdjl.groupCount }</td>
				                    <td>
				                        <c:if test="${critc:isP('LvcdjlclDetail')}">
                         				     <a href="toDetail.htm?id=${lvcdjl.id }&backUrl=${backUrl}&trainTypeCode=${lvcdjl.trainTypeCode}">编组</a>
                         		       </c:if>
                                   </td>
				                </tr>
				            </c:forEach>
				            </tbody>
				        </table>
				    </div>
				  </div>
         	 </div>
         	 <div class="tab-pane" id="tab_2">
				<div class="row">
				    <div class="col-md-12">
				        <table id="simple-table" class="table table-striped table-bordered table-hover">
				            <thead>
				            <tr>
				                <th width=40>#</th>
				                <th width=140>车底交路名称</th>
				                <th width="120">车底交路车次</th>
				                <th width="120">配属局</th>
				                <th width="140">交路运行区段</th>
				                <th width="180">客运列车类型代码</th>
				                <th width="160">客运列车类型名称</th>
				                <th width="160">交路总里程</th>
				                <th width="100">车底组数</th>
				                <th width="80">编组</th>
				                   
				            </tr>
				            </thead>
				            <tbody id="tbody_2">
				            	<c:forEach items="${list }" var="lvcdjl" varStatus="st">
					                <tr>
					                    <td>${st.index+1 }</td>
					                    <td>${lvcdjl.name }</td>
					                    <td>${lvcdjl.cc }</td>
					                    <td>${lvcdjl.shortName }</td>
					                    <td>${lvcdjl.line }</td>
					                    <td>${lvcdjl.trainTypeCode }</td>
					                    <td>${lvcdjl.trainTypeName }</td>
					                    <td>${lvcdjl.mileage }</td>
					                    <td>${lvcdjl.groupCount }</td>
					                    <td>
				                        <c:if test="${critc:isP('LvcdjlclDetail')}">
                         				     <a href="toDetail.htm?id=${lvcdjl.id }&backUrl=${backUrl}&trainTypeCode=${lvcdjl.trainTypeCode}">编组</a>
                         		       </c:if>
                                   </td>
					                </tr>
				               </c:forEach>
				            </tbody>
				        </table>
				    </div>
				  </div>
         	 </div>
         	 
         	 <div class="tab-pane" id="tab_3">
				<div class="row">
				    <div class="col-md-12">
				        <table id="simple-table" class="table table-striped table-bordered table-hover">
				            <thead>
				           <tr>
				                <th width=40>#</th>
				                <th width=140>车底交路名称</th>
				                <th width="120">车底交路车次</th>
				                <th width="120">配属局</th>
				                <th width="140">交路运行区段</th>
				                <th width="180">客运列车类型代码</th>
				                <th width="160">客运列车类型名称</th>
				                <th width="160">交路总里程</th>
				                <th width="100">车底组数</th>
				                <th width="80">编组</th>
				            </tr>
				            </thead>
				            <tbody id="tbody_3">
				            	<c:forEach items="${list }" var="lvcdjl" varStatus="st">
					                <tr>
					                    <td>${st.index+1 }</td>
					                    <td>${lvcdjl.name }</td>
					                    <td>${lvcdjl.cc }</td>
					                    <td>${lvcdjl.shortName }</td>
					                    <td>${lvcdjl.line }</td>
					                    <td>${lvcdjl.trainTypeCode }</td>
					                    <td>${lvcdjl.trainTypeName }</td>
					                    <td>${lvcdjl.mileage }</td>
					                    <td>${lvcdjl.groupCount }</td>
					                    <td>
				                        <c:if test="${critc:isP('LvcdjlclDetail')}">
                         				    <a href="toDetail.htm?id=${lvcdjl.id }&backUrl=${backUrl}&trainTypeCode=${lvcdjl.trainTypeCode}">编组</a>
                         		       </c:if>
                                      </td>
					                </tr>
				               </c:forEach>
				            </tbody>
				        </table>
				    </div>
				  </div>
         	 </div>
        </div>
       </div>
     </div>
	 <div class="row">
	    <div class="col-xs-12">${ pageNavigate.pageModel}</div>
	 </div>
</div>

<critc-script>
	<script type="text/javascript">
		 $(function () {
	         $("#btnSearch").bind('click', searchLvcdjl);
	         $("#btnRefresh").bind('click',btnRefresh);
	         init();
	     })
	     
	     var init = function(){
			 var tab = "${trainTypeCode}";
	         if(tab!="1" && tab!='' && tab!='null'){
	        	 $("#"+tab).addClass("in active");
	    		 $("#1").removeClass("in active");
	    		 $("#tab_"+tab).addClass("in active");
	    		 $("#tab_1").removeClass("in active");
	         }
		 }
	     
	     // 查询方法
         var searchLvcdjl = function () {
			//用于判断当前选中的tab页
			 var trainTypeCode = tabActive();
             var url = "index.htm?";
             if ($("#cc").val() != ''){
                url += "cc=" + $("#cc").val();
             }
             
             if(trainTypeCode!=''){
            	 url +="&trainTypeCode=" + trainTypeCode;
             }
             
             window.location = encodeURI(url);
             
         }
	     
	     
	     //刷新页面
         var btnRefresh = function () {
              var url = "index.htm?";
              window.location = encodeURI(url);
         }
	     
	     //切换tab时加载数据
	     $("li").click(function(){
	    	 
	    		 var trainTypeCode = $(this).attr("id");
	             var url = "index.htm?";
	             if(trainTypeCode!='switchBtn' && typeof(trainTypeCode)!='undefined'){
	            	 url +="trainTypeCode=" + trainTypeCode;
	            	 window.location = encodeURI(url);
	             }else {
	            	 trainTypeCode = tabActive();
	            	 var href = $(this).find("a").attr("href");
	            	 if(href.indexOf("http")>-1){
	            		 $(this).find("a").attr("href",href+ "&trainTypeCode=" + trainTypeCode);
	            	 }
	             }
	           
	    	 
	     })
	     
	     
		 var tabActive = function (){
	         return $("div[class=page-container]").find("li[class^=in]").attr("id");;
		 }
		 
	
	</script>
</critc-script>
</body>