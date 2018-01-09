<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../common/taglib.jsp" %>
<head>
    <title>备品成本</title>
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
            >备品成本
        </li>
    </ul>
</div>
<h1 class="page-title"> 备品成本
    <small>>>新增备品成本</small>
</h1>
<div class="row">
    <div class="col-md-12">
        <form role="form" id="pricePartForm" name="pricePartForm" class="form-horizontal"
              action="add.htm" method="post">
            <input type="hidden" name="backUrl" value="${backUrl }">
            <div class="form-body">
                
                <div class="form-group">
                    <label class="col-md-3 control-label">铁路局：</label>
                    <div class="col-md-9">
                         <form:select path="pricePart.ljdm"
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
                    <label class="col-md-3 control-label">客运列车类型：</label>
                    <div class="col-md-9">
                        <form:select path="pricePartSearchVO.trainTypeCode"
								class="form-control input-inline  input-xlarge" name="trainTypeCode"
								id="trainTypeCode">
								<option value="">请选择客运列车类型：</option>
								<form:options items="${listTrainType}" itemValue="value"
									itemLabel="content" />
						 </form:select>
				         <label id="trainTypeCodeTip"></label>
				         <input type="hidden" id="trainTypeName" name="trainTypeName" value=""/>
                    </div>
                </div>
                
                
                <div class="form-group">
                    <label class="col-md-3 control-label">平均年使用费用：</label>
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
        	
        	
        	$("#trainTypeCode").change(function(){
        		$("#trainTypeName").val($("#trainTypeCode option:selected").text());
        	})
        	
        	
            $("#pricePartForm").validate({
                debug: true,
                errorElement: "label",
                errorClass: "valiError",
                errorPlacement: function (error, element) {
                    error.appendTo($("#" + element.attr('id') + "Tip"));
                },
                rules: {
                	trainTypeCode: {
                        required: true,
                        maxlength: 20
                    },
                    
                    
                    ljdm: {
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