<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>服务清算单价</title>
</head>

<body>
<!-- BEGIN PAGE BAR -->
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >清算单价
        </li>
        <li>
            >服务清算单价
        </li>
    </ul>
</div>
<h1 class="page-title"> 服务清算单价
    <small>>>新增服务清算单价</small>
</h1>
<div class="row">
    <div class="col-md-12">
        <form role="form" id="priceServiceForm" name="priceServiceForm" class="form-horizontal"
              action="add.htm" method="post">
            <input type="hidden" name="backUrl" value="${backUrl }">
            <div class="form-body">
                <div class="form-group">
                    <label class="col-md-3 control-label">服务类型：</label>
                    <div class="col-md-9">
                        <form:select path="priceService.serviceCode"
								class="form-control input-inline  input-xlarge" name="serviceCode"
								id="serviceCode">
								<option value="">请选择服务类型</option>
								<form:options items="${listService}" itemValue="value"
									itemLabel="content" />
				         </form:select>
				         <label id="serviceCodeTip"></label>
				         <input type="hidden" id="serviceName" name="serviceName" value=""/>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-md-3 control-label">铁路局：</label>
                    <div class="col-md-9">
                        <form:select path="priceService.ljdm"
								class="form-control input-inline  input-xlarge" name="ljdm"
								id="ljdm">
								<option value="">请选择铁路局</option>
								<form:options items="${listBureau}" itemValue="value"
									itemLabel="content" />
				         </form:select>
				         <label id="ljdmTip"></label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-md-3 control-label">服务计量单位：</label>
                    <div class="col-md-9">
                        <input id="unit" maxlength="20" name="unit" type="text" class="form-control input-inline  input-xlarge"
                               placeholder=""
                               value=""> <label id="unitTip"></label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-md-3 control-label">清算单价：</label>
                    <div class="col-md-9">
                         <input id="price" maxlength="13" name="price" type="text" class="form-control input-inline  input-xlarge"
                               placeholder=""
                               value=""> <label id="priceTip"></label>
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-3 col-md-9">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-save"/></i> 保存</button>
                        <button type="button" class="btn default" onclick="history.back(-1)"><i class="fa fa-undo"/></i>
                                                              取消
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<critc-script>
    <script type="text/javascript"> 
    
       
        $(document).ready(function () {
        	
        	
        	$("#serviceCode").change(function(){
        		$("#serviceName").val($("#serviceCode option:selected").text());
        	})
        	
            $("#priceServiceForm").validate({
                debug: true,
                errorElement: "label",
                errorClass: "valiError",
                errorPlacement: function (error, element) {
                    error.appendTo($("#" + element.attr('id') + "Tip"));
                },
                rules: {
                	serviceCode: {
                        required: true,
                        maxlength: 20
                    },
                    
                    ljdm: {
                        required: true,
                        maxlength:20
                    },
                     
                    unit: {
                        required: true,
                        maxlength:20
                    },
                    price: {
                        required: true,
                        number:true,
                        maxlength: 13,
                       
                    }
                    
                },
                messages: {
                },
                submitHandler: function (form) {
                    form.submit();
                }
            });
        });

    </script>
</critc-script>

</body>