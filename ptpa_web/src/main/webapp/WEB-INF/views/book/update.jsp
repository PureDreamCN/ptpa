<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../common/taglib.jsp" %>
<head>
    <title>客车账本</title>

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
            >修改客车账本
        </li>
    </ul>
</div>
<h1 class="page-title"> 客车账本
    <small>>>修改</small>
</h1>
<div class="row">
    <div class="col-md-12">
        <form role="form" id="bookForm" name="cePriceForm" class="form-horizontal"
              action="update.htm" method="post">
            <input name="backUrl"  type="hidden" value="${backUrl }" />
            <div class="form-body">
                <div class="form-group">
                    <label class="col-md-3 control-label">车次详情：</label>
                    <div class="col-md-9">
                        <input id="id"  name="id"  type="hidden"
                               class="form-control input-inline  input-medium"
                               placeholder=""
                               value="${book.id}" />

                        <input id="trainId" name="trainId"  type="hidden"
                               class="form-control input-inline  input-medium"
                               placeholder=""
                               value="${book.trainId}" />

                        <input id="trainId2" name="trainId2"  type="text"
                               class="form-control input-inline  input-medium"
                               placeholder=""
                               value="${book.cc}" readonly/> <label id="trainId2Tip"></label>

                    </div>
                </div>
             <div class="form-group">
                    <label class="col-md-3 control-label">开行日期：</label>
                    <div class="col-md-9">
                        <input id="startDate"  name="" type="text"
                               class="form-control input-inline  input-medium"
                               placeholder=""
                               value="<fmt:formatDate value="${book.startDate}" pattern="yyyy-MM-dd " />" readonly> <label id="startDateTip"></label>
                    </div>
                </div>


                              <div class="form-group">
                                  <label class="col-md-3 control-label">客运部票价收入：</label>
                                  <div class="col-md-9">
                                      <input id="ptTickeIncoming" maxlength="13" name="ptTickeIncoming" type="text"
                                             class="form-control input-inline  input-medium"
                                             placeholder=""
                                             value="${book.ptTickeIncoming}"> <label id="ptTickeIncomingTip"></label>
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-md-3 control-label">客运部发送人数：</label>
                                  <div class="col-md-9">
                                      <input id="ptPersonCount" maxlength="9" name="ptPersonCount" type="text"
                                             class="form-control input-inline  input-medium"
                                             placeholder=""
                                             value="${book.ptPersonCount}"> <label id="ptPersonCountTip"></label>
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-md-3 control-label">发改部票价收入：</label>
                                  <div class="col-md-9">
                                      <input id="drTickeIncoming" maxlength="13" name="drTickeIncoming" type="text"
                                             class="form-control input-inline  input-medium"
                                             placeholder=""
                                             value="${book.drTickeIncoming}"> <label id="drTickeIncomingTip"></label>
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-md-3 control-label">发改部发送人数：</label>
                                  <div class="col-md-9">
                                      <input id="drPersonCount" maxlength="9" name="drPersonCount" type="text"
                                             class="form-control input-inline  input-medium"
                                             placeholder=""
                                             value="${book.drPersonCount}"> <label id="drPersonCountTip"></label>
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-md-3 control-label">客运部车站服务成本：</label>
                                  <div class="col-md-9">
                                      <input id="ptStationServiceCost"  name="ptStationServiceCost" type="text"
                                             class="form-control input-inline  input-medium"
                                             placeholder=""
                                             value="${book.ptStationServiceCost}" readonly> <label id="ptStationServiceCostTip"></label>
                                  </div>
                              </div>
                              <div class="form-group">
                                  <label class="col-md-3 control-label">客运部售票服务成本：</label>
                                  <div class="col-md-9">
                                      <input id="ptTicketServiceCost"  name="ptTicketServiceCost" type="text"
                                             class="form-control input-inline  input-medium"
                                             placeholder=""
                                             value="${book.ptTicketServiceCost}" readonly> <label id="ptTicketServiceCostTip"></label>
                                  </div>
                              </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">发改部车站服务成本：</label>
                                    <div class="col-md-9">
                                        <input id="drStationServiceCost"  name="drStationServiceCost" type="text"
                                               class="form-control input-inline  input-medium"
                                               placeholder=""
                                               value="${book.drStationServiceCost}" readonly> <label id="drStationServiceCostTip"></label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">发改部售票服务成本：</label>
                                    <div class="col-md-9">
                                        <input id="drTicketServiceCost"  name="drTicketServiceCost" type="text"
                                               class="form-control input-inline  input-medium"
                                               placeholder=""
                                               value="${book.drTicketServiceCost}" readonly> <label id="drTicketServiceCostTip"></label>
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





<critc-script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#bookForm").validate({
                debug: true,
                errorElement: "label",
                errorClass: "valiError",
                errorPlacement: function (error, element) {
                    error.appendTo($("#" + element.attr('id') + "Tip"));
                },
                rules: {
                    ptTickeIncoming:{
                       // required: true,
                        number: true,
                        maxlength: 13
                    },
                    ptPersonCount: {
                      //  required: true,
                        number: true,
                        maxlength: 9
                    },
                    drTickeIncoming: {
                       // required: true,
                        number: true,
                        maxlength: 13
                    },
                    drPersonCount: {
                     //   required: true,
                        number: true,
                        maxlength: 9
                    }

                },
                messages: {},
                submitHandler: function (form) {
                    form.submit();
                }
            });
        });

        //客运部售票服务成本
        $("#ptTickeIncoming").get(0).addEventListener("input",function(o){

            var str = $(this).val();

            if(str!=""&&str==str.replace(/[^\d.]/g,'')){
                $.ajax({
                    type:"get",
                    url:"${dynamicServer}/book/calculateTicketAgentfee.htm",
                    dataType:"json",
                    data:{price:str},
                    success:function(data){
                        $("#ptTicketServiceCost").val(data);
                    }

                });
            }else{
                $("#ptTickeIncoming").val("");
                $("#ptTicketServiceCost").val("");
            }


        },false);
        //发改部售票服务成本
        $("#drTickeIncoming").get(0).addEventListener("input",function(o){

            var str = $(this).val();
            if(str!=""&&str==str.replace(/[^\d.]/g,'')){
                $.ajax({
                    type:"get",
                    url:"${dynamicServer}/book/calculateTicketAgentfee.htm",
                    dataType:"json",
                    data:{price:str},
                    success:function(data){
                        $("#drTicketServiceCost").val(data);
                    }

                });
            }else {
                $("#drTickeIncoming").val("");
                $("#drTicketServiceCost").val("");
            }


        },false);

        //客运部车站服务成本
        $("#ptPersonCount").get(0).addEventListener("input",function(o){

            var str = $(this).val();
            var id = $("#trainId").val();
            if(str!=""&&str==str.replace(/[^\d.]/g,'')){
                $.ajax({
                    type:"get",
                    url:"${dynamicServer}/book/calculateStationService.htm",
                    dataType:"json",
                    data:{id:id,count:str},
                    success:function(data){
                        $("#ptStationServiceCost").val(data);
                    }

                });
            }else{
                $("#ptPersonCount").val("");
                $("#ptStationServiceCost").val("");
            }


        },false);
        //发改部车站服务成本
        $("#drPersonCount").get(0).addEventListener("input",function(o){

            var str = $(this).val();
            var id = $("#trainId").val();
            if(str!=""&&str==str.replace(/[^\d.]/g,'')){
                $.ajax({
                    type:"get",
                    url:"${dynamicServer}/book/calculateStationService.htm",
                    dataType:"json",
                    data:{id:id,count:str},
                    success:function(data){
                        $("#drStationServiceCost").val(data);
                    }

                });
            }else {
                $("#drPersonCount").val("");
                $("#drStationServiceCost").val("");
            }


        },false);
    </script>
</critc-script>

</body>
