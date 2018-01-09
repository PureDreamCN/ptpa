/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:ptpa
 * Module Name:Web
 */
package com.critc.ptpa.dao;

import com.critc.core.dao.BaseDao;
import com.critc.ptpa.model.TrainTraction;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * what:  车次牵引区段Dao
 *
 * @author 杨超凡 created on 2017/12/3
 */
@Repository
public class TrainTractionDao extends BaseDao<TrainTraction,TrainTraction> {
    /**
     * what: 车次牵引区段新增
     *
     * @param trainTraction 车次牵引区段model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int add(TrainTraction trainTraction) {
        String sql = "insert into t_train_traction VALUES (seq_t_train_traction.nextval,:trainId,:xldm,:xldmName,:beginCzdm,:beginCzdmName,:endCzdm,:endCzdmName,:tractionTypeCode,:tractionTypeName,:mileage,:locomotivePrice,:cePrice,:orderIndex,:ljdm)";
        return insert(sql,trainTraction);
    }

    /**
     * what: 车次牵引区段删除
     *
     * @param id 车次牵引区段id
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int delete(Integer id){
        String sql = "delete from t_train_traction where id = ?";
        return delete(sql,id);
    }

    /**
     * what: 车次牵引区段修改
     *
     * @param trainTraction 车次牵引区段model
     *
     * @return int
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public int update(TrainTraction trainTraction,String param){
        String sql="";
        //基本信息修改
        if (param.equals("baseinfo")){
            sql = "update t_train_traction set TRACTION_TYPE_CODE=:tractionTypeCode,TRACTION_TYPE_NAME=:tractionTypeName,TRAIN_ID=:trainId,BEGIN_CZDM=:beginCzdm,BEGIN_CZDM_NAME=:beginCzdmName,END_CZDM=:endCzdm,END_CZDM_NAME=:endCzdmName,MILEAGE=:mileage,ORDER_INDEX=:orderIndex where ID=:id";
        }
        //线路修改
        if (param.equals("xldm")){
            sql = "update t_train_traction set XLDM=:xldm,XLDM_NAME=:xldmName where ID=:id";
        }
        //清算数据修改
        if (param.equals("price")){
            sql = "update t_train_traction set LOCOMOTIVE_PRICE=:locomotivePrice,CE_PRICE=:cePrice where ID=:id";
        }
        return update(sql,trainTraction);
    }

    /**
     * what: 车次牵引区段列表
     *
     * @return 车次牵引区段列表信息
     *
     * @author 杨超凡 created on 2017/11/29
     */
    public List<TrainTraction> listAll(Integer trainId){
        String sql = "select * from t_train_traction where train_id = ?";
        sql += " order by ORDER_INDEX asc";
        return list(sql,trainId);
    }

    public int deleteByTrainId(int trainId) {
        String sql = "delete from t_train_traction where train_id = ?";
        return delete(sql,trainId);
    }

    public List<TrainTraction> getRowid(int trainId) {
        String sql = "select t.*, rownum from t_train_traction t where t.train_id=?";
        return list(sql,trainId);
    }

    public void updateOrderIndex(TrainTraction trainTraction) {
        String sql = "update t_train_traction set ORDER_INDEX=:orderIndex where ID=:id";
        update(sql,trainTraction);
    }
}
