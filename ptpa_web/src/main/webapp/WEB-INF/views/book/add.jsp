<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/taglib.jsp" %>
<head>
    <title>客车账本</title>
    <link rel="stylesheet"
          href="${staticServer}/assets/autocomplete/css/jquery.autocomplete.css" />
</head>

<body>
<!-- BEGIN PAGE BAR -->
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li>
            <i class="fa fa-home"></i> <a href="${dynamicServer}/index.htm">首页</a>
        </li>
        <li>
            >客车账本
        </li>
        <li>
            >新增客车账本
        </li>
    </ul>
</div>
<h1 class="page-title"> 客车账本
    <small>>>新增</small>
</h1>
<div class="row">
    <div class="col-md-12">
        <form role="form" id="bookForm" name="cePriceForm" class="form-horizontal"
              action="" method="post">
            <input type="hidden" name="backUrl" value="${backUrl }">
            <div class="form-body">
                <div class="form-group">
                    <label class="col-md-3 control-label">车次详情：</label>
                    <div class="col-md-9">
                        <input type="hidden" vlaue="" id="trainId" name="trainId"/>
                        <input id="trainId2" maxlength="20" name="trainId2"  type="text"
                               class="form-control input-inline  input-medium"
                               placeholder=""
                               value=""> <label id="trainId2Tip"></label>

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">开始日期：</label>
                    <div class="col-md-9">
                        <input id="startDate" maxlength="10" name="startDate" type="text"
                               class="form-control input-inline  input-medium"
                               placeholder=""
                               value=""> <label id="startDateTip"></label>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-md-3 control-label">结束日期：</label>
                    <div class="col-md-9">
                        <input id="endDate" maxlength="10" name="endDate" type="text"
                               class="form-control input-inline  input-medium"
                               placeholder=""
                               value=""> <label id="endDateTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">运行规则：</label>
                    <div class="col-md-9">
                        <div class="md-radio-inline">
                            <div class="md-radio">
                                <input type="radio" id="checkbox1_8" name="intervalDays" class="md-radiobtn" value="1" checked="">
                                <label for="checkbox1_8">
                                    <span class="inc"></span>
                                    <span class="check"></span>
                                    <span class="box"></span>
                                    每天
                                </label>
                            </div>
                            <div class="md-radio">
                                <input type="radio" id="checkbox1_9" name="intervalDays" class="md-radiobtn" value="2">
                                <label for="checkbox1_9">
                                    <span class="inc"></span>
                                    <span class="check"></span>
                                    <span class="box"></span>
                                    隔天
                                </label>
                            </div>
                            <div class="md-radio">
                                <input type="radio" id="checkbox1_6" name="intervalDays" class="md-radiobtn" value="">
                                <label for="checkbox1_6">
                                    <span class="inc"></span>
                                    <span class="check"></span>
                                    <span class="box"></span>
                                    每
                                    <input class = " input-inline input-xsmall" id="intervalDays" type="text"
                                           name="intervalDays"/>
                                    天
                                </label>
                            </div>


                        </div>
                    </div>
                </div>

            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-3 col-md-9">
                        <button id="save" type="submit" class="btn btn-primary"><i class="fa fa-save"/></i> 保存</button>
                        <button type="button" class="btn default" onclick="history.back(-1)"><i class="fa fa-undo"/></i>
                            取消
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>


<div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >


        <i class="fa fa-spinner fa-spin fa-5x  " style="margin-top: 25%;margin-left: 45%" ></i>



</div>



<critc-script>
    <script
            src="${staticServer}/assets/autocomplete/js/jquery.autocomplete.js"></script>
    <script type="text/javascript">

        $(function(){

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
            $("#intervalDays").get(0).addEventListener("input",function(o){

               var str = $(this).val();
                $("input[name='intervalDays']:eq(2)").attr("checked",'checked');
                $("#checkbox1_6").val(str);
            },false);
            $("#checkbox1_9").click(function(){
                $("#intervalDays").val("");
            });
            $("#checkbox1_8").click(function(){
                $("#intervalDays").val("");
            });

            $("#save").click(function(){

            });


        });


        $(document).ready(function(){
            $.ajax({
                type:'POST',
                contentType: "application/json",
                url: "${dynamicServer}/book/getAutoComplteTrainList.htm",
                dataType: "json",
                success:function(data){
                    autocompleteFn(data);
                }
            });
        });


        function autocompleteFn(names){
            $("#trainId2").autocomplete(names,{
                minChars:0,
                max: 10,
                dataType:"json",
                autoFill: true,
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
                $("#trainId").val("");
                $("#trainId").val(data.id);
            });

        }

        $("#bookForm").validate({
            debug: true,
            errorElement: "label",
            errorClass: "valiError",
            errorPlacement: function (error, element) {
                error.appendTo($("#" + element.attr('id') + "Tip"));
            },
            rules: {
                trainId2: {
                    required: true,
                },

                startDate: {
                    required: true,

                },

                endDate: {
                    required: true,
                    checkCode:true
                },

            },
            messages: {

            },

            showErrors : function(errorMap, errorList) {

                this.defaultShowErrors();

            },
            submitHandler: function (form) {
                $('#myModal').modal({backdrop: "static", keyboard: false});
                $('#myModal').modal('show');
                var trainId = $("#trainId").val();
                var startDate = $("#startDate").val();
                var endDate = $("#endDate").val();
                var intervalDays =  $("input[type='radio']:checked").val();
                console.log($("#trainId").val()+"startDate"+ $("#startDate").val()+"endDate"+$("#endDate").val()+$("input[type='radio']:checked").val());
                $.ajax({
                    type:"get",
                    contentType: "application/json",
                    dataType:"json",
                    data:{
                        trainId:trainId,
                        startDate: startDate,
                        endDate:endDate,
                        intervalDays: intervalDays
                    },
                    url:"${dynamicServer}/book/addRule.htm",
                    success:function(data){
                        if(data.success==true){
                            $('#myModal').modal('hide');
                           window.location="${dynamicServer}/book/index.htm";
                        }

                    },
                    error:function(){
                        alert("失败");
                    }
                });

            }
        });
        jQuery.validator.addMethod("checkCode", function(value, element) {
            var startDate = $("#startDate").val();
            var endDate = $("#endDate").val();
            var start=new Date(startDate.replace("-", "/").replace("-", "/"));

            var end=new Date(endDate.replace("-", "/").replace("-", "/"));
            if(end<start){
                return false;
            }
            return true;



        }, "结束日期不能小于开始日期");




    </script>
</critc-script>

</body>
