<%--
  Created by IntelliJ IDEA.
  User: guofei
  Date: 2017/11/28
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="../../common/taglib.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; utf-8">
    <title>新增</title>

</head>
<body>
<div class="page-bar">
    <ul class="page-breadcrumb">
        <li><i class="fa fa-home"></i> <a
                href="${dynamicServer}/index.htm">首页</a></li>
        <li>>客车统计新增</li>

    </ul>
</div>
<h1 class="page-title">
    客车统计 <small>>>新增客车统计</small>
</h1>
<div class="row">
    <div class="col-md-8">
        <form role="form" id="resouceForm" name="resouceForm"
              class="form-horizontal" action="add.htm" method="post">
            <div class="form-body">


                <div class="form-group">
                    <label class="col-md-3 control-label">上报车次：</label>
                    <div class="col-md-9">
                        <input id="cc" name="cc" type="text"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="20"> <label id=""></label>
                    </div>

                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">列车当局：</label>
                    <div class="col-md-9">
                        <input id="ddjmc" type="text" name="ddjmc"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="40"><label id="codeTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">区段代码：</label>
                    <div class="col-md-9">
                        <input id="lineCode" type="text" name="lineCode"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="200"><label id="urlTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">区段起讫点：</label>
                    <div class="col-md-9">
                        <input id="beginEnd" type="text" name="beginEnd"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="200"><label id="urlTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">区段里程：</label>
                    <div class="col-md-9">
                        <input id="mileage" type="text" name="mileage"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="200"><label id="urlTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">线路名：</label>
                    <div class="col-md-9">
                        <input id="railwayName" type="text" name="railwayName"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="200"><label id="urlTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">线路等级：</label>
                    <div class="col-md-9">
                        <input id="railwayLevel" type="text" name="railwayLevel"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="200"><label id="urlTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">线路所属局名：</label>
                    <div class="col-md-9">
                        <input id="railwaySsjmc" type="text" name="railwaySsjmc"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="200"><label id="urlTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">机车种类：</label>
                    <div class="col-md-9">
                       <input id="locomotiveType" type="text" name="locomotiveType"
                           class="form-control input-inline  input-xlarge" placeholder=""
                           value="" maxlength="200"><label id="urlTip"></label>
                      </div>
                  </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">机车配属局：</label>
                    <div class="col-md-9">
                        <input id="locomotivePsjmc" type="text" name="locomotivePsjmc"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="200"><label id="urlTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">列车公里：</label>
                    <div class="col-md-9">
                        <input id="trainMileage" type="text" name="trainMileage"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="200"><label id="urlTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">客车车辆公里合计：</label>
                    <div class="col-md-9">
                        <input id="trainVehicleMileageSum" type="text" name="trainVehicleMileageSum"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="200"><label id="urlTip"></label>
                    </div>
                </div>


            </div>

            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-3 col-md-9">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa fa-save" /></i> 保存
                        </button>
                        <button type="button" class="btn default"
                                onclick="history.back(-1)">
                            <i class="fa fa-undo" /></i> 取消
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<critc-script>

    <script type="text/javascript">

    </script>
</critc-script>

</body>
</html>
