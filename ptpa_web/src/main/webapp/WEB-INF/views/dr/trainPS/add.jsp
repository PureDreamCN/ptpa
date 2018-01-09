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
        <li>>旅客统计新增</li>

    </ul>
</div>
<h1 class="page-title">
    旅客统计 <small>>>新增旅客统计</small>
</h1>
<div class="row">
    <div class="col-md-8">
        <form role="form" id="resouceForm" name="resouceForm"
              class="form-horizontal" action="add.htm" method="post">
            <div class="form-body">


                <div class="form-group">
                    <label class="col-md-3 control-label">交路号：</label>
                    <div class="col-md-9">
                        <input id="jlCode" name="jlCode" type="text"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="20"> <label id=""></label>
                    </div>

                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">日期：</label>
                    <div class="col-md-9">
                        <input id="statisticDate" type="text" name="statisticDate"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="40"><label id="codeTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">车次：</label>
                    <div class="col-md-9">
                        <input id="cc" type="text" name="cc"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="200"><label id="urlTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">旅客发送量：</label>
                    <div class="col-md-9">
                        <input id="passengerVolume" type="text" name="passengerVolume"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="200"><label id="urlTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">全程周转量：</label>
                    <div class="col-md-9">
                        <input id="passengerMileage" type="text" name="passengerMileage"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="200"><label id="urlTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">票价合计：</label>
                    <div class="col-md-9">
                        <input id="fareSum" type="text" name="fareSum"
                               class="form-control input-inline  input-xlarge" placeholder=""
                               value="" maxlength="200"><label id="urlTip"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">所属路局：</label>
                    <div class="col-md-9">

                        <form:select path="trainStatisticVO.ljdm"
                                     class="form-control input-inline  input-xlarge"  id="ljdm" name="ljdm">

                            <form:option value="" label=""/>
                            <form:options items="${listBureau}" itemValue="value"
                                          itemLabel="content"/>

                        </form:select>
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
