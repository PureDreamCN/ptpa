/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:core
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.Train;
import com.critc.ptpa.vo.TrainSearchVO;
import com.critc.util.page.PageUtil;
import com.critc.util.string.StringUtil;
import org.springframework.stereotype.Repository;

import javax.print.Doc;
import java.util.List;

/**
 * what:  客车详情dao
 *
 * @author 杨超凡 created on 2017/11/24
 */
@Repository
public class TrainDao extends BaseDao<Train,TrainSearchVO>{
    /**
     * what: 计算数据条数
     *
     * @param trainSearchVO 客车详情VO
     *
     * @return 数据条数
     *
     * @author 杨超凡 created on 2017/11/24
     */
    public int count(TrainSearchVO trainSearchVO) {
        String sql = "select count(*) from t_train where 1=1 ";
        sql += createSearchSql(trainSearchVO);
        sql += " order by last_modified_at desc";
        return count(sql, trainSearchVO);
    }

    /**
     * what:  拼接查询条件
     *
     * @param trainSearchVO 客车详情VO
     *
     * @return sql
     *
     * @author 杨超凡 created on 2017/11/24
     */
    private String createSearchSql(TrainSearchVO trainSearchVO) {
        String sql = "";
        if (StringUtil.isNotNullOrEmpty(trainSearchVO.getCc())) {
            sql += " and cc like :searchCc";
        }
        return sql;
    }

    /**
     * what: 车次数据详情列表
     *
     * @param trainSearchVO
     *
     * @return 数据列表
     *
     * @author 杨超凡 created on 2017/11/24
     */
    public List<Train> list(TrainSearchVO trainSearchVO) {
        String sql = "select t.id,t.name,t.cc,t.train_type_name,t.train_level_name,begin_czdm,end_czdm,begin_czdm_name,end_czdm_name," +
                "(select b.NAME from t_dic_bureau b where b.LJDM=t.LJDM) ljdm," +
                "t.vehicle_group_size,t.last_modified_by,t.last_modified_at,lv_jl_mileage,lv_jl_mileage_cc,lv_jl_id from t_train t where 1=1 ";
        sql += createSearchSql(trainSearchVO);
        sql += " order by CC asc";
        sql = PageUtil.createOraclePageSQL(sql, trainSearchVO.getPageIndex());
        return list(sql, trainSearchVO);
    }

    /**
     * what: 车次数据详情列表
     *
     * @return 数据列表
     *
     * @author 杨超凡 created on 2017/11/24
     */
    public List<Train> listAll() {
        String sql = "select t.id,t.name,t.cc,t.train_type_name,t.train_level_name,begin_czdm,end_czdm,begin_czdm_name,end_czdm_name," +
                "t.ljdm,t.vehicle_group_size,t.last_modified_by,t.last_modified_at,lv_jl_mileage,lv_jl_mileage_cc,lv_jl_id from t_train t where 1=1 ";
        sql += " order by CC asc";
        return list(sql);
    }
    /**
     * what:  车次列表
     *
     * @return list
     *
     * @author 杨超凡 created on 2017/11/24
     */
    public List<Train> listAllCc() {
        String sql = "select CC,ID,NAME from t_train ";
        sql += " order by last_modified_at desc";
        return list(sql);
    }

    /**
     * what:  通过id获取车次详情
     *
     * @param id id
     *
     * @return Train
     *
     * @author 杨超凡 created on 2017/11/24
     */
    public Train getTrainById(Integer id) {
        String sql = "select * from t_train where id = ?";
        return get(sql,id);
    }

    /**
     * what:  通过车次获取车次详情
     *
     * @param cc 车次
     *
     * @return Train
     *
     * @author 杨超凡 created on 2017/11/24
     */
    public Train getTrainByCc(String  cc) {
        String sql = "select * from t_train where CC = ?";
        return get(sql,cc);
    }

    /**
     * what:  客车详情新增方法
     *
     * @param train 客车详情model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/28
     */
    public int add(Train train) {
        String sql = "insert into t_train VALUES (seq_t_train.nextval,:name,:cc,:trainTypeCode,:trainTypeName,:trainLevelCode,:trainLevelName,:ljdm,:beginCzdm,:beginCzdmName,:endCzdm,:endCzdmName,:trainMarshallingTypeCode,:trainMarshallingTypeName,:vehicleGroupSize,:vehicleGroupRate,:lvJlId,:createdBy,sysdate,:lastModifiedBy,sysdate,:lvJlMileage,:lvJlMileageCc)";
        return insertForId(sql,train,"id");
    }

    /**
     * what: 客车车次详情修改
     *
     * @param train
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/28
     */
    public Integer update(Train train) {
        String sql = "update t_train set name=:name,CC=:cc,train_type_code=:trainTypeCode,train_type_name=:trainTypeName,train_level_code=:trainLevelCode," +
                "train_level_name=:trainLevelName,LJDM=:ljdm,begin_czdm=:beginCzdm,end_czdm=:endCzdm,begin_czdm_name=:beginCzdmName,end_czdm_name=:endCzdmName,train_marshalling_type_code=:trainMarshallingTypeCode,train_marshalling_type_name=:trainMarshallingTypeName,vehicle_group_size=:vehicleGroupSize,vehicle_group_rate=:vehicleGroupRate,lv_jl_id=:lvJlId,last_modified_by=:lastModifiedBy," +
                "LAST_MODIFIED_AT=sysdate,lv_jl_mileage=:lvJlMileage,lv_jl_mileage_cc=:lvJlMileageCc where id=:id";
        return update(sql, train);
    }

    /**
     * what: 备品清算单价修改
     *
     * @param train
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/28
     */
    public int updatePartPrice(Train train) {
        String sql = "update t_train set PART_PRICE=:partPrice where id=:id";
        return update(sql, train);
    }

    /**
     * what: 车站旅客服务修改
     *
     * @param train
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/28
     */
    public int updateStationservice(Train train) {
        String sql = "update t_train set STATION_SERVICE_TYPE_CODE=:stationServiceTypeCode,STATION_SERVICE_TYPE_NAME=:stationServiceTypeName,STATION_SERVICE_PRICE=:stationServicePrice where id=:id";
        return update(sql, train);
    }

    public int mutiAdd(Train train) {
        String sql = "insert into t_train (ID,NAME,CC,TRAIN_TYPE_CODE,TRAIN_TYPE_NAME,LJDM,VEHICLE_GROUP_SIZE,LV_JL_ID,LV_JL_MILEAGE,LV_JL_MILEAGE_CC) " +
                " VALUES (seq_t_train.nextval,:name,:cc,:trainTypeCode,:trainTypeName,:ljdm,:vehicleGroupSize,:lvJlId,:lvJlMileage,:lvJlMileageCc)";
        return insertForId(sql,train,"id");
    }

    public int copyTrain(Train train) {
        String sql = "insert into t_train (ID,NAME,CC,TRAIN_TYPE_CODE,TRAIN_TYPE_NAME,TRAIN_LEVEL_CODE,TRAIN_LEVEL_NAME,LJDM,BEGIN_CZDM,END_CZDM,TRAIN_MARSHALLING_TYPE_CODE,TRAIN_MARSHALLING_TYPE_NAME,VEHICLE_GROUP_SIZE,PART_PRICE,LINE_COST,TRACTION_COST,CE_COST,DEPRECIATION_COST,MAINTAIN_ADVANCE_COST,MAINTAIN_NORMAL_COST,HUMAN_RESOURCE_COST,PART_COST,SERVICE_COST,STATION_SERVICE_TYPE_CODE,STATION_SERVICE_TYPE_NAME,STATION_SERVICE_PRICE,BEGIN_CZDM_NAME,END_CZDM_NAME,DS)" +
                " VALUES (seq_t_train.nextval,:name,:cc,:trainTypeCode,:trainTypeName,:trainLevelCode,:trainLevelName,:ljdm,:beginCzdm,:endCzdm,:trainMarshallingTypeCode,:trainMarshallingTypeName,:vehicleGroupSize,:partPrice,:lineCost,:tractionCost,:ceCost,:depreciationCost,:maintainAdvanceCost,:maintainNormalCost,:humanResourceCost,:partCost,:serviceCost,:stationServiceTypeCode,:stationServiceTypeName,:stationServicePrice,:beginCzdmName,:endCzdmName,:ds)";
        return insertForId(sql,train,"id");
    }

    public int delete(Integer id) {
        String sql = "delete from t_train where id = ?";
        return delete(sql,id);
    }

    public int updateMarshallingType(Train train) {
        String sql = "update t_train set NAME=:name,TRAIN_MARSHALLING_TYPE_CODE=:trainMarshallingTypeCode,TRAIN_MARSHALLING_TYPE_NAME=:trainMarshallingTypeName,TRAIN_LEVEL_CODE=:trainLevelCode,TRAIN_LEVEL_NAME=:trainLevelName  where id=:id";
        return update(sql, train);
    }

    public int updateStation(Train train) {
        String sql = "update t_train set BEGIN_CZDM=:beginCzdm,END_CZDM=:endCzdm,BEGIN_CZDM_NAME=:beginCzdmName,END_CZDM_NAME=:endCzdmName where id=:id";
        return update(sql, train);
    }

    public void updateCost(Train train) {
        String sql = "update t_train set LINE_COST=:lineCost,TRACTION_COST=:tractionCost,CE_COST=:ceCost,DEPRECIATION_COST=:depreciationCost,MAINTAIN_ADVANCE_COST=:maintainAdvanceCost,MAINTAIN_NORMAL_COST=:maintainNormalCost,HUMAN_RESOURCE_COST=:humanResourceCost,PART_COST=:partCost,SERVICE_COST=:serviceCost where id=:id";
        update(sql,train);
    }
}
